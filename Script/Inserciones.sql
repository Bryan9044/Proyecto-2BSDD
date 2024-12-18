USE ERPPRUEBA

INSERT INTO Usuarios(NombreUS, ContrasenaUS) values
('Prueba','Nashe'),
('Cartel','desanta'),
('rapapa','disco'),
('perros', 'gatos'),
('p1','pp'),
('Administrador','SOYadmin.');

INSERT INTO Zona (Nombre, TamanoKmCuadrado,Descripcion) VALUES
('Pacifico sur',100 ,'Muchas playas y vegetaci�n'),
('Pacifico norte',300 ,'Mucho sol y climas calidos'),
('Pacifico central',250 ,'Muchas playas y esta llena de bosque y otros atractivos'),
('Caribe norte',100 ,'Mucha flora y fauna en exceso'),
('Caribe sur', 100,'Las mejores playas y lugar de mucha cultura'),
('Valle central', 400,'Donde hay m�s poblaci�n y muchas oportunidades de crecimiento'),
('Zona norte',200 ,'Mucha tierra y muchos cultivos de ca�a y arroz');

INSERT INTO Sector (Nombre, Descripcion) VALUES
('Econ�mico', 'Relaciono con la producci�n y venta de productos.'),
('Constructor', 'Sector dedicado a la construcci�n de edificios, infraestructuras y obras p�blicas.'),
('Tecnol�gico', 'En busca de desarrollo y uso de tecnolog�a en diversos �mbitos.'),
('Salud', 'Sector que abarca servicios m�dicos, farmac�uticos y de bienestar.'),
('Educaci�n', 'Sector que se ocupa de la ense�anza y formaci�n en todos los niveles.'),
('Industrial', 'Sector que engloba la producci�n de bienes en f�bricas.'),
('Transporte', 'Sector relacionado con el movimiento de personas y mercanc�as.'),
('Energ�a', 'Sector que abarca la producci�n y distribuci�n de energ�a.'),
('Comercial', 'Sector dedicado a la venta de productos y servicios al por menor.'),
('Cultural', 'Sector que abarca actividades relacionadas con la cultura y el arte.'),
('Deportivo', 'Sector que se enfoca en la pr�ctica de deportes.'),
('Automotriz', 'Sector dedicado a la fabricaci�n y venta de veh�culos.'),
('Telecomunicaciones', 'Sector que abarca servicios de comunicaci�n a distancia.'),
('Alimentaci�n', 'Sector que se ocupa de la producci�n y distribuci�n de alimentos.');

insert into Estado(TipoEstado,Descripcion) values
('Abierta', 'Todavia no se da un veredicto final'),
('Aprobado', 'Se aprueba la cotizacion yupiiii'),
('Rechazado', 'Se rechaza la cotizacion mecagoentodo');

INSERT INTO Probabilidad (Porcentaje, ProbabilidadEstimada)
VALUES 
(0.75, 'Alta'),
(0.50, 'Media'),
(0.25, 'Baja');


insert into Prioridad(TipoPrioridad, Descripcion) values
('Alta','Merece mucha atenci�n'),
('Media','No se debe descuidar'),
('Baja','Para hacer despu�s');

insert into TipoCaso(Tipocaso,Descripcion) values
('Reclamo','Se exige un reclamo por un error'),
('Devolucion','Se necesita abrir un caso para que devuelvan ciertos articulos'),
('Garantia','Un producto se da�o antes de lo esperado');

INSERT INTO Departamento(Codigo, Nombre) values
('DEP1', 'Mantenimiento'),
('DEP2', 'Ingenier�a'),
('DEP3', 'Log�stica'),
('DEP4', 'Administraci�n'),
('DEP5', 'Atenci�n al cliente'),
('DEP6', 'Ventas'),
('DEP7', 'Producci�n'),
('DEP8', 'Supervisi�n'),
('DEP9', 'Electricidad');

