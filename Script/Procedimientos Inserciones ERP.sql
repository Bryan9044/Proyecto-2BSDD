CREATE PROCEDURE InsertarRol
    @NumeroRol INT,
    @NombreRol VARCHAR(20),
    @Descripcion VARCHAR(20)
AS
BEGIN
    INSERT INTO Rol (NumeroRol, NombreRol, Descripcion)
    VALUES (@NumeroRol, @NombreRol, @Descripcion);
END;
GO

CREATE PROCEDURE InsertarModulo
    @NumeroModulo INT,
    @NombreModulo VARCHAR(20),
    @Descripcion VARCHAR(200)
AS
BEGIN
    INSERT INTO Modulo (NumeroModulo, NombreModulo, Descripcion)
    VALUES (@NumeroModulo, @NombreModulo, @Descripcion);
END;
GO

CREATE PROCEDURE InsertarAccionesXModulo
    @NumeroAccion INT,
    @NumeroModulo INT,
    @NombreAccion VARCHAR(20),
    @Descripcion VARCHAR(200)
AS
BEGIN
    INSERT INTO AccionesXModulo (NumeroAccion, NumeroModulo, NombreAccion, Descripcion)
    VALUES (@NumeroAccion, @NumeroModulo, @NombreAccion, @Descripcion);
END;
GO

CREATE PROCEDURE InsertarEmpleado
    @CedulaEmpleado VARCHAR(15),
    @Nombre VARCHAR(20),
    @Apellido1 VARCHAR(20),
    @Apellido2 VARCHAR(20),
    @Genero INT,
    @FechaNacimiento DATE,
    @Residencia INT,
    @Telefono VARCHAR(20),
    @FechaIngreso DATE,
    @PuestoActual VARCHAR(20),
    @DepartamentoActual VARCHAR(15)
AS
BEGIN
    INSERT INTO Empleado (CedulaEmpleado, Nombre, Apellido1, Apellido2, Genero, FechaNacimiento, Residencia, Telefono, FechaIngreso, PuestoActual, DepartamentoActual)
    VALUES (@CedulaEmpleado, @Nombre, @Apellido1, @Apellido2, @Genero, @FechaNacimiento, @Residencia, @Telefono, @FechaIngreso, @PuestoActual, @DepartamentoActual);
END;
GO

CREATE PROCEDURE InsertarArticulo
    @CodigoArticulo VARCHAR(15),
    @NombreArticulo VARCHAR(20),
    @Activo INT,
    @Descripcion VARCHAR(200),
    @FamiliaArticulo VARCHAR(15),
    @PesoKG FLOAT,
    @Costo FLOAT,
    @PrecioEstandar FLOAT
AS
BEGIN
    INSERT INTO Articulo (CodigoArticulo, NombreArticulo, Activo, Descripcion, FamiliaArticulo, PesoKG, Costo, PrecioEstandar)
    VALUES (@CodigoArticulo, @NombreArticulo, @Activo, @Descripcion, @FamiliaArticulo, @PesoKG, @Costo, @PrecioEstandar);
END;
GO

CREATE PROCEDURE InsertarDepartamento
    @CodigoDepartamento VARCHAR(15),
    @Nombre VARCHAR(100)
AS
BEGIN
    INSERT INTO Departamento (CodigoDepartamento, Nombre)
    VALUES (@CodigoDepartamento, @Nombre);
END;
GO

CREATE PROCEDURE InsertarPuesto
    @NombrePuesto VARCHAR(20),
    @Salario FLOAT,
    @Descripcion VARCHAR(15)
AS
BEGIN
    INSERT INTO Puesto (NombrePuesto, Salario, Descripcion)
    VALUES (@NombrePuesto, @Salario, @Descripcion);
END;
GO

CREATE PROCEDURE InsertarResidencia
    @NumeroResidencia INT,
    @Ubicacion VARCHAR(200)
AS
BEGIN
    INSERT INTO Residencia (NumeroResidencia, Ubicacion)
    VALUES (@NumeroResidencia, @Ubicacion);
END;
GO

CREATE PROCEDURE InsertarRolXUsuarios
    @CedulaEmpleado VARCHAR(15),
    @NumeroRol INT
AS
BEGIN
    INSERT INTO RolXUsuarios (CedulaEmpleado, NumeroRol)
    VALUES (@CedulaEmpleado, @NumeroRol);
