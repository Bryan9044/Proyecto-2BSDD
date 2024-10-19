CREATE DATABASE ERPPRUEBA
GO

USE ERPPRUEBA;
GO


CREATE TABLE Estado(
	TipoEstado VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (TipoEstado)
)

CREATE TABLE Probabilidad (
	Porcentaje FLOAT,
	ProbabilidadEstimada VARCHAR(20),
	PRIMARY KEY (Porcentaje)
)

CREATE TABLE Prioridad(
	Nivel INT NOT NULL,
	TipoPrioridad VARCHAR(20) NOT NULL,
	PRIMARY KEY (TipoPrioridad)
)


CREATE TABLE TipoCaso(
	Tipocaso VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (Tipocaso)
)

CREATE TABLE TipoPago(
	tipoPago VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY(tipoPago)
)


CREATE TABLE Departamento (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY(Codigo)
)
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



USE ERPPRUEBA
GO

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


create function ObtenerTipoAcciones()
returns table
as
return
(
select tipoAccion from Acciones
);

select * from ObtenerTipoAcciones()



--visualizar, reporteria y creación

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
--INSERT INTO Roles (IDRol, tipoRol) VALUES (1, 'Administrador');

CREATE FUNCTION ObtenerTiposDeRoles()
RETURNS TABLE
AS
RETURN
(
    SELECT tipoRol
    FROM Roles
);

select  * from ObtenerTiposDeRoles()


drop procedure insercionRoles
create procedure insercionRoles
	@tipoRol varchar(20),
	@Descripcion varchar(20)
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
end

CREATE TABLE AccionesXrol (
    tipoRol VARCHAR(20),
    tipoAccion VARCHAR(40),
    PRIMARY KEY (tipoRol, tipoAccion),
    FOREIGN KEY (tipoRol) REFERENCES Roles(tipoRol),
    FOREIGN KEY (tipoAccion) REFERENCES Acciones(tipoAccion)
);

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
	end


	--Estos insert no los hice, equisde

INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('Ayudante', 'Visualizacion');
INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('SuperUsuario', 'Edicion');
INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('SuperUsuario', 'Reportes');




CREATE TABLE Planilla (
	CodigoPlanilla VARCHAR(15) NOT NULL,
	HorasMensuales INT NOT NULL,
	HorasLaboradas INT,
	Salario FLOAT NOT NULL,
	HorasExtra INT,
	Fecha date,
	PRIMARY KEY(CodigoPlanilla)
)

CREATE TABLE Puesto(
	TipoPuesto VARCHAR(20) NOT NULL,
	Salario DECIMAL NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (TipoPuesto)
)

INSERT INTO Puesto(TipoPuesto, Salario, Descripcion) values
('Electricista', 500000.00, 'Se encarga de los cables y todo el fluido electrico'),
('Ingeniero', 700000.00, 'Se encarga de diseñar y elaborar planes para mejorar la eficiencia'),
('Control de Calidad', 480000.00, 'Garantiza que los productos cumplen con los estándares de calidad'),
('Encargado de Inventarios', 450000.00, 'Mantiene un registro actualizado del inventario'),
('Ayudante', 200000.00, 'Se encarga de todos los trabajos que le sean asignados'),
('Bodeguero', 350000.00, 'Tiene que realizar chequeos de bodega y mover mercancia'),
('MontaCargas', 400000.00, 'Tiene que mover mercancia pesada o de gran cantidad'),
('Recepcionista', 320000.00, 'Atiende a los clientes que lleguen al negocio'),
('Administrador', 450000.00, 'Se encarga de dirigir y ver como van los avances'),
('Operador', 370000.00, 'Usa maquinas y dirige de mejor forma las cargas de productos'),
('Auxiliar', 400000.00, 'Realiza de todo un poco de los trabajos que hay en la bodega'),
('Vendedor', 500000.00, 'Se encarga de buscar o atender clientes que quieran comprar productos'),
('Supervisor', 600000.00, 'Debe realizar chequeos constantes para ver que todo este en orden y nada falle'),
('Empacador', 350000.00, 'Da las ultimas ordenes de donde llevar la mercancia y guardarla'),
('Despachador', 320000.00, 'Busca a los vehiculos a los cuales va a cargar los productos de salida'),
('Coordinador', 320000.00, 'Coordina todas las entregas y posibles rutas a tomar'),
('Reparaciones', 420000.00, 'Tiene que hacer trabajos de reparamiento a las maquinas o bodegas'),
('Preparador', 250000.00, 'Va guardando y enlistando los productos a utilizar');






)


