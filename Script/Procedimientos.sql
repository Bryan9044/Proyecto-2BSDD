USE ERPPRUEBA
GO
CREATE PROCEDURE AgregarFactura
    @Codigo VARCHAR(15),
    @CodigoCotizacion int,
    @CedulaCliente VARCHAR(9),
    @CedulaEmpleado VARCHAR(9), 
    @CedulaJuridica VARCHAR(9),
    @TelefonoLocal VARCHAR(8),
    @NombreLocal VARCHAR(40),
    @FechaFactura DATE,
    @NombreCliente varchar(20),
    @listaArticulos varchar(40)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Factura(Codigo, CodigoCotizacion, CedulaCliente, CedulaEmpleado, CedulaJuridica, TelefonoLocal, NombreLocal, FechaFactura, NombreCliente, listaArticulos)
        VALUES (@Codigo, @CodigoCotizacion, @CedulaCliente, @CedulaEmpleado, @CedulaJuridica, @TelefonoLocal, @NombreLocal, @FechaFactura, @NombreCliente, @listaArticulos);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al intentar agregar la factura', 16, 1);
    END CATCH;
END;
GO


CREATE PROCEDURE InsertarUsuarios
    @NombreUS VARCHAR(50),
    @ContrasenaUS VARCHAR(255)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE NombreUS = @NombreUS AND ContrasenaUS = @ContrasenaUS)
        BEGIN
            INSERT INTO Usuarios(NombreUS, ContrasenaUS) VALUES (@NombreUS, @ContrasenaUS);
        END
        ELSE
        BEGIN
            RAISERROR ('Error: ya existe un usuario con el mismo nombre y contraseña.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al insertar un usuario',16,1);
    END CATCH;
END;
GO


CREATE PROCEDURE insertarEmpleado 
    @Cedula VARCHAR(9),
    @Nombre VARCHAR(30),
    @apellido1 VARCHAR(30),
    @apellido2 VARCHAR(30),
    @genero CHAR(1),
    @FechaNacimiento DATE,
    @provincia VARCHAR(30),
    @Direccion VARCHAR(30),
    @Telefono VARCHAR(9),
    @CodigoDepartamento VARCHAR(15),
    @FechaIngreso DATE,
    @Puesto VARCHAR(35),
    @tipoRol VARCHAR(20),
    @IDUsuario INT,
    @SalarioActual INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Empleado WHERE Cedula = @Cedula)
        BEGIN
            INSERT INTO Empleado(Cedula, Nombre, apellido1, apellido2, genero, FechaNacimiento, provincia, Direccion, Telefono, CodigoDepartamento,
            FechaIngreso, Puesto, tipoRol, IDUsuario, SalarioActual)
            VALUES (@Cedula, @Nombre, @apellido1, @apellido2, @genero, @FechaNacimiento, @provincia, @Direccion, @Telefono, @CodigoDepartamento,
            @FechaIngreso, @Puesto, @tipoRol, @IDUsuario, @SalarioActual);
        END
        ELSE
        BEGIN
            RAISERROR ('Error: la cédula ya existe en la tabla Empleado.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al insertar empleado', 16, 1);
    END CATCH;
END;
GO

CREATE PROCEDURE insercionRoles
    @tipoRol VARCHAR(20),
    @Descripcion VARCHAR(200)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Roles WHERE tipoRol = @tipoRol)
        BEGIN
            INSERT INTO Roles(tipoRol, Descripcion) VALUES (@tipoRol, @Descripcion);
        END
        ELSE
        BEGIN
            RAISERROR ('Error: el rol ya existe.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al insertar el rol',16,1);
    END CATCH;
END;
GO


CREATE PROCEDURE insertarAccionesXRol
    @tipoRol VARCHAR(20),
    @tipoAccion VARCHAR(40)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM AccionesXrol WHERE tipoRol = @tipoRol AND tipoAccion = @tipoAccion)
        BEGIN
            INSERT INTO AccionesXrol(tipoRol, tipoAccion) VALUES (@tipoRol, @tipoAccion);
        END
        ELSE
        BEGIN
            RAISERROR ('Error: la combinación de rol y acción ya existe.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al insertar la accion por rol', 16, 1);
    END CATCH;
