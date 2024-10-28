CREATE DATABASE ERPPRUEBA12
GO

USE ERPPRUEBA12;
GO

CREATE TABLE Usuarios (
    IDUsuario INT IDENTITY(1,1) PRIMARY KEY,
    NombreUS VARCHAR(50) NOT NULL UNIQUE,
    ContrasenaUS VARCHAR(255) NOT NULL
);
INSERT INTO Usuarios(NombreUS, ContrasenaUS) values
('Prueba','Nashe'),
('Cartel','desanta'),
('rapapa','disco'),
('perros', 'gatos'),
('p1','pp'),
('Administrador','SOYadmin.');



CREATE TABLE Zona (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	TamanoKmCuadrado INT NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
);


INSERT INTO Zona (Nombre, TamanoKmCuadrado,Descripcion) VALUES
('Pacifico sur',100 ,'Muchas playas y vegetación'),
('Pacifico norte',300 ,'Mucho sol y climas calidos'),
('Pacifico central',250 ,'Muchas playas y esta llena de bosque y otros atractivos'),
('Caribe norte',100 ,'Mucha flora y fauna en exceso'),
('Caribe sur', 100,'Las mejores playas y lugar de mucha cultura'),
('Valle central', 400,'Donde hay más población y muchas oportunidades de crecimiento'),
('Zona norte',200 ,'Mucha tierra y muchos cultivos de caña y arroz');


CREATE TABLE Sector (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
);

INSERT INTO Sector (Nombre, Descripcion) VALUES
('Económico', 'Relaciono con la producción y venta de productos.'),
('Constructor', 'Sector dedicado a la construcción de edificios, infraestructuras y obras públicas.'),
('Tecnológico', 'En busca de desarrollo y uso de tecnología en diversos ámbitos.'),
('Salud', 'Sector que abarca servicios médicos, farmacéuticos y de bienestar.'),
('Educación', 'Sector que se ocupa de la enseñanza y formación en todos los niveles.'),
('Industrial', 'Sector que engloba la producción de bienes en fábricas.'),
('Transporte', 'Sector relacionado con el movimiento de personas y mercancías.'),
('Energía', 'Sector que abarca la producción y distribución de energía.'),
('Comercial', 'Sector dedicado a la venta de productos y servicios al por menor.'),
('Cultural', 'Sector que abarca actividades relacionadas con la cultura y el arte.'),
('Deportivo', 'Sector que se enfoca en la práctica de deportes.'),
('Automotriz', 'Sector dedicado a la fabricación y venta de vehículos.'),
('Telecomunicaciones', 'Sector que abarca servicios de comunicación a distancia.'),
('Alimentación', 'Sector que se ocupa de la producción y distribución de alimentos.');






CREATE TABLE Estado(
	TipoEstado VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (TipoEstado)
);

insert into Estado(TipoEstado,Descripcion) values
('Abierta', 'Todavia no se da un veredicto final'),
('Aprobado', 'Se aprueba la cotizacion yupiiii'),
('Rechazado', 'Se rechaza la cotizacion mecagoentodo');


CREATE TABLE Probabilidad (
	Porcentaje FLOAT,
	ProbabilidadEstimada VARCHAR(20),
	PRIMARY KEY (Porcentaje)
);


INSERT INTO Probabilidad (Porcentaje, ProbabilidadEstimada)
VALUES 
(0.75, 'Alta'),
(0.50, 'Media'),
(0.25, 'Baja');



CREATE TABLE Prioridad(
	TipoPrioridad VARCHAR(20) NOT NULL,
	Descripcion varchar(200) not null
	PRIMARY KEY (TipoPrioridad)
);

insert into Prioridad(TipoPrioridad, Descripcion) values
('Alta','Merece mucha atención'),
('Media','No se debe descuidar'),
('Baja','Para hacer después');


CREATE TABLE TipoCaso(
	Tipocaso VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (Tipocaso)
);

insert into TipoCaso(Tipocaso,Descripcion) values
('Reclamo','Se exige un reclamo por un error'),
('Devolucion','Se necesita abrir un caso para que devuelvan ciertos articulos'),
('Garantia','Un producto se daño antes de lo esperado');


CREATE TABLE Departamento (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY(Codigo)
);
INSERT INTO Departamento(Codigo, Nombre) values
('DEP1', 'Mantenimiento'),
('DEP2', 'Ingeniería'),
('DEP3', 'Logística'),
('DEP4', 'Administración'),
('DEP5', 'Atención al cliente'),
('DEP6', 'Ventas'),
('DEP7', 'Producción'),
('DEP8', 'Supervisión'),
('DEP9', 'Electricidad');



CREATE TABLE Modulos (
    IDModulo INT PRIMARY KEY,
    NombreModulo VARCHAR(50) UNIQUE NOT NULL,
    Descripcion VARCHAR(200)
);

INSERT INTO Modulos(IDModulo,NombreModulo,Descripcion) values
(1, 'Factura', 'Se le permite hacer cosas dentro de la factura'),
(2, 'Cotizacion', 'Se le permite hacer cosas dentro de la cotización'),
(3, 'Tarea', 'Se le permite hacer cosas dentro de la tarea'),
(4, 'Bodega', 'Se le permite hacer cosas dentro de la bodega'),
(5, 'Planilla', 'Se le permite hacer cosas dentro de la planilla'),
(6, 'Departamento', 'Se le permite hacer cosas del departamento'),
(7, 'Caso', 'Se le permite hacer cosas de un caso'),
(8, 'Usuario', 'Se le permite hacer cosas del usuario');

CREATE TABLE Acciones (
    IDAccion INT NOT NULL,
    tipoAccion VARCHAR(40) UNIQUE,
    descripcion VARCHAR(200),
    PRIMARY KEY (IDAccion)
);

INSERT INTO Acciones(IDAccion,tipoAccion,descripcion) values
(1, 'Visualizacion', 'Se le permite todo con respecto a visualizar'),
(2, 'Creacion', 'Se le permite todo con respecto a la creación'),
(3, 'Reporteria', 'Se le permite todo con respecto a reportes'),
(4, 'Edicion', 'Se le permite todo con respecto a editar');



CREATE TABLE ModulosXAcciones (
    NombreModulo varchar(50),
    tipoAccion varchar(40),
    PRIMARY KEY (NombreModulo, tipoAccion),
    FOREIGN KEY (NombreModulo) REFERENCES Modulos(NombreModulo),
    FOREIGN KEY (tipoAccion) REFERENCES Acciones(tipoAccion)
);
insert into ModulosXAcciones(NombreModulo,tipoAccion) values
('Cotizacion', 'Visualizacion'),
('Cotizacion', 'Creacion'),
('Cotizacion', 'Edicion');


CREATE TABLE Roles (
    IDRol INT IDENTITY(1,1) , --Preguntar si se puede autoIncrementar
    tipoRol VARCHAR(20) UNIQUE,
	Descripcion varchar(200),
    PRIMARY KEY (IDRol)
);
insert into Roles(tipoRol,Descripcion) values
('Encargado', 'Se encarga de que todo este bien'),
('Vendedor', 'Se encarga de vender productos'),
('Bodeguero', 'Se encarga de la bodega'),
('SuperUsuario','Es el admin'),
('Ayudante','Ayuda en todas las tareas al admin');


CREATE TABLE AccionesXrol (
    tipoRol VARCHAR(20),
    tipoAccion VARCHAR(40),
    PRIMARY KEY (tipoRol, tipoAccion),
    FOREIGN KEY (tipoRol) REFERENCES Roles(tipoRol),
    FOREIGN KEY (tipoAccion) REFERENCES Acciones(tipoAccion)
);


INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('Ayudante', 'Visualizacion');
INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('SuperUsuario', 'Edicion');
INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('SuperUsuario', 'Reporteria');




CREATE TABLE Puesto(
	TipoPuesto VARCHAR(35) NOT NULL,
	Salario int NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (TipoPuesto)
);