USE ERPPRUEBA;
GO

CREATE TABLE Usuarios (
    IDUsuario INT PRIMARY KEY,
    NombreUS VARCHAR(50) NOT NULL UNIQUE,
    ContrasenaUS VARCHAR(255) NOT NULL,
);
INSERT INTO Usuarios(IDUsuario, NombreUS, ContrasenaUS) values
(1, 'Administrador','SOYadmin.')

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
end


CREATE PROCEDURE InsertarUsuarios
	@IDUsuario int ,
	@NombreUS varchar(50),
	@ContrasenaUS varchar(255),
	@tipoRol varchar(20) 
as
begin
	if not exists (select 1 FROM Usuarios where NombreUS = @NombreUS)
	begin
		insert into Usuarios (
		IDUsuario, NombreUS, ContrasenaUS, tipoRol
		) 
		values 
		(@IDUsuario,@NombreUS,@ContrasenaUS, @tipoRol);
		PRINT 'Se creo el usuario'
	end
	else
	begin
		PRINT 'El nombre de usuario ya existe';
	end
end;



CREATE TABLE Empleado (
	Cedula VARCHAR(9) NOT NULL,
	Nombre varchar(30) not null,
	apellido1 varchar(30) Not null,
	apellido2 varchar(30) not null,
	genero char(1) not null,
	FechaNacimiento date not null,
	provincia varchar(30),
	Direccion varchar(30),
	Telefono varchar(9),
	CodigoDepartamento VARCHAR(15) NOT NULL,
	CodigoPlanilla VARCHAR(15) NOT NULL,
	FechaIngreso DATE NOT NULL,
	Puesto VARCHAR(20) NOT NULL,
	tipoRol varchar(20),
	FOREIGN KEY (tipoRol) references Roles(tipoRol)
	PRIMARY KEY(Cedula),
	FOREIGN KEY (CodigoDepartamento) REFERENCES Departamento(Codigo),
	FOREIGN KEY (CodigoPlanilla) REFERENCES Planilla(CodigoPlanilla),
	FOREIGN KEY (Puesto) REFERENCES Puesto(Nombre)
)

CREATE TABLE Historicos (
	CodigoDepartamento VARCHAR(15) NOT NULL,
	CedulaEmpleado VARCHAR(9) NOT NULL,
	FechaInicio DATE NOT NULL,
	FechaFinal DATE NOT NULL,
	Monto FLOAT NOT NULL,
	PRIMARY KEY (CodigoDepartamento, CedulaEmpleado),
	FOREIGN KEY (CodigoDepartamento) REFERENCES Departamento(Codigo),
	FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula)
)

CREATE TABLE Bodega (
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Ubicacion VARCHAR(20) NOT NULL,
	EspacioCubico SMALLINT NOT NULL,
	CapacidadTon SMALLINT NOT NULL,
	PRIMARY KEY (Codigo)
)

CREATE TABLE TelefonosLocal (
    CodigoBodega VARCHAR(15) NOT NULL,
    NumTelefono VARCHAR(8) NOT NULL,
    PRIMARY KEY (CodigoBodega, NumTelefono),
	FOREIGN KEY (CodigoBodega) REFERENCES Bodega(Codigo)
)