INSERT INTO Modulos(IDModulo,NombreModulo,Descripcion) values
(1, 'Factura', 'Se le permite hacer cosas dentro de la factura'),
(2, 'Cotizacion', 'Se le permite hacer cosas dentro de la cotizaci�n'),
(3, 'Tarea', 'Se le permite hacer cosas dentro de la tarea'),
(4, 'Bodega', 'Se le permite hacer cosas dentro de la bodega'),
(5, 'Planilla', 'Se le permite hacer cosas dentro de la planilla'),
(6, 'Departamento', 'Se le permite hacer cosas del departamento'),
(7, 'Caso', 'Se le permite hacer cosas de un caso'),
(8, 'Usuario', 'Se le permite hacer cosas del usuario');

INSERT INTO Acciones(IDAccion,tipoAccion,descripcion) values
(1, 'Visualizacion', 'Se le permite todo con respecto a visualizar'),
(2, 'Creacion', 'Se le permite todo con respecto a la creaci�n'),
(3, 'Reporteria', 'Se le permite todo con respecto a reportes'),
(4, 'Edicion', 'Se le permite todo con respecto a editar');

insert into ModulosXAcciones(NombreModulo,tipoAccion) values
('Cotizacion', 'Visualizacion'),
('Cotizacion', 'Creacion'),
('Cotizacion', 'Edicion');

insert into Roles(tipoRol,Descripcion) values
('Encargado', 'Se encarga de que todo este bien'),
('SuperUsuario', 'Se encarga de que todo este bien'),
('Vendedor', 'Se encarga de vender productos'),
('Bodeguero', 'Se encarga de la bodega'),
('Ayudante','Ayuda en todas las tareas al admin');

INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('Ayudante', 'Visualizacion');
INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('SuperUsuario', 'Edicion');
INSERT INTO AccionesXrol (tipoRol, tipoAccion) VALUES ('SuperUsuario', 'Reporteria');

INSERT INTO Puesto(TipoPuesto, Salario, Descripcion) values
('Electricista', 500000, 'Se encarga de los cables y todo el fluido electrico'),
('Ingeniero', 700000, 'Se encarga de dise�ar y elaborar planes para mejorar la eficiencia'),
('Control de Calidad', 480000, 'Garantiza que los productos cumplen con los est�ndares de calidad'),
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

insert into Empleado(Cedula,Nombre,apellido1,apellido2,genero,FechaNacimiento,provincia,Direccion,Telefono,CodigoDepartamento,FechaIngreso,Puesto,tipoRol,IDUsuario,SalarioActual)
values
('123456789', 'Jose', 'Perez', 'Rodriguez', 'M', '1990-05-12', 'San Jos�', 'San pedro 50 metros norte', '22223333', 'DEP1', '2015-03-10', 'Electricista', 'Encargado', 1, 500000),
('987654321', 'Sofia', 'Lopez', 'Jimenez', 'F', '1985-09-15', 'Alajuela', 'Alajuelita underground', '22334455', 'DEP2', '2010-07-22', 'Ingeniero', 'Vendedor', 2, 700000),
('112233445', 'Fabian', 'Martinez', 'Solis', 'M', '1995-12-05', 'Heredia', 'Guarari', '22445566', 'DEP3', '2018-01-19', 'Control de Calidad', 'Bodeguero', 3, 480000),
('556677889', 'Valka', 'Gomez', 'Alvarado', 'F', '1992-03-28', 'Cartago', 'Lomas del sur', '22556677', 'DEP4', '2017-09-15', 'Administrador', 'Encargado', 4, 450000),
('334455667', 'Andres', 'Vargas', 'Campos', 'M', '1998-11-23', 'Puntarenas', 'Del faro a 30 metros', '22667788', 'DEP5', '2019-11-25', 'Recepcionista', 'Vendedor', 5, 320000),
('998877665', 'Clarisa', 'Castro', 'Mora', 'F', '1991-06-30', 'Guanacaste', 'Playa samara casa 50', '22778899', 'DEP6', '2016-04-13', 'Vendedor', 'Ayudante', 1, 500000);