INSERT INTO Puesto(TipoPuesto, Salario, Descripcion) values
('Electricista', 500000, 'Se encarga de los cables y todo el fluido electrico'),
('Ingeniero', 700000, 'Se encarga de diseñar y elaborar planes para mejorar la eficiencia'),
('Control de Calidad', 480000, 'Garantiza que los productos cumplen con los estándares de calidad'),
('Encargado de Inventarios', 450000, 'Mantiene un registro actualizado del inventario'),
('Ayudante', 200000, 'Se encarga de todos los trabajos que le sean asignados'),
('Bodeguero', 350000, 'Tiene que realizar chequeos de bodega y mover mercancia'),
('MontaCargas', 400000, 'Tiene que mover mercancia pesada o de gran cantidad'),
('Recepcionista', 320000, 'Atiende a los clientes que lleguen al negocio'),
('Administrador', 450000, 'Se encarga de dirigir y ver como van los avances'),
('Operador', 370000, 'Usa maquinas y dirige de mejor forma las cargas de productos'),
('Auxiliar', 400000, 'Realiza de todo un poco de los trabajos que hay en la bodega'),
('Vendedor', 500000, 'Se encarga de buscar o atender clientes que quieran comprar productos'),
('Supervisor', 600000, 'Debe realizar chequeos constantes para ver que todo este en orden y nada falle'),
('Empacador', 350000, 'Da las ultimas ordenes de donde llevar la mercancia y guardarla'),
('Despachador', 320000, 'Busca a los vehiculos a los cuales va a cargar los productos de salida'),
('Coordinador', 320000, 'Coordina todas las entregas y posibles rutas a tomar'),
('Reparaciones', 420000, 'Tiene que hacer trabajos de reparamiento a las maquinas o bodegas'),
('Preparador', 250000, 'Va guardando y enlistando los productos a utilizar');


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
insert into Empleado(Cedula,Nombre,apellido1,apellido2,genero,FechaNacimiento,provincia,Direccion,Telefono,CodigoDepartamento,FechaIngreso,Puesto,tipoRol,IDUsuario,SalarioActual)
values
('123456789', 'Jose', 'Perez', 'Rodriguez', 'M', '1990-05-12', 'San José', 'San pedro 50 metros norte', '22223333', 'DEP1', '2015-03-10', 'Electricista', 'Encargado', 1, 500000),
('987654321', 'Sofia', 'Lopez', 'Jimenez', 'F', '1985-09-15', 'Alajuela', 'Alajuelita underground', '22334455', 'DEP2', '2010-07-22', 'Ingeniero', 'Vendedor', 2, 700000),
('112233445', 'Fabian', 'Martinez', 'Solis', 'M', '1995-12-05', 'Heredia', 'Guarari', '22445566', 'DEP3', '2018-01-19', 'Control de Calidad', 'Bodeguero', 3, 480000),
('556677889', 'Valka', 'Gomez', 'Alvarado', 'F', '1992-03-28', 'Cartago', 'Lomas del sur', '22556677', 'DEP4', '2017-09-15', 'Administrador', 'Encargado', 4, 450000),
('334455667', 'Andres', 'Vargas', 'Campos', 'M', '1998-11-23', 'Puntarenas', 'Del faro a 30 metros', '22667788', 'DEP5', '2019-11-25', 'Recepcionista', 'Vendedor', 5, 320000),
('998877665', 'Clarisa', 'Castro', 'Mora', 'F', '1991-06-30', 'Guanacaste', 'Playa samara casa 50', '22778899', 'DEP6', '2016-04-13', 'Vendedor', 'Ayudante', 1, 500000);





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


CREATE TABLE Planilla (
	CodigoPlanilla VARCHAR(15) NOT NULL,
	FechaPlanilla date not null,   
	CedulaEmpleado varchar(9) not null,
	HorasRealizadas int not null,
	Salario int, --HAY QUE CAMBIARLO URGENTE DEBE SER NULO PORQUE SE CALCULA DESPUES DE LAS HORAS
	foreign key (CedulaEmpleado) references Empleado(Cedula),
	Primary key (CodigoPlanilla, CedulaEmpleado)

);


CREATE TABLE Familia (
	CodigoFamilia VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	activo varchar(20) not null,
	Descripcion VARCHAR(200) not null,
	PRIMARY KEY(CodigoFamilia)
);

INSERT INTO Familia(CodigoFamilia,Nombre,activo,Descripcion) values
('Fam1', 'Escolares', 'Si','Artículos como lapices o borradores'),
('Fam2', 'Farmacéuticos', 'Si','Medicamentos y productos de salud '),
('Fam3', 'Electrónica','Si', 'Componentes electrónicos como chips o tecnología implementada'),
('Fam4', 'Calzado','Si', 'Todo tipo de zapatos'),
('Fam5', 'Relojes y Joyas', 'No','Artículos que son solo de lujo'),
('Fam6', 'Juguetes', 'Si','Artículos para entretenimiento infantil'),
('Fam7', 'Alimentos', 'Si','Productos alimenticios enlatados, frescos, congelados'),
('Fam8', 'Bebidas', 'Si','Líquidos para consumo como refrescos, jugos, bebidas alcohólicas y agua embotellada'),
('Fam9', 'Cosméticos', 'No','Productos de cuidado personal'),
('Fam10', 'Electrodomésticos','Si', 'Aparatos eléctricos para uso doméstico'),
('Fam11', 'Limpieza', 'No','Productos hechos para limipiar'),
('Fam12', 'Herramientas', 'Si','Herramientas manuales y eléctricas'),
('Fam13', 'Jardinería', 'No','Herramientas y productos para el cuidado de jardines'),
('Fam14', 'Automotriz', 'Si','Accesorios y repuestos para vehículos'),
('Fam15', 'Construcción', 'Si','Materiales para la construcción '),
('Fam16', 'Deportes', 'No',' s deportivos hechos solo para deporte'),
('Fam17', 'Mascotas', 'Si','Productos para el cuidado de mascotas'),
('Fam18', 'Ropa', 'Si','Prendas de vestir'),
('Fam19', 'Muebles', 'Si','Artículos de mobiliario'),
('Fam20', 'Libros', 'No','Todo tipo de literatura'),
('Fam21', 'Tecnología', 'Si','Dispositivos electrónicos'),
('Fam22', 'Iluminación', 'No','Articulos hechos para iluminar la casa u oficinas'),
('Fam23', 'Material de Oficina', 'No','Artículos necesarios para el trabajo'),
('Fam24', 'Bebés', 'No','Productos para el cuidado de bebés'),
('Fam25', 'Accesorios de hogar', 'Si','Productos hechos para usar en el hogar');

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



INSERT INTO Articulo (CodigoFamilia, Codigo, Nombre,Activo, Peso, Costo,PrecioEstandar,Descripcion) VALUES
('Fam1', 'ART1', 'Lápiz HB', 'Si', 0.02, 0.5, 100.0, 'Lápiz de grafito para escritura.'),
('Fam1', 'ART2', 'Cuaderno 100 hojas', 'No', 0.3, 1.5, 3000.0, 'Cuaderno de con 100 hojas rayadas.'),
('Fam1', 'ART3', 'Borrador blanco', 'Si', 0.01, 0.2, 100.4, 'Borrador de leche para lápiz.'),
('Fam1', 'ART4', 'Regla 30 cm', 'Si', 0.05, 0.7, 100.5, 'Regla plástica para medir.'),
('Fam1', 'ART5', 'Sacapuntas doble', 'No', 0.02, 0.3, 350.0, 'Sacapuntas para lápices grandes y pequeños.'),
  
('Fam2', 'ART6', 'Ibuprofeno 200mg', 'Si', 0.01, 0.8, 2000.0, 'Tabletas para alivio del dolor.'),
('Fam2', 'ART7', 'Jarabe para la tos', 'No', 0.25, 3.0, 5000.0, 'Medicamento para calmar la tos.'),
('Fam2', 'ART8', 'Espadrapo', 'Si', 0.55, 1.0, 2000.5, 'espadrapo para soporte y compresión.'),
('Fam2', 'ART9', 'Anticonceptivos', 'Si', 0.1, 4.0, 10000.0, 'Prevenir embarazos.'),
('Fam2', 'ART10', 'Curitas adhesivas', 'No', 0.02, 0.4, 100.0, 'Tiras adhesivas para pequeñas heridas.'),
  
('Fam3', 'ART11', 'GPU', 'No', 0.01, 200.0, 250000.0, 'Grafica para juegos.'),
('Fam3', 'ART12', 'Placa madre', 'Si', 3.5, 100.0, 120000.0, 'La que hace que una computadora funcione.'),
('Fam3', 'ART13', 'Pantalla LED', 'Si', 1.2, 80.0, 100000.0, 'Pantalla LED para dispositivos electrónicos.'),
('Fam3', 'ART14', 'Cable HDMI', 'No', 0.15, 5.0, 1000.0, 'Cable para conectar dispositivos a pantallas.'),
('Fam3', 'ART15', 'Teclado inalámbrico', 'No', 0.6, 20.0, 25000.0, 'Teclado sin cables para computadora.'),
  