CREATE TABLE Familia (
	CodigoFamilia VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY(CodigoFamilia)
)
INSERT INTO Familia(CodigoFamilia,Nombre,Descripcion) values
('Fam1', 'Escolares', 'Artículos como lapices o borradores'),
('Fam2', 'Farmacéuticos', 'Medicamentos y productos de salud '),
('Fam3', 'Electrónica', 'Componentes electrónicos como chips o tecnología implementada'),
('Fam4', 'Calzado', 'Todo tipo de zapatos'),
('Fam5', 'Relojes y Joyas', 'Artículos que son solo de lujo'),
('Fam6', 'Juguetes', 'Artículos para entretenimiento infantil'),
('Fam7', 'Alimentos', 'Productos alimenticios enlatados, frescos, congelados'),
('Fam8', 'Bebidas', 'Líquidos para consumo como refrescos, jugos, bebidas alcohólicas y agua embotellada'),
('Fam9', 'Cosméticos', 'Productos de cuidado personal'),
('Fam10', 'Electrodomésticos', 'Aparatos eléctricos para uso doméstico'),
('Fam11', 'Limpieza', 'Productos hechos para limipiar'),
('Fam12', 'Herramientas', 'Herramientas manuales y eléctricas'),
('Fam13', 'Jardinería', 'Herramientas y productos para el cuidado de jardines'),
('Fam14', 'Automotriz', 'Accesorios y repuestos para vehículos'),
('Fam15', 'Construcción', 'Materiales para la construcción '),
('Fam16', 'Deportes', 'articulos deportivos hechos solo para deporte'),
('Fam17', 'Mascotas', 'Productos para el cuidado de mascotas'),
('Fam18', 'Ropa', 'Prendas de vestir'),
('Fam19', 'Muebles', 'Artículos de mobiliario'),
('Fam20', 'Libros', 'Todo tipo de literatura'),
('Fam21', 'Tecnología', 'Dispositivos electrónicos'),
('Fam22', 'Iluminación', 'Articulos hechos para iluminar la casa u oficinas'),
('Fam23', 'Material de Oficina', 'Artículos necesarios para el trabajo'),
('Fam24', 'Bebés', 'Productos para el cuidado de bebés'),
('Fam25', 'Accesorios de hogar', 'Productos hechos para usar en el hogar');

CREATE TABLE FamiliaBodega (
	CodigoBodega VARCHAR(15) NOT NULL,
	CodigoFamilia VARCHAR(15) NOT NULL,
	PRIMARY KEY (CodigoBodega,CodigoFamilia),
	FOREIGN KEY (CodigoBodega) references Bodega(Codigo)
	FOREIGN KEY (CodigoFamilia) references Familia(CodigoFamilia)
)

CREATE TABLE Articulo (
	CodigoFamilia VARCHAR(15)  NOT NULL,
	Codigo VARCHAR(15) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Peso FLOAT NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Codigo),
	FOREIGN KEY (CodigoFamilia) references Familia(CodigoFamilia)
)

INSERT INTO Articulo (CodigoFamilia, Codigo, Nombre, Peso, Descripcion) VALUES
('Fam1', 'ART1', 'Lápiz HB', 0.02, 'Lápiz de grafito para escritura.'),
('Fam1', 'ART2', 'Cuaderno 100 hojas', 0.3, 'Cuaderno de con 100 hojas rayadas.'),
('Fam1', 'ART3', 'Borrador blanco', 0.01, 'Borrador de leche para lápiz.'),
('Fam1', 'ART4', 'Regla 30 cm', 0.05, 'Regla plástica para medir.'),
('Fam1', 'ART5', 'Sacapuntas doble', 0.02, 'Sacapuntas para lápices grandes y pequeños.'),
  