INSERT INTO Familia(CodigoFamilia,Nombre,activo,Descripcion) values
('Fam1', 'Escolares', 'Si','Art�culos como lapices o borradores'),
('Fam2', 'Farmac�uticos', 'Si','Medicamentos y productos de salud '),
('Fam3', 'Electr�nica','Si', 'Componentes electr�nicos como chips o tecnolog�a implementada'),
('Fam4', 'Calzado','Si', 'Todo tipo de zapatos'),
('Fam5', 'Relojes y Joyas', 'No','Art�culos que son solo de lujo'),
('Fam6', 'Juguetes', 'Si','Art�culos para entretenimiento infantil'),
('Fam7', 'Alimentos', 'Si','Productos alimenticios enlatados, frescos, congelados'),
('Fam8', 'Bebidas', 'Si','L�quidos para consumo como refrescos, jugos, bebidas alcoh�licas y agua embotellada'),
('Fam9', 'Cosm�ticos', 'No','Productos de cuidado personal'),
('Fam10', 'Electrodom�sticos','Si', 'Aparatos el�ctricos para uso dom�stico'),
('Fam11', 'Limpieza', 'No','Productos hechos para limipiar'),
('Fam12', 'Herramientas', 'Si','Herramientas manuales y el�ctricas'),
('Fam13', 'Jardiner�a', 'No','Herramientas y productos para el cuidado de jardines'),
('Fam14', 'Automotriz', 'Si','Accesorios y repuestos para veh�culos'),
('Fam15', 'Construcci�n', 'Si','Materiales para la construcci�n '),
('Fam16', 'Deportes', 'No',' s deportivos hechos solo para deporte'),
('Fam17', 'Mascotas', 'Si','Productos para el cuidado de mascotas'),
('Fam18', 'Ropa', 'Si','Prendas de vestir'),
('Fam19', 'Muebles', 'Si','Art�culos de mobiliario'),
('Fam20', 'Libros', 'No','Todo tipo de literatura'),
('Fam21', 'Tecnolog�a', 'Si','Dispositivos electr�nicos'),
('Fam22', 'Iluminaci�n', 'No','Articulos hechos para iluminar la casa u oficinas'),
('Fam23', 'Material de Oficina', 'No','Art�culos necesarios para el trabajo'),
('Fam24', 'Beb�s', 'No','Productos para el cuidado de beb�s'),
('Fam25', 'Accesorios de hogar', 'Si','Productos hechos para usar en el hogar');