('Fam4', 'ART16', 'tenis nike', 'Si', 0.8, 50.0, 75000.0, 'tenis para hacer deporte.'),
('Fam4', 'ART17', 'Botas de cuero', 'No', 1.2, 80.0, 100000.0, 'Botas resistentes de cuero.'),
('Fam4', 'ART18', 'Sandalias', 'No', 0.3, 25.0, 4000.0, 'Sandalias casuales.'),
('Fam4', 'ART19', 'Burros', 'Si', 6.7, 200.0, 25000.0, 'Para trabajar de verdad.'),
('Fam4', 'ART20', 'Zapatos formales', 'Si', 0.9, 70.0, 9000.0, 'Zapatos elegantes para eventos formales.'),
  
('Fam5', 'ART21', 'Reloj suizo', 'No', 0.15, 300.0, 3500000.0, 'Reloj analógico de lujo.'),
('Fam5', 'ART22', 'Collar de oro', 'Si', 0.02, 200.0, 250000.0, 'Collar hecho de oro de 18 quilates.'),
('Fam5', 'ART23', 'Anillo de diamantes', 'Si', 0.01, 500.0, 600000.0, 'Anillo con incrustaciones de diamantes.'),
('Fam5', 'ART24', 'Pulsera de Zafiro', 'No', 0.05, 150.0, 180000.0, 'Pulsera de Zafiro.'),
('Fam5', 'ART25', 'Aretes de perlas', 'Si', 0.01, 80.0, 100000.0, 'Aretes con perlas naturales.'),
  
('Fam6', 'ART26', 'Muñeca de Barbie', 'No', 0.2, 20.0, 25000.0, 'Muñeca transformable para jugar.'),
('Fam6', 'ART27', 'Terreneitor', 'Si', 0.1, 15.0, 200000.0, 'Carro para loquear.'),
('Fam6', 'ART28', 'Legos', 'Si', 0.3, 30.0, 35000.0, 'Muñequitos armables.'),
('Fam6', 'ART29', 'Pelota de futbol', 'No', 0.1, 10.0, 150000.0, 'Pelota de cuero.'),
('Fam6', 'ART30', 'Monopoly', 'Si', 0.7, 50.0, 60000.0, 'Juego de mesa familiar.'),
  
('Fam7', 'ART31', 'Bistek', 'Si', 0.25, 10.0, 1500.0, 'pedazo de carne.'),
('Fam7', 'ART32', 'Arroz 99', 'No', 1.0, 2.0, 3000.0, 'Bolsa de arroz al 99 porciento.'),
('Fam7', 'ART33', 'Johnys', 'Si', 0.5, 1.5, 2000.5, 'Polvo de cacao para bebidas.'),
('Fam7', 'ART34', 'Frootlops', 'No', 0.6, 3.0, 4000.0, 'Cereal para el desayuno.'),
('Fam7', 'ART35', 'Pollo congelado', 'Si', 1.5, 8.0, 1200.0, 'Pollo entero congelado.'),
  
('Fam8', 'ART36', 'Alpina 1L', 'No', 1.0, 1.0, 2.0, 'Botella de agua potable.'),
('Fam8', 'ART37', 'Refresco coca cola 500ml', 'Si', 0.5, 1.0, 1.5, 'Botella de coca cola fria.'),
('Fam8', 'ART38', 'Del valle 1L', 'Si', 1.1, 1.5, 2.0, 'Jugo de naranja natural.'),
('Fam8', 'ART39', 'Imperial 355ml', 'Si', 0.4, 1.0, 1.5, 'Lata de cerveza.'),
('Fam8', 'ART40', 'Villa maria', 'No', 1.2, 15.0, 20.0, 'Botella de vino tinto importado.'),
  
('Fam9', 'ART41', 'Shampoo 500ml', 'Si', 0.6, 2.0, 3000.0, 'Botella de shampoo para el cabello.'),
('Fam9', 'ART42', 'Crema hidratante 200ml', 'Si', 0.3, 1.5, 2000.5, 'Crema para hidratar la piel.'),
('Fam9', 'ART43', 'Perfume de vainilla', 'Si', 0.2, 10.0, 15000.0, 'Perfume con fragancia de vainilla.'),
('Fam9', 'ART44', 'Desodorante en barra', 'No', 0.1, 0.5, 1000.0, 'Desodorante duro para el cuidado personal.'),
('Fam9', 'ART45', 'Lápiz labial', 'Si', 0.05, 5.0, 7000.0, 'Lápiz labial de larga duración.'),



('Fam10', 'ART46', 'Microondas','No', 1.3, 7.0, 5000.00,  'Horno de microondas para calentar alimentos.'),
('Fam10', 'ART47', 'Batidora' ,'Si',  1.2, 2.5, 13000.00, 'Batidora de mano para cocina.'),
('Fam10', 'ART48', 'Aspiradora' ,'No', 1.5, 4.0, 25000.00, 'Aspiradora para limpieza del hogar.'),
('Fam10', 'ART49', 'Tostadora' ,'Si', 1.4, 1.8, 10000.00, 'Tostadora eléctrica para pan.'),
('Fam10', 'ART50', 'Cafetera' ,'Si',2.3, 2.0, 4000.00,  'Cafetera eléctrica para preparar café.'),
  
('Fam11', 'ART51', 'Limpiador multiusos' ,'Si', 0.5, 0.75, 1200.00, 'Limpiador para todo tipo de superficies.'),
('Fam11', 'ART52', 'Detergente líquido' ,'Si', 0.7, 1.0, 700.00, 'Detergente para lavar ropa.'),
('Fam11', 'ART53', 'Esponjas de limpieza' ,'No', 0.1, 0.05, 300.00, 'Esponjas para lavar platos y superficies.'),
  
('Fam12', 'ART54', 'Martillo' ,'Si', 7.2, 1.0, 5000.00, 'Martillo de acero y mango de madera para clavar.'),
('Fam12', 'ART55', 'Destornillador','Si', 2.2, 0.2, 2500.00, 'Destornillador plano y de cruz.'),
  
('Fam13', 'ART56', 'Tijeras de podar' ,'No', 4.4, 0.4, 7500.00, 'Tijeras para podar plantas.'),
('Fam13', 'ART57', 'Guantes de jardinería' ,'Si', 1.2, 0.2, 2000.00, 'Guantes para trabajar en el jardín.'),
  
('Fam14', 'ART58', 'Batería de carros' ,'No', 14.2, 20.0, 70000.00, 'Batería para carros.'),
('Fam14', 'ART59', 'Aceite de motor' ,'Si', 1.5, 1.0, 20000.00, 'Aceite lubricante para motores.'),
  
('Fam15', 'ART60', 'Cemento' ,'Si', 20.3, 25.0, 15000.00, 'Saco de cemento para construcción.'),
('Fam15', 'ART61', 'Ladrillos' ,'No', 15.0, 3.0, 1000.00, 'Ladrillos para construir muros.'),
  
('Fam16', 'ART62', 'Balón de fútbol' ,'No', 3.2, 0.5, 3500.00, 'Balón de fútbol de tamaño oficial.'),
('Fam16', 'ART63', 'Raqueta de tenis' ,'Si', 2.0, 0.3, 12500.00, 'Raqueta ligera para jugar al tenis.'),
  
('Fam17', 'ART64', 'Comida para perros','No', 1.3, 1.5, 1500.00, 'Alimento seco para perros.'),
('Fam17', 'ART65', 'Arena para gatos' ,'Si', 1.5, 1.0, 1500.00, 'Arena absorbente para gatos.'),
  
('Fam18', 'ART66', 'Camisa de algodón' ,'No', 1.4, 0.2, 10000.00, 'Camisa cómoda para uso diario.'),
('Fam18', 'ART67', 'Pantalones jeans' ,'Si', 1.3, 0.5, 13000.00, 'Pantalones de mezclilla.'),
  
('Fam19', 'ART68', 'Escritorio' ,'Si', 10.3, 10.5, 55000.00, 'Escritorio grande para trabajo.'),
('Fam19', 'ART69', 'Ropero' ,'No', 30.2, 30.0, 150000.00, 'Ropero gigante para 1 persona.'),
  
('Fam20', 'ART70', 'Novela' ,'No', 1.0, 1.5, 7000.00, 'Libro hecho para generar drama.'),
('Fam20', 'ART71', 'Comic' ,'Si', 1.0, 1.5, 3500.00, 'Libro de acción.'),
  
('Fam21', 'ART72', 'Celular' ,'No', 1.0, 5.5, 130000.00, 'Dispositivo para comunicarse y entretenerse.'),
('Fam21', 'ART73', 'Laptop' ,'Si', 5.0, 10.5, 200000.00,'Dispositivo para trabajar y portar a todo lado.'),
  