END;
GO


CREATE PROCEDURE GuardarCotizacion
    @CedulaCliente VARCHAR(9),
    @CedulaEmpleado VARCHAR(9),
    @FechaCotizacion DATE,
    @MesProyectadoCierre DATE,
    @TipoCotizacion VARCHAR(50),
    @Estado VARCHAR(20),
    @Probabilidad FLOAT,
    @Zona VARCHAR(20),
    @Sector VARCHAR(20)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Cotizacion(CedulaCliente, CedulaEmpleado, FechaCotizacion, MesProyectadoCierre, TipoCotizacion, Estado, Probabilidad, Zona, Sector)
        VALUES (@CedulaCliente, @CedulaEmpleado, @FechaCotizacion, @MesProyectadoCierre, @TipoCotizacion, @Estado, @Probabilidad, @Zona, @Sector);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error en al guardar cotizacion', 16, 1)
    END CATCH;
END;
GO

	--TODO ESTO ES PARA MODIFICAR EMPLEADO
CREATE PROCEDURE ModificarEmpleado
    @Cedula VARCHAR(9),
    @Puesto VARCHAR(35),
    @SalarioActual INT
AS
BEGIN
    BEGIN TRY
        UPDATE Empleado
        SET Puesto = @Puesto, SalarioActual = @SalarioActual
        WHERE Cedula = @Cedula;
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al modificar empleado', 16, 1);
    END CATCH;
END;
GO


CREATE PROCEDURE actualizarHistoricoPuesto2
    @CedulaEmpleado VARCHAR(9),
    @FechaInicio DATE, 
    @FechaFin DATE, 
    @Departamento VARCHAR(50),
    @NombrePuesto VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        INSERT INTO HistoricoPuesto(CedulaEmpleado, FechaInicio, FechaFin, NombrePuesto, Departamento)
        VALUES (@CedulaEmpleado, @FechaInicio, @FechaFin, @NombrePuesto, @Departamento);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al actulizar el historico puesto', 16, 1);
    END CATCH;
END;
GO

CREATE PROCEDURE actualizarHistoricoSalario2
    @CedulaEmpleado VARCHAR(9),
    @FechaInicio DATE, 
    @FechaFin DATE,
    @Monto DECIMAL,
    @Departamento VARCHAR(50),
    @NombrePuesto VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        INSERT INTO HistoricoSalario(CedulaEmpleado, FechaInicio, FechaFin, Monto, NombrePuesto, Departamento)
        VALUES (@CedulaEmpleado, @FechaInicio, @FechaFin, @Monto, @NombrePuesto, @Departamento);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al actulizar el historico salario', 16, 1);
    END CATCH;
END;
GO

CREATE PROCEDURE AgregarPlanilla
    @CodigoPlanilla VARCHAR(15),
    @FechaPlanilla DATE,   
    @CedulaEmpleado VARCHAR(9),
    @HorasRealizadas INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Planilla(CodigoPlanilla, FechaPlanilla, CedulaEmpleado, HorasRealizadas)
        VALUES (@CodigoPlanilla, @FechaPlanilla, @CedulaEmpleado, @HorasRealizadas);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al agregar planilla', 16, 1);
    END CATCH;
END;
GO

	--Para calcular el pago de una planilla
CREATE PROCEDURE CalcularPago
    @CodigoPlanilla VARCHAR(15) 