INSERT INTO Articulo (CodigoFamilia, Codigo, Nombre,Activo, Peso, Costo,PrecioEstandar,Descripcion) VALUES
('Fam1', 'ART1', 'L�piz HB', 'Si', 0.02, 0.5, 100.0, 'L�piz de grafito para escritura.'),
('Fam1', 'ART2', 'Cuaderno 100 hojas', 'No', 0.3, 1.5, 3000.0, 'Cuaderno de con 100 hojas rayadas.'),
('Fam1', 'ART3', 'Borrador blanco', 'Si', 0.01, 0.2, 100.4, 'Borrador de leche para l�piz.'),
('Fam1', 'ART4', 'Regla 30 cm', 'Si', 0.05, 0.7, 100.5, 'Regla pl�stica para medir.'),
('Fam1', 'ART5', 'Sacapuntas doble', 'No', 0.02, 0.3, 350.0, 'Sacapuntas para l�pices grandes y peque�os.'), 
('Fam2', 'ART6', 'Ibuprofeno 200mg', 'Si', 0.01, 0.8, 2000.0, 'Tabletas para alivio del dolor.'),
('Fam2', 'ART7', 'Jarabe para la tos', 'No', 0.25, 3.0, 5000.0, 'Medicamento para calmar la tos.'),
('Fam2', 'ART8', 'Espadrapo', 'Si', 0.55, 1.0, 2000.5, 'espadrapo para soporte y compresi�n.'),
('Fam2', 'ART9', 'Anticonceptivos', 'Si', 0.1, 4.0, 10000.0, 'Prevenir embarazos.'),
('Fam2', 'ART10', 'Curitas adhesivas', 'No', 0.02, 0.4, 100.0, 'Tiras adhesivas para peque�as heridas.'),
('Fam3', 'ART11', 'GPU', 'No', 0.01, 200.0, 250000.0, 'Grafica para juegos.'),
('Fam3', 'ART12', 'Placa madre', 'Si', 3.5, 100.0, 120000.0, 'La que hace que una computadora funcione.'),
('Fam3', 'ART13', 'Pantalla LED', 'Si', 1.2, 80.0, 100000.0, 'Pantalla LED para dispositivos electr�nicos.'),
('Fam3', 'ART14', 'Cable HDMI', 'No', 0.15, 5.0, 1000.0, 'Cable para conectar dispositivos a pantallas.'),
('Fam3', 'ART15', 'Teclado inal�mbrico', 'No', 0.6, 20.0, 25000.0, 'Teclado sin cables para computadora.'),
('Fam4', 'ART16', 'tenis nike', 'Si', 0.8, 50.0, 75000.0, 'tenis para hacer deporte.'),
('Fam4', 'ART17', 'Botas de cuero', 'No', 1.2, 80.0, 100000.0, 'Botas resistentes de cuero.'),
('Fam4', 'ART18', 'Sandalias', 'No', 0.3, 25.0, 4000.0, 'Sandalias casuales.'),
('Fam4', 'ART19', 'Burros', 'Si', 6.7, 200.0, 25000.0, 'Para trabajar de verdad.'),
('Fam4', 'ART20', 'Zapatos formales', 'Si', 0.9, 70.0, 9000.0, 'Zapatos elegantes para eventos formales.'),
('Fam5', 'ART21', 'Reloj suizo', 'No', 0.15, 300.0, 3500000.0, 'Reloj anal�gico de lujo.'),
('Fam5', 'ART22', 'Collar de oro', 'Si', 0.02, 200.0, 250000.0, 'Collar hecho de oro de 18 quilates.'),
('Fam5', 'ART23', 'Anillo de diamantes', 'Si', 0.01, 500.0, 600000.0, 'Anillo con incrustaciones de diamantes.'),
('Fam5', 'ART24', 'Pulsera de Zafiro', 'No', 0.05, 150.0, 180000.0, 'Pulsera de Zafiro.'),
('Fam5', 'ART25', 'Aretes de perlas', 'Si', 0.01, 80.0, 100000.0, 'Aretes con perlas naturales.'),
('Fam6', 'ART26', 'Mu�eca de Barbie', 'No', 0.2, 20.0, 25000.0, 'Mu�eca transformable para jugar.'),
('Fam6', 'ART27', 'Terreneitor', 'Si', 0.1, 15.0, 200000.0, 'Carro para loquear.'),
('Fam6', 'ART28', 'Legos', 'Si', 0.3, 30.0, 35000.0, 'Mu�equitos armables.'),
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
('Fam9', 'ART45', 'L�piz labial', 'Si', 0.05, 5.0, 7000.0, 'L�piz labial de larga duraci�n.'),
('Fam10', 'ART46', 'Microondas','No', 1.3, 7.0, 5000.00,  'Horno de microondas para calentar alimentos.'),
('Fam10', 'ART47', 'Batidora' ,'Si',  1.2, 2.5, 13000.00, 'Batidora de mano para cocina.'),
('Fam10', 'ART48', 'Aspiradora' ,'No', 1.5, 4.0, 25000.00, 'Aspiradora para limpieza del hogar.'),
('Fam10', 'ART49', 'Tostadora' ,'Si', 1.4, 1.8, 10000.00, 'Tostadora el�ctrica para pan.'),
('Fam10', 'ART50', 'Cafetera' ,'Si',2.3, 2.0, 4000.00,  'Cafetera el�ctrica para preparar caf�.'),
('Fam11', 'ART51', 'Limpiador multiusos' ,'Si', 0.5, 0.75, 1200.00, 'Limpiador para todo tipo de superficies.'),
('Fam11', 'ART52', 'Detergente l�quido' ,'Si', 0.7, 1.0, 700.00, 'Detergente para lavar ropa.'),
('Fam11', 'ART53', 'Esponjas de limpieza' ,'No', 0.1, 0.05, 300.00, 'Esponjas para lavar platos y superficies.'),
('Fam12', 'ART54', 'Martillo' ,'Si', 7.2, 1.0, 5000.00, 'Martillo de acero y mango de madera para clavar.'),
('Fam12', 'ART55', 'Destornillador','Si', 2.2, 0.2, 2500.00, 'Destornillador plano y de cruz.'),
('Fam13', 'ART56', 'Tijeras de podar' ,'No', 4.4, 0.4, 7500.00, 'Tijeras para podar plantas.'),
('Fam13', 'ART57', 'Guantes de jardiner�a' ,'Si', 1.2, 0.2, 2000.00, 'Guantes para trabajar en el jard�n.'),
('Fam14', 'ART58', 'Bater�a de carros' ,'No', 14.2, 20.0, 70000.00, 'Bater�a para carros.'),
('Fam14', 'ART59', 'Aceite de motor' ,'Si', 1.5, 1.0, 20000.00, 'Aceite lubricante para motores.'),
('Fam15', 'ART60', 'Cemento' ,'Si', 20.3, 25.0, 15000.00, 'Saco de cemento para construcci�n.'),
('Fam15', 'ART61', 'Ladrillos' ,'No', 15.0, 3.0, 1000.00, 'Ladrillos para construir muros.'),
('Fam16', 'ART62', 'Bal�n de f�tbol' ,'No', 3.2, 0.5, 3500.00, 'Bal�n de f�tbol de tama�o oficial.'),
('Fam16', 'ART63', 'Raqueta de tenis' ,'Si', 2.0, 0.3, 12500.00, 'Raqueta ligera para jugar al tenis.'),
('Fam17', 'ART64', 'Comida para perros','No', 1.3, 1.5, 1500.00, 'Alimento seco para perros.'),
('Fam17', 'ART65', 'Arena para gatos' ,'Si', 1.5, 1.0, 1500.00, 'Arena absorbente para gatos.'),
('Fam18', 'ART66', 'Camisa de algod�n' ,'No', 1.4, 0.2, 10000.00, 'Camisa c�moda para uso diario.'),
('Fam18', 'ART67', 'Pantalones jeans' ,'Si', 1.3, 0.5, 13000.00, 'Pantalones de mezclilla.'),
('Fam19', 'ART68', 'Escritorio' ,'Si', 10.3, 10.5, 55000.00, 'Escritorio grande para trabajo.'),
('Fam19', 'ART69', 'Ropero' ,'No', 30.2, 30.0, 150000.00, 'Ropero gigante para 1 persona.'),
('Fam20', 'ART70', 'Novela' ,'No', 1.0, 1.5, 7000.00, 'Libro hecho para generar drama.'),
('Fam20', 'ART71', 'Comic' ,'Si', 1.0, 1.5, 3500.00, 'Libro de acci�n.'),
('Fam21', 'ART72', 'Celular' ,'No', 1.0, 5.5, 130000.00, 'Dispositivo para comunicarse y entretenerse.'),
('Fam21', 'ART73', 'Laptop' ,'Si', 5.0, 10.5, 200000.00,'Dispositivo para trabajar y portar a todo lado.'),
('Fam22', 'ART74', 'Lampara de pared','No', 1.3, 3.5, 4000.00, 'Lampara para iluminar un cuarto.'),
('Fam22', 'ART75', 'Lampara de techo' ,'Si', 1.5, 5.5, 5000.00, 'Lampara led para iluminar un lugar.'),
('Fam23', 'ART76', 'Grapadora' ,'Si', 0.8, 4.5, 1200.00, 'Para grapar hojas o documentos.'),
('Fam23', 'ART77', 'Impresora' ,'No', 7.3, 15.5, 20000.00, 'Impresora para imprimir hojas o documentos.'),
('Fam24', 'ART78', 'Pa�alito' ,'No', 1.8, 5.5, 3500.00, 'Por si el bebe est� quemado.'),
('Fam24', 'ART79', 'Colonia' ,'Si', 1.9, 7.5, 2000.00, 'Para que huela bien.'),
('Fam25', 'ART80', 'Cuchillos' ,'No', 3.2, 6.5, 5000.00, 'Para cortar alimentos.'),
('Fam25', 'ART81', 'Cuadros decorativos' ,'Si', 2.3, 9.5, 6000.00, 'Para que se vea bonita la casa.');

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