('Fam22', 'ART74', 'Lampara de pared','No', 1.3, 3.5, 4000.00, 'Lampara para iluminar un cuarto.'),
('Fam22', 'ART75', 'Lampara de techo' ,'Si', 1.5, 5.5, 5000.00, 'Lampara led para iluminar un lugar.'),
  
('Fam23', 'ART76', 'Grapadora' ,'Si', 0.8, 4.5, 1200.00, 'Para grapar hojas o documentos.'),
('Fam23', 'ART77', 'Impresora' ,'No', 7.3, 15.5, 20000.00, 'Impresora para imprimir hojas o documentos.'),
  
('Fam24', 'ART78', 'Pañalito' ,'No', 1.8, 5.5, 3500.00, 'Por si el bebe está quemado.'),
('Fam24', 'ART79', 'Colonia' ,'Si', 1.9, 7.5, 2000.00, 'Para que huela bien.'),
  
('Fam25', 'ART80', 'Cuchillos' ,'No', 3.2, 6.5, 5000.00, 'Para cortar alimentos.'),
('Fam25', 'ART81', 'Cuadros decorativos' ,'Si', 2.3, 9.5, 6000.00, 'Para que se vea bonita la casa.');

CREATE TABLE Bodega (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Ubicacion VARCHAR(20) NOT NULL,
	EspacioCubico int NOT NULL,
	CapacidadTon int NOT NULL,
	PRIMARY KEY (Codigo)
);
INSERT INTO Bodega(Codigo, Nombre,Ubicacion,EspacioCubico,CapacidadTon) values
('BO1','Castle Rock','Limon', 50,3 ),
('BO2','Del valle','Puntarenas', 40,2 ),
('BO3','El sol','Guanacaste', 30,5 ),
('BO4','La cava','Alajuela', 20,4 ),
('BO5','Montes','San jose', 30,3 ),
('BO6','Elites','Cartago', 40,2 ),
('BO7','Forca','Heredia', 50,3 ),
('BO8','Naciente','Limon', 20,4 ),
('BO9','Tovar','Guanacaste', 10,3 ),
('BO10','Escondida','San jose', 35,2 ),
('BO11','Shaft','Limon', 40, 1);
 




CREATE TABLE FamiliaBodega (
	CodigoBodega VARCHAR(15) NOT NULL,
	CodigoFamilia VARCHAR(15) NOT NULL,
	PRIMARY KEY (CodigoBodega,CodigoFamilia),
	FOREIGN KEY (CodigoBodega) references Bodega(Codigo),
	FOREIGN KEY (CodigoFamilia) references Familia(CodigoFamilia)
);


insert into FamiliaBodega(CodigoBodega,CodigoFamilia) values
('BO1','Fam1'),
('BO1','Fam5'),
('BO2','Fam2'),
('BO2','Fam9'),
('BO3','Fam3'),
('BO3','Fam4'),
('BO4','Fam6'),
('BO4','Fam7'),
('BO5','Fam8'),
('BO5','Fam9'),
('BO6','Fam10'),
('BO6','Fam11'),
('BO7','Fam14'),
('BO7','Fam15'),
('BO8','Fam12'),
('BO8','Fam13'),
('BO9','Fam19'),
('BO9','Fam20'),
('BO10','Fam21'),
('BO10','Fam23'),
('BO11','Fam25'),
('BO11','Fam17');





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



INSERT INTO Cliente (Cedula, Telefono, Genero, Nombre, CorreoElectronico, Fax, Sector, Zona, Celular) VALUES
('123456789', '22223334', 'M', 'Juan Pérez', 'juaperezZeledon@mail.com', '22224444', 'Económico', 'Zona norte', '80839796'),
('325543227', '33334444', 'F', 'María López', 'marilopez@mail.com', '33335555', 'Tecnológico', 'Pacifico central', '70755432'),
('456789123', '44445555', 'M', 'Carlos Rodríguez', 'carlosrodriguezzzzz@mail.com', '44446666', 'Industrial', 'Caribe sur', '60876543'),
('321654987', '55556666', 'F', 'Ana Martínez', 'anadel@mail.com', '55557777', 'Salud', 'Caribe norte', '56647890'),
('754323489', '66667777', 'M', 'Luis Fernández', 'luisferna3421@mail.com', '66668888', 'Construcción', 'Valle central', '98763453'),
('432124368', '77778888', 'F', 'Laura Gómez', 'lauragoz@mail.com', '77779999', 'Comercial', 'Pacifico sur', '75623754'),
('153234558', '88889999', 'M', 'Pedro Jiménez', 'pedronez@mail.com', '88880000', 'Alimentacion', 'Pacifico norte', '87357423'),
('533467853', '99990000', 'F', 'Carmen Díaz', 'carmenz@mail.com', '99991111', 'Educacion', 'Zona norte', '93945412'),
('258932147', '11112222', 'M', 'Javier Morales', 'moralesjavier@mail.com', '11113333', 'Deportivo', 'Caribe sur', '45678976'),
('369253247', '22223334', 'F', 'Isabel Torres', 'isabel20torres@mail.com', '22224444', 'Cultural', 'Valle central', '23456843');


--Esto es el inventario
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

insert into TipoTareaCotizacion(TipoTarea,descripcion) values
('Seguimiento','El empleado debe estar en constante vigilancia de la cotización para ver el progreso que esta tiene'),
('Archivacion','Guardar toda la información con respecto a una cotización en un documento especifico'),
('Orden','Generar una orden con la lista de productos de la cotizacion para revisar si estan disponibles'),
('Envio','Asegurarse de que el envio de los productos en caso de que se quieran se puedan enviar'),
('Documentación','Generar todo el listado de los productos y cantidad que se va a requerir en un documento formal'),
('Control de calidad','Revisar que todos los productos que se quieran en la cotizacion esten en buen estado'),
('Revisión de precios','Revisar que todos los precios que fueron dados en la cotización sean los correctos'),
('Negociación','Hablar con el cliente y persuadirlo para que realice la compra en el momento');




create table TipoTareaCaso (
	TipoTarea varchar(30) not null,
	descripcion varchar(200)not null,
	Primary key (TipoTarea)
)

insert into TipoTareaCaso(TipoTarea,descripcion) values
('Devolucion','Revisar el por qué es que se debe devolver el producto'),
('Reclamo','Atender al cliente y verificar la situación para aliviar el problema'),
('Garantia','Revisar la garantía del producto e informale al cliente si es posible');



create table TipoTareaEstado (
	tipoEstado varchar(30) not null,
	descripcion varchar(200)not null,
	Primary key (tipoEstado)
)


--Creado de aqui
insert into TipoTareaEstado(tipoEstado,descripcion) values
('Iniciada','Es una tarea que recien se empieza'),
('En proceso', 'Es una tarea que sigue en marcha'),
('Terminada', 'Es una tarea que ya termuno');

 

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
INSERT INTO Tarea (CodigoTarea, tipoTareaCotizacion, tipoTareaCaso, Fecha, Descripcion, Estado) 
VALUES
('T1', NULL,'Devolucion','2024/10/22','Tiene que mover la mercancia hasta el camion','Terminada'),
('T2', NULL, 'Reclamo', '2024/05/15', 'descargar equipo', 'Iniciada'),
('T3', NULL, 'Garantia', '2022/10/24', 'Saber como comunicarse con el cliente', 'En proceso'),
('T4', NULL, 'Devolucion', '2023/07/03', 'Tiene que verificar el tipo de producto a devolver', 'En proceso'),
('T5', NULL, 'Reclamo', '2024/06/28', 'debe revisar si el reclamo es valido', 'Iniciada'),
('T6', NULL, 'Garantia', '2022/12/31', 'Revisar si todavía es valida y ver el producto', 'Terminada');





CREATE TABLE TipoCotizacion(
	Tipocotizacion varchar(50),
	Descripcion varchar(200),
	PRIMARY KEY (Tipocotizacion)
);

INSERT INTO TipoCotizacion(Tipocotizacion,Descripcion) values
('Cotizacion abierta','Es una cotizacion la cual su precio puede variar'),
('Cotizacion cerrada','Es una cotizacion fija en la cual se busca que se mantenga un precio'),
('Cotizacion preliminar','Es una cotizacion en la cual solo se busca saber el precio'),
('Cotizacion de servicios','Consta en que se va a generar por los servicios que le fueron prestados'),
('Cotizacion de articulos','Es una cotización por toda la cantidad de articulos que se van a pedir');





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