AS 
BEGIN
    DECLARE @HorasRealizadas INT;
    DECLARE @Cedula VARCHAR(9);
    DECLARE @SalarioActual INT;
    DECLARE @NuevoSalario INT;
    DECLARE @Excedente INT; 

    BEGIN TRY
        SELECT @HorasRealizadas = HorasRealizadas, 
               @Cedula = CedulaEmpleado
        FROM Planilla
        WHERE CodigoPlanilla = @CodigoPlanilla;

        SELECT @SalarioActual = SalarioActual
        FROM Empleado
        WHERE Cedula = @Cedula;

        IF @HorasRealizadas > 200
        BEGIN 
            SET @Excedente = @HorasRealizadas - 200;
            SET @NuevoSalario = (@SalarioActual / 200) * @Excedente * 1.5 + @SalarioActual;
        END
        ELSE
        BEGIN
            SET @NuevoSalario = @SalarioActual;
        END

        UPDATE Planilla
        SET Salario = @NuevoSalario
        WHERE CodigoPlanilla = @CodigoPlanilla;
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al calcular el pago de la planilla', 16, 1);
    END CATCH;
END;
GO

CREATE PROCEDURE actualizarCotizacion
    @Codigo INT,
    @CedulaCliente VARCHAR(9), 
    @CedulaEmpleado VARCHAR(9),
    @FechaCotizacion DATE,
    @MesProyectadoCierre DATE,
    @TipoCotizacion VARCHAR(50),
    @Estado VARCHAR(20),
    @Probabilidad FLOAT,
    @Zona VARCHAR(20),
    @Sector VARCHAR(20)
AS
BEGIN
    BEGIN TRY
        UPDATE Cotizacion
        SET CedulaCliente = @CedulaCliente,
            CedulaEmpleado = @CedulaEmpleado,
            FechaCotizacion = @FechaCotizacion,
            MesProyectadoCierre = @MesProyectadoCierre,
            TipoCotizacion = @TipoCotizacion,
            Estado = @Estado,
            Probabilidad = @Probabilidad,
            Zona = @Zona,
            Sector = @Sector
        WHERE Codigo = @Codigo;
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al actualizar cotizacion', 16, 1);
    END CATCH;
END;
GO

CREATE PROCEDURE AgregarListaCotizacion
    @CantidadProducto INT,
    @CodigoCotizacion INT,
    @Nombre VARCHAR(40)
AS
BEGIN
    DECLARE @CodigoProducto VARCHAR(15);

    BEGIN TRY
        SELECT @CodigoProducto = Codigo 
        FROM Articulo  
        WHERE Nombre = @Nombre;

        IF @CodigoProducto IS NULL
        BEGIN
            RAISERROR('Error: El artículo no existe.', 16, 1);
            RETURN;
        END

        INSERT INTO ListaCotizacion(CodigoProducto, CantidadProducto, CodigoCotizacion) 
        VALUES (@CodigoProducto, @CantidadProducto, @CodigoCotizacion);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al agregar lista cotizacion', 16, 1);
    END CATCH;
END;
GO


CREATE PROCEDURE InsertarTarea
    @CodigoTarea VARCHAR(15),
    @tipoTareaCotizacion VARCHAR(30),
    @Fecha DATE,
    @Descripcion VARCHAR(200),
    @Estado VARCHAR(30)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Tarea (CodigoTarea, tipoTareaCotizacion, Fecha, Descripcion, Estado)
        VALUES (@CodigoTarea, @tipoTareaCotizacion, @Fecha, @Descripcion, @Estado);
    END TRY
    BEGIN CATCH
        RAISERROR('Error al insertar tarea', 16, 1);
    END CATCH;
END;
GO





GO
CREATE PROCEDURE EliminarCotizacion
    @CodigoCotizacion INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM ListaCotizacion WHERE CodigoCotizacion = @CodigoCotizacion;
        DELETE FROM Cotizacion WHERE Codigo = @CodigoCotizacion;
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al eliminar cotizacion', 16, 1);
    END CATCH;
END;
GO


CREATE PROCEDURE IngresarMovimiento
    @Cedula VARCHAR(9),
    @BodegaOrigen VARCHAR(15),
    @BodegaDestino VARCHAR(15) = NULL,
    @fecha DATE,
    @hora TIME
