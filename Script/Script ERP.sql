CREATE DATABASE ERP;
GO
USE ERP;
GO

CREATE TABLE Departamento (
    CodigoDepartamento VARCHAR(15),
    Nombre VARCHAR(100) NOT NULL,
	PRIMARY KEY (CodigoDepartamento)
)

CREATE TABLE Puesto (
	NombrePuesto VARCHAR(20),
	Salario FLOAT,
	Descripcion VARCHAR(15),
	PRIMARY KEY (NombrePuesto)

)

CREATE TABLE Residencia (
	NumeroResidencia INT NOT NULL,
	Ubicacion VARCHAR(200) NOT NULL,
	PRIMARY KEY (NumeroResidencia)
)

CREATE TABLE Empleado (
    CedulaEmpleado VARCHAR(15),
    Nombre VARCHAR(20),
    Apellido1 VARCHAR(20),
    Apellido2 VARCHAR(20),
    Genero INT,
    FechaNacimiento DATE,
    Residencia INT,
    Telefono VARCHAR(20),
    FechaIngreso DATE,
    PuestoActual VARCHAR(20),
    DepartamentoActual VARCHAR(15),
	PRIMARY KEY (CedulaEmpleado),
    FOREIGN KEY (DepartamentoActual) REFERENCES Departamento(CodigoDepartamento),
	FOREIGN KEY (PuestoActual) REFERENCES Puesto(NombrePuesto),
	FOREIGN KEY (Residencia) REFERENCES Residencia(NumeroResidencia)
)

CREATE TABLE Historicos (
    CodigoHistorico VARCHAR(15),
    CedulaEmpleado VARCHAR(15),
    FechaInicio DATE,
    FechaFin DATE,
    NombrePuesto VARCHAR(20),
    CodigoDepartamento VARCHAR(15),
	PRIMARY KEY (CodigoHistorico),
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(CedulaEmpleado),
    FOREIGN KEY (CodigoDepartamento) REFERENCES Departamento(CodigoDepartamento),
	FOREIGN KEY (NombrePuesto) REFERENCES Puesto(NombrePuesto)

)

CREATE TABLE Modulo (
    NumeroModulo INT,
	CedulaEmpleado VARCHAR(15),
    NombreModulo VARCHAR(20) UNIQUE NOT NULL,
    Descripcion VARCHAR(200),
	PRIMARY KEY (NumeroModulo),
	FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(CedulaEmpleado)
)

CREATE TABLE Accion (
    NumeroAccion INT NOT NULL,
	NumeroModulo INT,
    tipoAccion VARCHAR(20) UNIQUE,
    descripcion VARCHAR(200),
    PRIMARY KEY (NumeroAccion),
	FOREIGN KEY (NumeroModulo) REFERENCES Modulo(NumeroModulo)
)

CREATE TABLE Familia (
    CodigoFamilia VARCHAR(15),
    NombreFamilia VARCHAR(20),
    Activo INT,
    Descripcion VARCHAR(200),
	PRIMARY KEY(CodigoFamilia)
)

CREATE TABLE Articulo (
    CodigoArticulo VARCHAR(15),
    NombreArticulo VARCHAR(20),
    Activo INT,
    Descripcion VARCHAR(200),
    FamiliaArticulo VARCHAR(15),
    PesoKG FLOAT,
    Costo FLOAT,
    PrecioEstandar FLOAT,
	PRIMARY KEY (CodigoArticulo),
    FOREIGN KEY (FamiliaArticulo) REFERENCES Familia(CodigoFamilia)
)

CREATE TABLE Sector (
    NombreSector VARCHAR(20),
	PRIMARY KEY (NombreSector)
)

CREATE TABLE Zona (
    NombreZona VARCHAR(20),
	PRIMARY KEY (NombreZona)
)


CREATE TABLE Bodega (
    CodigoBodega VARCHAR(15),
    NombreBodega VARCHAR(20),
    Ubicacion VARCHAR(200),
    CapacidadTON FLOAT,
    EspacioCubico FLOAT,
	PRIMARY KEY (CodigoBodega)
)

CREATE TABLE ListaArticulo (
    CodigoLista VARCHAR(15),
    CodigoBodega VARCHAR(15),
    CodigoArticulo VARCHAR(15),
    Cantidad FLOAT,
	PRIMARY KEY (CodigoLista),
    FOREIGN KEY (CodigoBodega) REFERENCES Bodega(CodigoBodega),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(CodigoArticulo)
)



CREATE TABLE BodegaArticulo (
	NumeroBodegaArticulo INT,
	CodigoBodega VARCHAR(15),
	CodigoArticulo VARCHAR(15),
	Existencias INT, 
    FOREIGN KEY (CodigoBodega) REFERENCES Bodega(CodigoBodega),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(CodigoArticulo)
)

