USE ERPPRUEBA

GO
create function ExisteUsuario(@NombreUS varchar(50), @ContrasenaUS varchar(255))
returns int
as
begin
	 declare @Existe int;
	 IF EXISTS (select 1 from Usuarios where NombreUS = @NombreUS and ContrasenaUS = @ContrasenaUS)
	 begin
		set @Existe = 1;
	 end
	 else
	 begin
		set @Existe = 0;
	 end
	 return @Existe;
end;
GO

create function ObtenerDepartamentos()
returns table
as

return(
	select Codigo From Departamento
	);
GO

create function ObtenerPuestos()
returns table 
as
return(
	select TipoPuesto from Puesto
);
GO

CREATE FUNCTION ObtenerRoles()
returns table
as
return
(
    select tipoRol
    from Roles
);
GO

create function ObtenerUsuarios()
returns table
as
return(
	select IDUsuario from Usuarios
);
GO

create function ObtenerTipoAcciones()
returns table
as
return
(
select tipoAccion from Acciones
);
GO

create function VerEmpleados()
returns table
as
return(
	select * from Empleado
);
go

create function VerCotizaciones()
returns table
as
return(
	select * from Cotizacion
);
GO

create function MostrarZonas()
returns table
as
return 
(
	select Nombre from Zona
);
GO

create function MostrarSectores()
returns table
as
return 
(
	select Nombre from Sector
);
GO

create function MostrarClientes()
returns table
as
return
(
select Cedula from Cliente
);
GO

create function MostrarEmpleados()
returns table
as
return(
	select Cedula from Empleado
);
GO

create function MostrarTiposCotizacion()
returns table
as 
return 
(
	select Tipocotizacion from TipoCotizacion
);

GO

create function MostrarEstados()
returns table
as
return
(
	select TipoEstado from Estado
);
GO

create function MostrarProbabilidad()
returns table 
as 
return (
	select Porcentaje from Probabilidad
);
GO

create function RolesXusuario()
returns table
as
return(
	select tipoRol, IDUsuario from Empleado
);
GO

create function actualizarHistoricoPuesto(@Cedula varchar(9))
returns table
as
return(
select FechaIngreso, CodigoDepartamento, Puesto from Empleado where Cedula = @Cedula
);
GO
create function actualizarHistoricoSalario(@Cedula varchar(9))
returns table
as
return(
select FechaIngreso, CodigoDepartamento, Puesto,SalarioActual from Empleado where Cedula = @Cedula
);
GO

create function MostrarCodigoCotizacion()
returns table
as
return
(
	select Codigo from Cotizacion
);
go

create function MostrarArticulos()
returns table
as
return(
	select Nombre from Articulo
);
go

create function MostrarTareasCOT()
returns table
as
return (
	select TipoTarea from TipoTareaCotizacion
); --Creada ya
go

create function MostrarEstadosTarea()
returns table
as 
return (
	select tipoEstado from TipoTareaEstado
); 
go

create function mostrarTareasC()
returns table
as return(
	select * from TareaCotizacion
);
go

create function mostrarBodegas()
 returns table
 as return(
	select Nombre from Bodega
 );
go

create function mostrarMovimientos()
returns table
as 
return (
	select IDMovimiento from Movimiento
);
go