('Fam2', 'ART6', 'Ibuprofeno 200mg', 0.01, 'Tabletas para alivio del dolor.'),
('Fam2', 'ART7', 'Jarabe para la tos', 0.25, 'Medicamento para calmar la tos.'),
('Fam2', 'ART8', 'Espadrapo', 0.55, 'espadrapo para soporte y compresión.'),
('Fam2', 'ART9', 'Anticonceptivos', 0.1, 'Prevenir embarazos.'),
('Fam2', 'ART10', 'Curitas adhesivas', 0.02, 'Tiras adhesivas para pequeñas heridas.'),
  
('Fam3', 'ART11', 'GPU', 0.01, 'Grafica para juegos.'),
('Fam3', 'ART12', 'Placa madre', 3.5, 'La que hace que una computadora funcione'),
('Fam3', 'ART13', 'Pantalla LED', 1.2, 'Pantalla LED para dispositivos electrónicos.'),
('Fam3', 'ART14', 'Cable HDMI', 0.15, 'Cable para conectar dispositivos a pantallas.'),
('Fam3', 'ART15', 'Teclado inalámbrico', 0.6, 'Teclado sin cables para computadora.'),
  
('Fam4', 'ART16', 'tenis nike', 0.8, 'tenis para hacer deporte.'),
('Fam4', 'ART17', 'Botas de cuero', 1.2, 'Botas resistentes de cuero.'),
('Fam4', 'ART18', 'Sandalias', 0.3, 'Sandalias casuales'),
('Fam4', 'ART19', 'Burros ', 6.7, 'Para trabajar de verdad.'),
('Fam4', 'ART20', 'Zapatos formales', 0.9, 'Zapatos elegantes para eventos formales.'),
  
('Fam5', 'ART21', 'Reloj suizo', 0.15, 'Reloj analógico de lujo.'),
('Fam5', 'ART22', 'Collar de oro', 0.02, 'Collar hecho de oro de 18 quilates.'),
('Fam5', 'ART23', 'Anillo de diamantes', 0.01, 'Anillo con incrustaciones de diamantes.'),
('Fam5', 'ART24', 'Pulsera de Zafior', 0.05, 'Pulsera de Zafiro.'),
('Fam5', 'ART25', 'Aretes de perlas', 0.01, 'Aretes con perlas naturales.'),
  
('Fam6', 'ART26', 'Muñeca de Barbie', 0.2, 'Muñeca transformable para jugar.'),
('Fam6', 'ART27', 'Terreneitor', 0.1, 'Carro para loquear.'),
('Fam6', 'ART28', 'Legos', 0.3, 'Muñequitos armables'),
('Fam6', 'ART29', 'Pelota de futbol', 0.1, 'Pelota de cuero'),
('Fam6', 'ART30', 'Monopoly', 0.7, 'Juego de mesa familiar.'),
  
('Fam7', 'ART31', 'Bistek', 0.25, 'pedazo de carne.'),
('Fam7', 'ART32', 'Arroz 99', 1.0, 'Bolsa de arroz al 99 porciento.'),
('Fam7', 'ART33', 'Johnys', 0.5, 'Polvo de cacao para bebidas.'),
('Fam7', 'ART34', 'Frootlops', 0.6, 'Cereal para el desayuno.'),
('Fam7', 'ART35', 'Pollo congelado', 1.5, 'Pollo entero congelado.'),
  
('Fam8', 'ART36', 'Alpina 1L', 1.0, 'Botella de agua potable.'),
('Fam8', 'ART37', 'Refresco de coca cola 500ml', 0.5, 'Botella de coca cola fria.'),
('Fam8', 'ART38', 'Del valle 1L', 1.1, 'Jugo de naranja natural.'),
('Fam8', 'ART39', 'Imperial 355ml', 0.4, 'Lata de cerveza.'),
('Fam8', 'ART40', 'Villa maria', 1.2, 'Botella de vino tinto importado.'),
  
