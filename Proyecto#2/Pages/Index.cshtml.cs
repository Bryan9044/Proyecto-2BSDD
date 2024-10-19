using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using static System.Runtime.InteropServices.JavaScript.JSType;

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
        public List<string> Departamentos { get; set; } = new List<string>();
        public List<string> Planillas { get; set; } = new List<string>();
        public List<string> Puestos { get; set; } = new List<string>();
        public List<int> Usuarios { get; set; } = new List<int>();


        public void OnGet()
        {
            Acciones = new List<string>();
            Roles = new List<string>();
            Departamentos = new List<string>();
            Planillas = new List<string>();
            Puestos = new List<string>();   
            Usuarios = new List<int>();
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



            //Esta parte es para obtener todas los departamentos que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from ObtenerDepartamentos()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Departamentos.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui Departamentos


            //Esta parte es para obtener todas las planillas que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from ObtenerPlanilla()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Planillas.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui departamentos

            //Esta parte es para obtener todos los puestos que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from ObtenerPuestos()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Puestos.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui puestos


            //Esta parte es para obtener todos los roles que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from ObtenerRoles()";
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
            //Hasta aqui roles

            //Esta parte es para obtener todos los usuarios que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from ObtenerUsuarios()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Usuarios.Add(reader.GetInt32(0));
                        }
                    }
                }
            }
            //Hasta aqui usuarios


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


        public IActionResult OnPostGuardarEmpleado(string projectEmpleadoC, string projectEmpleadoN, string projectEmpleadoAP1,
            string projectEmpleadoAP2, string projectEmpleadoGenero, DateOnly projectFecha, string projectProvincia,
            string projectDireccion, string projectTelefono, string projectDepartamentos, string projectPlanillas,
            DateOnly projectFechaIngreso, string projectPuestos, string projectRoles, string projectUsuarios)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC insertarEmpleado @Cedula, @Nombre, @apellido1, @apellido2,@genero, @FechaNacimiento, @provincia, @Direccion, @Telefono, @CodigoDepartamento, @CodigoPlanilla, @FechaIngreso, @Puesto, @tipoRol, @IDUsuario";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@Cedula", projectEmpleadoC));
                        command.Parameters.Add(new SqlParameter("@Nombre", projectEmpleadoN));
                        command.Parameters.Add(new SqlParameter("@apellido1", projectEmpleadoAP1));
                        command.Parameters.Add(new SqlParameter("@apellido2", projectEmpleadoAP2));
                        command.Parameters.Add(new SqlParameter("@genero", projectEmpleadoGenero));
                        command.Parameters.Add(new SqlParameter("@FechaNacimiento", projectFecha));
                        command.Parameters.Add(new SqlParameter("@provincia", projectProvincia));
                        command.Parameters.Add(new SqlParameter("@Direccion", projectDireccion));
                        command.Parameters.Add(new SqlParameter("@Telefono", projectTelefono));
                        command.Parameters.Add(new SqlParameter("@CodigoDepartamento", projectDepartamentos));
                        command.Parameters.Add(new SqlParameter("@CodigoPlanilla", projectPlanillas));
                        command.Parameters.Add(new SqlParameter("@FechaIngreso", projectFechaIngreso));
                        command.Parameters.Add(new SqlParameter("@Puesto", projectPuestos));
                        command.Parameters.Add(new SqlParameter("@tipoRol", projectRoles));
                        command.Parameters.Add(new SqlParameter("@IDUsuario", projectUsuarios));

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
