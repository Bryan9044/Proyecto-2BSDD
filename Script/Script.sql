CREATE DATABASE ERPPRUEBA
GO

USE ERPPRUEBA;
GO

CREATE TABLE Usuarios (
    IDUsuario INT IDENTITY(1,1) PRIMARY KEY,
    NombreUS VARCHAR(50) NOT NULL UNIQUE,
    ContrasenaUS VARCHAR(255) NOT NULL
);

CREATE TABLE Zona (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	TamanoKmCuadrado INT NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
);

CREATE TABLE Sector (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
);

CREATE TABLE Estado(
	TipoEstado VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (TipoEstado)
);

CREATE TABLE Probabilidad (
	Porcentaje FLOAT,
	ProbabilidadEstimada VARCHAR(20),
	PRIMARY KEY (Porcentaje)
);

CREATE TABLE Prioridad(
	TipoPrioridad VARCHAR(20) NOT NULL,
	Descripcion varchar(200) not null
	PRIMARY KEY (TipoPrioridad)
);

CREATE TABLE TipoCaso(
	Tipocaso VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (Tipocaso)
);

CREATE TABLE Departamento (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY(Codigo)
);

CREATE TABLE Modulos (
    IDModulo INT PRIMARY KEY,
    NombreModulo VARCHAR(50) UNIQUE NOT NULL,
    Descripcion VARCHAR(200)
);

CREATE TABLE Acciones (
    IDAccion INT NOT NULL,
    tipoAccion VARCHAR(40) UNIQUE,
    descripcion VARCHAR(200),
    PRIMARY KEY (IDAccion)
);

CREATE TABLE ModulosXAcciones (
    NombreModulo varchar(50),
    tipoAccion varchar(40),
    PRIMARY KEY (NombreModulo, tipoAccion),
    FOREIGN KEY (NombreModulo) REFERENCES Modulos(NombreModulo),
    FOREIGN KEY (tipoAccion) REFERENCES Acciones(tipoAccion)
);

CREATE TABLE Roles (
    IDRol INT IDENTITY(1,1) , --Preguntar si se puede autoIncrementar
    tipoRol VARCHAR(20) UNIQUE,
	Descripcion varchar(200),
    PRIMARY KEY (IDRol)
);

CREATE TABLE AccionesXrol (
	IDAccionesXRol INT IDENTITY (1,1),
    tipoRol VARCHAR(20),
    tipoAccion VARCHAR(40),
    PRIMARY KEY (IDAccionesXRol),
    FOREIGN KEY (tipoRol) REFERENCES Roles(tipoRol),
    FOREIGN KEY (tipoAccion) REFERENCES Acciones(tipoAccion)
);

CREATE TABLE Puesto(
	TipoPuesto VARCHAR(35) NOT NULL,
	Salario int NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (TipoPuesto)
);

CREATE TABLE Empleado (
	Cedula VARCHAR(9) NOT NULL,
	Nombre varchar(30) not null,
	apellido1 varchar(30) Not null,
	apellido2 varchar(30) not null,
	genero char(1) not null,
	FechaNacimiento date not null,
	provincia varchar(30) not null,
	Direccion varchar(30) not null,
	Telefono varchar(9) not null,
	CodigoDepartamento VARCHAR(15) NOT NULL,
	FechaIngreso DATE NOT NULL,
	Puesto VARCHAR(35) NOT NULL,
	tipoRol varchar(20) not null,
	IDUsuario INT not null,
	SalarioActual int not null
	PRIMARY KEY(Cedula),
	FOREIGN KEY (tipoRol) references Roles(tipoRol),
	FOREIGN KEY (CodigoDepartamento) REFERENCES Departamento(Codigo),
	FOREIGN KEY (Puesto) REFERENCES Puesto(TipoPuesto),
	FOREIGN KEY (IDUsuario) REFERENCES Usuarios(IDUsuario) --Lo podriamos cambiar por el nombre
);