('Fam9', 'ART41', 'Shampoo 500ml', 0.6, 'Botella de shampoo para el cabello.'),
('Fam9', 'ART42', 'Crema hidratante 200ml', 0.3, 'Crema para hidratar la piel.'),
('Fam9', 'ART43', 'Perfume de vainilla', 0.2, 'Perfume con fragancia de vainilla.'),
('Fam9', 'ART44', 'Desodorante en barra', 0.1, 'Desodorante duro para el cuidado personal.'),
('Fam9', 'ART45', 'Lápiz labial', 0.05, 'Lápiz labial de larga duración.'),
  
('Fam10', 'ART46', 'Microondas', 7.0, 'Horno de microondas para calentar alimentos.'),
('Fam10', 'ART47', 'Batidora', 2.5, 'Batidora de mano para cocina.'),
('Fam10', 'ART48', 'Aspiradora', 4.0, 'Aspiradora para limpieza del hogar.'),
('Fam10', 'ART49', 'Tostadora', 1.8, 'Tostadora eléctrica para pan.'),
('Fam10', 'ART50', 'Cafetera', 2.0, 'Cafetera eléctrica para preparar café.'),
  
('Fam11', 'ART51', 'Limpiador multiusos', 0.75, 'Limpiador para todo tipo de superficies.'),
('Fam11', 'ART52', 'Detergente líquido', 1.0, 'Detergente para lavar ropa.'),
('Fam11', 'ART53', 'Esponjas de limpieza', 0.05, 'Esponjas para lavar platos y superficies.'),
  
('Fam12', 'ART54', 'Martillo', 1.0, 'Martillo de acero y mango de madera para clavar.'),
('Fam12', 'ART55', 'Destornillador', 0.2, 'Destornillador plano y de cruz.'),
  
('Fam13', 'ART56', 'Tijeras de podar', 0.4, 'Tijeras para podar plantas.'),
('Fam13', 'ART57', 'Guantes de jardinería', 0.2, 'Guantes para trabajar en el jardín.'),
  
('Fam14', 'ART58', 'Batería de carros', 20.0, 'Batería para carros.'),
('Fam14', 'ART59', 'Aceite de motor', 1.0, 'Aceite lubricante para motores.'),
  
('Fam15', 'ART60', 'Cemento', 25.0, 'Saco de cemento para construcción.'),
('Fam15', 'ART61', 'Ladrillos', 3.0, 'Ladrillos para construir muros.'),
  
('Fam16', 'ART62', 'Balón de fútbol', 0.5, 'Balón de fútbol de tamaño oficial.'),
('Fam16', 'ART63', 'Raqueta de tenis', 0.3, 'Raqueta ligera para jugar al tenis.'),
  
('Fam17', 'ART64', 'Comida para perros', 1.5, 'Alimento seco para perros.'),
('Fam17', 'ART65', 'Arena para gatos', 1.0, 'Arena absorbente para gatos.'),
  
('Fam18', 'ART66', 'Camisa de algodón', 0.2, 'Camisa cómoda para uso diario.'),
('Fam18', 'ART67', 'Pantalones jeans', 0.5, 'Pantalones de mezclilla.'),


('Fam19', 'ART68', 'Escritorio', 10.5, 'Escritorio grande para trabajo.'),
('Fam19', 'ART69', 'Ropero', 30.00, 'Ropero gigante para 1 persona.'),


('Fam20', 'ART70', 'Novela', 1.5, 'Libro hecho para generar drama.'),
('Fam20', 'ART71', 'Comic', 1.5, 'Libro de accion.'),


('Fam21', 'ART72', 'Celular', 5.5, 'Dispositivo para comunicarse y entretenerse'),
('Fam21', 'ART73', 'Laptop', 10.5, 'Dispositivo para trabajar y portar a todo lado'),

('Fam22', 'ART74', 'Lampara de pared', 3.5, 'Lampara para iluminar un cuarto'),
('Fam22', 'ART75', 'Lampara de techo', 5.5, 'Lampara led para iluminar un lugar'),

('Fam23', 'ART76', 'Grapadora', 4.5, 'Para grapar hojas o documentos'),
('Fam23', 'ART77', 'Impresora', 15.5, 'Impresora para imprimir hojas o documentos'),

