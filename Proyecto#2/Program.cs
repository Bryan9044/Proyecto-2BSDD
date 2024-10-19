var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddSession(); //Para iniciar sesion
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseSession();  //Para iniciar sesion
app.UseAuthorization();



//Importante para ver donde redirijo al usuario sino esta iniciando va para el Login si ya inicio a la página principal
app.MapGet("/", (HttpContext httpContext) =>
{
    if (string.IsNullOrEmpty(httpContext.Session.GetString("NombreUS")))
    {
        httpContext.Response.Redirect("/Login");
    }
    else
    {
        httpContext.Response.Redirect("/Index");
    }
});


app.MapRazorPages();

app.Run();