insert into Cotizacion(CedulaCliente,CedulaEmpleado,FechaCotizacion,MesProyectadoCierre,TipoCotizacion,Estado,Probabilidad,Zona,Sector) values
('754323489','123456789','2020/10/15','2020/12/15','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Alimentación'),
('369253247','987654321','2017/06/04','2018/06/04','Cotizacion cerrada','Aprobado' ,0.5, 'Caribe sur','Automotriz'),
('432124368','112233445','2024/10/24','2024/12/24','Cotizacion de articulos','Rechazado' ,0.75, 'Pacifico central','Comercial'),
('456789123','556677889','2023/05/03','2023/09/03','Cotizacion de servicios', 'Aprobado',0.5, 'Pacifico norte','Constructor'),
('533467853','334455667','2021/02/02','2021/05/02','Cotizacion preliminar','Abierta' ,0.25, 'Pacifico sur','Cultural'),
('754323489','998877665','2015/05/15','2017/05/15','Cotizacion de articulos', 'Rechazado',0.75,'Valle central','Deportivo');

	


	


CREATE TABLE Caso (
    CodigoCaso VARCHAR(15) NOT NULL,
    PropietarioCaso VARCHAR(9) NOT NULL,
    OrigenCaso INT NOT NULL,
    NombreCuenta VARCHAR(40) NOT NULL,
    NombreContacto VARCHAR(40) NOT NULL,
    Asunto VARCHAR(200) NOT NULL,
    Direccion VARCHAR(150) NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    EstadoCaso VARCHAR(20) NOT NULL,
    TipoCaso VARCHAR(20) NOT NULL,
    Prioridad VARCHAR(20) NOT NULL,
    PRIMARY KEY (CodigoCaso),
    FOREIGN KEY (TipoCaso) REFERENCES TipoCaso(TipoCaso),
    FOREIGN KEY (EstadoCaso) REFERENCES Estado(TipoEstado),
    FOREIGN KEY (OrigenCaso) REFERENCES Cotizacion(Codigo),
    FOREIGN KEY (PropietarioCaso) REFERENCES Cliente(Cedula),
    FOREIGN KEY (Prioridad) REFERENCES Prioridad(TipoPrioridad)
);

INSERT INTO Caso (CodigoCaso, PropietarioCaso, OrigenCaso, NombreCuenta, NombreContacto, Asunto, Direccion, Descripcion, EstadoCaso, TipoCaso, Prioridad) VALUES
('CS1', '754323489', 1, 'Personal', 'Salamar', 'Necesitamos una ayuda inmediata', 'San jose en el centro de la capital', 'Se tiene que verificar el tipo de ayuda que necesita', 'Abierta', 'Devolucion', 'Alta'),
('CS2', '369253247', 2, 'Empresarial', 'Dospinos', 'Queremos hablar con un encargado', 'Alajuela a un costado del mercado', 'Se procedera a enviar la queja al encargado', 'Aprobado', 'Devolucion', 'Alta'),
('CS3', '432124368', 3, 'Personal', 'Aurua', 'Tuvimos problemas', 'En San carlos debajo de una catarata', 'Se busca el tipo de problemas', 'Rechazado', 'Garantia', 'Baja'),
('CS4', '456789123', 4, 'Personal', 'Dianeys', 'Hubo un problema', 'En la casa habitacion #58 en limon', 'Se habla para ver el problema', 'Aprobado', 'Garantia', 'Baja'),
('CS5', '533467853', 5, 'Empresarial', 'Nike', 'Algo fallo en los pedidos', 'San jose a la par de amazon', 'Se indica el fallo que hubo', 'Abierta', 'Reclamo', 'Media'),
('CS6', '754323489', 6, 'Empresarial', 'Adidas', 'Es un asunto de urgencia', 'San jose por el mall san pedro', 'Se habla con el administrador', 'Rechazado', 'Reclamo', 'Media');




CREATE TABLE TareaCaso (
    CodigoTarea VARCHAR(15) NOT NULL,
	CodigoCaso varchar(15) not null,
	PRIMARY KEY (CodigoTarea,CodigoCaso),
	foreign key (CodigoCaso) references Caso(CodigoCaso)
);
insert into TareaCaso(CodigoTarea,CodigoCaso) values
('T1', 'CS1'),
('T2', 'CS2'),
('T3', 'CS3'),
('T4', 'CS4'),
('T5', 'CS5'),
('T6', 'CS6');





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

insert into estadoFactura(tipoFactura, descripcion) values 
('Emitida','Recien se creo la factura'),
('Pagada','El cliente ya pago toda la factura'),
('Cancelada','El cliente cancela la factura');



CREATE TABLE Factura (
    Codigo VARCHAR(15) NOT NULL, --
	CodigoCotizacion int  null,  --
	CedulaCliente varchar(9),
    CedulaEmpleado VARCHAR(9) NOT NULL, 
    CedulaJuridica VARCHAR(9) NOT NULL,
    TelefonoLocal VARCHAR(8) NOT NULL,
    NombreLocal VARCHAR(40) NOT NULL,
    FechaFactura DATE not null,
	NombreCliente varchar(20) not null,
	estado varchar(30) not null
	PRIMARY KEY (Codigo),
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo),
	foreign key (estado) references estadoFactura(tipoFactura)
);







CREATE TABLE ListaFactura (
    IDLista varchar(40) NOT NULL,
    CantidadProducto int NOT NULL,
    Codigo varchar(15) not null,
	CodigoF varchar(15) not null
    primary key (IDLista, CodigoF),
    foreign key (Codigo) references Articulo (Codigo), 
	foreign key (CodigoF) references Factura(Codigo), 
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







-------------






CREATE TABLE IngresoInventario (
    IDIngreso INT IDENTITY(1,1) NOT NULL,
    CedulaEmpleado VARCHAR(9) NOT NULL,
    BodegaDestino VARCHAR(15) NOT NULL,
    Fecha DATETIME,
    PRIMARY KEY (IDIngreso, BodegaDestino),  
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
    FOREIGN KEY (BodegaDestino) REFERENCES Bodega(Codigo)
);

CREATE TABLE ListaIngreso (
    IDIngreso INT NOT NULL,
    BodegaDestino VARCHAR(15) NOT NULL, 
    CodigoArticulo VARCHAR(15) NOT NULL,
    CantidadIngresada INT NOT NULL,
    PRIMARY KEY (CodigoArticulo, IDIngreso, BodegaDestino),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo),
    FOREIGN KEY (IDIngreso, BodegaDestino) REFERENCES IngresoInventario(IDIngreso, BodegaDestino)
);




--Esto iria despues de la creacion de la factura
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



GO
CREATE PROCEDURE IngresarSalidaMov
    @IDFactura VARCHAR(15),
    @NombreArt VARCHAR(40),
    @NombreBodega VARCHAR(20),
    @Cantidad INT
AS
BEGIN
    DECLARE @CodigoBodega VARCHAR(15);
    DECLARE @CodigoProducto VARCHAR(15);
    DECLARE @CantidadRestante INT = @Cantidad;
    DECLARE @CantidadEnInventario INT;

    -- Obtener el código de la bodega
    SELECT @CodigoBodega = Codigo
    FROM Bodega
    WHERE @NombreBodega = Nombre;

    -- Obtener el código del producto
    SELECT @CodigoProducto = Codigo
    FROM Articulo
    WHERE @NombreArt = Nombre;

    -- Intentar restar de la bodega principal
    SELECT @CantidadEnInventario = CantidadProducto 
    FROM ListaArticulos 
    WHERE CodigoBodega = @CodigoBodega AND CodigoProducto = @CodigoProducto;

    IF @CantidadEnInventario IS NOT NULL AND @CantidadEnInventario >= @CantidadRestante
    BEGIN
        -- Hay suficiente cantidad en la bodega principal
        INSERT INTO SalidaMovimiento(IDFactura, CodigoProducto, CodigoBodega, Cantidad) 
        VALUES (@IDFactura, @CodigoProducto, @CodigoBodega, @CantidadRestante);

        UPDATE ListaArticulos
        SET CantidadProducto = CantidadProducto - @CantidadRestante
        WHERE CodigoBodega = @CodigoBodega AND CodigoProducto = @CodigoProducto;
    END
    ELSE
    BEGIN
        -- No hay suficiente cantidad en la bodega principal, buscar en otras bodegas
        DECLARE @CodigoOtrasBodegas VARCHAR(15);

        -- Intentar buscar en otras bodegas
        DECLARE cur CURSOR FOR 
        SELECT Codigo
        FROM Bodega
        WHERE Codigo <> @CodigoBodega;

        OPEN cur;

        FETCH NEXT FROM cur INTO @CodigoOtrasBodegas;

        WHILE @@FETCH_STATUS = 0 AND @CantidadRestante > 0
        BEGIN
            SELECT @CantidadEnInventario = CantidadProducto 
            FROM ListaArticulos 
            WHERE CodigoBodega = @CodigoOtrasBodegas AND CodigoProducto = @CodigoProducto;

            IF @CantidadEnInventario IS NOT NULL AND @CantidadEnInventario > 0
            BEGIN
                IF @CantidadEnInventario >= @CantidadRestante
                BEGIN
                    INSERT INTO SalidaMovimiento(IDFactura, CodigoProducto, CodigoBodega, Cantidad) 
                    VALUES (@IDFactura, @CodigoProducto, @CodigoOtrasBodegas, @CantidadRestante);

                    UPDATE ListaArticulos
                    SET CantidadProducto = CantidadProducto - @CantidadRestante
                    WHERE CodigoBodega = @CodigoOtrasBodegas AND CodigoProducto = @CodigoProducto;

                    SET @CantidadRestante = 0; 
                END
                ELSE
                BEGIN
                    INSERT INTO SalidaMovimiento(IDFactura, CodigoProducto, CodigoBodega, Cantidad) 
                    VALUES (@IDFactura, @CodigoProducto, @CodigoOtrasBodegas, @CantidadEnInventario);

                    UPDATE ListaArticulos
                    SET CantidadProducto = 0
                    WHERE CodigoBodega = @CodigoOtrasBodegas AND CodigoProducto = @CodigoProducto;

                    SET @CantidadRestante = @CantidadRestante - @CantidadEnInventario; 
                END
            END

            FETCH NEXT FROM cur INTO @CodigoOtrasBodegas;
        END

        CLOSE cur;
        DEALLOCATE cur;

        IF @CantidadRestante > 0
        BEGIN
            RAISERROR('No hay suficiente cantidad en inventario para realizar la salida.', 16, 1);
        END
    END