END;
GO

CREATE PROCEDURE InsertarHistorico
    @CodigoHistorico VARCHAR(15),
    @CedulaEmpleado VARCHAR(15),
    @FechaInicio DATE,
    @FechaFin DATE,
    @NombrePuesto VARCHAR(20),
    @CodigoDepartamento VARCHAR(15)
AS
BEGIN
    INSERT INTO Historicos (CodigoHistorico, CedulaEmpleado, FechaInicio, FechaFin, NombrePuesto, CodigoDepartamento)
    VALUES (@CodigoHistorico, @CedulaEmpleado, @FechaInicio, @FechaFin, @NombrePuesto, @CodigoDepartamento);
END;
GO

CREATE PROCEDURE InsertarFamilia
    @CodigoFamilia VARCHAR(15),
    @NombreFamilia VARCHAR(20),
    @Activo INT,
    @Descripcion VARCHAR(200)
AS
BEGIN
    INSERT INTO Familia (CodigoFamilia, NombreFamilia, Activo, Descripcion)
    VALUES (@CodigoFamilia, @NombreFamilia, @Activo, @Descripcion);
END;
GO

CREATE PROCEDURE InsertarBodega
    @CodigoBodega VARCHAR(15),
    @NombreBodega VARCHAR(20),
    @Ubicacion VARCHAR(200),
    @CapacidadTON FLOAT,
    @EspacioCubico FLOAT
AS
BEGIN
    INSERT INTO Bodega (CodigoBodega, NombreBodega, Ubicacion, CapacidadTON, EspacioCubico)
    VALUES (@CodigoBodega, @NombreBodega, @Ubicacion, @CapacidadTON, @EspacioCubico);
END;
GO

CREATE PROCEDURE InsertarListaArticulo
    @CodigoLista VARCHAR(15),
    @CodigoBodega VARCHAR(15),
    @CodigoArticulo VARCHAR(15),
    @Cantidad FLOAT
AS
BEGIN
    INSERT INTO ListaArticulo (CodigoLista, CodigoBodega, CodigoArticulo, Cantidad)
    VALUES (@CodigoLista, @CodigoBodega, @CodigoArticulo, @Cantidad);
END;
GO

CREATE PROCEDURE InsertarBodegaArticulo
    @NumeroBodegaArticulo INT,
    @CodigoBodega VARCHAR(15),
    @CodigoArticulo VARCHAR(15),
    @Existencias INT
AS
BEGIN
    INSERT INTO BodegaArticulo (NumeroBodegaArticulo, CodigoBodega, CodigoArticulo, Existencias)
    VALUES (@NumeroBodegaArticulo, @CodigoBodega, @CodigoArticulo, @Existencias);
END;
GO

CREATE PROCEDURE InsertarMovimientoEntrada
    @CodigoMovimientoE VARCHAR(15),
    @FechaYHora DATETIME,
    @CedulaUsuario VARCHAR(15),
    @BodegaDestino VARCHAR(15),
    @ListaArticulos VARCHAR(15)
AS
BEGIN
    INSERT INTO MovimientoEntrada (CodigoMovimientoE, FechaYHora, CedulaUsuario, BodegaDestino, ListaArticulos)
    VALUES (@CodigoMovimientoE, @FechaYHora, @CedulaUsuario, @BodegaDestino, @ListaArticulos);
END;
GO

CREATE PROCEDURE InsertarMovimientoBodegas
    @CodigoMovimientoB VARCHAR(15),
    @FechaYHora DATETIME,
    @Usuario VARCHAR(100),
    @BodegaOrigen VARCHAR(15),
    @BodegaDestino VARCHAR(15),
    @ListaArticulos VARCHAR(15)
AS
BEGIN
    INSERT INTO MovimientoBodegas (CodigoMovimientoB, FechaYHora, Usuario, BodegaOrigen, BodegaDestino, ListaArticulos)
    VALUES (@CodigoMovimientoB, @FechaYHora, @Usuario, @BodegaOrigen, @BodegaDestino, @ListaArticulos);
END;
GO

CREATE PROCEDURE InsertarMovimientoSalida
    @CodigoFactura VARCHAR(15),
    @CedulaUsuario VARCHAR(15),
    @BodegaPorArticulo VARCHAR(15)
AS
BEGIN
    INSERT INTO MovimientoSalida (CodigoFactura, CedulaUsuario, BodegaPorArticulo)
    VALUES (@CodigoFactura, @CedulaUsuario, @BodegaPorArticulo);