CREATE TABLE HistoricoPuesto (
    IdHistoricoPuesto INT PRIMARY KEY IDENTITY(1,1), 
    CedulaEmpleado VARCHAR(9) not null, -- Agregado
    FechaInicio DATE not null,  
    FechaFin DATE not null, 
    NombrePuesto VARCHAR(50) not null, 
    Departamento VARCHAR(50) not null,
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula)
);

CREATE TABLE HistoricoSalario (
    IdHistoricoSalario INT PRIMARY KEY IDENTITY(1,1), 
    CedulaEmpleado VARCHAR(9) not null, -- Agregado
    FechaInicio DATE not null,  
    FechaFin DATE not null, 
    Monto Decimal not null, 
    NombrePuesto VARCHAR(50) not null, 
    Departamento VARCHAR(50) not null,
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula)
);

CREATE TABLE Familia (
	CodigoFamilia VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	activo varchar(20) not null,
	Descripcion VARCHAR(200) not null,
	PRIMARY KEY(CodigoFamilia)
);

CREATE TABLE Articulo (
	CodigoFamilia VARCHAR(15)  NOT NULL,
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(40) NOT NULL,
	Activo Varchar(20) not null,
	Peso FLOAT NOT NULL,
	Costo decimal not null,
	PrecioEstandar decimal not null,
	Descripcion VARCHAR(200) not null,
	PRIMARY KEY (Codigo),
	FOREIGN KEY (CodigoFamilia) references Familia(CodigoFamilia)
);

CREATE TABLE Bodega (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Ubicacion VARCHAR(20) NOT NULL,
	EspacioCubico int NOT NULL,
	CapacidadTon int NOT NULL,
	PRIMARY KEY (Codigo)
);

CREATE TABLE FamiliaBodega (
	CodigoBodega VARCHAR(15) NOT NULL,
	CodigoFamilia VARCHAR(15) NOT NULL,
	PRIMARY KEY (CodigoBodega,CodigoFamilia),
	FOREIGN KEY (CodigoBodega) references Bodega(Codigo),
	FOREIGN KEY (CodigoFamilia) references Familia(CodigoFamilia)
);

CREATE TABLE Cliente (
    Cedula VARCHAR(9) NOT NULL,
    Telefono VARCHAR(8) NOT NULL,
    Genero char(1) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    CorreoElectronico VARCHAR(50) NOT NULL,
    Fax VARCHAR(20) not null,
    Sector varchar(20) not null,
    Zona varchar(20) not null,
	Celular VARCHAR(8) NOT NULL,
	PRIMARY KEY (Cedula)
);

--Esto es para los articulos de la bodega
CREATE TABLE ListaArticulos (
    CodigoBodega VARCHAR(15) NOT NULL,
    CodigoProducto VARCHAR(15) NOT NULL,
    CantidadProducto INT NOT NULL,
    PRIMARY KEY (CodigoBodega,CodigoProducto),
    FOREIGN KEY (CodigoBodega) REFERENCES Bodega(Codigo),
    FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo)
);

create table TipoTareaCotizacion (
	TipoTarea varchar(30),
	descripcion varchar(200)
	Primary key (TipoTarea)
)

create table TipoTareaCaso (
	TipoTarea varchar(30) not null,
	descripcion varchar(200)not null,
	Primary key (TipoTarea)
)

create table TipoTareaEstado (
	tipoEstado varchar(30) not null,
	descripcion varchar(200)not null,
	Primary key (tipoEstado)
)

CREATE TABLE Tarea (
    CodigoTarea VARCHAR(15) NOT NULL,
	tipoTareaCotizacion varchar(30) null,
	tipoTareaCaso varchar(30) null,
    Fecha DATE NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    Estado VARCHAR(30) NOT NULL,
	PRIMARY KEY (CodigoTarea),
	FOREIGN KEY (Estado) REFERENCES TipoTareaEstado(tipoEstado),
	FOREIGN KEY (tipoTareaCotizacion) References TipoTareaCotizacion(TipoTarea),
	FOREIGN KEY (tipoTareaCaso) References TipoTareaCaso(TipoTarea)
);