('Fam24', 'ART78', 'Pañalito', 5.5, 'Por si el bebe esta quemado'),
('Fam24', 'ART79', 'Colonia', 7.5, 'Para que huela bien'),

('Fam25', 'ART80', 'Cuchillos', 6.5, 'Para cortar alimentos'),
('Fam25', 'ART81', 'Cuadros decorativos', 9.5, 'Para que se vea bonita la casa');

CREATE TABLE Zona (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	TamanoKmCuadrado INT NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
)


INSERT INTO Zona (Nombre, TamanoKmCuadrado,Descripcion) VALUES
('Pacifico sur',100 ,'Muchas playas y vegetación'),
('Pacifico norte',300 ,'Mucho sol y climas calidos'),
('Pacifico central',250 ,'Muchas playas y esta llena de bosque y otros atractivos'),
('Caribe norte',100 ,'Mucha flora y fauna en exceso'),
('Caribe sur', 100,'Las mejores playas y lugar de mucha cultura'),
('Valle central', 400,'Donde hay más población y muchas oportunidades de crecimiento'),
('Zona norte',200 ,'Mucha tierra y muchos cultivos de caña y arroz'),


CREATE TABLE Sector (
	Nombre VARCHAR(20) UNIQUE NOT NULL,
	Descripcion VARCHAR(200),
	PRIMARY KEY (Nombre)
)

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





CREATE TABLE Cliente (
    Cedula VARCHAR(9) NOT NULL,
    Telefono VARCHAR(8) NOT NULL,
    Genero char(1) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    CorreoElectronico VARCHAR(20) NOT NULL,
    Fax VARCHAR(20),
    Sector varchar(20) not null,
    Zona varchar(20) not null,
	Celular VARCHAR(8) NOT NULL,
	PRIMARY KEY (Cedula)
)

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


CREATE TABLE ListaArticulos (
    CodigoBodega VARCHAR(15) NOT NULL,
    Codigo VARCHAR(15),
    CodigoProducto VARCHAR(15) NOT NULL,
    CantidadProducto INT NOT NULL,
    PRIMARY KEY (Codigo),
    FOREIGN KEY (CodigoBodega) REFERENCES Bodega(Codigo),
    FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo)
);


CREATE TABLE Movimiento(
	IDMovimiento int,
	Cedula VARCHAR(9) not null, 
	BodegaOrigen varchar(15),
	BodegaDestino varchar(15),
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
	CodigoMovimiento int NOT NULL, --Este no se
	PRIMARY KEY (CodigoArticulo, CodigoMovimiento),
	FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoMovimiento) REFERENCES Movimiento(IDMovimiento),
)

CREATE TABLE IngresoInventario (
	CodigoArticulo VARCHAR(15) NOT NULL,
	CedulaEmpleado varchar(9),
	BodegaDestino varchar(15),
	Fecha date,
	PRIMARY KEY (CodigoArticulo),
	FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
	FOREIGN KEY (BodegaDestino) REFERENCES Bodega(Codigo)
)

CREATE TABLE ListaIngreso (
    CodigoMovimiento INT NOT NULL,
    CodigoArticulo VARCHAR(15) NOT NULL,
    CantidadIngresada INT,
    PRIMARY KEY (CodigoArticulo, CodigoMovimiento),
    FOREIGN KEY (CodigoMovimiento) REFERENCES Movimiento(IDMovimiento),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo)
);



CREATE TABLE SalidaMovimiento(
	IDFactura VARCHAR(15),
	CodigoProducto VARCHAR(15),
	CodigoBodega VARCHAR(15),
	Cantidad int,
	PRIMARY KEY(IDFactura, CodigoProducto,CodigoBodega),
	FOREIGN KEY (CodigoProducto) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoBodega) REFERENCES Bodega(Codigo),
	FOREIGN KEY (IDFactura) REFERENCES Factura(Codigo),
);