END;


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

--Esto es para el registro

create procedure InsertarUsuarios
    @NombreUS VARCHAR(50),
    @ContrasenaUS VARCHAR(255)
	as
	begin
		if not exists( select 1 from Usuarios where NombreUS = @NombreUS and ContrasenaUS = @ContrasenaUS)
		begin
			insert into Usuarios(NombreUS,ContrasenaUS) values
			(@NombreUS,@ContrasenaUS)
		end
		else
		begin
			print('Error no pueden existir usuarios con el mismo nombre y contraseña');
		end
	end;

	--Para mostrar los departamentos

GO
	--Para mostrar los Puestos
	create function ObtenerPuestos()
returns table 
as
return(
	select TipoPuesto from Puesto
);


GO
--Para ver los roles
CREATE FUNCTION ObtenerRoles()
returns table
as
return
(
    select tipoRol
    from Roles
);


GO
--Para ver los usuarios
create function ObtenerUsuarios()
returns table
as
return(
	select IDUsuario from Usuarios
);



GO
--Para ver las acciones
create function ObtenerTipoAcciones()
returns table
as
return
(
select tipoAccion from Acciones
);


GO
--Para guardar un empleado
create procedure insertarEmpleado 
	@Cedula varchar(9),
	@Nombre varchar(30),
	@apellido1 varchar(30),
	@apellido2 varchar(30),
	@genero char(1),
	@FechaNacimiento date,
	@provincia varchar(30),
	@Direccion varchar(30),
	@Telefono varchar(9),
	@CodigoDepartamento VARCHAR(15),
	@FechaIngreso DATE,
	@Puesto VARCHAR(35),
	@tipoRol varchar(20),
	@IDUsuario INT,
	@SalarioActual int 	
as
begin
	if not exists (select 1 from Empleado where Cedula = @Cedula)
	begin
		insert into Empleado(Cedula,Nombre,apellido1,apellido2,genero,FechaNacimiento,provincia,Direccion,Telefono,CodigoDepartamento,
		FechaIngreso,Puesto,tipoRol,IDUsuario,SalarioActual) values
		(@Cedula,@Nombre,@apellido1,@apellido2,@genero,@FechaNacimiento,@provincia,@Direccion,@Telefono,@CodigoDepartamento,
		@FechaIngreso,@Puesto,@tipoRol,@IDUsuario,@SalarioActual)
	end
	else 
	begin
		print('No se puede repetir la cedula')
	end
end;



GO

--Para ver los empleados
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
--Para guardar los roles

create procedure insercionRoles
	@tipoRol varchar(20),
	@Descripcion varchar(200)
as
begin
	IF NOT EXISTS (SELECT 1 FROM Roles WHERE tipoRol = @tipoRol)
	begin
		insert into Roles(tipoRol, Descripcion) values
		(@tipoRol, @Descripcion);
	end
	else
	begin
		print('Ya existe ese nombre de rol')
	end
end;


GO
--Para guardar las acciones de los roles
create procedure insertarAccionesXRol
	@tipoRol VARCHAR(20),
	@tipoAccion VARCHAR(40)
	as
	begin
		IF NOT EXISTS(select 1 from AccionesXrol where tipoRol = @tipoRol and tipoAccion = @tipoAccion)
		begin
			insert into AccionesXrol(tipoRol,tipoAccion) values
			(@tipoRol,@tipoAccion)
		end
		else 
		begin
			PRINT ('Ya existe un rolXAccion');
		end
	end;





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
create procedure GuardarCotizacion
	@CedulaCliente VARCHAR(9), --Les quite el unique
	@CedulaEmpleado VARCHAR(9), -- Les quite el unique
	@FechaCotizacion DATE,
	@MesProyectadoCierre DATE,
	@TipoCotizacion VARCHAR(50),
	@Estado VARCHAR(20) ,
	@Probabilidad FLOAT,
	@Zona VARCHAR(20),
	@Sector VARCHAR(20)
	as
	begin
	insert into Cotizacion(CedulaCliente,CedulaEmpleado,FechaCotizacion,MesProyectadoCierre,TipoCotizacion,Estado,Probabilidad,
	Zona,Sector) values (@CedulaCliente,@CedulaEmpleado,@FechaCotizacion,@MesProyectadoCierre,@TipoCotizacion,@Estado,@Probabilidad,@Zona,@Sector)
	end;




GO
create function RolesXusuario()
returns table
as
return(
	select tipoRol, IDUsuario from Empleado
);


GO
create procedure ModificarEmpleado
	@Cedula varchar(9),
	@Puesto VARCHAR(35),
	@SalarioActual int
	as
	begin
		update Empleado
		set Puesto = @Puesto,
		SalarioActual = @SalarioActual
		where Cedula = @Cedula
	end;



	--TODO ESTO ES PARA MODIFICAR EMPLEADO

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
create procedure actualizarHistoricoPuesto2
	@CedulaEmpleado VARCHAR(9), -- Agregado
    @FechaInicio DATE, 
    @FechaFin DATE, 
    @Departamento VARCHAR(50),
	@NombrePuesto VARCHAR(50)
	as
	begin
	insert into HistoricoPuesto(CedulaEmpleado,FechaInicio,FechaFin,NombrePuesto,Departamento) values
	(@CedulaEmpleado,@FechaInicio,@FechaFin ,@NombrePuesto,@Departamento)
	end;


GO
create procedure actualizarHistoricoSalario2
	@CedulaEmpleado VARCHAR(9), -- Agregado
    @FechaInicio DATE, 
    @FechaFin DATE,
	@Monto decimal,
    @Departamento VARCHAR(50),
	@NombrePuesto VARCHAR(50)
	as
	begin
	insert into HistoricoSalario(CedulaEmpleado,FechaInicio,FechaFin,Monto ,NombrePuesto,Departamento) values
	(@CedulaEmpleado,@FechaInicio,@FechaFin,@Monto,@NombrePuesto,@Departamento)
	end;




	--TODO ESTO ES PARA MODIFICAR EMPLEADO




	CREATE TABLE Planilla (
	CodigoPlanilla VARCHAR(15) NOT NULL,
	FechaPlanilla date not null,   
	CedulaEmpleado varchar(9) not null,
	HorasRealizadas int not null,
	Salario int NULL, 
	foreign key (CedulaEmpleado) references Empleado(Cedula),
	Primary key (CodigoPlanilla, CedulaEmpleado)

);



go
	create procedure AgregarPlanilla
	@CodigoPlanilla VARCHAR(15),
	@FechaPlanilla date,   
	@CedulaEmpleado varchar(9),
	@HorasRealizadas int
	as
	begin
		insert into Planilla(CodigoPlanilla,FechaPlanilla,CedulaEmpleado,HorasRealizadas) values
		(@CodigoPlanilla,@FechaPlanilla,@CedulaEmpleado,@HorasRealizadas)
	end;


	go

	CREATE PROCEDURE CalcularPago
    @CodigoPlanilla VARCHAR(15) 