INSERT INTO Cliente (Cedula, Telefono, Genero, Nombre, CorreoElectronico, Fax, Sector, Zona, Celular) VALUES
('123456789', '22223334', 'M', 'Juan P�rez', 'juaperezZeledon@mail.com', '22224444', 'Econ�mico', 'Zona norte', '80839796'),
('325543227', '33334444', 'F', 'Mar�a L�pez', 'marilopez@mail.com', '33335555', 'Tecnol�gico', 'Pacifico central', '70755432'),
('456789123', '44445555', 'M', 'Carlos Rodr�guez', 'carlosrodriguezzzzz@mail.com', '44446666', 'Industrial', 'Caribe sur', '60876543'),
('321654987', '55556666', 'F', 'Ana Mart�nez', 'anadel@mail.com', '55557777', 'Salud', 'Caribe norte', '56647890'),
('754323489', '66667777', 'M', 'Luis Fern�ndez', 'luisferna3421@mail.com', '66668888', 'Construcci�n', 'Valle central', '98763453'),
('432124368', '77778888', 'F', 'Laura G�mez', 'lauragoz@mail.com', '77779999', 'Comercial', 'Pacifico sur', '75623754'),
('153234558', '88889999', 'M', 'Pedro Jim�nez', 'pedronez@mail.com', '88880000', 'Alimentacion', 'Pacifico norte', '87357423'),
('533467853', '99990000', 'F', 'Carmen D�az', 'carmenz@mail.com', '99991111', 'Educacion', 'Zona norte', '93945412'),
('258932147', '11112222', 'M', 'Javier Morales', 'moralesjavier@mail.com', '11113333', 'Deportivo', 'Caribe sur', '45678976'),
('369253247', '22223334', 'F', 'Isabel Torres', 'isabel20torres@mail.com', '22224444', 'Cultural', 'Valle central', '23456843');