AS
BEGIN
    DECLARE @CodigoBodegaOrigen VARCHAR(15);
    DECLARE @CodigoBodegaDestino VARCHAR(15) = NULL;

    BEGIN TRY
        SELECT @CodigoBodegaOrigen = Codigo 
        FROM Bodega 
        WHERE Nombre = @BodegaOrigen;

        IF @CodigoBodegaOrigen IS NULL
        BEGIN  
            RAISERROR('Error: La bodega de origen no existe.', 16, 1);
            RETURN;
        END

        IF @BodegaDestino IS NOT NULL
        BEGIN
            SELECT @CodigoBodegaDestino = Codigo 
            FROM Bodega 
            WHERE Nombre = @BodegaDestino;

            IF @CodigoBodegaDestino IS NULL
            BEGIN
                RAISERROR('Error: La bodega de destino no existe.', 16, 1);
                RETURN;
            END
        END

        INSERT INTO Movimiento (Cedula, BodegaOrigen, BodegaDestino, fecha, hora)
        VALUES (@Cedula, @CodigoBodegaOrigen, @CodigoBodegaDestino, @fecha, @hora);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al ingresarMovimiento', 16, 1);
    END CATCH;
END;
GO

CREATE PROCEDURE RegistrarInventario
    @IDMovimiento INT,
    @CedulaEmpleado VARCHAR(9),
    @BodegaDestino VARCHAR(15),
    @Fecha DATE
AS
BEGIN
    DECLARE @CodigoBodegaDestino VARCHAR(15);

    BEGIN TRY
        SELECT @CodigoBodegaDestino = Codigo 
        FROM Bodega 
        WHERE Nombre = @BodegaDestino;

        IF @CodigoBodegaDestino IS NULL
        BEGIN
            RAISERROR('Error: La bodega de destino no existe.', 16, 1);
            RETURN;
        END

        INSERT INTO IngresoInventario(IDMovimiento, CedulaEmpleado, BodegaDestino, Fecha)
        VALUES (@IDMovimiento, @CedulaEmpleado, @CodigoBodegaDestino, @Fecha);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al ingresar', 16, 1);
    END CATCH;
END;
GO


CREATE PROCEDURE IngresarInventarioArticulos
    @IDMovimiento INT,
    @NombreArticulo VARCHAR(40),
    @CantidadIngresada INT
AS
BEGIN
    DECLARE @CodigoFinal VARCHAR(15);

    BEGIN TRY
        -- Buscar el código del artículo según su nombre
        SELECT @CodigoFinal = Codigo
        FROM Articulo
        WHERE Nombre = @NombreArticulo;

        IF @CodigoFinal IS NULL
        BEGIN
            RAISERROR('Error: El artículo no existe.', 16, 1);
            RETURN;
        END

        INSERT INTO ListaIngreso(IDMovimiento, CodigoArticulo, CantidadIngresada)
        VALUES (@IDMovimiento, @CodigoFinal, @CantidadIngresada);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al ingresar articulos', 16, 1);
    END CATCH;
END;
GO

CREATE PROCEDURE AgregarArticulosFactura
    @IDLista VARCHAR(40),
    @NombreProducto VARCHAR(40),
    @CantidadProducto INT
AS
BEGIN
    DECLARE @CodigoProdu VARCHAR(15);

    BEGIN TRY
        SELECT @CodigoProdu = Codigo
        FROM Articulo
        WHERE Nombre = @NombreProducto;

        IF @CodigoProdu IS NULL
        BEGIN
            RAISERROR('Error: El producto no existe.', 16, 1);
            RETURN;
        END

        INSERT INTO ListaFactura(IDLista, CodigoProducto, CantidadProducto)
        VALUES (@IDLista, @CodigoProdu, @CantidadProducto);
    END TRY
    BEGIN CATCH
        RAISERROR ('Error al agregar articulos', 16, 1);
    END CATCH;
END;
GO