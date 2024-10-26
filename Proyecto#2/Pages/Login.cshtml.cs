using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient; 
using System.Data;

public class LoginModel : PageModel
{
    private readonly ILogger<LoginModel> _logger;
    private readonly IConfiguration _configuration; 

    public LoginModel(ILogger<LoginModel> logger, IConfiguration configuration)
    {
        _logger = logger;
        _configuration = configuration;
    }

    public bool ShowModal { get; set; } = false;

    public string MensajeError {  get; set; }

    [BindProperty]
    public string NombreUS { get; set; }

    [BindProperty]
    public string ContrasenaUS { get; set; }

    public IActionResult OnGet()
    {
        
        return Page();
    }

    public IActionResult OnPost()
    {
        // Llama a la funci�n para verificar credenciales
        if (GuardarInicio(NombreUS, ContrasenaUS))
        {
            // Almacena el nombre de usuario en la sesi�n
            HttpContext.Session.SetString("NombreUS", NombreUS);
            Console.WriteLine("Inicio de sesi�n exitoso. Redirigiendo a la p�gina principal...");
            return RedirectToPage("/Index"); // Redirige a la p�gina principal
        }

        // Registro de intento de inicio de sesi�n fallido
        MensajeError = "Error: usuario o contrase�a incorrectos.";
        ShowModal = true; // Muestra el modal de error
        return Page();
    }
    public IActionResult OnPostCloseModal()
    {
        ShowModal = false; // Cierra el modal
        return Page(); // Regresa a la misma p�gina
    }




    private bool GuardarInicio(string username, string password)
    {
        string connectionString = _configuration.GetConnectionString("DefaultConnection");
        Console.WriteLine(username);
        Console.WriteLine(password);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT dbo.ExisteUsuario(@NombreUS, @ContrasenaUS)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.Add(new SqlParameter("@NombreUS", username));
                command.Parameters.Add(new SqlParameter("@ContrasenaUS", password));

                int resultado = (int)command.ExecuteScalar();                
                return resultado == 1; // Devuelve true si existe el usuario
            }
        }
    }
}