CREATE TABLE Tarea (
    CodigoTarea VARCHAR(15) NOT NULL,
    CodigoEmpleado VARCHAR(9) NOT NULL,
    Fecha DATE NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
	PRIMARY KEY (CodigoTarea,CodigoEmpleado),
    FOREIGN KEY (CodigoEmpleado) REFERENCES Empleado(Cedula),
	FOREIGN KEY (Estado) REFERENCES  Estado(TipoEstado)
)




CREATE TABLE Caso (
    CodigoCaso VARCHAR(15) NOT NULL,
    CedulaPropietario VARCHAR(9) UNIQUE NOT NULL,
    NombreCuenta VARCHAR(20) NOT NULL,
    TipoCaso VARCHAR(20) NOT NULL,
    Asunto VARCHAR(200) NOT NULL,
    NombreContacto VARCHAR(20) NOT NULL,
    Descripcion VARCHAR(200),
    Ubicacion VARCHAR(200) NOT NULL,
    Prioridad VARCHAR(20) NOT NULL,
    CodigoTarea varchar(15) null, --Agregado
	PRIMARY KEY (CodigoCaso,CedulaPropietario),
    FOREIGN KEY (CedulaPropietario) REFERENCES Empleado(Cedula),
    FOREIGN KEY (CodigoTarea) references Tarea(CodigoTarea),
    FOREIGN KEY (Prioridad) references Prioridad(TipoPrioridad) --Agregado,
    FOREIGN KEY (TipoCaso) references TipoCaso(TipoCaso) --Agregado
)

--Para guardar
CREATE PROCEDURE CrearTareaYCaso (
    IN p_CodigoTarea VARCHAR(15),
    IN p_CodigoEmpleado VARCHAR(9),
    IN p_Fecha DATE,
    IN p_Descripcion VARCHAR(200),
    IN p_Estado VARCHAR(20),
    IN p_CodigoCaso VARCHAR(15),
    IN p_CedulaPropietario VARCHAR(9),
    IN p_NombreCuenta VARCHAR(20),
    IN p_TipoCaso VARCHAR(20),
    IN p_Asunto VARCHAR(200),
    IN p_NombreContacto VARCHAR(20),
    IN p_Ubicacion VARCHAR(200),
    IN p_Prioridad VARCHAR(20)
)
BEGIN
    -- Insertar la tarea
    INSERT INTO Tarea (CodigoTarea, CodigoEmpleado, Fecha, Descripcion, Estado)
    VALUES (p_CodigoTarea, p_CodigoEmpleado, p_Fecha, p_Descripcion, p_Estado);
    
    -- Insertar el caso
    INSERT INTO Caso (CodigoCaso, CedulaPropietario, NombreCuenta, TipoCaso, Asunto, NombreContacto, Descripcion, Ubicacion, Prioridad, CodigoTarea)
    VALUES (p_CodigoCaso, p_CedulaPropietario, p_NombreCuenta, p_TipoCaso, p_Asunto, p_NombreContacto, p.Descripcion, p_Ubicacion, p_Prioridad, p_CodigoTarea);
END;



CREATE TABLE TipoCotizacion(
	Tipocotizacion varchar(20),
	Descripcion varchar(200),
	PRIMARY KEY (Tipocotizacion)
);

