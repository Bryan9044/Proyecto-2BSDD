using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace Proyecto_2.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly IConfiguration _configuration;
        public IndexModel(ILogger<IndexModel> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        public bool ShowModal1 { get; set; }
        public bool ShowModal2 { get; set; }

        public bool ShowModal3 { get; set; }

        public List<string> Roles { get; set; } = new List<string>();

        public List<string> Acciones { get; set; } = new List<string>();
        public void OnGet()
        {
            Acciones = new List<string>();
            Roles = new List<string>();
            string connectionString = _configuration.GetConnectionString("DefaultConnection");


            //Esta parte es para obtener todas las acciones que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from ObtenerTipoAcciones()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Acciones.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui acciones


            //Esta parte es para obtener todas los roles que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from ObtenerTiposDeRoles()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Roles.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui acciones


        }

        public IActionResult OnPostGuardarRol(string projectTipoRol, string projectDescripcionRol)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC insercionRoles @tipoRol, @Descripcion";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@tipoRol", projectTipoRol));
                        command.Parameters.Add(new SqlParameter("@Descripcion", projectDescripcionRol));


                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {

                    _logger.LogError(ex, "Error al insertar el rol.");
                    ModelState.AddModelError(string.Empty, "Error al guardar el rol.");
                    return Page();
                }
            }

            Console.WriteLine("Si se inserto el rol");
            return Page();
        }

        public IActionResult OnPostGuardarAccionesRol(string projectTipoRolAc, string projectTipoAccion)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC insertarAccionesXRol @tipoRol, @tipoAccion";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@tipoRol", projectTipoRolAc));
                        command.Parameters.Add(new SqlParameter("@tipoAccion", projectTipoAccion));


                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {

                    _logger.LogError(ex, "Error al insertar el rol por accion.");
                    ModelState.AddModelError(string.Empty, "Error al guardar el rol por accion.");
                    return Page();
                }
            }

            Console.WriteLine("Si se inserto la acción por rol");
            return Page();




        }
    }
}
