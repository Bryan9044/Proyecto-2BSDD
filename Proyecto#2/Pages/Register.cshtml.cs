using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

public class RegisterModel : PageModel
{
    private readonly IConfiguration _configuration;

    public RegisterModel(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    [BindProperty]
    public string NombreUS { get; set; }

    [BindProperty]
    public string ContrasenaUS { get; set; }

    public IActionResult OnPost()
    {
        // Crear el usuario en la base de datos


        //_context.Usuarios.Add(nuevoUsuario);
       // _context.SaveChanges();

        // Redirigir al login
        return RedirectToPage("/Login");
    }
}