CREATE TABLE Cotizacion (
	Codigo VARCHAR(15) NOT NULL,
	CedulaCliente VARCHAR(9)  NOT NULL, --Les quite el unique
	CedulaEmpleado VARCHAR(9)  NOT NULL, -- Les quite el unique
	OrdenDeCompra VARCHAR(20) NOT NULL,
	FechaCotizacion DATE NOT NULL,
	MesProyectadoCierre DATE NOT NULL,
	CierreFinal DATE NOT NULL,
	TipoCotizacion VARCHAR(20) NOT NULL,
	Estado VARCHAR(20) NOT NULL,
	Probabilidad FLOAT,
	CodigoCaso VARCHAR(15),
	PRIMARY KEY(Codigo),
	FOREIGN KEY (CedulaCliente) REFERENCES Cliente(Cedula),
	FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
    FOREIGN KEY (TipoCotizacion) REFERENCES TipoCotizacion(Tipocotizacion),
	FOREIGN KEY (CodigoCaso) REFERENCES Caso(CodigoCaso),
	FOREIGN KEY (Probabilidad) REFERENCES Probabilidad(Porcentaje),
	FOREIGN KEY (Estado) REFERENCES  Estado(TipoEstado)
)


CREATE TABLE ZonaCotizacion (
	NombreZona VARCHAR(20) NOT NULL,
	CodigoCotizacion VARCHAR(15) NOT NULL,
	PRIMARY KEY (NombreZona,CodigoCotizacion),
	FOREIGN KEY (NombreZona) REFERENCES Zona(Nombre),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo)
)



CREATE TABLE SectorCotizacion (
	NombreSector VARCHAR(20) NOT NULL,
	CodigoCotizacion VARCHAR(15) NOT NULL,
	PRIMARY KEY (NombreSector,CodigoCotizacion),
	FOREIGN KEY (NombreSector) REFERENCES Sector(Nombre),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo)
)

CREATE TABLE Factura (
    Codigo VARCHAR(15) NOT NULL,
	CodigoCotizacion VARCHAR(15) UNIQUE NOT NULL,
    CedulaCliente VARCHAR(9) UNIQUE NOT NULL,
    CedulaEmpleado VARCHAR(9) UNIQUE NOT NULL,
    CedulaJuridica VARCHAR(9) NOT NULL,
    TelefonoLocal VARCHAR(8) NOT NULL,
    NombreLocal VARCHAR(20) NOT NULL,
    FechaFactura DATE,
	PRIMARY KEY (Codigo),
    FOREIGN KEY (CedulaCliente) REFERENCES Cliente(Cedula),
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo),
)





CREATE TABLE Movimiento (
	Codigo VARCHAR(15) NOT NULL,
    CodigoFactura VARCHAR(15) UNIQUE NOT NULL,
    CedulaEmpleado VARCHAR(9) UNIQUE NOT NULL,
    BodegaOrigen VARCHAR(15) UNIQUE NOT NULL,
    BodegaDestino VARCHAR(15) UNIQUE NOT NULL,
    CantidadArticulo INT NOT NULL,
    FechaHora DATE NOT NULL,
    TipoMovimiento VARCHAR(20) NOT NULL,
	PRIMARY KEY (Codigo),
    FOREIGN KEY (CodigoFactura) REFERENCES Factura(Codigo),
    FOREIGN KEY (CedulaEmpleado) REFERENCES Empleado(Cedula),
    FOREIGN KEY (BodegaOrigen) REFERENCES Bodega(Codigo),
	FOREIGN KEY (BodegaDestino) REFERENCES Bodega(Codigo)
)



CREATE TABLE ListaFactura (
	CodigoLista VARCHAR(15) NOT NULL,
	CodigoFactura VARCHAR(15) NOT NULL,
	PRIMARY KEY (CodigoLista,CodigoFactura),
	FOREIGN KEY (CodigoLista) REFERENCES ListaArticulos(Codigo),
	FOREIGN KEY (CodigoFactura) REFERENCES Factura(Codigo),
)

CREATE TABLE ListaCotizacion (
	CodigoArticulo VARCHAR(15) NOT NULL,
	CantidadArticulos int not null,
	CodigoCotizacion VARCHAR(15) NOT NULL,
	PRIMARY KEY (CodigoArticulo,CodigoCotizacion),
	FOREIGN KEY (CodigoArticulo) REFERENCES Articulo(Codigo),
	FOREIGN KEY (CodigoCotizacion) REFERENCES Cotizacion(Codigo),
)