AS 
BEGIN
    DECLARE @HorasRealizadas INT;
    DECLARE @Cedula VARCHAR(9);
    DECLARE @SalarioActual int;
    DECLARE @NuevoSalario int;
    DECLARE @Excedente INT; 

    SELECT @HorasRealizadas = HorasRealizadas, 
           @Cedula = CedulaEmpleado
    FROM Planilla
    WHERE CodigoPlanilla = @CodigoPlanilla;

    SELECT @SalarioActual = SalarioActual
    FROM Empleado
    WHERE Cedula = @Cedula;
	    -- Calcular el nuevo salario
    IF @HorasRealizadas > 200
    BEGIN 
        SET @Excedente = @HorasRealizadas - 200;  --Estas vienen a ser las horas extras
        SET @NuevoSalario = (@SalarioActual / 200) * @Excedente * 1.5 + @SalarioActual ;
    END
    ELSE
    BEGIN
        SET @NuevoSalario = @SalarioActual 
    END

    -- Actualizar el salario en la tabla Planilla
    UPDATE Planilla
    SET Salario = @NuevoSalario
    WHERE CodigoPlanilla = @CodigoPlanilla;
END;





GO
CREATE PROCEDURE actualizarCotizacion
    @Codigo INT, -- Agregado
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
    UPDATE Cotizacion
    SET 
        CedulaCliente = @CedulaCliente,CedulaEmpleado = @CedulaEmpleado, FechaCotizacion = @FechaCotizacion, MesProyectadoCierre = @MesProyectadoCierre,
        TipoCotizacion = @TipoCotizacion, Estado = @Estado, Probabilidad = @Probabilidad, Zona = @Zona, Sector = @Sector
    WHERE Codigo = @Codigo;
END;


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
create procedure AgregarListaCotizacion
    @CantidadProducto INT,
    @CodigoCotizacion INT,
    @Nombre VARCHAR(40)
as
begin
    declare @CodigoProducto VARCHAR(15);

    select @CodigoProducto = Codigo 
    from Articulo  
    where Nombre = @Nombre;

    insert into ListaCotizacion(CodigoProducto, CantidadProducto, CodigoCotizacion) 
    values (@CodigoProducto, @CantidadProducto, @CodigoCotizacion);
end;




go
create function MostrarTareasCOT()
returns table
as
return (
	select TipoTarea from TipoTareaCotizacion
); 



go
create function MostrarEstadosTarea()
returns table
as 
return (
	select tipoEstado from TipoTareaEstado
); 




go
create procedure InsertarTarea
@CodigoTarea VARCHAR(15),
@tipoTareaCotizacion varchar(30),
@Fecha DATE,
@Descripcion VARCHAR(200),
@Estado VARCHAR(30)
as
begin
	insert into Tarea(CodigoTarea,tipoTareaCotizacion,Fecha,Descripcion,Estado) values
	(@CodigoTarea,@tipoTareaCotizacion,@Fecha,@Descripcion,@Estado)
end;




go
create procedure EliminarCotizacion
	@CodigoCotizacion int
	as
	begin
	delete from ListaCotizacion  where @CodigoCotizacion = CodigoCotizacion;

	 delete from Cotizacion where @CodigoCotizacion = Codigo;
	end;


	
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
create procedure IngresarMovimiento
    @Cedula VARCHAR(9),
    @BodegaOrigen VARCHAR(15),
    @BodegaDestino VARCHAR(15) = NULL,
    @fecha DATE,
    @hora TIME
as
begin
    declare @CodigoBodegaOrigen VARCHAR(15);
    declare @CodigoBodegaDestino VARCHAR(15) = NULL;


    select @CodigoBodegaOrigen = Codigo 
    from Bodega 
    where Nombre = @BodegaOrigen;

    if @CodigoBodegaOrigen IS NULL
    begin  
        raiserror('La bodega de origen no existe.', 16, 1);
        return;
    end

    if @BodegaDestino IS NOT NULL
    begin
        select @CodigoBodegaDestino = Codigo 
        from Bodega 
        where Nombre = @BodegaDestino;

        if @CodigoBodegaDestino IS NULL
        begin
            raiserror('La bodega de destino no existe.', 16, 1);
            return;
        end
    end

    insert into Movimiento (Cedula, BodegaOrigen, BodegaDestino, fecha, hora)
    values (@Cedula, @CodigoBodegaOrigen, @CodigoBodegaDestino, @fecha, @hora);
end;

go
create function mostrarMovimientos()
returns table
as 
return (
	select IDMovimiento from Movimiento
);

go
create procedure RegistrarInventario
    @NombreEmpleado VARCHAR(60),
    @NombreBodega VARCHAR(55),
    @Fecha DATE
as
begin
    declare @CodigoBodegaDestino VARCHAR(15);
    declare @CedulaEmpleado VARCHAR(9);

    select @CodigoBodegaDestino = Codigo
    from Bodega
    where Nombre = @NombreBodega;

    select @CedulaEmpleado = Cedula
    from Empleado
    where CONCAT(Nombre, ' ', Apellido1, ' ', Apellido2) = @NombreEmpleado;

    -- Insertar en la tabla IngresoInventario
    INSERT INTO IngresoInventario (CedulaEmpleado, BodegaDestino, Fecha)
    VALUES (@CedulaEmpleado, @CodigoBodegaDestino, @Fecha);
END;

go
create function mostrarIDInventario()
returns table
as
return (
	select IDIngreso from IngresoInventario
);



go
create function DevolverBodega(@NombreBodega VARCHAR(55))
returns VARCHAR(15)
as
begin
    return (
        select Codigo 
        from Bodega 
        where Nombre = @NombreBodega
    );
end;



GO
CREATE PROCEDURE IngresarInventarioArticulos
    @IDIngreso INT,
    @NombreArticulo VARCHAR(40),
    @CantidadIngresada INT
AS
BEGIN
    DECLARE @CodigoFinal VARCHAR(15);
    DECLARE @CodigoBodegaDestino VARCHAR(15);
    DECLARE @CantidadActual INT;

    SELECT @CodigoFinal = Codigo
    FROM Articulo
    WHERE Nombre = @NombreArticulo;

    SELECT @CodigoBodegaDestino = BodegaDestino
    FROM IngresoInventario
    WHERE IDIngreso = @IDIngreso;

    SELECT @CantidadActual = CantidadProducto
    FROM ListaArticulos
    WHERE CodigoBodega = @CodigoBodegaDestino AND CodigoProducto = @CodigoFinal;

    IF @CantidadActual IS NOT NULL
    BEGIN
        UPDATE ListaArticulos
        SET CantidadProducto = CantidadProducto + @CantidadIngresada
        WHERE CodigoBodega = @CodigoBodegaDestino AND CodigoProducto = @CodigoFinal;
    END
    ELSE
    BEGIN
        INSERT INTO ListaArticulos (CodigoBodega, CodigoProducto, CantidadProducto)
        VALUES (@CodigoBodegaDestino, @CodigoFinal, @CantidadIngresada);
    END;
END;







	go
CREATE FUNCTION verInventarioBodega()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        b.Nombre AS NombreBodega, 
        a.Nombre AS NombreArticulo, 
        SUM(la.CantidadProducto) AS TotalArticulos
    FROM 
        Bodega AS b
    LEFT JOIN 
        ListaArticulos AS la ON b.Codigo = la.CodigoBodega
    JOIN 
        Articulo AS a ON la.CodigoProducto = a.Codigo 
    GROUP BY 
        b.Nombre, a.Nombre  
);










go
create procedure AgregarArticulosFactura
	@IDLista varchar(40),
	@NombreProducto VARCHAR(40),
	@CantidadProducto INT
	as
	begin
		DECLARE @CodigoProdu VARCHAR(15);


		select @CodigoProdu = Codigo
		from Articulo
		where @NombreProducto = Nombre;

		insert into ListaFactura(IDLista,CantidadProducto,Codigo) values
		(@IDLista,@CodigoProdu,@CantidadProducto)
	end;



go 
create function EmpleadosNombre()
returns table
as
return (
	select concat(Nombre, ' ', apellido1, ' ', apellido2) as NombreCompleto
	from Empleado 
);


