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
        // Llama a la función 
        if (GuardarInicio(NombreUS, ContrasenaUS))
        {
            // Almacena el nombre de usuario
            HttpContext.Session.SetString("NombreUS", NombreUS);

            Console.WriteLine("Inicio de sesión exitoso. Redirigiendo a la página principal...");
            return RedirectToPage("/Index"); // Redirige a la página principal
        }

        
        ModelState.AddModelError(string.Empty, "Nombre de usuario o contraseña incorrectos.");
        return Page(); 
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
                Console.WriteLine("Resultado de la función ExisteUsuario: " + resultado);
                return resultado == 1; // Devuelve true si existe el usuario
            }
        }
    }
}