CREATE TABLE MovimientoEntrada (
    CodigoMovimientoE VARCHAR(15),
    FechaYHora DATETIME,
    CedulaUsuario VARCHAR(15),
    BodegaDestino VARCHAR(15),
    ListaArticulos VARCHAR(15),
	PRIMARY KEY(CodigoMovimientoE),
    FOREIGN KEY (BodegaDestino) REFERENCES Bodega(CodigoBodega),
    FOREIGN KEY (ListaArticulos) REFERENCES ListaArticulo(CodigoLista)
)

CREATE TABLE MovimientoBodegas (
    CodigoMovimientoB VARCHAR (15),
    FechaYHora DATETIME,
    Usuario VARCHAR(100),
    BodegaOrigen VARCHAR(15),
    BodegaDestino VARCHAR(15),
    ListaArticulos VARCHAR(15),
	PRIMARY KEY (CodigoMovimientoB),
    FOREIGN KEY (BodegaOrigen) REFERENCES Bodega(CodigoBodega),
    FOREIGN KEY (BodegaDestino) REFERENCES Bodega(CodigoBodega),
    FOREIGN KEY (ListaArticulos) REFERENCES ListaArticulo(CodigoLista)
)

CREATE TABLE MovimientoSalida (
    CodigoFactura VARCHAR(15),
    CedulaUsuario VARCHAR(15),
    BodegaPorArticulo VARCHAR(15), --Falta la logica para esto
	PRIMARY KEY (CodigoFactura),
    FOREIGN KEY (BodegaPorArticulo) REFERENCES Bodega(CodigoBodega)
)

CREATE TABLE Cliente (
    CedulaCliente VARCHAR(15),
    Nombre VARCHAR(20),
    CorreoElectronico VARCHAR(20),
    Celular VARCHAR(8),
    Fax VARCHAR(20),
    Zona VARCHAR(20),
    Sector VARCHAR(20),
	PRIMARY KEY(CedulaCliente),
    FOREIGN KEY (Zona) REFERENCES Zona(NombreZona),
    FOREIGN KEY (Sector) REFERENCES Sector(NombreSector)
)

CREATE TABLE Estado (
	NombreEstado VARCHAR(20),
	Descripcion VARCHAR(200),
	PRIMARY KEY (NombreEstado)
)

CREATE TABLE Cotizacion (
    NumeroCotizacion INT PRIMARY KEY,
    CedulaCliente VARCHAR(15),
    FechaCotizacion DATE,
    MesProyectadoCierre INT,
    CedulaVendedor VARCHAR(15),
    FechaCierre DATE,
    Probabilidad FLOAT,
    OrdenDeCompra VARCHAR(100),
    TipoCotizacion VARCHAR(50),
    Descripcion VARCHAR(200),
    Zona VARCHAR(20),
    Sector VARCHAR(20),
    Estado VARCHAR(20),
    MontoTotal FLOAT,
    ListaArticulos VARCHAR(15),
    FOREIGN KEY (CedulaCliente) REFERENCES Cliente(CedulaCliente),
    FOREIGN KEY (Zona) REFERENCES Zona(NombreZona),
    FOREIGN KEY (Sector) REFERENCES Sector(NombreSector),
    FOREIGN KEY (ListaArticulos) REFERENCES ListaArticulo(CodigoLista),
	FOREIGN KEY (Estado) REFERENCES Estado(NombreEstado)
)

CREATE TABLE Tarea (
	NumeroTarea INT,
    CedulaEmpleado VARCHAR(15),
    NumeroCotizacion INT,
    Descripcion VARCHAR(200),
    PRIMARY KEY (NumeroTarea),
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(CedulaEmpleado),
    FOREIGN KEY (NumeroCotizacion) REFERENCES Cotizacion(NumeroCotizacion)
)

CREATE TABLE Factura (
    NumeroFactura INT,
    NombreLocal VARCHAR(100),
    CedulaJuridicaLocal VARCHAR(15),
    TelefonosLocal VARCHAR(50),
    CedulaCliente VARCHAR(15),
    NombreCliente VARCHAR(20),
    NumeroCotizacion INT,
    CedulaVendedor VARCHAR(15),
    FechaFactura DATE,
    Estado VARCHAR(20),
	PRIMARY KEY(NumeroFactura),
    FOREIGN KEY (CedulaCliente) REFERENCES Cliente(CedulaCliente),
    FOREIGN KEY (NumeroCotizacion) REFERENCES Cotizacion(NumeroCotizacion),
	FOREIGN KEY (Estado) REFERENCES Estado(NombreEstado)
)