go
create procedure AgregarFactura
    @Codigo VARCHAR(15),
	@CodigoCotizacion int = null,
    @NombreEmpleado VARCHAR(60), 
    @CedulaJuridica VARCHAR(9),
    @TelefonoLocal VARCHAR(8),
    @NombreLocal VARCHAR(40),
    @FechaFactura DATE,
	@NombreCliente varchar(20)
	as
	begin
		declare @CedulaCliente varchar(9);
		declare @CedulaEmpleado varchar(9);

		select @CedulaCliente = Cedula
		from Cliente
		where @NombreCliente = Nombre;

		select @CedulaEmpleado = Cedula
		from Empleado
		where @NombreEmpleado = concat(Nombre, ' ', apellido1, ' ', apellido2)


		insert into Factura(Codigo,CodigoCotizacion,CedulaCliente,CedulaEmpleado,CedulaJuridica,TelefonoLocal,NombreLocal,FechaFactura,NombreCliente,estado) values
		(@Codigo,@CodigoCotizacion,@CedulaCliente,@CedulaEmpleado,@CedulaJuridica,@TelefonoLocal,@NombreLocal,@FechaFactura,@NombreCliente,'Emitida')
	end;



GO
CREATE FUNCTION verBodegasArticuloActivo(@NombreArticulo VARCHAR(40))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        b.Codigo AS CodigoBodega,
        b.Nombre AS NombreBodega,
        li.CodigoProducto,
        a.Nombre AS NombreArticulo,
        SUM(li.CantidadProducto) AS TotalArticulos
    FROM Bodega AS b
    JOIN IngresoInventario AS iv ON b.Codigo = iv.BodegaDestino
    JOIN ListaArticulos AS li ON iv.BodegaDestino = li.CodigoBodega
    JOIN Articulo AS a ON li.CodigoProducto = a.Codigo
    JOIN Familia AS f ON a.CodigoFamilia = f.CodigoFamilia
    WHERE a.Nombre = @NombreArticulo
      AND a.Activo = 'Si'          
      AND f.Activo = 'Si'          
    GROUP BY b.Codigo, b.Nombre, li.CodigoProducto, a.Nombre
);





GO
create function DevolverFactura(@IDfactura varchar(30))
returns table
as
return (
    select 
        f.Codigo as IDFactura,
        sm.CodigoBodega as BodegaCodigo,
        sm.CodigoProducto as Producto,
        SUM(sm.Cantidad) as TotalProductos
    from Factura as f
    join SalidaMovimiento as sm on f.Codigo = sm.IDFactura
    where f.Codigo = @IDfactura
    group by f.Codigo, sm.CodigoBodega, sm.CodigoProducto
);


go
create procedure DevolverProductos
    @IDFactura varchar(30),
    @NombreEmpleado varchar(60),
    @Motivo varchar(255),
    @fecha datetime
as
begin
    declare @CedulaEMP varchar(9);
    declare @CodigoBodega varchar(30);
    declare @CodigoProducto varchar(30);
    declare @CantidadDevuelta int;

    select @CedulaEMP = Cedula
    from Empleado
    where @NombreEmpleado = concat(Nombre, ' ', apellido1, ' ', apellido2)

    declare ProductoCursor cursor for
    select 
        sm.CodigoBodega,
        sm.CodigoProducto,
        sm.Cantidad
    from 
        SalidaMovimiento as sm
    INNER JOIN 
        Factura as f on f.Codigo = sm.IDFactura
    where 
        f.Codigo = @IDFactura;

    open ProductoCursor;
	fetch next from ProductoCursor into @CodigoBodega, @CodigoProducto, @CantidadDevuelta;

    while @@fetch_status = 0
    begin
        update ListaArticulos
        set CantidadProducto = CantidadProducto + @CantidadDevuelta
        where CodigoBodega = @CodigoBodega AND CodigoProducto = @CodigoProducto;

        insert into Movimiento (Cedula, BodegaOrigen, BodegaDestino, fecha, hora)
        values (@CedulaEMP, @CodigoBodega, null, cast(@fecha as date), cast(@fecha as time)); 

        fetch next from ProductoCursor into @CodigoBodega, @CodigoProducto, @CantidadDevuelta;
    end

    close ProductoCursor;
    deallocate ProductoCursor;

    update Factura
    set estado = 'Cancelada'
    where Codigo = @IDFactura;

end;

go
create procedure IngresarTareaCot
	@CodigoTarea varchar(15),
	@CodigoCotizacion int
	as
	begin
		insert into TareaCotizacion(CodigoTarea,Codigo) values
		(@CodigoTarea,@CodigoCotizacion)
	end;


GO
create function VerTareasCotizacion()
returns table
as
return
(
    select 
        t.Descripcion,
        t.tipoTareaCotizacion,
        t.Fecha,
        t.Estado,
        CONCAT(e.Nombre, ' ', e.apellido1, ' ', e.apellido2) as NombreCompleto
    from 
        Tarea as t
    join 
        TareaCotizacion as tc on t.CodigoTarea = tc.CodigoTarea 
    join 
        Cotizacion as c on tc.Codigo = c.Codigo
    join 
        Empleado as e on c.CedulaEmpleado = e.Cedula
    where 
        t.tipoTareaCotizacion IS NOT NULL  
);



go
create function VerTareaCot()
returns table
as
return (
	select CodigoTarea from TareaCotizacion
); 

GO
CREATE PROCEDURE EliminarTareaCOT
    @CodigoTarea VARCHAR(15),
    @CodigoC INT
AS
BEGIN
    DELETE FROM TareaCotizacion
    WHERE CodigoTarea = @CodigoTarea AND Codigo = @CodigoC;
END;

go
create function detalleFactura()
returns table
as
return
(
	select 
		sm.IDFactura, 
		f.NombreCliente, 
		f.FechaFactura,
		a.Nombre,  
		sm.Cantidad,  
		CONCAT(e.Nombre, ' ', e.apellido1, ' ', e.apellido2) as NombreEmpleado,  
		(sm.Cantidad * a.PrecioEstandar) as PrecioArticulos,
		(select sum(sm2.Cantidad * a2.PrecioEstandar) 
		 from SalidaMovimiento sm2 
		 join Articulo a2 on sm2.CodigoProducto = a2.Codigo 
		 where sm2.IDFactura = sm.IDFactura) as TotalFactura  
	from 
		Factura as f
	join 
		SalidaMovimiento as sm on f.Codigo = sm.IDFactura
	join 
		Articulo as a on sm.CodigoProducto = a.Codigo
	join 
		Empleado as e on f.CedulaEmpleado = e.Cedula  
)



go
CREATE PROCEDURE listamovimientoFinal
    @nombreart VARCHAR(70),
    @cantidadarticulo INT,
    @codigomovimiento INT
AS
BEGIN
    DECLARE @codigoart VARCHAR(15);
    DECLARE @codigoBodegaOrigen VARCHAR(15);
    DECLARE @codigoBodegaDestino VARCHAR(15);
    
    SELECT @codigoart = codigo
    FROM articulo
    WHERE @nombreart = nombre;

    SELECT 
        @codigoBodegaOrigen = BodegaOrigen,
        @codigoBodegaDestino = BodegaDestino
    FROM Movimiento
    WHERE IDMovimiento = @codigomovimiento; 


    INSERT INTO ListaMovimiento (codigoarticulo, cantidadarticulo, codigomovimiento) 
    VALUES (@codigoart, @cantidadarticulo, @codigomovimiento);

    UPDATE ListaArticulos
    SET CantidadProducto = CantidadProducto - @cantidadarticulo
    WHERE CodigoBodega = @codigoBodegaOrigen AND CodigoProducto = @codigoart;

    IF @codigoBodegaDestino IS NOT NULL
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM ListaArticulos 
                       WHERE CodigoBodega = @codigoBodegaDestino AND CodigoProducto = @codigoart)
        BEGIN
            INSERT INTO ListaArticulos (CodigoBodega, CodigoProducto, CantidadProducto) 
            VALUES (@codigoBodegaDestino, @codigoart, @cantidadarticulo);
        END
        ELSE
        BEGIN
            UPDATE ListaArticulos
            SET CantidadProducto = CantidadProducto + @cantidadarticulo
            WHERE CodigoBodega = @codigoBodegaDestino AND CodigoProducto = @codigoart;
        END
    END
END;


go
create function mostrarNombreC()
returns table
as return(
	select Nombre from Cliente
);

go
create function MostrarCodigoFac()
returns table
as
return (
	select Codigo from Factura
);

go
create function verListaF()
returns table
as return (
select IDLista from ListaFactura
);




go
create procedure agregarFacturaLista
	@IDLista varchar(40),
	@CantidadProducto int,
	@Nombrepro varchar(40),
	@CodigoF varchar(15)
	as
	begin
		declare @CodigoProducto varchar(15);

		select @CodigoProducto = Codigo
		from Articulo
		where @Nombrepro = Nombre

		insert into ListaFactura(IDLista,CantidadProducto,Codigo,CodigoF) values (@IDLista, @CantidadProducto, @CodigoProducto,@CodigoF)
	end;



	GO
	create function ObtenerDepartamentos()
returns table
as
return(
	select Codigo From Departamento
	);