CREATE TABLE TipoCotizacion(
	Tipocotizacion varchar(50),
	Descripcion varchar(200),
	PRIMARY KEY (Tipocotizacion)
);

CREATE TABLE Cotizacion (
	Codigo int identity(1,1) NOT NULL,
	CedulaCliente VARCHAR(9)  NOT NULL, --Les quite el unique
	CedulaEmpleado VARCHAR(9)  NOT NULL, -- Les quite el unique
	FechaCotizacion DATE NOT NULL,
	MesProyectadoCierre DATE NOT NULL,
	TipoCotizacion VARCHAR(50) NOT NULL,
	Estado VARCHAR(20) NOT NULL,
	Probabilidad FLOAT not null,
	Zona VARCHAR(20) not null,
	Sector VARCHAR(20) not null,
	PRIMARY KEY(Codigo),
	FOREIGN KEY (CedulaCliente) REFERENCES Cliente(Cedula),
	FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
    FOREIGN KEY (TipoCotizacion) REFERENCES TipoCotizacion(Tipocotizacion),
	FOREIGN KEY (Probabilidad) REFERENCES Probabilidad(Porcentaje),
	FOREIGN KEY (Estado) REFERENCES  Estado(TipoEstado),
	FOREIGN KEY (Zona) REFERENCES Zona(Nombre),
    FOREIGN KEY (Sector) REFERENCES Sector(Nombre)
);

CREATE TABLE Caso (
    CodigoCaso VARCHAR(15) NOT NULL,
	PropietarioCaso varchar(9) not null,
	OrigenCaso int not null,
	NombreCuenta varchar(40) not null,
	NombreContacto Varchar(40) not null,
	Asunto Varchar(200) not null,
	Direccion VARCHAR(150) not null,
	Descripcion VARCHAR(200) not null,
	EstadoCaso varchar(20) not null,
	TipoCaso varchar(20) not null,
	Prioridad varchar (20) not null,
	PRIMARY KEY (CodigoCaso),
	FOREIGN KEY (TipoCaso) references TipoCaso(Tipocaso),
	FOREIGN KEY (EstadoCaso) references Estado(tipoEstado),
	FOREIGN KEY (OrigenCaso) references Cotizacion(Codigo),
	FOREIGN KEY (PropietarioCaso) references Cliente(Cedula),
	FOREIGN KEY (Prioridad) references Prioridad(TipoPrioridad)
);

CREATE TABLE TareaCaso (
    CodigoTarea VARCHAR(15) NOT NULL,
	CodigoCaso varchar(15) not null,
	PRIMARY KEY (CodigoTarea,CodigoCaso),
	foreign key (CodigoCaso) references Caso(CodigoCaso)
);

CREATE TABLE TareaCotizacion (
    CodigoTarea VARCHAR(15) NOT NULL,
	Codigo int not null,
	PRIMARY KEY (CodigoTarea,Codigo),
    FOREIGN KEY (Codigo) REFERENCES Cotizacion(Codigo)
);

create table estadoFactura(
	tipoFactura varchar(30) not null,
	descripcion varchar(200) not null,
	primary key (tipoFactura)

);

CREATE TABLE ListaFactura (
	IDLista varchar(40) UNIQUE not null,
	CodigoProducto VARCHAR(15) NOT NULL,
	CantidadProducto INT NOT NULL,
	PRIMARY KEY (CodigoProducto,IDLista),
	FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo),
);