END;
GO

CREATE PROCEDURE InsertarCliente
    @CedulaCliente VARCHAR(15),
    @Nombre VARCHAR(20),
    @CorreoElectronico VARCHAR(20),
    @Celular VARCHAR(8),
    @Fax VARCHAR(20),
    @Zona VARCHAR(20),
    @Sector VARCHAR(20)
AS
BEGIN
    INSERT INTO Cliente (CedulaCliente, Nombre, CorreoElectronico, Celular, Fax, Zona, Sector)
    VALUES (@CedulaCliente, @Nombre, @CorreoElectronico, @Celular, @Fax, @Zona, @Sector);
END;
GO

CREATE PROCEDURE InsertarCotizacion
    @NumeroCotizacion INT,
    @CedulaCliente VARCHAR(15),
    @FechaCotizacion DATE,
    @MesProyectadoCierre INT,
    @CedulaVendedor VARCHAR(15),
    @FechaCierre DATE,
    @Probabilidad FLOAT,
    @OrdenDeCompra VARCHAR(100),
    @TipoCotizacion VARCHAR(50),
    @Descripcion VARCHAR(200),
    @Zona VARCHAR(20),
    @Sector VARCHAR(20),
    @Estado VARCHAR(20),
    @MontoTotal FLOAT,
    @ListaArticulos VARCHAR(15)
AS
BEGIN
    INSERT INTO Cotizacion (NumeroCotizacion, CedulaCliente, FechaCotizacion, MesProyectadoCierre, CedulaVendedor, FechaCierre, Probabilidad, OrdenDeCompra, TipoCotizacion, Descripcion, Zona, Sector, Estado, MontoTotal, ListaArticulos)
    VALUES (@NumeroCotizacion, @CedulaCliente, @FechaCotizacion, @MesProyectadoCierre, @CedulaVendedor, @FechaCierre, @Probabilidad, @OrdenDeCompra, @TipoCotizacion, @Descripcion, @Zona, @Sector, @Estado, @MontoTotal, @ListaArticulos);
END;
GO

CREATE PROCEDURE InsertarTarea
    @NumeroTarea INT,
    @CedulaEmpleado VARCHAR(15),
    @NumeroCotizacion INT,
    @Descripcion VARCHAR(200)
AS
BEGIN
    INSERT INTO Tarea (NumeroTarea, CedulaEmpleado, NumeroCotizacion, Descripcion)
    VALUES (@NumeroTarea, @CedulaEmpleado, @NumeroCotizacion, @Descripcion);
END;
GO

CREATE PROCEDURE InsertarFactura
    @NumeroFactura INT,
    @NombreLocal VARCHAR(100),
    @CedulaJuridicaLocal VARCHAR(15),
    @TelefonosLocal VARCHAR(50),
    @CedulaCliente VARCHAR(15),
    @NombreCliente VARCHAR(20),
    @NumeroCotizacion INT,
    @CedulaVendedor VARCHAR(15),
    @FechaFactura DATE,
    @Estado VARCHAR(20)
AS
BEGIN
    INSERT INTO Factura (NumeroFactura, NombreLocal, CedulaJuridicaLocal, TelefonosLocal, CedulaCliente, NombreCliente, NumeroCotizacion, CedulaVendedor, FechaFactura, Estado)
    VALUES (@NumeroFactura, @NombreLocal, @CedulaJuridicaLocal, @TelefonosLocal, @CedulaCliente, @NombreCliente, @NumeroCotizacion, @CedulaVendedor, @FechaFactura, @Estado);
END;
GO

CREATE PROCEDURE InsertarSector
    @NombreSector VARCHAR(20)
AS
BEGIN
    INSERT INTO Sector (NombreSector)
    VALUES (@NombreSector);
END;
GO

CREATE PROCEDURE InsertarZona
    @NombreZona VARCHAR(20)
AS
BEGIN
    INSERT INTO Zona (NombreZona)
    VALUES (@NombreZona);
END;
GO

CREATE PROCEDURE InsertarEstado
    @NombreEstado VARCHAR(20),
    @Descripcion VARCHAR(200)
AS
BEGIN
    INSERT INTO Estado (NombreEstado, Descripcion)
    VALUES (@NombreEstado, @Descripcion);
END;
GO