insert into TipoTareaCotizacion(TipoTarea,descripcion) values
('Seguimiento','El empleado debe estar en constante vigilancia de la cotizaci�n para ver el progreso que esta tiene'),
('Archivacion','Guardar toda la informaci�n con respecto a una cotizaci�n en un documento especifico'),
('Orden','Generar una orden con la lista de productos de la cotizacion para revisar si estan disponibles'),
('Envio','Asegurarse de que el envio de los productos en caso de que se quieran se puedan enviar'),
('Documentaci�n','Generar todo el listado de los productos y cantidad que se va a requerir en un documento formal'),
('Control de calidad','Revisar que todos los productos que se quieran en la cotizacion esten en buen estado'),
('Revisi�n de precios','Revisar que todos los precios que fueron dados en la cotizaci�n sean los correctos'),
('Negociaci�n','Hablar con el cliente y persuadirlo para que realice la compra en el momento');

insert into TipoTareaCaso(TipoTarea,descripcion) values
('Devolucion','Revisar el por qu� es que se debe devolver el producto'),
('Reclamo','Atender al cliente y verificar la situaci�n para aliviar el problema'),
('Garantia','Revisar la garant�a del producto e informale al cliente si es posible');

insert into TipoTareaEstado(tipoEstado,descripcion) values
('Iniciada','Es una tarea que recien se empieza'),
('En proceso', 'Es una tarea que sigue en marcha'),
('Terminada', 'Es una tarea que ya termuno');

INSERT INTO Tarea (CodigoTarea, tipoTareaCotizacion, tipoTareaCaso, Fecha, Descripcion, Estado) VALUES
('T1', NULL,'Devolucion','2024/10/22','Tiene que mover la mercancia hasta el camion','Terminada'),
('T2', NULL, 'Reclamo', '2024/05/15', 'descargar equipo', 'Iniciada'),
('T3', NULL, 'Garantia', '2022/10/24', 'Saber como comunicarse con el cliente', 'En proceso'),
('T4', NULL, 'Devolucion', '2023/07/03', 'Tiene que verificar el tipo de producto a devolver', 'En proceso'),
('T5', NULL, 'Reclamo', '2024/06/28', 'debe revisar si el reclamo es valido', 'Iniciada'),
('T6', NULL, 'Garantia', '2022/12/31', 'Revisar si todav�a es valida y ver el producto', 'Terminada');