CREATE TABLE Factura (
    Codigo VARCHAR(15) NOT NULL, --
	CodigoCotizacion int  null,  --
    CedulaCliente VARCHAR(9) NOT NULL, 
    CedulaEmpleado VARCHAR(9) NOT NULL, 
    CedulaJuridica VARCHAR(9) NOT NULL,
    TelefonoLocal VARCHAR(8) NOT NULL,
    NombreLocal VARCHAR(40) NOT NULL,
    FechaFactura DATE not null,
	NombreCliente varchar(20) not null,
	listaArticulos varchar(40) not null
	PRIMARY KEY (Codigo),
    FOREIGN KEY (CedulaCliente) REFERENCES Cliente(Cedula),
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo),
	foreign key (listaArticulos) references ListaFactura(IDLista)
);

CREATE TABLE Movimiento(
	IDMovimiento int IDENTITY(1,1) not null,
	Cedula VARCHAR(9) not null, 
	BodegaOrigen varchar(15) not null,
	BodegaDestino varchar(15) null,
	fecha date not null,
	hora time not null,
	PRIMARY KEY (IDMovimiento),
	FOREIGN KEY (Cedula) references Empleado(Cedula),
	FOREIGN KEY (BodegaOrigen) REFERENCES Bodega(Codigo),
    FOREIGN KEY (BodegaDestino) REFERENCES Bodega(Codigo)
);

CREATE TABLE ListaMovimiento (
	CodigoArticulo VARCHAR(15) NOT NULL,
	CantidadArticulo int not null,
	CodigoMovimiento int NOT NULL,
	PRIMARY KEY (CodigoArticulo, CodigoMovimiento),
	FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoMovimiento) REFERENCES Movimiento(IDMovimiento),
);

CREATE TABLE IngresoInventario (
    IDMovimiento INT NOT NULL,
    CedulaEmpleado VARCHAR(9) NOT NULL,
    BodegaDestino VARCHAR(15) NOT NULL,
    Fecha DATETIME,
    PRIMARY KEY (IDMovimiento, BodegaDestino), 
    FOREIGN KEY (IDMovimiento) REFERENCES Movimiento(IDMovimiento),
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
    FOREIGN KEY (BodegaDestino) REFERENCES Bodega(Codigo)
);

CREATE TABLE ListaIngreso (
    IDMovimiento int NOT NULL,
    CodigoArticulo VARCHAR(15) NOT NULL,
    CantidadIngresada INT NOT NULL,
    PRIMARY KEY (CodigoArticulo, IDMovimiento),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo)
);

CREATE TABLE SalidaMovimiento(
	IDFactura VARCHAR(15) not null,
	CodigoProducto VARCHAR(15) not null,
	CodigoBodega VARCHAR(15) not null,
	Cantidad int not null,
	PRIMARY KEY(IDFactura, CodigoProducto,CodigoBodega),
	FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoBodega) REFERENCES Bodega(Codigo),
	FOREIGN KEY (IDFactura) REFERENCES Factura(Codigo)
);

CREATE TABLE ListaSalida (
    CodigoMovimiento INT NOT NULL,
    CodigoArticulo VARCHAR(15) NOT NULL,
    CantidadIngresada INT not null,
    PRIMARY KEY (CodigoArticulo, CodigoMovimiento),
    FOREIGN KEY (CodigoMovimiento) REFERENCES Movimiento(IDMovimiento),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo)
);

CREATE TABLE ListaCotizacion (
	CodigoProducto VARCHAR(15) NOT NULL,
	CantidadProducto INT NOT NULL,
	CodigoCotizacion int NOT NULL,
	PRIMARY KEY (CodigoProducto,CodigoCotizacion),
	FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo)
);

CREATE TABLE Planilla (
	CodigoPlanilla VARCHAR(15) NOT NULL,
	FechaPlanilla date not null,   
	CedulaEmpleado varchar(9) not null,
	HorasRealizadas int not null,
	Salario int NULL, --HAY QUE CAMBIARLO URGENTE DEBE SER NULO PORQUE SE CALCULA DESPUES DE LAS HORAS
	foreign key (CedulaEmpleado) references Empleado(Cedula),
	Primary key (CodigoPlanilla, CedulaEmpleado)

);