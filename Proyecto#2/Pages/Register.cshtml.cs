using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;
using Proyecto_2.Pages;

public class RegisterModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;
    private readonly IConfiguration _configuration;

    public RegisterModel(IConfiguration configuration, ILogger<IndexModel> logger)
    {
        _configuration = configuration;
        _logger = logger;
    }

    [BindProperty]
    public string NombreUS { get; set; }

    [BindProperty]
    public string ContrasenaUS { get; set; }

    public IActionResult OnPost()
    {

        return RedirectToPage("/Login");
    }

    public IActionResult OnPostGuardarCreacion(string NombreUS, string ContrasenaUS)
    {
        string connectionString = _configuration.GetConnectionString("DefaultConnection");
        Console.WriteLine(NombreUS);
        Console.WriteLine(ContrasenaUS);

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                connection.Open();
                string query = "EXEC InsertarUsuarios @NombreUS, @ContrasenaUS";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add(new SqlParameter("@NombreUS", NombreUS));
                    command.Parameters.Add(new SqlParameter("@ContrasenaUS", ContrasenaUS));


                    command.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {

                _logger.LogError(ex, "Error al insertar el usuario.");
                ModelState.AddModelError(string.Empty, "Error al guardar el usuario.");
                return Page();
            }
        }

        Console.WriteLine("Si se inserto el usuario");
        return RedirectToPage("/Login");
    }
}
