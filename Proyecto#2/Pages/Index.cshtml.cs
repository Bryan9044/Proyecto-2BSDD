using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;
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

        public bool ShowModal4 { get; set; }

        public bool ShowModal5 { get; set; }

        public bool ShowModal6 { get; set; }

        public bool ShowModal7 { get; set; }

        public bool ShowModal8 { get; set; }

        public bool ShowModal9 { get; set; }
        public bool ShowModal10 { get; set; }
        public List<string> Roles { get; set; } = new List<string>();//ya

        public List<string> Acciones { get; set; } = new List<string>(); //ya
        public List<string> Departamentos { get; set; } = new List<string>(); //Ya
        public List<string> Puestos { get; set; } = new List<string>(); //ya
        public List<int> Usuarios { get; set; } = new List<int>(); //ya
        public List<string> RolesUsuario { get; set; } = new List<string>();  //ya
        public List<int> IDUsuarios { get; set; } = new List<int>(); //ya
        public List<string> CedulaEmp { get; set; } = new List<string>(); //ya
        public List<string> NombreEmp { get; set; } = new List<string>(); //ya
        public List<string> ApellidoEmp1 { get; set; } = new List<string>();//ya

        public List<string> ApellidoEmp2 { get; set; } = new List<string>();//ya
        public List<string> GeneroEmp { get; set; } = new List<string>();//ya
        public List<DateOnly> FechaNacimientoEmp { get; set; } = new List<DateOnly>();//ya
        public List<string> ProvinciaEmp { get; set; } = new List<string>();//ya
        public List<string> DireccionEmp { get; set; } = new List<string>();//ya

        public List<string> TelefonoEmp { get; set; } = new List<string>();//ya


        public List<string> CodigoEmp { get; set; } = new List<string>();//ya
        public List<string> PlanillaEmp { get; set; } = new List<string>();//ya

        public List<DateOnly> FechaIngresoEmp { get; set; } = new List<DateOnly>();//ya
        public List<string> PuestoEmp { get; set; } = new List<string>();//ya

        public List<string> tipoRolEmp { get; set; } = new List<string>();//ya

        public List<int> IDUsuarioEmp { get; set; } = new List<int>();//ya
        public List<int> SalarioEmp { get; set; } = new List<int>();//ya



        public List<string> Sectores { get; set; } = new List<string>();//ya

        public List<string> Zonas { get; set; } = new List<string>();//ya


        public List<double> Probabilidades { get; set; } = new List<double>(); //ya

        public List<string> TiposCotizacion { get; set; } = new List<string>(); //ya
        public List<string> Clientes { get; set; } = new List<string>();//ya
        public List<string> Empleados { get; set; } = new List<string>();//ya
        public List<string> TiposEstadosC { get; set; } = new List<string>(); //ya
        public List<int> Cotizaciones { get; set; } = new List<int>(); //ya
        public List<string> Articulos { get; set; } = new List<string>(); //ya

        public List<string> Tareas { get; set; } = new List<string>();
        public List<string> TipoTareas { get; set; } = new List<string>();






        public void OnGet()
        {
            Acciones = new List<string>();
            Roles = new List<string>();
            Departamentos = new List<string>();
            Puestos = new List<string>();
            Usuarios = new List<int>();
            RolesUsuario = new List<string>();
            IDUsuarios = new List<int>();
            CedulaEmp = new List<string>();
            NombreEmp = new List<string>();
            ApellidoEmp1 = new List<string>();
            ApellidoEmp2 = new List<string>();
            GeneroEmp = new List<string>();
            FechaNacimientoEmp = new List<DateOnly>();
            ProvinciaEmp = new List<string>();
            DireccionEmp = new List<string>();
            TelefonoEmp = new List<string>();
            CodigoEmp = new List<string>();
            PlanillaEmp = new List<string>();
            FechaIngresoEmp = new List<DateOnly>();
            PuestoEmp = new List<string>();
            tipoRolEmp = new List<string>();
            IDUsuarioEmp = new List<int>();
            SalarioEmp = new List<int>();
            Zonas = new List<string>();
            Sectores = new List<string>();
            Probabilidades = new List<double>();
            TiposCotizacion = new List<string>();
            Clientes = new List<string>();
            Empleados = new List<string>();
            TiposEstadosC = new List<string>();
            Cotizaciones = new List<int>();
            Tareas = new List<string>();
            TipoTareas = new List<string>();

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


            //Esta parte es para obtener todos los roles por usuario que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from RolesXusuario()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            RolesUsuario.Add(reader.GetString(0));
                            IDUsuarios.Add(reader.GetInt32(1));

                        }
                    }
                }

            }
            //Hasta aqui roles por usuarios



            //Esta parte es para obtener todos los empleados que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from VerEmpleados()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            CedulaEmp.Add(reader.GetString(0));
                            NombreEmp.Add(reader.GetString(1));
                            ApellidoEmp1.Add(reader.GetString(2));
                            ApellidoEmp2.Add(reader.GetString(3));
                            GeneroEmp.Add(reader.GetString(4));
                            FechaNacimientoEmp.Add(DateOnly.FromDateTime(reader.GetDateTime(5)));
                            ProvinciaEmp.Add(reader.GetString(6));
                            DireccionEmp.Add(reader.GetString(7));
                            TelefonoEmp.Add(reader.GetString(8));
                            CodigoEmp.Add(reader.GetString(9));
                            FechaIngresoEmp.Add(DateOnly.FromDateTime(reader.GetDateTime(10)));
                            PuestoEmp.Add(reader.GetString(11));
                            tipoRolEmp.Add(reader.GetString(12));
                            IDUsuarioEmp.Add(reader.GetInt32(13));
                            SalarioEmp.Add(reader.GetInt32(14));
                            var valorSalario = reader.GetValue(14);
                            var tipoSalario = reader.GetFieldType(14);

                            // Imprimir tipo y valor para depuración
                            Console.WriteLine($"Tipo de Salario: {tipoSalario}, Valor de Salario: {valorSalario}");




                        }
                    }
                }
            }
            //Hasta aqui empleados 



            //Esta parte es para obtener todos las zonas que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarZonas()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Zonas.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui zonas

            //Esta parte es para obtener todos las Sectores que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarSectores()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Sectores.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui sectores


            //Esta parte es para obtener todos las PROBABILIDADES que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarProbabilidad()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Probabilidades.Add(reader.GetDouble(0));
                        }
                    }
                }
            }
            //Hasta aqui probabilidades


            //Esta parte es para obtener todos los tipos de cotizaciones que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarTiposCotizacion()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            TiposCotizacion.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui tipos de cotizaciones

            //Esta parte es para obtener todos los Clientes que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarClientes()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Clientes.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui clientes



            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarEstados()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            TiposEstadosC.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui Tipos de estado de una cotizacion



            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarEmpleados()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Empleados.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui Tipos de estado de una cotizacion


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarCodigoCotizacion()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Cotizaciones.Add(reader.GetInt32(0));
                        }
                    }
                }
            }
            //Hasta aqui Tipos de estado de una cotizacion


            //Esta parte es para obtener todos las zonas que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarArticulos()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Articulos.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui zonas


            //Esta parte es para obtener todos las tareas que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarTareasCOT()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Tareas.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui tareas


            //Esta parte es para obtener todos las tareas que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarEstadosTarea()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            TipoTareas.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui tareas
        }







        public IActionResult OnGetMostrarModal()
        {
            ShowModal1 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal()
        {
            ShowModal1 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal2()
        {
            ShowModal2 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal2()
        {
            ShowModal2 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal3()
        {
            ShowModal3 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal3()
        {
            ShowModal3 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal4()
        {
            ShowModal4 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal4()
        {
            ShowModal4 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal5()
        {
            ShowModal5 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal5()
        {
            ShowModal5 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal6()
        {
            ShowModal6 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal6()
        {
            ShowModal6 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal7()
        {
            ShowModal7 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal7()
        {
            ShowModal7 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal8()
        {
            ShowModal8 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal8()
        {
            ShowModal8 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal9()
        {
            ShowModal9 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModal9()
        {
            ShowModal9 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal10()
        {
            ShowModal10 = true;
            return Page();
        }

        public IActionResult OnPostCerrarModa10()
        {
            ShowModal10 = false;
            return RedirectToPage();
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
            string projectDireccion, string projectTelefono, string projectDepartamentos, DateOnly projectFechaIngreso,
            string projectPuestos, string projectRoles, string projectUsuarios, int projectSalarioAC)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC insertarEmpleado @Cedula, @Nombre, @apellido1, @apellido2,@genero, @FechaNacimiento, @provincia, @Direccion, @Telefono, @CodigoDepartamento, @FechaIngreso, @Puesto, @tipoRol, @IDUsuario,@SalarioActual";

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
                        command.Parameters.Add(new SqlParameter("@FechaIngreso", projectFechaIngreso));
                        command.Parameters.Add(new SqlParameter("@Puesto", projectPuestos));
                        command.Parameters.Add(new SqlParameter("@tipoRol", projectRoles));
                        command.Parameters.Add(new SqlParameter("@IDUsuario", projectUsuarios));
                        command.Parameters.Add(new SqlParameter("@SalarioActual", projectSalarioAC));



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


        public IActionResult OnPostGuardarCotizacion(string projectClienteC, string projectEmpleadoC, DateOnly projectFechaC,
            DateOnly projectFechaF, string projectTipoC, string projectEstadoC, double projectProbabilidadC,
            string projectZona, string projectSector)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");


            Console.WriteLine($"Valor de projectSector: {projectSector}");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("GuardarCotizacion", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@CedulaCliente", projectClienteC);
                    command.Parameters.AddWithValue("@CedulaEmpleado", projectEmpleadoC);
                    command.Parameters.AddWithValue("@FechaCotizacion", projectFechaC);
                    command.Parameters.AddWithValue("@MesProyectadoCierre", projectFechaF);
                    command.Parameters.AddWithValue("@TipoCotizacion", projectTipoC);
                    command.Parameters.AddWithValue("@Estado", projectEstadoC);
                    command.Parameters.AddWithValue("@Probabilidad", projectProbabilidadC);
                    command.Parameters.AddWithValue("@Zona", projectZona);
                    command.Parameters.AddWithValue("@Sector", projectSector);

                    try
                    {
                        command.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        Console.WriteLine($"Error al ejecutar el comando: {ex.Message}");
                    }
                }
            }

            return RedirectToPage("Index");
        }





        //Realiza el cambio del puesto y del salario
        //Ademas realiza el cambio en el historial

        public IActionResult OnPostModificarEmpleado(string projectEmpleadoM, string projectPuestosM, int projectSalarioACM, DateOnly projectFechaFin)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");

            // Usar una nueva conexión para cada comando
            using (SqlConnection connectionHistorial = new SqlConnection(connectionString))
            {
                try
                {
                    connectionHistorial.Open();

                    // Consulta de información actual para actualizar el historial
                    string queryHistorialSalario = "SELECT * FROM actualizarHistoricoSalario(@Cedula)";
                    using (SqlCommand commandHistorialSalario = new SqlCommand(queryHistorialSalario, connectionHistorial))
                    {
                        commandHistorialSalario.Parameters.Add(new SqlParameter("@Cedula", projectEmpleadoM));
                        using (SqlDataReader reader = commandHistorialSalario.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                DateOnly fechaIngreso = DateOnly.FromDateTime(reader.GetDateTime(0));
                                string departamento = reader.GetString(1);
                                string puesto = reader.GetString(2);
                                int salarioActual = reader.GetInt32(3);

                                // Llamar a la stored procedure para actualizar el historial del puesto
                                using (SqlConnection connectionUpdatePuesto = new SqlConnection(connectionString))
                                {
                                    connectionUpdatePuesto.Open();
                                    string queryUpdatePuesto = "EXEC actualizarHistoricoPuesto2 @CedulaEmpleado, @FechaInicio, @FechaFin, @Departamento, @NombrePuesto";
                                    using (SqlCommand commandUpdatePuesto = new SqlCommand(queryUpdatePuesto, connectionUpdatePuesto))
                                    {
                                        commandUpdatePuesto.Parameters.Add(new SqlParameter("@CedulaEmpleado", projectEmpleadoM));
                                        commandUpdatePuesto.Parameters.Add(new SqlParameter("@FechaInicio", fechaIngreso));
                                        commandUpdatePuesto.Parameters.Add(new SqlParameter("@FechaFin", projectFechaFin));
                                        commandUpdatePuesto.Parameters.Add(new SqlParameter("@Departamento", departamento));
                                        commandUpdatePuesto.Parameters.Add(new SqlParameter("@NombrePuesto", puesto));

                                        commandUpdatePuesto.ExecuteNonQuery();
                                    }
                                }

                                // Llamar a la stored procedure para actualizar el historial del salario
                                using (SqlConnection connectionUpdateSalario = new SqlConnection(connectionString))
                                {
                                    connectionUpdateSalario.Open();
                                    string queryUpdateSalario = "EXEC actualizarHistoricoSalario2 @CedulaEmpleado, @FechaInicio, @FechaFin, @Monto, @Departamento, @NombrePuesto";
                                    using (SqlCommand commandUpdateSalario = new SqlCommand(queryUpdateSalario, connectionUpdateSalario))
                                    {
                                        commandUpdateSalario.Parameters.Add(new SqlParameter("@CedulaEmpleado", projectEmpleadoM));
                                        commandUpdateSalario.Parameters.Add(new SqlParameter("@FechaInicio", fechaIngreso));
                                        commandUpdateSalario.Parameters.Add(new SqlParameter("@FechaFin", projectFechaFin));
                                        commandUpdateSalario.Parameters.Add(new SqlParameter("@Monto", salarioActual));
                                        commandUpdateSalario.Parameters.Add(new SqlParameter("@Departamento", departamento));
                                        commandUpdateSalario.Parameters.Add(new SqlParameter("@NombrePuesto", puesto));

                                        commandUpdateSalario.ExecuteNonQuery();
                                    }
                                }
                            }
                            else
                            {
                                // Manejar caso en que no se encuentra el empleado
                                ModelState.AddModelError(string.Empty, "Empleado no encontrado.");
                                return Page();
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al modificar el empleado.");
                    ModelState.AddModelError(string.Empty, "Error al modificar el empleado.");
                    return Page();
                }
            }

            // Modificar el empleado después de actualizar los historiales
            using (SqlConnection connectionModificar = new SqlConnection(connectionString))
            {
                connectionModificar.Open();
                string queryModificarEmpleado = "EXEC ModificarEmpleado @Cedula, @Puesto, @SalarioActual";
                using (SqlCommand commandModificarEmpleado = new SqlCommand(queryModificarEmpleado, connectionModificar))
                {
                    commandModificarEmpleado.Parameters.Add(new SqlParameter("@Cedula", projectEmpleadoM));
                    commandModificarEmpleado.Parameters.Add(new SqlParameter("@Puesto", projectPuestosM));
                    commandModificarEmpleado.Parameters.Add(new SqlParameter("@SalarioActual", projectSalarioACM));

                    commandModificarEmpleado.ExecuteNonQuery();
                }
            }

            return Page();
        }




        //Guarda la planilla y realiza el calculo del salario

        public IActionResult OnPostGuardarPlanilla(string projectPlanillaCodigo, DateOnly projectFechaPlanilla, string projectEmpleadoP, int projectPlanillaHoras)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Agregar la planilla
                    string query = "EXEC AgregarPlanilla @CodigoPlanilla, @FechaPlanilla, @CedulaEmpleado, @HorasRealizadas";
                    using (SqlCommand commandPlanilla = new SqlCommand(query, connection))
                    {
                        commandPlanilla.Parameters.Add(new SqlParameter("@CodigoPlanilla", projectPlanillaCodigo));
                        commandPlanilla.Parameters.Add(new SqlParameter("@FechaPlanilla", projectFechaPlanilla));
                        commandPlanilla.Parameters.Add(new SqlParameter("@CedulaEmpleado", projectEmpleadoP));
                        commandPlanilla.Parameters.Add(new SqlParameter("@HorasRealizadas", projectPlanillaHoras));

                        commandPlanilla.ExecuteNonQuery();
                    }

                    // Calcular el salario
                    string queryUpdatePago = "EXEC CalcularPago @CodigoPlanilla";
                    using (SqlCommand commandUpdateSalario = new SqlCommand(queryUpdatePago, connection))
                    {
                        commandUpdateSalario.Parameters.Add(new SqlParameter("@CodigoPlanilla", projectPlanillaCodigo));
                        commandUpdateSalario.ExecuteNonQuery();
                    }

                    return RedirectToPage(); // Redirigir después de guardar
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al guardar la planilla.");
                    ModelState.AddModelError(string.Empty, "Error al guardar la planilla.");
                    return Page();
                }
            }
        }




        public IActionResult OnPostModificarCotizacion(int projectCotizacionC, string projectClienteC, string projectEmpleadoC, DateOnly projectFechaC,
                DateOnly projectFechaF, string projectTipoC, string projectEstadoC, double projectProbabilidadC,
                string projectZona, string projectSector)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC actualizarCotizacion @Codigo, @CedulaCliente, @CedulaEmpleado, @FechaCotizacion,@MesProyectadoCierre, @TipoCotizacion, @Estado, @Probabilidad, @Zona, @Sector";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@Codigo", projectCotizacionC));
                        command.Parameters.Add(new SqlParameter("@CedulaCliente", projectClienteC));
                        command.Parameters.Add(new SqlParameter("@CedulaEmpleado", projectEmpleadoC));
                        command.Parameters.Add(new SqlParameter("@FechaCotizacion", projectFechaC));
                        command.Parameters.Add(new SqlParameter("@MesProyectadoCierre", projectFechaF));
                        command.Parameters.Add(new SqlParameter("@TipoCotizacion", projectTipoC));
                        command.Parameters.Add(new SqlParameter("@Estado", projectEstadoC));
                        command.Parameters.Add(new SqlParameter("@Probabilidad", projectProbabilidadC));
                        command.Parameters.Add(new SqlParameter("@Zona", projectZona));
                        command.Parameters.Add(new SqlParameter("@Sector", projectSector));


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



        public IActionResult OnPostAgregarArticulosCotizacion(string projecCotizacionAr, int projectCantidadProducto, int projectCotizacionC)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            Console.WriteLine(projectCotizacionC);
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC AgregarListaCotizacion @CantidadProducto, @CodigoCotizacion, @Nombre";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@CantidadProducto", projectCantidadProducto));
                        command.Parameters.Add(new SqlParameter("@CodigoCotizacion", projectCotizacionC));
                        command.Parameters.Add(new SqlParameter("@Nombre", projecCotizacionAr));

                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar el artículo a la cotización.");
                    ModelState.AddModelError(string.Empty, "Error al agregar el artículo a la cotización.");
                    return Page();
                }
            }

            Console.WriteLine("Se insertó el artículo en la cotización correctamente.");
            return Page();
        }







        public IActionResult OnPostAgregarTareaCOT(string projectCodigoTarea, string projectTipoTarea, DateOnly projectCodigoFecha, string projectDescripcionCOT,
            string projectEstadosT)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC InsertarTarea @CodigoTarea,@tipoTareaCotizacion,@Fecha,@Descripcion,@Estado";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@CodigoTarea", projectCodigoTarea));
                        command.Parameters.Add(new SqlParameter("@tipoTareaCotizacion", projectTipoTarea));
                        command.Parameters.Add(new SqlParameter("@Fecha", projectCodigoFecha));
                        command.Parameters.Add(new SqlParameter("@Descripcion", projectDescripcionCOT));
                        command.Parameters.Add(new SqlParameter("@Estado", projectEstadosT));

                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar el artículo a la cotización.");
                    ModelState.AddModelError(string.Empty, "Error al agregar el artículo a la cotización.");
                    return Page();
                }
            }

            Console.WriteLine("Se insertó el artículo en la cotización correctamente.");
            return Page();
        }


    }
}