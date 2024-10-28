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
        public bool ShowModal11 { get; set; }
        public bool ShowModal12 { get; set; }
        public bool ShowModal13 { get; set; }
        public bool ShowModal14 { get; set; }
        public bool ShowModal15 { get; set; }
        public bool ShowModal16 { get; set; }
        public bool ShowModal17 { get; set; }
        public bool ShowModal18 { get; set; }
        public bool ShowModal19 { get; set; }
        public bool ShowModal20 { get; set; }
        public bool ShowModal21 { get; set; }
        public bool ShowModal22 { get; set; }
        public bool ShowModal23 { get; set; }
        public bool ShowModal24 { get; set; }
        public bool ShowModal25 { get; set; }
        public bool ShowModal26 { get; set; }
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
        public List<int> CodigoC { get; set; } = new List<int>();
        public List<string> ClienteC { get; set; } = new List<string>();
        public List<string> EmpleadoC { get; set; } = new List<string>();

        public List<DateOnly> FechaC { get; set; } = new List<DateOnly>();
        public List<DateOnly> MesC { get; set; } = new List<DateOnly>();

        public List<string> TiposCotizaciones { get; set; } = new List<string>();
        public List<string> EstadosC { get; set; } = new List<string>();
        public List<float> ProbabilidadesC { get; set; } = new List<float>();

        public List<string> ZonasC { get; set; } = new List<string>();

        public List<string> SectorC { get; set; } = new List<string>();

        public List<string> CodigoTareaC { get; set; } = new List<string>();

        public List<int> CodigoCtarea { get; set; } = new List<int>();

        public List<string> Bodegas { get; set; } = new List<string>();

        public List<int> Movimientos { get; set; } = new List<int>();

        public List<string> ClientesNom { get; set; } = new List<string>();
        public List<string> ListaF { get; set; } = new List<string>();

        public List<string> NombreEmpleados { get; set; } = new List<string>();

        public List<string> CodigoFactu { get; set; } = new List<string>();

        public List<string> BodegaCodigo { get; set; } = new List<string>();

        public List<string> BodegaArt { get; set; } = new List<string>();

        public List<int> CantidadArt { get; set; } = new List<int>();

        public List<string> DescripcionTC { get; set; } = new List<string>();
        public List<string> tipotareaTC { get; set; } = new List<string>();

        public List<DateOnly> FechaTC { get; set; } = new List<DateOnly>();
        public List<string> EstadoTC { get; set; } = new List<string>();

        public List<string> NombreTC { get; set; } = new List<string>();

        public List<string> BodegaDispo { get; set; } = new List<string>();

        public List<string> TareaCreada { get; set; } = new List<string>();



        public List<string> IDDetalle { get; set; } = new List<string>();
        public List<string> NombreCliente { get; set; } = new List<string>();
        public List<DateOnly> FechaFacturacion { get; set; } = new List<DateOnly>();
        public List<string> ArticuloFactura { get; set; } = new List<string>();
        public List<int> CantidadFactura { get; set; } = new List<int>();

        public List<string> EmpleadoFactura { get; set; } = new List<string>();
        public List<decimal> PrecioFactura { get; set; } = new List<decimal>();
        public List<decimal> PrecioFinal { get; set; } = new List<decimal>();
        public List<int> IDIngreso { get; set; } = new List<int>();




        public bool MostrarSegundoModal { get; set; }


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
            Bodegas = new List<string>();
            Movimientos = new List<int>();
            ClientesNom = new List<string>();
            ListaF = new List<string>();
            NombreEmpleados = new List<string>();
            CodigoFactu = new List<string>();
            BodegaArt = new List<string>();
            BodegaCodigo = new List<string>();
            CantidadArt = new List<int>();
            BodegaDispo = new List<string>();
            DescripcionTC = new List<string>();
            tipotareaTC = new List<string>();
            FechaTC = new List<DateOnly>();
            EstadoTC = new List<string>();
            NombreTC = new List<string>();
            TareaCreada = new List<string>();
            IDDetalle = new List<string>();
            NombreCliente = new List<string>();
            FechaFacturacion = new List<DateOnly>();
            ArticuloFactura = new List<string>();
            CantidadFactura = new List<int>();
            EmpleadoFactura = new List<string>();
            PrecioFactura = new List<decimal>();
            PrecioFinal = new List<decimal>();
            IDIngreso = new List<int>();
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


            //Esta parte es para obtener todos los articulos por bodega que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from verInventarioBodega()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            BodegaCodigo.Add(reader.GetString(0));
                            BodegaArt.Add(reader.GetString(1));
                            CantidadArt.Add(reader.GetInt32(2));

                        }
                    }
                }

            }
            //Hasta aqui todos los articulos por bodega



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





                        }
                    }
                }
            }
            //Hasta aqui empleados 

            //Esta parte es para obtener todos las cotizaciones que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from VerCotizaciones()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            CodigoC.Add(reader.GetInt32(0));
                            ClienteC.Add(reader.GetString(1));
                            EmpleadoC.Add(reader.GetString(2));
                            FechaC.Add(DateOnly.FromDateTime(reader.GetDateTime(3)));
                            MesC.Add(DateOnly.FromDateTime(reader.GetDateTime(4)));
                            TiposCotizaciones.Add(reader.GetString(5));
                            EstadosC.Add(reader.GetString(6));
                            ProbabilidadesC.Add((float)reader.GetDouble(7));
                            ZonasC.Add(reader.GetString(8));
                            SectorC.Add(reader.GetString(9));





                        }
                    }
                }
            }
            //Hasta aqui empleados 




            //Esta parte es para obtener el detalle de la factura que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from detalleFactura()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            IDDetalle.Add(reader.GetString(0));
                            NombreCliente.Add(reader.GetString(1));
                            FechaFacturacion.Add(DateOnly.FromDateTime(reader.GetDateTime(2)));
                            ArticuloFactura.Add(reader.GetString(3));
                            CantidadFactura.Add(reader.GetInt32(4));
                            EmpleadoFactura.Add(reader.GetString(5));
                            PrecioFactura.Add(reader.GetDecimal(6));
                            PrecioFinal.Add(reader.GetDecimal(7));





                        }
                    }
                }
            }
            //Hasta aqui empleados 



            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from mostrarTareasC()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            CodigoTareaC.Add(reader.GetString(0));
                            CodigoCtarea.Add(reader.GetInt32(1));

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



            //Esta parte es para obtener todos las bodegas que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from mostrarBodegas()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Bodegas.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui bodegas

            //Esta parte es para obtener todos los movimientos que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from mostrarMovimientos()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Movimientos.Add(reader.GetInt32(0));
                        }
                    }
                }
            }

            //Esta parte es para obtener todos las Nombres de clientes que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from mostrarNombreC()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ClientesNom.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui Nombres de clientes

            //Esta parte es para obtener todos las Nombres de clientes que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from verListaF()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ListaF.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui Nombres de clientes

            //Esta parte es para obtener todos las Nombres de los empleados completos que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from EmpleadosNombre()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            NombreEmpleados.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui Nombres de clientes


            //Esta parte es para obtener todos los codigos de factura que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from MostrarCodigoFac()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            CodigoFactu.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui codigos de factura
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from VerTareasCotizacion()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            DescripcionTC.Add(reader.GetString(0));
                            tipotareaTC.Add(reader.GetString(1));
                            FechaTC.Add(DateOnly.FromDateTime(reader.GetDateTime(2)));
                            EstadoTC.Add(reader.GetString(3));
                            NombreTC.Add(reader.GetString(4));


                        }
                    }
                }

            }
            //Esta parte es para obtener todas los departamentos que hayan sido registradas en la base de datos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from VerTareaCot()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            TareaCreada.Add(reader.GetString(0));
                        }
                    }
                }
            }
            //Hasta aqui Departamentos
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "select * from mostrarIDInventario()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            IDIngreso.Add(reader.GetInt32(0));
                        }
                    }
                }
            }
            



            //Hasta aqui codigos de factura
        }







        public IActionResult OnGetMostrarModal()
        {
            ShowModal1 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal()
        {
            ShowModal1 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal2()
        {
            ShowModal2 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal2()
        {
            ShowModal2 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal3()
        {
            ShowModal3 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal3()
        {
            ShowModal3 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal4()
        {
            ShowModal4 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal4()
        {
            ShowModal4 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal5()
        {
            ShowModal5 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal5()
        {
            ShowModal5 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal6()
        {
            ShowModal6 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal6()
        {
            ShowModal6 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal7()
        {
            ShowModal7 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal7()
        {
            ShowModal7 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal8()
        {
            ShowModal8 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal8()
        {
            ShowModal8 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal9()
        {
            ShowModal9 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal9()
        {
            ShowModal9 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal10()
        {
            ShowModal10 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal10()
        {
            ShowModal10 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal11()
        {
            ShowModal11 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal11()
        {
            ShowModal11 = false;
            return RedirectToPage();
        }


        public IActionResult OnGetMostrarModal12()
        {
            ShowModal12 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal12()
        {
            ShowModal12 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal13()
        {
            ShowModal13 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal13()
        {
            ShowModal13 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal14()
        {
            ShowModal14 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal14()
        {
            ShowModal14 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal15()
        {
            ShowModal15 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal15()
        {
            ShowModal15 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal16()
        {
            ShowModal16 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal16()
        {
            ShowModal16 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal17()
        {
            ShowModal17 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal17()
        {
            ShowModal17 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal18()
        {
            ShowModal18 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal18()
        {
            ShowModal18 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal19()
        {
            ShowModal19 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal19()
        {
            ShowModal19 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal20()
        {
            ShowModal20 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal20()
        {
            ShowModal20 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal21()
        {
            ShowModal21 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal21()
        {
            ShowModal21 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal22()
        {
            ShowModal22 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal22()
        {
            ShowModal22 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal23()
        {
            ShowModal23 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal23()
        {
            ShowModal23 = false;
            return RedirectToPage();
        }
        public IActionResult OnGetMostrarModal24()
        {
            ShowModal24 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal24()
        {
            ShowModal24 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal25()
        {
            ShowModal25 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal25()
        {
            ShowModal25 = false;
            return RedirectToPage();
        }

        public IActionResult OnGetMostrarModal26()
        {
            ShowModal26 = true;
            return RedirectToPage();
        }

        public IActionResult OnPostCerrarModal26()
        {
            ShowModal26 = false;
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
            return RedirectToPage();
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
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Si se inserto la acción por rol");
            return RedirectToPage();




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
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Si se inserto la acción por rol");
            return RedirectToPage();




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

            return RedirectToPage();
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
                                return RedirectToPage();
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al modificar el empleado.");
                    ModelState.AddModelError(string.Empty, "Error al modificar el empleado.");
                    return RedirectToPage();
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

            return RedirectToPage();
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

                    return RedirectToPage(); 
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al guardar la planilla.");
                    ModelState.AddModelError(string.Empty, "Error al guardar la planilla.");
                    return RedirectToPage();
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
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Si se inserto la acción por rol");
            return RedirectToPage();




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
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó el artículo en la cotización correctamente.");
            return RedirectToPage();
        }







        public IActionResult OnPostAgregarTareaCOT(string projectCodigoTarea, string projectTipoTarea, DateOnly projectCodigoFecha, string projectDescripcionCOT,
                string projectEstadosT, string projectEliCotizacion2)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Primero insertamos la tarea
                    string queryInsertarTarea = "EXEC InsertarTarea @CodigoTarea,@tipoTareaCotizacion,@Fecha,@Descripcion,@Estado";
                    using (SqlCommand command = new SqlCommand(queryInsertarTarea, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@CodigoTarea", projectCodigoTarea));
                        command.Parameters.Add(new SqlParameter("@tipoTareaCotizacion", projectTipoTarea));
                        command.Parameters.Add(new SqlParameter("@Fecha", projectCodigoFecha));
                        command.Parameters.Add(new SqlParameter("@Descripcion", projectDescripcionCOT));
                        command.Parameters.Add(new SqlParameter("@Estado", projectEstadosT));

                        command.ExecuteNonQuery();
                    }

                    // Ahora insertamos en TareaCotizacion
                    string queryInsertarTareaCotizacion = "exec IngresarTareaCot @CodigoTarea, @CodigoCotizacion";
                    using (SqlCommand command = new SqlCommand(queryInsertarTareaCotizacion, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@CodigoTarea", projectCodigoTarea));
                        command.Parameters.Add(new SqlParameter("@CodigoCotizacion", projectEliCotizacion2)); 

                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar la tarea y asociarla a la cotización.");
                    ModelState.AddModelError(string.Empty, "Error al agregar la tarea y asociarla a la cotización.");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó la tarea y se asoció a la cotización correctamente.");
            return RedirectToPage();
        }




        public IActionResult OnPostEliminarCotizacion(int projectEliCotizacion)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC EliminarCotizacion @CodigoCotizacion";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@CodigoCotizacion", projectEliCotizacion));


                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar el artículo a la cotización.");
                    ModelState.AddModelError(string.Empty, "Error al agregar el artículo a la cotización.");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó el artículo en la cotización correctamente.");
            return RedirectToPage();
        }


        public IActionResult OnPostIngresarMovimiento(string projectEmpleadoM, string projectBodegaN, string projectBodegaDes, DateOnly projectFechaMov,
            TimeOnly projectDuracionMov)
        {
            Console.WriteLine(projectEmpleadoM);
            Console.WriteLine(projectBodegaN);
            Console.WriteLine(projectDuracionMov);

            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC IngresarMovimiento @Cedula, @BodegaOrigen, @BodegaDestino, @fecha, @hora";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@Cedula", projectEmpleadoM));
                        command.Parameters.Add(new SqlParameter("@BodegaOrigen", projectBodegaN));
                        command.Parameters.Add(new SqlParameter("@BodegaDestino", projectBodegaDes));
                        command.Parameters.Add(new SqlParameter("@fecha", projectFechaMov));
                        command.Parameters.Add(new SqlParameter("@hora", projectDuracionMov));



                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar el artículo a la cotización.");
                    ModelState.AddModelError(string.Empty, "Error al agregar el artículo a la cotización.");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó el artículo en la cotización correctamente.");
            return RedirectToPage();
        }


        public IActionResult OnPostIngresarInventarios(string projectEmpleadoM, string projectBodegaN, DateOnly projectFechaM)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string queryRegistrar = "EXEC RegistrarInventario @NombreEmpleado, @NombreBodega, @Fecha";
                    using (SqlCommand commandRegistrar = new SqlCommand(queryRegistrar, connection))
                    {
                        commandRegistrar.Parameters.Add(new SqlParameter("@NombreEmpleado", projectEmpleadoM));
                        commandRegistrar.Parameters.Add(new SqlParameter("@NombreBodega", projectBodegaN));
                        commandRegistrar.Parameters.Add(new SqlParameter("@Fecha", projectFechaM));

                        commandRegistrar.ExecuteNonQuery();
                    }

                   
                    string queryBodega = "SELECT dbo.DevolverBodega(@NombreBodega)"; 
                    using (SqlCommand commandBodega = new SqlCommand(queryBodega, connection))
                    {
                        commandBodega.Parameters.Add(new SqlParameter("@NombreBodega", projectBodegaN));

                        var codigoBodegaDestino = (string)commandBodega.ExecuteScalar();
                        TempData["CodigoBodegaDestino"] = codigoBodegaDestino; 
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar el artículo a la cotización.");
                    ModelState.AddModelError(string.Empty, "Error al agregar el artículo a la cotización.");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó el artículo en la cotización correctamente.");
            return RedirectToPage();
        }







        public IActionResult OnPostIngresarArticulosMOV(int projectIngreso, string projectInventA , int projectCantidadInve)
        {

            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC IngresarInventarioArticulos @IDIngreso, @NombreArticulo, @CantidadIngresada";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@IDIngreso", projectIngreso));
                        command.Parameters.Add(new SqlParameter("@NombreArticulo", projectInventA));
                        command.Parameters.Add(new SqlParameter("@CantidadIngresada", projectCantidadInve));



                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar el artículo a la cotización.");
                    ModelState.AddModelError(string.Empty, "Error al agregar el artículo a la cotización.");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó el artículo en la cotización correctamente.");
            return RedirectToPage();
        }






        public IActionResult OnPostIngresarListaArt(string projectIDListaF, string projectCF2, string projectArtLista, int projectCantidadInveL)
        {

            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC agregarFacturaLista @IDLista, @CantidadProducto, @Nombrepro,@CodigoF";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@IDLista", projectIDListaF));
                        command.Parameters.Add(new SqlParameter("@CantidadProducto", projectCantidadInveL));
                        command.Parameters.Add(new SqlParameter("@Nombrepro", projectArtLista));
                        command.Parameters.Add(new SqlParameter("@CodigoF", projectCF2));




                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar el artículo a la cotización.");
                    ModelState.AddModelError(string.Empty, "Error al agregar el artículo a la cotización.");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó el artículo en la cotización correctamente.");
            return RedirectToPage();
        }



        public IActionResult OnPostIngresarFactura(string projectFacturaIDF, int projectCF, string projectClienteF, string projectEmpleadoF,
            string projectJuridico, string projectCelLocal, string projectNombreLocal, DateOnly projectFecha)
        {
            Console.WriteLine(projectCF);
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC AgregarFactura @Codigo, @CodigoCotizacion, @NombreEmpleado, @CedulaJuridica,@TelefonoLocal,@NombreLocal,@FechaFactura,@NombreCliente";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@Codigo", projectFacturaIDF));
                        if (projectCF == 0)
                        {
                            command.Parameters.Add(new SqlParameter("@CodigoCotizacion", DBNull.Value));
                        }
                        else
                        {
                            command.Parameters.Add(new SqlParameter("@CodigoCotizacion", projectCF));
                        }
                        command.Parameters.Add(new SqlParameter("@NombreEmpleado", projectEmpleadoF));
                        command.Parameters.Add(new SqlParameter("@CedulaJuridica", projectJuridico));
                        command.Parameters.Add(new SqlParameter("@TelefonoLocal", projectCelLocal));
                        command.Parameters.Add(new SqlParameter("@NombreLocal", projectNombreLocal));
                        command.Parameters.Add(new SqlParameter("@FechaFactura", projectFecha));
                        command.Parameters.Add(new SqlParameter("@NombreCliente", projectClienteF));


                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar la factura.");
                    ModelState.AddModelError(string.Empty, "Error al agregar la factura");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó la factura correctamente.");
            return RedirectToPage();
        }




        public IActionResult OnPostRegistrarSalida1(string projectCFS, string projectArtLista, int projectCantidadInveL)
        {
            // Configurar variable para mostrar el segundo modal
            ViewData["MostrarModalSalidaMOV2"] = true;

            // Simular el nombre de artículo seleccionado
            string articuloSeleccionado = projectArtLista;

            // Inicializar la lista de bodegas
            BodegaDispo = new List<string>();

            string connectionString = _configuration.GetConnectionString("DefaultConnection");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT NombreBodega FROM verBodegasArticuloActivo(@NombreArticulo)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@NombreArticulo", articuloSeleccionado);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            BodegaDispo.Add(reader.GetString(0));
                        }
                    }
                }
            }
            ViewData["projectCFS"] = projectCFS;
            ViewData["projectArtLista"] = projectArtLista;
            ViewData["projectCantidadInveL"] = projectCantidadInveL;
            return RedirectToPage();
        }

        public IActionResult OnPostRegistrarSalida2(string projectCFS, string projectArtLista, int projectCantidadInveL, string bodegasSelect)
        {
            Console.WriteLine(projectCFS);
            Console.WriteLine(projectArtLista);
            Console.WriteLine(projectCantidadInveL);
            Console.WriteLine(bodegasSelect);
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "EXEC IngresarSalidaMov @IDFactura, @NombreArt, @NombreBodega, @Cantidad";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@IDFactura", projectCFS));
                        command.Parameters.Add(new SqlParameter("@NombreArt", projectArtLista));
                        command.Parameters.Add(new SqlParameter("@NombreBodega", bodegasSelect));
                        command.Parameters.Add(new SqlParameter("@Cantidad", projectCantidadInveL));



                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar la factura.");
                    ModelState.AddModelError(string.Empty, "Error al agregar la factura");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó la factura correctamente.");
            return RedirectToPage();







        }
        public IActionResult OnPostCancelFac(string projectCF3, string projecEmpleadoFC, DateTime projectFecha2,string projectCancel)
        {
            Console.WriteLine(projectCF3);

            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "exec DevolverProductos @IDFactura,@NombreEmpleado,@Motivo,@fecha";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@IDFactura", projectCF3));
                        command.Parameters.Add(new SqlParameter("@NombreEmpleado", projecEmpleadoFC));
                        command.Parameters.Add(new SqlParameter("@Motivo", projectCancel));
                        command.Parameters.Add(new SqlParameter("@fecha", projectFecha2));



                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar la factura.");
                    ModelState.AddModelError(string.Empty, "Error al agregar la factura");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó la factura correctamente.");
            return RedirectToPage();


        }

        public IActionResult OnPostEliminarTareaCotizacion(int projectEliCotizacion3, string projectTareaTc)
        {
            Console.WriteLine(projectEliCotizacion3);
            Console.WriteLine(projectTareaTc);

            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "exec EliminarTareaCOT @CodigoTarea,@CodigoC";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@CodigoTarea", projectTareaTc));
                        command.Parameters.Add(new SqlParameter("@CodigoC", projectEliCotizacion3));




                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar la factura.");
                    ModelState.AddModelError(string.Empty, "Error al agregar la factura");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó la factura correctamente.");
            return RedirectToPage();


        }


        public IActionResult OnPostAgregarARTMOV(string projectArtLista5, int projectARTMOV, int projectMovimientoC23)
        {
            Console.WriteLine(projectARTMOV);
            Console.WriteLine(projectMovimientoC23);

            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "exec listamovimientoFinal @nombreart,@cantidadarticulo,@codigomovimiento";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@nombreart", projectArtLista5));
                        command.Parameters.Add(new SqlParameter("@cantidadarticulo", projectARTMOV));
                        command.Parameters.Add(new SqlParameter("@codigomovimiento", projectMovimientoC23));


                        command.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    _logger.LogError(ex, "Error al agregar la factura.");
                    ModelState.AddModelError(string.Empty, "Error al agregar la factura");
                    return RedirectToPage();
                }
            }

            Console.WriteLine("Se insertó la factura correctamente.");
            return RedirectToPage();


        }


    }
}