INSERT INTO TipoCotizacion(Tipocotizacion,Descripcion) values
('Cotizacion abierta','Es una cotizacion la cual su precio puede variar'),
('Cotizacion cerrada','Es una cotizacion fija en la cual se busca que se mantenga un precio'),
('Cotizacion preliminar','Es una cotizacion en la cual solo se busca saber el precio'),
('Cotizacion de servicios','Consta en que se va a generar por los servicios que le fueron prestados'),
('Cotizacion de articulos','Es una cotizaci�n por toda la cantidad de articulos que se van a pedir');

insert into Cotizacion(CedulaCliente,CedulaEmpleado,FechaCotizacion,MesProyectadoCierre,TipoCotizacion,Estado,Probabilidad,Zona,Sector) values
('754323489','123456789','2020/10/15','2020/12/15','Cotizacion abierta','Abierta' ,0.25, 'Caribe norte','Alimentaci�n'),
('369253247','987654321','2017/06/04','2018/06/04','Cotizacion cerrada','Aprobado' ,0.5, 'Caribe sur','Automotriz'),
('432124368','112233445','2024/10/24','2024/12/24','Cotizacion de articulos','Rechazado' ,0.75, 'Pacifico central','Comercial'),
('456789123','556677889','2023/05/03','2023/09/03','Cotizacion de servicios', 'Aprobado',0.5, 'Pacifico norte','Constructor'),
('533467853','334455667','2021/02/02','2021/05/02','Cotizacion preliminar','Abierta' ,0.25, 'Pacifico sur','Cultural'),
('754323489','998877665','2015/05/15','2017/05/15','Cotizacion de articulos', 'Rechazado',0.75,'Valle central','Deportivo');

insert into Caso(CodigoCaso,PropietarioCaso,OrigenCaso,NombreCuenta,NombreContacto,Asunto, Direccion, Descripcion,EstadoCaso, TipoCaso,Prioridad) values
('CS1','754323489',1 , 'Personal','Salamar' ,'Necesitamos una ayuda inmediata', 'San jose en el centro de la capital', 'Se tiene que verificar el tipo de ayuda que necesita','Abierta', 'Devolucion','Alta'),
('CS2','369253247',2 , 'Empresarial','Dospinos' ,'Queremos hablar con un encargado', 'Alajuela a un costado del mercado', 'Se procedera a enviar la queja al encargado','Aprobado', 'Devolucion','Alta'),
('CS3','432124368',3 , 'Personal','Aurua','Tuvimos problemas', 'En San carlos debajo de una catarata ', 'Se busca el tipo de problemas','Rechazado', 'Garantia','Baja'),
('CS4','456789123',4 , 'Personal','Dianeys' ,'Hubo un problema', 'En la casa habitacion #58 en limon', 'Se habla para ver el problema','Aprobado', 'Garantia','Baja'),
('CS5','533467853',5 , 'Empresarial','Nike' ,'Algo fallo en los pedidos', 'San jose a la par de amazon', 'Se indica el fallo que hubo','Abierta', 'Reclamo','Media'),
('CS6','754323489',6 , 'Empresarial','Adidas' ,'Es un asunto de urgencia', 'San jose por el mall san pedro','se habla con el administrador', 'Rechazado', 'Reclamo','Media');

insert into TareaCaso(CodigoTarea,CodigoCaso) values
('T1', 'CS1'),
('T2', 'CS2'),
('T3', 'CS3'),
('T4', 'CS4'),
('T5', 'CS5'),
('T6', 'CS6');

insert into estadoFactura(tipoFactura, descripcion) values 
('Emitida','Recien se creo la factura'),
('Pagada','El cliente ya pago toda la factura'),
('Cancelada','El cliente cancela la factura');