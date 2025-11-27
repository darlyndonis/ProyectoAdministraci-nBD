 -- INSERTS

USE ONG_ManosSolidarias;
GO
-- ==========================================================
-- CATÁLOGOS BASE - ONG "Manos Solidarias"
-- ==========================================================

-- Tipos de Donante
INSERT INTO TipoDonante (tipo) VALUES
('Individual'),
('Corporativo'),
('Fundación'),
('Gobierno'),
('ONG Aliada');

-- Países
INSERT INTO Pais (pais) VALUES
('El Salvador'),
('Guatemala'),
('Honduras'),
('Nicaragua'),
('Costa Rica');

-- Estados del Proyecto
INSERT INTO Estado_Proyecto (estado) VALUES
('Planificación'),
('En ejecución'),
('Completado'),
('En evaluación'),
('Cancelado');

-- Tipos de Beneficiario
INSERT INTO Tipo_beneficiario (tipo_beneficiario) VALUES
('Niños'),
('Familias'),
('Adultos mayores'),
('Comunidades rurales'),
('Centros educativos');

-- Tipos de Beneficio
INSERT INTO Tipo_beneficio (tipo_beneficio) VALUES
('Alimentación'),
('Educación'),
('Salud'),
('Infraestructura'),
('Capacitación');

-- Cargos
INSERT INTO Cargo (cargo) VALUES
('Coordinador'),
('Administrador'),
('Voluntario'),
('Consultor Técnico'),
('Promotor Comunitario');
GO


INSERT INTO Cargo (cargo)
VALUES
('Coordinador de Proyecto'),     
('Trabajador Social'),          
('Facilitador Comunitario'),     
('Administrador de Programa'),   
('Promotor de Salud'),           
('Voluntario Especializado');    



-- ==========================================================
-- Donantes Base
-- ==========================================================
INSERT INTO Donante (nombre_completo, nombre_organizacion, tipo_donante, email, telefono, direccion, fecha_registro, id_pais)
VALUES
('María Gómez', NULL, 1, 'maria.gomez@email.com', '7012-4587', 'San Salvador', '2023-03-15', 1),
('Banco Solidario', 'Banco Solidario S.A.', 2, 'contacto@bsolidario.com', '2211-4000', 'San Salvador', '2023-05-20', 1),
('Fundación Esperanza', 'Fundación Esperanza', 3, 'info@esperanza.org', '2300-9001', 'Guatemala', '2023-06-10', 2),
('Ministerio de Salud', 'Gobierno de El Salvador', 4, 'salud@minsal.gob.sv', '2222-9999', 'San Salvador', '2023-04-05', 1),
('ONG Vida Nueva', 'ONG Vida Nueva', 5, 'contacto@vidanueva.org', '503-8888-1111', 'Santa Ana', '2023-07-01', 1);
GO

-- Nuevos Donantes

INSERT INTO Donante (nombre_completo, nombre_organizacion, tipo_donante, email, telefono, direccion, fecha_registro, id_pais) VALUES
('Laura Méndez', 'Fundación Esperanza Global', 2, 'laura.esperanza@fe.org', '5555-1001', 'Calle Real #12, San Salvador', '2024-09-15', 1),
('Carlos Jiménez', 'Asociación Viva México', 2, 'carlos.jimenez@avm.mx', '5555-2002', 'Av Reforma #100, CDMX', '2024-10-01', 2),
('Anna Schmidt', 'Ayuda Alemana', 1, 'anna.schmidt@aa.de', '5555-3003', 'Berlin Mitte 45', '2024-10-10', 5),
('Robert Thompson', 'Red Humanitaria Canadá', 2, 'rthompson@rhc.ca', '5555-4004', 'Ottawa Center 77', '2024-11-01', 3),
('María Gutiérrez', NULL, 3, 'maria.gutierrez@gmail.com', '5555-1111', 'Santa Tecla', '2024-09-20', 1),
('Jorge Castillo', 'Fundación Luz Ibérica', 2, 'jorge.c@luziberica.es', '5555-2222', 'Madrid Centro', '2024-09-30', 4),
('Julia Hernández', NULL, 3, 'julia.hdz@gmail.com', '5555-3333', 'San Miguel', '2024-12-05', 1),
('Thomas Becker', 'Ayuda Humanitaria Berlín', 1, 'tbecker@ahb.de', '5555-4444', 'Berlín Oeste 12', '2024-11-15', 5),
('Sofía Martínez', 'Colectivo Canadá Apoya', 2, 'smartinez@cca.ca', '5555-5555', 'Toronto Station', '2024-11-20', 3),
('Miguel Torres', NULL, 3, 'miguel.torres@gmail.com', '5555-6666', 'Santa Ana', '2025-01-02', 1);



-- ==========================================================
-- Empleados Base
-- ==========================================================
INSERT INTO Empleado (nombre, contacto, cargo, tipo_empleado, fecha_ingreso)
VALUES
('Laura Castillo', 'laura.castillo@manossolidarias.org', 'Coordinador', 'Tiempo completo', '2023-01-01'),
('Carlos Ramos', 'carlos.ramos@manossolidarias.org', 'Administrador', 'Tiempo completo', '2023-02-10'),
('Sofía López', 'sofia.lopez@manossolidarias.org', 'Voluntario', 'Temporal', '2023-03-15'),
('Miguel Hernández', 'miguel.hernandez@manossolidarias.org', 'Consultor Técnico', 'Contrato', '2023-04-01'),
('Daniela Flores', 'daniela.flores@manossolidarias.org', 'Promotor Comunitario', 'Tiempo parcial', '2023-05-01');
GO

INSERT INTO Empleado (nombre, contacto, cargo, tipo_empleado, fecha_ingreso)
VALUES
-- Proyecto Aurora (2 empleados)
('Ana Torres', 'ana@mail.com', 'Analista', 'Tiempo Completo', '2021-01-10'),
('Luis Martínez', 'luis@mail.com', 'Desarrollador', 'Tiempo Completo', '2022-02-15'),

-- Proyecto Solaris (4 empleados)
('Carlos Gómez', 'carlos@mail.com', 'Coordinador', 'Temporal', '2020-05-20'),
('María Pérez', 'maria@mail.com', 'Analista', 'Tiempo Completo', '2019-11-13'),
('Ricardo Cruz', 'ricardo@mail.com', 'Consultor', 'Consultor', '2021-09-01'),
('Elena Duarte', 'elena@mail.com', 'Asistente', 'Practicante', '2022-08-12'),

-- Proyecto Vertex (6 empleados)
('Jorge Medina', 'jorge@mail.com', 'Supervisor', 'Tiempo Completo', '2018-07-22'),
('Sofía Rivas', 'sofia@mail.com', 'Técnico', 'Temporal', '2019-03-01'),
('Héctor López', 'hector@mail.com', 'Consultor', 'Consultor', '2020-12-15'),
('Patricia Vega', 'patricia@mail.com', 'Analista', 'Tiempo Completo', '2021-03-30'),
('Diego Castillo', 'diego@mail.com', 'Asistente', 'Practicante', '2022-06-18'),
('Fabiola Herrera', 'fabi@mail.com', 'Coordinador', 'Tiempo Completo', '2023-01-05'),

-- Proyecto Horizonte (3 empleados)
('Esteban Flores', 'esteban@mail.com', 'Analista', 'Tiempo Completo', '2020-04-10'),
('Gabriela Soto', 'gabriela@mail.com', 'Técnico', 'Temporal', '2021-02-22'),
('Sergio Campos', 'sergio@mail.com', 'Consultor', 'Consultor', '2022-10-11'),

-- Proyecto Atlas (5 empleados)
('Natalia Ramos', 'natalia@mail.com', 'Supervisor', 'Tiempo Completo', '2019-08-14'),
('Oscar Ramírez', 'oscar@mail.com', 'Técnico', 'Temporal', '2020-07-19'),
('Viviana Melgar', 'viviana@mail.com', 'Analista', 'Tiempo Completo', '2021-05-03'),
('Mauricio López', 'mauricio@mail.com', 'Consultor', 'Consultor', '2022-11-25'),
('Daniela Robles', 'daniela@mail.com', 'Asistente', 'Practicante', '2023-03-02');

GO

-- Nuevos empleados para proyectos vacíos
INSERT INTO Empleado (nombre, tipo_empleado, fecha_ingreso) VALUES
('José Martínez', 'Tiempo completo', '2023-02-11'),
('Ana Beltrán', 'Tiempo parcial', '2023-04-20'),
('Rosa Aguilar', 'Temporal', '2023-03-22'),
('Pedro Juárez', 'Contrato', '2023-05-10'),
('Marta Hidalgo', 'Voluntario', '2023-06-01');


---------------------------------------------------------
-- 1. EMPLEADOS NUEVOS PARA LOS PROYECTOS VACÍOS
---------------------------------------------------------
INSERT INTO Empleado (nombre, tipo_empleado, fecha_ingreso)
VALUES
('José Martínez', 'Tiempo completo', '2023-02-11'),
('Ana Beltrán', 'Tiempo parcial', '2023-04-20'),
('Rosa Aguilar', 'Temporal', '2023-03-22'),
('Pedro Juárez', 'Contrato', '2023-05-10'),
('Marta Hidalgo', 'Voluntario', '2023-06-01');



-- ==========================================================
-- 4. PROYECTOS CON SUS RELACIONES
-- ==========================================================

INSERT INTO Proyecto (nombre, descripcion, presupuesto, fecha_inicio, fecha_fin, id_estado_proyecto) 
VALUES
('Agua Limpia para Todos','Instalación de sistemas de purificación de agua en comunidades rurales.',25000.00,'2023-01-10','2023-08-30',3),
('Educación sin Fronteras','Programa educativo para niños en zonas vulnerables.',18000.00,'2023-02-01','2023-12-01',2),
('Salud Comunitaria','Jornadas médicas y campañas de vacunación.',30000.00,'2023-04-15','2023-10-15',2),
('Construyendo Futuro','Construcción de aulas en escuelas rurales.',50000.00,'2023-03-01','2024-01-15',1),
('Alimentos Solidarios','Entrega mensual de paquetes alimentarios a familias vulnerables.',12000.00,'2023-05-10','2023-11-20',2),
('Capacitación Laboral','Talleres de habilidades técnicas para jóvenes desempleados.',15000.00,'2023-06-01','2023-12-31',2),
('Hogares Verdes','Promoción de prácticas ecológicas en comunidades rurales.',10000.00,'2023-07-01','2023-12-31',2),
('Escuelas Digitales','Dotación de computadoras y formación digital en escuelas públicas.',45000.00,'2023-07-10','2024-02-10',2),
('Salud Mental Comunitaria','Programa de apoyo psicológico en zonas afectadas por violencia.',22000.00,'2023-08-01','2024-01-30',2),
('Mujeres Emprendedoras','Capacitación a mujeres en emprendimiento y finanzas básicas.',18000.00,'2023-08-15','2024-02-15',2),
('Huertos Escolares','Creación de huertos educativos sostenibles.',16000.00,'2023-09-01','2024-03-01',1),
('Viviendas Solidarias','Construcción de viviendas para familias de bajos recursos.',60000.00,'2023-09-10','2024-06-15',1),
('Recicla YA','Campaña de reciclaje urbano en municipios del país.',12000.00,'2023-10-01','2024-03-01',2),
('Energía Limpia','Instalación de paneles solares en escuelas y centros de salud.',55000.00,'2023-10-05','2024-07-01',2),
('Transporte Escolar Seguro','Creación de rutas seguras y buses para estudiantes.',30000.00,'2023-11-01','2024-05-01',1),
('Centro Juvenil Futuro','Centro comunitario con talleres de arte, tecnología y deporte.',28000.00,'2023-11-10','2024-06-30',2),
('Protegiendo la Fauna','Rescate y rehabilitación de animales silvestres.',20000.00,'2023-11-20','2024-05-20',2),
('Agua y Saneamiento Escolar','Mejoramiento de sistemas de agua en centros educativos.',24000.00,'2023-12-01','2024-06-01',1),
('Comedores Infantiles','Establecimiento de comedores para niños en situación vulnerable.',15000.00,'2023-12-15','2024-05-30',2),
('Reforestando el Futuro','Plantación de árboles nativos para restaurar ecosistemas.',12000.00,'2024-01-05','2024-07-15',2),

('Salud Materna Rural','Atención médica a mujeres embarazadas en comunidades rurales.',28000.00,'2024-02-01','2024-08-01',2),
('Jóvenes al Futuro','Programa de becas y mentorías para jóvenes de escasos recursos.',22000.00,'2024-02-15','2024-09-30',2),
('Salud Bucal Infantil','Campañas de higiene y atención dental a niños.',15000.00,'2024-03-01','2024-08-15',2),
('Red de Mujeres Artesanas','Impulso a cooperativas de artesanas rurales.',20000.00,'2024-03-10','2024-09-20',2),
('Puentes de Esperanza','Construcción de puentes peatonales en zonas rurales.',38000.00,'2024-04-01','2024-10-01',1),
('Cultura Viva','Talleres de música y arte para jóvenes en riesgo.',16000.00,'2024-04-10','2024-10-20',2),
('Escuelas Seguras','Rehabilitación de infraestructura y mejora de seguridad escolar.',27000.00,'2024-05-01','2024-12-01',2),
('Salud y Nutrición Escolar','Desayunos nutritivos para estudiantes de zonas rurales.',18000.00,'2024-05-15','2024-11-15',2),
('Iniciativa Verde Urbana','Creación de parques ecológicos en zonas urbanas.',24000.00,'2024-06-01','2024-12-20',2),
('Educación Inclusiva','Apoyo educativo a niños con discapacidad.',26000.00,'2024-06-15','2024-12-30',2),
('Manos Limpias','Implementación de estaciones de lavado de manos en escuelas.',15000.00,'2024-07-01','2024-12-31',2),
('Reactivación Agrícola','Entrega de semillas y herramientas a pequeños agricultores.',28000.00,'2024-07-15','2025-01-30',2),
('Bibliotecas Comunitarias','Creación de bibliotecas en zonas rurales.',20000.00,'2024-08-01','2025-02-01',1),
('Salud Visual','Entrega de lentes y consultas oftalmológicas.',14000.00,'2024-08-15','2025-01-15',2),
('Cosechas Solidarias','Entrega de insumos agrícolas y asistencia técnica.',30000.00,'2024-09-01','2025-03-15',2),
('Conectividad Escolar','Internet satelital en escuelas rurales.',26000.00,'2024-09-15','2025-03-30',2),
('Atención Integral al Adulto Mayor','Programa de salud, recreación y alimentación.',18000.00,'2024-10-01','2025-04-01',2),
('Escuelas Saludables','Instalación de filtros de agua y letrinas sanitarias.',24000.00,'2024-10-10','2025-05-10',1),
('Fortaleciendo Comunidades','Formación en liderazgo y organización comunitaria.',20000.00,'2024-11-01','2025-05-15',2),
('Energía Limpia Rural','Instalación de paneles solares en comunidades sin electricidad.',32000.00,'2024-11-20','2025-06-30',1),

('Agua para la Vida','Instalación de pozos artesanales en comunidades rurales sin acceso a agua.',28000.00,'2025-01-10','2025-07-10',2),
('Escuelas para Todos','Rehabilitación de centros educativos rurales.',32000.00,'2025-01-20','2025-08-20',2),
('Salud en Movimiento','Clínica móvil para atención médica en zonas aisladas.',35000.00,'2025-02-05','2025-09-05',2),
('Bosques Vivos','Reforestación de áreas afectadas por incendios.',22000.00,'2025-02-15','2025-09-15',2),
('Sonrisas Saludables','Campañas de salud bucal en comunidades escolares.',15000.00,'2025-03-01','2025-09-01',2),
('Manos que Ayudan','Capacitación a voluntarios en atención comunitaria.',12000.00,'2025-03-15','2025-09-30',2),
('Comunidad Segura','Implementación de alumbrado público solar en barrios vulnerables.',27000.00,'2025-04-01','2025-10-01',2),
('Bibliotecas Digitales','Creación de espacios digitales para jóvenes.',24000.00,'2025-04-15','2025-10-30',2),
('Salud Animal','Vacunación y rescate de animales callejeros.',18000.00,'2025-05-01','2025-11-15',2),
('EcoEscuelas','Fomento del reciclaje y huertos escolares sostenibles.',20000.00,'2025-05-10','2025-11-30',2),
('Red Solidaria de Salud','Entrega de medicamentos esenciales a clínicas rurales.',26000.00,'2025-06-01','2025-12-15',2),
('Mujeres con Futuro','Apoyo a mujeres jefas de hogar con microcréditos.',30000.00,'2025-06-15','2025-12-31',2),
('Cuidando el Río','Limpieza y educación ambiental sobre cuencas hídricas.',16000.00,'2025-07-01','2026-01-01',2),
('Alimentación Escolar','Programa de desayunos nutritivos diarios.',24000.00,'2025-07-10','2026-01-20',2),
('Casa Saludable','Mejoramiento de viviendas con techos y pisos firmes.',28000.00,'2025-07-20','2026-02-20',2),
('Juventud Creativa','Talleres de arte y emprendimiento juvenil.',20000.00,'2025-08-01','2026-02-28',2),
('Salud Visual Rural','Brigadas oftalmológicas en comunidades aisladas.',15000.00,'2025-08-10','2026-03-01',2),
('Cosechando Futuro','Entrega de semillas mejoradas a agricultores.',28000.00,'2025-08-20','2026-03-15',2),
('Red de Apoyo Juvenil','Mentorías y orientación vocacional para jóvenes.',18000.00,'2025-09-01','2026-03-30',2),
('Refugio Animal Solidario','Construcción de albergue temporal para animales.',22000.00,'2025-09-15','2026-04-01',1),

('Conectando Comunidades','Instalación de puntos Wi-Fi públicos en zonas rurales.',25000.00,'2025-10-01','2026-04-15',2),
('Guardianes del Bosque','Capacitación en conservación ambiental y reforestación.',20000.00,'2025-10-10','2026-05-01',2),
('Salud para Todos','Campañas médicas gratuitas en comunidades urbanas.',28000.00,'2025-10-20','2026-05-20',2),
('Emprende Rural','Programa de apoyo financiero y asesoría a pequeños negocios.',32000.00,'2025-11-01','2026-06-01',2),
('Escuelas Accesibles','Adaptación de infraestructura para estudiantes con discapacidad.',26000.00,'2025-11-10','2026-06-30',2),
('Salud Mental Joven','Sesiones psicológicas y talleres de bienestar emocional.',18000.00,'2025-11-20','2026-07-15',2),
('Agua Segura Escolar','Instalación de sistemas de filtración en escuelas.',20000.00,'2025-12-01','2026-07-20',1),
('Hogares Digitales','Entrega de equipos tecnológicos a familias con estudiantes.',30000.00,'2025-12-10','2026-08-10',2),
('Vivienda Segura','Reparación de techos dañados por lluvias.',22000.00,'2025-12-15','2026-08-30',2),
('Escuelas Creativas','Dotación de material artístico a centros escolares.',15000.00,'2026-01-01','2026-08-31',2),
('Cuidemos el Agua','Campaña educativa sobre uso responsable del agua.',18000.00,'2026-01-15','2026-09-15',2),
('Manos por la Salud','Brigadas médicas móviles en comunidades de difícil acceso.',30000.00,'2026-01-25','2026-09-30',2),
('Red Escolar Verde','Instalación de jardines y huertos ecológicos escolares.',24000.00,'2026-02-01','2026-10-01',2),
('Mentes Brillantes','Becas para estudiantes destacados de bajos recursos.',35000.00,'2026-02-15','2026-10-15',2),
('Mujeres al Rescate','Formación en primeros auxilios para líderes comunitarias.',16000.00,'2026-03-01','2026-10-30',2),
('Sonrisas para Todos','Campaña odontológica infantil en zonas rurales.',15000.00,'2026-03-10','2026-11-01',2),
('Agricultura Sostenible','Capacitación sobre prácticas agrícolas ecológicas.',23000.00,'2026-03-20','2026-11-15',2),
('Héroes del Reciclaje','Programa juvenil de recolección y reutilización de residuos.',18000.00,'2026-04-01','2026-11-30',2),
('Tecnología para Aprender','Donación de tabletas a escuelas rurales.',27000.00,'2026-04-10','2026-12-10',2),
('Red de Solidaridad Alimentaria','Entrega de víveres a familias afectadas por crisis económica.',30000.00,'2026-04-20','2026-12-20',2), 

('Puentes de Conexión','Construcción de pasos peatonales seguros en comunidades aisladas.',34000.00,'2026-05-01','2026-12-30',1),
('Educando con Amor','Talleres para padres sobre apoyo educativo en casa.',15000.00,'2026-05-10','2026-12-15',2),
('Salud Verde','Promoción de medicina natural y huertos medicinales.',20000.00,'2026-05-20','2027-01-10',2),
('Semillas de Futuro','Entrega de semillas y capacitación en agricultura urbana.',26000.00,'2026-06-01','2027-01-20',2),
('Deporte y Paz','Promoción de valores a través del deporte escolar.',18000.00,'2026-06-10','2027-01-30',2),
('Conservación Marina','Protección de manglares y fauna costera.',28000.00,'2026-06-20','2027-02-15',2),
('Jóvenes al Rescate','Voluntariado juvenil en atención de emergencias.',15000.00,'2026-07-01','2027-02-28',2),
('Luz para Aprender','Electrificación solar de aulas rurales sin energía.',35000.00,'2026-07-10','2027-03-01',1),
('Cultura Viva Rural','Rescate de tradiciones y expresiones culturales locales.',19000.00,'2026-07-20','2027-03-10',2),
('Salud y Esperanza','Atención médica integral a pacientes con enfermedades crónicas.',30000.00,'2026-08-01','2027-03-30',2),
('Sabores del Campo','Apoyo a cooperativas rurales en producción alimentaria local.',25000.00,'2026-08-10','2027-04-10',2),
('Innova Jóvenes','Capacitación tecnológica para emprendedores.',27000.00,'2026-08-20','2027-04-25',2),
('Reforestando Esperanza','Reforestación de cuencas hidrográficas degradadas.',30000.00,'2026-09-01','2027-05-01',2),
('Cuidando Vidas','Instalación de estaciones de primeros auxilios en playas.',19000.00,'2026-09-10','2027-05-15',1),
('Bibliotecas Comunitarias','Creación de espacios de lectura y aprendizaje libre.',22000.00,'2026-09-20','2027-05-30',2),
('Energía Limpia','Capacitación sobre energía solar en comunidades rurales.',21000.00,'2026-10-01','2027-06-10',2),
('Escuelas Saludables','Instalación de estaciones de lavado de manos en escuelas.',18000.00,'2026-10-10','2027-06-25',2),
('Cuidando a Nuestros Mayores','Atención domiciliaria a adultos mayores solos.',25000.00,'2026-10-20','2027-07-05',2),
('EcoConstrucción','Uso de materiales reciclables en viviendas sociales.',31000.00,'2026-11-01','2027-07-20',1),
('Mentes Digitales','Implementación de laboratorios informáticos en escuelas.',35000.00,'2026-11-10','2027-08-01',2);
GO

INSERT INTO Proyecto (nombre, descripcion, presupuesto, fecha_inicio, fecha_fin, id_estado_proyecto)
VALUES
('Proyecto Aurora', 'Mejora de infraestructura rural', 50000, '2021-01-01', '2021-12-31', 1),
('Proyecto Solaris', 'Instalación de paneles solares', 120000, '2020-03-15', '2022-06-30', 1),
('Proyecto Vertex', 'Capacitación comunitaria', 30000, '2019-07-01', '2021-05-15', 1),
('Proyecto Horizonte', 'Programa de salud local', 80000, '2022-02-01', '2023-02-01', 1),
('Proyecto Atlas', 'Construcción de pozos de agua', 100000, '2021-09-01', '2023-01-20', 1);




INSERT INTO Beneficiario (nombre, apellido, tipo_beneficiario, direccion, descripcion, fecha_registro, id_proyecto)
VALUES
('José','Ramírez',4,'Cantón Los Planes, Chalatenango','Beneficiario del sistema de agua potable.','2023-01-15',1),
('Ana','Pérez',1,'Comunidad Nueva Esperanza','Niña participante del programa educativo.','2023-02-10',2),
('Carlos','Ruiz',3,'Colonia La Paz, Santa Ana','Atendido en jornada médica.','2023-04-20',3),
('Escuela Rural El Pinar','',5,'Cantón El Pinar, Morazán','Centro beneficiado con nuevas aulas.','2023-03-15',4),
('Rosa','López',2,'Soyapango','Familia beneficiada con paquetes alimentarios.','2023-05-15',5),
('Juan','Méndez',2,'San Vicente','Participante en taller de soldadura.','2023-06-15',6),
('Carmen','Alvarado',2,'Cantón El Tránsito','Familia beneficiada por prácticas ecológicas.','2023-07-10',7),
('Escuela San José','',5,'San Vicente','Escuela beneficiada con laboratorio digital.','2023-07-20',8),
('Luis','Castillo',3,'Mejicanos','Atendido en sesiones de apoyo psicológico.','2023-08-15',9),
('María','Rivas',2,'Soyapango','Mujer participante en programa de emprendimiento.','2023-08-20',10),
('Escuela Flor de Campo','',5,'Chalatenango','Escuela con huerto educativo.','2023-09-15',11),
('Pedro','González',2,'Santa Ana','Familia beneficiada con vivienda solidaria.','2023-09-20',12),
('Andrea','Vásquez',1,'San Salvador','Niña participante en programa de reciclaje.','2023-10-10',13),
('Centro Escolar Los Andes','',5,'Usulután','Instalación de paneles solares.','2023-10-20',14),
('Oscar','López',1,'Ilobasco','Estudiante con transporte seguro.','2023-11-05',15),
('Centro Juvenil Futuro','',5,'San Martín','Centro de formación juvenil.','2023-11-15',16),
('Rosa','Morales',2,'Ahuachapán','Familia beneficiada por programa de fauna.','2023-11-25',17),
('Escuela Nueva Luz','',5,'Cuscatlán','Escuela con nuevo sistema de agua.','2023-12-05',18),
('Carla','Hernández',2,'Santa Tecla','Madre beneficiada con comedor infantil.','2023-12-20',19),
('Daniel','Reyes',2,'Suchitoto','Participante en campaña de reforestación.','2024-01-10',20), 

('María','Cruz',2,'San Miguel','Mujer beneficiaria del programa materno infantil.','2024-02-10',21),
('Luis','Pineda',1,'Santa Ana','Joven beneficiario de beca educativa.','2024-02-20',22),
('Andrea','Mejía',1,'Usulután','Niña beneficiada con atención dental gratuita.','2024-03-05',23),
('Lucía','Zelaya',2,'San Vicente','Artesana participante en programa productivo.','2024-03-15',24),
('Comunidad El Rosario','',4,'La Unión','Comunidad beneficiada con nuevo puente.','2024-04-10',25),
('Kevin','Ortiz',1,'San Salvador','Joven participante en taller de percusión.','2024-04-15',26),
('Centro Escolar San José','',5,'San Miguel','Centro beneficiado con mejoras de seguridad.','2024-05-10',27),
('Escuela El Paraíso','',5,'Cuscatlán','Escuela beneficiada con programa de nutrición.','2024-05-20',28),
('Comunidad Las Flores','',4,'Santa Tecla','Comunidad con parque ecológico urbano.','2024-06-10',29),
('Mario','Flores',1,'San Salvador','Niño con discapacidad beneficiado.','2024-06-20',30),
('Escuela Luz y Saber','',5,'Sonsonate','Escuela con nuevas estaciones de higiene.','2024-07-10',31),
('José','Martínez',4,'Morazán','Agricultor beneficiado con semillas.','2024-07-20',32),
('Comunidad El Milagro','',4,'Chalatenango','Comunidad beneficiada con biblioteca.','2024-08-10',33),
('Juana','Flores',3,'San Vicente','Atendida en jornada de salud visual.','2024-08-20',34),
('Mario','Santos',4,'La Paz','Campesino beneficiado con herramientas agrícolas.','2024-09-10',35),
('Escuela Nuevo Horizonte','',5,'San Miguel','Escuela beneficiada con conexión satelital.','2024-09-25',36),
('Carlos','Ayala',3,'Ahuachapán','Adulto mayor beneficiado con atención médica.','2024-10-05',37),
('Escuela Monte Verde','',5,'Cabañas','Escuela con mejoras sanitarias.','2024-10-15',38),
('Comité Comunal Nueva Esperanza','',4,'La Libertad','Líderes comunitarios capacitados en organización social.','2024-11-10',39),
('Comunidad El Progreso','',4,'Morazán','Hogares beneficiados con acceso a energía solar.','2024-11-25',40),

('Comunidad San Luis','',4,'San Vicente','Comunidad beneficiada con pozo artesanal.','2025-01-15',41),
('Centro Escolar Nueva Esperanza','',5,'Chalatenango','Escuela beneficiada con mejoras estructurales.','2025-01-25',42),
('Gloria','Hernández',3,'Usulután','Atendida en jornada médica móvil.','2025-02-10',43),
('Comunidad El Bosque','',4,'La Paz','Comunidad participante en jornada de reforestación.','2025-02-20',44),
('Carolina','Zepeda',1,'Cuscatlán','Niña beneficiada con atención dental.','2025-03-05',45),
('Sofía','Campos',2,'San Salvador','Voluntaria capacitada en primeros auxilios.','2025-03-20',46),
('Comunidad La Fe','',4,'Santa Ana','Barrio beneficiado con alumbrado solar.','2025-04-05',47),
('Centro Juvenil Esperanza','',5,'San Miguel','Centro juvenil equipado con computadoras.','2025-04-20',48),
('Asociación Mascotas Felices','',4,'La Libertad','Organización colaboradora en rescate animal.','2025-05-05',49),
('Escuela Luz del Saber','',5,'Usulután','Escuela con huerto y reciclaje escolar.','2025-05-15',50),
('Clínica Rural El Milagro','',5,'Cabañas','Clínica beneficiada con medicamentos.','2025-06-05',51),
('Elena','García',2,'Sonsonate','Beneficiaria de microcrédito.','2025-06-20',52),
('Comunidad Río Claro','',4,'La Unión','Comunidad participante en jornadas ambientales.','2025-07-05',53),
('Escuela Fe y Alegría','',5,'San Vicente','Centro educativo beneficiado con desayunos.','2025-07-15',54),
('Juan','Reina',2,'Cuscatlán','Familia beneficiada con vivienda mejorada.','2025-07-25',55),
('Luis','Mejía',1,'San Salvador','Joven beneficiario del taller de diseño.','2025-08-05',56),
('Marta','Escobar',3,'Ahuachapán','Atendida en jornada oftalmológica.','2025-08-15',57),
('Manuel','Gómez',4,'La Paz','Agricultor beneficiado con semillas certificadas.','2025-08-25',58),
('Paola','Cruz',1,'San Vicente','Joven beneficiaria del programa vocacional.','2025-09-05',59),
('Centro de Rescate Animal','',5,'Santa Tecla','Centro con nuevo albergue para rescate.','2025-09-20',60),

('Comunidad El Progreso','',4,'La Paz','Comunidad con acceso gratuito a internet.','2025-10-05',61),
('Comunidad Las Nubes','',4,'Chalatenango','Participantes en programa de conservación.','2025-10-15',62),
('Rafael','Gómez',3,'San Salvador','Atendido en jornada médica general.','2025-10-25',63),
('Carmen','Linares',2,'San Vicente','Beneficiaria de microemprendimiento rural.','2025-11-05',64),
('Centro Escolar Armonía','',5,'Usulután','Escuela beneficiada con rampas y accesos inclusivos.','2025-11-15',65),
('Andrea','Zepeda',1,'Santa Tecla','Joven participante en talleres de salud mental.','2025-11-25',66),
('Escuela Jardín de Luz','',5,'Cuscatlán','Escuela con acceso a agua purificada.','2025-12-05',67),
('Familia Torres','',2,'Sonsonate','Familia beneficiada con equipos tecnológicos.','2025-12-15',68),
('Marcos','Linares',2,'Ahuachapán','Familia con vivienda reparada.','2025-12-20',69),
('Escuela San Luis','',5,'San Miguel','Escuela con materiales para talleres artísticos.','2026-01-05',70),
('Escuela Valle Verde','',5,'Santa Ana','Centro educativo participante en campaña ambiental.','2026-01-20',71),
('María','Pineda',3,'La Unión','Atendida en jornada médica general.','2026-01-30',72),
('Escuela Nuevo Amanecer','',5,'Cuscatlán','Escuela con nuevo huerto ecológico.','2026-02-10',73),
('Sofía','Morales',1,'San Salvador','Estudiante beneficiada con beca completa.','2026-02-20',74),
('Lucía','Pérez',2,'San Vicente','Líder comunitaria capacitada en primeros auxilios.','2026-03-05',75),
('Kevin','Ramírez',1,'Morazán','Niño beneficiado con tratamiento dental.','2026-03-15',76),
('José','García',4,'La Paz','Agricultor beneficiado con talleres sostenibles.','2026-03-25',77),
('Daniela','Ramos',1,'Santa Tecla','Joven participante del programa ambiental.','2026-04-05',78),
('Escuela Futuro Brillante','',5,'Usulután','Escuela beneficiada con equipo tecnológico.','2026-04-15',79),
('Rosa','Hernández',2,'Cabañas','Familia beneficiada con paquete alimentario.','2026-04-25',80),

('Comunidad San Pablo','',4,'La Unión','Comunidad beneficiada con paso peatonal.','2026-05-05',81),
('María','Flores',2,'San Salvador','Madre participante en programa educativo familiar.','2026-05-15',82),
('Doña Carmen','Zelaya',3,'Morazán','Participante en taller de medicina natural.','2026-05-25',83),
('Comunidad Los Jardines','',4,'San Miguel','Familias participantes en agricultura urbana.','2026-06-05',84),
('Escuela Fe y Progreso','',5,'Cuscatlán','Escuela beneficiada con equipos deportivos.','2026-06-15',85),
('Cooperativa Pesquera La Esperanza','',4,'La Paz','Pescadores capacitados en conservación marina.','2026-06-25',86),
('Carlos','López',1,'San Vicente','Voluntario formado en rescate y primeros auxilios.','2026-07-05',87),
('Escuela Nueva Esperanza','',5,'Ahuachapán','Escuela beneficiada con energía solar.','2026-07-15',88),
('Comunidad San José','',4,'Sonsonate','Participantes en talleres culturales.','2026-07-25',89),
('Miguel','Reyes',3,'San Salvador','Paciente beneficiado con control médico gratuito.','2026-08-05',90),
('Cooperativa Esperanza Viva','',4,'Chalatenango','Productores agrícolas beneficiados.','2026-08-15',91),
('Luis','Mendoza',1,'Santa Tecla','Joven capacitado en programación básica.','2026-08-25',92),
('Asociación Verde Natural','',4,'Cabañas','Miembros participantes en reforestación.','2026-09-05',93),
('Cruz Comunitaria Costa Azul','',4,'La Libertad','Grupo encargado del manejo de emergencias costeras.','2026-09-15',94),
('Biblioteca La Sabiduría','',5,'San Vicente','Centro comunitario beneficiado con libros y mobiliario.','2026-09-25',95),
('Carlos','Zepeda',2,'Morazán','Beneficiado con capacitación solar.','2026-10-05',96),
('Escuela Los Olivos','',5,'Usulután','Centro escolar con nuevas estaciones sanitarias.','2026-10-15',97),
('Juana','Cruz',2,'San Salvador','Adulto mayor beneficiado con atención médica en casa.','2026-10-25',98),
('Fundación Techo Verde','',4,'Ahuachapán','Familias beneficiadas con casas ecológicas.','2026-11-05',99),
('Escuela Horizonte','',5,'San Miguel','Escuela equipada con laboratorio tecnológico.','2026-11-15',100);
GO

------------------------------- NUEVOS REGISTROS ----------------------------------------------------------------

INSERT INTO Beneficiario (nombre, apellido, tipo_beneficiario, direccion, descripcion, fecha_registro, id_proyecto)
VALUES
('Juana','Martínez',4,'Cantón El Rosario, Chalatenango','Habitante beneficiada con sistema de purificación.','2023-02-01',1),
('Carlos','Gómez',3,'Comunidad Los Planes','Atendido en capacitación sobre uso de agua segura.','2023-02-10',1),
('Comunidad Las Flores','',4,'Chalatenango','Sector completo beneficiado con acceso a agua.','2023-02-15',1),

('María','Torres',1,'Colonia Nueva Vida','Niña recién inscrita en programa educativo.','2023-03-05',2),
('Escuela Vista Hermosa','',5,'San Salvador','Centro incorporado al programa de lectura.','2023-03-12',2),
('Daniel','Hernández',1,'Soyapango','Estudiante apoyado con útiles escolares.','2023-03-20',2),

('Paola','Fuentes',3,'Santa Ana Centro','Adulta mayor atendida en jornada médica.','2023-04-25',3),
('Comunidad San Carlos','',4,'Santa Ana','Comunidad beneficiada con vacunas.','2023-04-28',3),
('Eduardo','Rivas',3,'Metapán','Paciente con atención preventiva.','2023-05-01',3),

('Escuela Las Mercedes','',5,'Morazán','Centro beneficiado con ampliación de aulas.','2023-05-15',4),
('Centro Escolar La Granja','',5,'Morazán','Escuela sumada al programa de infraestructura.','2023-05-20',4),
('Juan','Silva',2,'Torola','Padre de familia beneficiado por mejoras.','2023-05-22',4),

('Familia Molina','',2,'Soyapango','Recibe paquete alimentario mensual.','2023-06-10',5),
('Familia Duarte','',2,'Soyapango','Apoyada en programa nutricional.','2023-06-12',5),
('Centro Infantil Arco Iris','',5,'Ilopango','Guardería beneficiada con alimentos.','2023-06-15',5),

('Jorge','Ramírez',2,'San Salvador','Participante en taller de mecánica.','2023-07-01',6),
('Evelin','Pérez',2,'San Salvador','Beneficiaria de curso de electricidad.','2023-07-05',6),
('Luis','Navarro',2,'Cojutepeque','Aprendiz en taller técnico.','2023-07-07',6),

('Comunidad El Bosque','',4,'San Miguel','Familias capacitadas en reciclaje.','2023-07-15',7),
('María','Serrano',2,'San Miguel','Hogar beneficiado con compostera.','2023-07-18',7),
('Familia Rosales','',2,'San Miguel','Participantes en programa ecológico.','2023-07-20',7),

('Escuela Buen Pastor','',5,'San Vicente','Centro con laboratorio digital.','2023-08-01',8),
('Centro Escolar Libertad','',5,'San Vicente','Aula equipada con computadoras.','2023-08-10',8),
('Jazmín','Lozano',1,'San Vicente','Estudiante beneficiada.','2023-08-15',8),

('Juan','Morales',3,'Mejicanos','Participante en terapia grupal.','2023-09-01',9),
('Centro Juvenil Crecer','',5,'Mejicanos','Centro beneficiado con charlas psicológicas.','2023-09-05',9),
('Ana','Velásquez',3,'Mejicanos','Atendida en consulta psicológica.','2023-09-10',9),

('Claudia','López',2,'Ilopango','Mujer beneficiada con capital semilla.','2023-10-01',10),
('Marcela','Ayala',2,'San Salvador','Participante en curso de finanzas.','2023-10-05',10),
('Red de Mujeres Unidas','',4,'Soyapango','Colectivo incorporado al programa.','2023-10-12',10),

('Familia Jiménez','',2,'Santa Tecla','Hogar beneficiado en programa de inclusión laboral.','2024-01-20',21),
('Paola','Sosa',1,'Santa Tecla','Participante de talleres vocacionales.','2024-01-22',21),
('Asociación Manos Unidas','',5,'La Libertad','Institución incorporada en programa de inclusión.','2024-01-25',21),
('Carlos','Villalta',3,'Antiguo Cuscatlán','Adulto beneficiado con capacitación laboral.','2024-01-28',21),

('Comunidad El Roble','',4,'San Vicente','Sector atendido con jornada de limpieza.','2024-02-02',22),
('Jorge','Melara',3,'San Vicente','Líder comunitario capacitado.','2024-02-05',22),

('Escuela Santa Clara','',5,'Chalatenango','Centro beneficiado con material de lectura.','2024-02-10',23),
('Marta','Flores',2,'Chalatenango','Madre capacitada en educación temprana.','2024-02-12',23),
('Luis','Barahona',1,'Agua Caliente','Niño beneficiado.','2024-02-15',23),
('Familia Ramos','',2,'La Palma','Hogar beneficiado con kits educativos.','2024-02-18',23),
('Comunidad Las Colinas','',4,'San Ignacio','Comunidad incorporada en programa de lectura.','2024-02-20',23),
('David','Martínez',1,'San Ignacio','Estudiante apoyado.','2024-02-22',23),

('Rosa','Santos',3,'Usulután','Asistió a jornada médica preventiva.','2024-03-01',24),
('Centro de Salud El Amate','',5,'Usulután','Clínica beneficiada con insumos.','2024-03-03',24),
('Familia Cruz','',2,'Jiquilisco','Hogar atendido en campaña de salud.','2024-03-05',24),

('Familia Quintanilla','',2,'Morazán','Vivienda reforzada en programa de reconstrucción.','2024-03-10',25),
('Comunidad El Pinar','',4,'Sociedad','Sector beneficiado con materiales de construcción.','2024-03-12',25),
('Escuela San Jorge','',5,'Sociedad','Centro apoyado para mejorar instalaciones.','2024-03-15',25),
('Iris','Cardona',3,'Gotera','Adulto beneficiado.','2024-03-17',25),
('Carmen','López',2,'Yamabal','Jefa de hogar asistida.','2024-03-18',25),

('Cooperativa Los Pinos','',4,'La Unión','Productores incluidos en programa agrícola.','2024-03-20',26),

('Comunidad Alto Verde','',4,'San Miguel','Capacitada en manejo de residuos.','2024-03-22',27),
('Familia Campos','',2,'San Miguel','Beneficiarios de compostera.','2024-03-23',27),
('Claudia','Henríquez',2,'San Miguel','Hogar apoyado en reciclaje familiar.','2024-03-24',27),
('Centro Escolar El Amate','',5,'San Miguel','Escuela incorporada al programa ecológico.','2024-03-25',27),
('Roberto','Martell',3,'San Miguel','Capacitado en reciclaje.','2024-03-26',27),
('Diana','Zelaya',1,'Chirilagua','Niña participante en programas ambientales.','2024-03-27',27),
('Familia Pineda','',2,'Chirilagua','Hogar beneficiado.','2024-03-28',27),

('Escuela Nuevo Horizonte','',5,'Sonsonate','Centro equipado con computadoras.','2024-04-01',28),
('Familia Guardado','',2,'Sonsonate','Hogar beneficiado con conectividad.','2024-04-03',28),
('Jazmín','Reyes',1,'Sonsonate','Estudiante apoyada.','2024-04-04',28),
('Centro Escolar Sol Naciente','',5,'Acajutla','Aula digital instalada.','2024-04-06',28),

('Ana','Villalobos',2,'La Paz','Participante en programa emocional.','2024-04-10',29),
('Comunidad El Progreso','',4,'San Pedro Masahuat','Sector beneficiado con talleres.','2024-04-12',29),
('Diego','Herrera',3,'Olocuilta','Adulto atendido en consulta psicológica.','2024-04-13',29),

('Familia Castillo','',2,'Ilopango','Beneficiarios de capital semilla.','2024-04-20',30),
('Claudia','Peña',2,'San Salvador','Participante en curso de liderazgo.','2024-04-22',30),
('Red de Mujeres Unidas','',4,'Soyapango','Colectivo incorporado al programa.','2024-04-23',30),
('Marta','Guzmán',3,'Mejicanos','Beneficiaria en formación financiera.','2024-04-25',30),
('Patricia','Molina',2,'San Marcos','Participa en talleres de emprendimiento.','2024-04-26',30),
('Grupo Mujeres Valientes','',4,'Santo Tomás','Colectivo apoyado.','2024-04-27',30),
('Rosa','López',2,'San Salvador','Emprendedora beneficiada.','2024-04-28',30),
('Elena','Vásquez',2,'Ilopango','Recibió acompañamiento empresarial.','2024-04-29',30),

('Comunidad Los Olivos','',4,'Cabañas','Sector beneficiado con jornadas de limpieza.','2024-05-02',31),
('Esteban','Arias',3,'Sensuntepeque','Adulto capacitado en manejo ambiental.','2024-05-04',31),
('Familia Méndez','',2,'Victoria','Hogar beneficiado por campaña ecológica.','2024-05-06',31),

('Escuela Monte Sinaí','',5,'San Miguel','Centro equipado para educación inicial.','2024-05-10',32),
('Melisa','García',1,'San Jorge','Niña beneficiada.','2024-05-12',32),
('Familia Ortez','',2,'San Miguel','Hogar apoyado con material escolar.','2024-05-14',32),
('Centro Escolar El Progreso','',5,'San Miguel','Aula reforzada.','2024-05-16',32),
('Kevin','Maldonado',1,'San Miguel','Estudiante participante.','2024-05-17',32),

('Rosa','Castellanos',3,'San Salvador','Beneficiaria en jornada médica preventiva.','2024-05-20',33),
('Centro de Salud Los Héroes','',5,'San Salvador','Clínica fortalecida con insumos.','2024-05-22',33),

('Familia Aguirre','',2,'Ahuachapán','Hogar beneficiado por programa alimentario.','2024-06-01',34),
('Escuela Buena Vista','',5,'Ahuachapán','Centro incorporado al programa nutricional.','2024-06-03',34),
('Samuel','Henríquez',1,'Tacuba','Estudiante con refuerzo alimenticio.','2024-06-04',34),
('Comunidad Las Flores','',4,'Atiquizaya','Sector asistido con alimentos.','2024-06-06',34),
('Ángel','Ramírez',1,'Atiquizaya','Niño beneficiado.','2024-06-08',34),
('Familia Fajardo','',2,'Ahuachapán','Hogar apoyado.','2024-06-09',34),
('Elena','Chávez',3,'Turbo','Adulto beneficiado.','2024-06-10',34),

('Cooperativa La Laguna','',4,'La Libertad','Productores apoyados en sostenibilidad.','2024-06-12',35),

('Centro Escolar Miramar','',5,'Sonsonate','Aula digital instalada.','2024-06-15',36),
('Alex','Vega',1,'Sonzacate','Niño beneficiado con tecnología.','2024-06-16',36),
('Familia López','',2,'Sonsonate','Hogar beneficiado con acceso educativo.','2024-06-18',36),
('Escuela La Rivera','',5,'Caluco','Centro incorporado al programa digital.','2024-06-19',36),

('Comunidad El Porvenir','',4,'San Vicente','Sector capacitado en prevención de violencia.','2024-06-25',37),
('Diego','Serrano',3,'San Vicente','Adulto beneficiado en taller emocional.','2024-06-27',37),
('Ana','Fuentes',2,'San Vicente','Participante en grupo de apoyo.','2024-06-28',37),
('Centro Juvenil Paso Firme','',5,'San Vicente','Institución incorporada al programa.','2024-06-30',37),
('Familia Benítez','',2,'Verapaz','Hogar atendido.','2024-07-01',37),
('Marta','Ortega',3,'Santo Domingo','Beneficiaria en taller preventivo.','2024-07-02',37),
('Lucía','Zaldaña',2,'San Vicente','Participante activa.','2024-07-03',37),
('Jorge','Morán',3,'San Vicente','Atendido en jornada de apoyo.','2024-07-04',37),

('Escuela Colinas del Sur','',5,'Usulután','Centro con nuevo laboratorio de ciencias.','2024-07-10',38),
('Familia Rivas','',2,'Usulután','Hogar beneficiado por programa educativo.','2024-07-12',38),
('Andrea','Salinas',1,'Jiquilisco','Estudiante apoyada.','2024-07-13',38),

('Centro Médico El Ángel','',5,'San Salvador','Clínica fortalecida con equipo médico.','2024-07-18',39),
('Gabriela','Pérez',3,'Mejicanos','Atendida en jornada médica.','2024-07-19',39),
('Miguel','Soriano',3,'Mejicanos','Paciente diagnosticado.','2024-07-20',39),
('Familia Orellana','',2,'Cuscatancingo','Hogar beneficiado con medicamentos.','2024-07-21',39),
('Comunidad Nuevo Horizonte','',4,'San Salvador','Sector atendido con campaña de salud.','2024-07-22',39),
('Luis','Martínez',3,'Apopa','Paciente atendido.','2024-07-23',39),

('Ana','Torres',2,'San Miguel','Mujer beneficiada con capacitación empresarial.','2024-07-30',40),
('Red de Mujeres El Progreso','',4,'San Miguel','Colectivo incorporado al programa.','2024-08-01',40),

('Familia Guzmán','',2,'San Marcos','Hogar beneficiado con insumos básicos.','2024-09-01',51),
('Rosa','Portillo',3,'San Marcos','Adulta atendida en programa de salud.','2024-09-03',51),
('Comunidad El Progreso','',4,'San Salvador','Sector incorporado en plan comunitario.','2024-09-05',51),

('Escuela La Esperanza','',5,'Ahuachapán','Centro equipado con material escolar.','2024-09-10',52),
('Mario','Reyes',1,'Atiquizaya','Niño beneficiado.','2024-09-11',52),
('Familia Ruano','',2,'Ahuachapán','Hogar apoyado en programa educativo.','2024-09-12',52),
('Centro Escolar San Lucas','',5,'Concepción de Ataco','Centro incorporado.','2024-09-13',52),
('Daniela','Campos',1,'El Refugio','Estudiante asistida.','2024-09-14',52),

('Comunidad Las Palmeras','',4,'Morazán','Sector afectado atendido con ayuda alimentaria.','2024-09-20',53),
('Luis','Armijo',3,'San Francisco Gotera','Adulto beneficiado.','2024-09-22',53),

('Familia Linares','',2,'Usulután','Hogar con asistencia alimentaria.','2024-09-25',54),
('Centro Escolar El Ángel','',5,'Jiquilisco','Centro apoyado.','2024-09-26',54),
('Ana','Valle',1,'Jiquilisco','Niña beneficiada.','2024-09-27',54),
('Comunidad El Trébol','',4,'Usulután','Sector atendido.','2024-09-28',54),
('María','Galdámez',3,'Santa María','Adulta atendida.','2024-09-29',54),
('Familia Palacios','',2,'Santa María','Hogar asistido.','2024-09-30',54),
('Ángela','Rivas',2,'Estanzuelas','Jefa de hogar beneficiada.','2024-10-01',54),
('Julio','Portillo',3,'Usulután','Adulto incorporado.','2024-10-02',54),

('Cooperativa Los Cedros','',4,'Santa Ana','Asociación fortalecida en prácticas agrícolas.','2024-10-05',55),

('Comunidad El Sauce','',4,'San Vicente','Sector capacitado en reciclaje.','2024-10-10',56),
('Doris','Peña',3,'San Vicente','Beneficiaria en taller ambiental.','2024-10-11',56),
('Familia Molina','',2,'San Vicente','Hogar incorporado al programa ecológico.','2024-10-12',56),
('Centro Escolar Los Almendros','',5,'Verapaz','Centro apoyado.','2024-10-13',56),
('Rafael','Gómez',3,'Apastepeque','Adulto asistido.','2024-10-14',56),
('Lidia','Sandoval',2,'San Vicente','Participante del taller.','2024-10-15',56),
('Comunidad Nueva Vida','',4,'San Vicente','Sector beneficiado.','2024-10-16',56),

('Escuela Altavista','',5,'Ilopango','Centro con aula digital.','2024-10-20',57),
('Familia Maravilla','',2,'Ilopango','Hogar beneficiado con conectividad.','2024-10-22',57),
('Paola','Rivera',1,'San Salvador','Niña apoyada con clases virtuales.','2024-10-23',57),
('Centro Escolar Valle Nuevo','',5,'Soyapango','Aula equipada.','2024-10-24',57),

('Comunidad Los Llanos','',4,'La Unión','Sector beneficiado con talleres comunitarios.','2024-10-28',58),
('Felipe','Lovo',3,'Santa Rosa de Lima','Adulto participante.','2024-10-29',58),
('Familia Escobar','',2,'La Unión','Hogar beneficiado.','2024-10-30',58),

('Centro Médico Nazaret','',5,'San Miguel','Clínica apoyada con insumos.','2024-11-05',59),
('Carolina','Hernández',3,'San Miguel','Atendida en jornada médica.','2024-11-06',59),
('Familia Muñoz','',2,'Moncagua','Hogar beneficiado.','2024-11-07',59),
('Comunidad La Reforma','',4,'San Miguel','Sector incorporado.','2024-11-08',59),
('Melvin','Barrios',3,'San Miguel','Paciente atendido.','2024-11-09',59),
('Escuela El Sitio','',5,'Quelepa','Centro apoyado.','2024-11-10',59),

('María','Perdomo',2,'Santa Tecla','Beneficiaria de programa financiero.','2024-11-15',60),
('Grupo Mujeres Renacer','',4,'Antiguo Cuscatlán','Colectivo apoyado en emprendimiento.','2024-11-17',60),

('Comunidad Los Naranjos','',4,'Sonsonate','Sector beneficiado con talleres de convivencia.','2024-08-05',41),
('César','Juárez',3,'Armenia','Adulto atendido en jornada emocional.','2024-08-07',41),
('Familia Roldán','',2,'Juayúa','Hogar beneficiado en programa comunitario.','2024-08-09',41),
('Escuela Santa Marta','',5,'Sonzacate','Centro incorporado.','2024-08-10',41),

('Rosa','Gómez',3,'Santa Ana','Participante en jornada médica.','2024-08-15',42),
('Carlos','Villalobos',3,'Santa Ana','Paciente atendido.','2024-08-17',42),
('Centro Médico San José','',5,'Santa Ana','Clínica fortalecida.','2024-08-18',42),

('Cooperativa La Amistad','',4,'Morazán','Asociación beneficiada con equipo agrícola.','2024-08-20',43),

('Familia Salguero','',2,'San Miguel','Hogar beneficiado.','2024-08-25',44),
('Karen','Zepeda',2,'San Miguel','Jefa de hogar asistida.','2024-08-26',44),
('Comunidad El Milagro','',4,'Chirilagua','Sector atendido.','2024-08-27',44),
('Escuela Los Laureles','',5,'San Miguel','Centro reforzado.','2024-08-28',44),
('José','Ramos',3,'San Miguel','Adulto atendido.','2024-08-29',44),
('Daniel','Salinas',1,'San Miguel','Niño participante.','2024-08-30',44),
('Familia Peña','',2,'Chirilagua','Hogar beneficiado.','2024-09-01',44),

('Comunidad Las Victorias','',4,'Chalatenango','Sector beneficiado con talleres.','2024-09-10',46),
('Lucía','Velásquez',2,'Chalatenango','Participante activa.','2024-09-11',46),
('Familia Granados','',2,'La Palma','Hogar beneficiado.','2024-09-12',46),
('Centro Escolar Nueva Luz','',5,'San Ignacio','Centro incorporado.','2024-09-13',46),
('Marcos','Galdámez',3,'Chalatenango','Adulto capacitado.','2024-09-14',46),
('Sofía','Linares',1,'La Palma','Niña apoyada.','2024-09-15',46),

('Escuela Los Almendros','',5,'San Vicente','Centro beneficiado.','2024-09-20',47),
('Familia Duarte','',2,'San Vicente','Hogar incorporado.','2024-09-21',47),
('Roberto','García',3,'San Vicente','Adulto atendido.','2024-09-22',47),

('Comunidad El Mirador','',4,'Santa Ana','Sector capacitado.','2024-09-25',48),
('Jessica','Rivas',2,'Santa Ana','Madre beneficiada.','2024-09-26',48),
('Centro Escolar El Rosario','',5,'Santa Ana','Centro equiparado.','2024-09-27',48),
('Pedro','Santos',3,'Metapán','Adulto asistido.','2024-09-28',48),
('Familia Báez','',2,'Metapán','Hogar apoyado.','2024-09-29',48),

('María','Fajardo',2,'San Salvador','Jefa de hogar beneficiada.','2024-10-02',49),
('Colectivo Mujeres en Acción','',4,'Soyapango','Grupo beneficiado en liderazgo.','2024-10-04',49),

('Comunidad Las Brisas','',4,'Usulután','Sector apoyado.','2024-10-10',50),
('Escuela San Patricio','',5,'Usulután','Centro reforzado.','2024-10-12',50),
('Claudia','Montoya',2,'Jiquilisco','Emprendedora beneficiada.','2024-10-13',50),
('Familia Molina','',2,'Usulután','Hogar apoyado.','2024-10-14',50),
('Elías','Portillo',3,'Santa María','Adulto atendido.','2024-10-15',50),
('Maricela','Reyes',2,'Usulután','Beneficiaria del programa productivo.','2024-10-16',50),
('Grupo Mujeres Unidas','',4,'Ozatlán','Colectivo beneficiado.','2024-10-17',50),
('Diego','Roldán',1,'Usulután','Niño beneficiado.','2024-10-18',50),

('Comunidad Los Pinares','',4,'La Libertad','Sector beneficiado con capacitaciones ambientales.','2024-11-20',61),
('Gloria','Hernández',3,'Antiguo Cuscatlán','Adulta atendida en jornada médica.','2024-11-22',61),
('Familia Romero','',2,'Zaragoza','Hogar beneficiado.','2024-11-23',61),

('Escuela Cristóbal Colón','',5,'Sonsonate','Centro equipado con material educativo.','2024-11-25',62),
('Andrea','Cañas',1,'Sonsonate','Estudiante apoyada.','2024-11-26',62),
('Familia Menjívar','',2,'Sonzacate','Hogar beneficiado.','2024-11-27',62),
('Centro Escolar San Pablo','',5,'Nahuizalco','Centro reforzado.','2024-11-28',62),
('Diego','Pineda',1,'Armenia','Niño beneficiado.','2024-11-29',62),
('Comunidad El Paraíso','',4,'Sonsonate','Sector incorporado al programa.','2024-12-01',62),

('Rodolfo','Velásquez',3,'San Miguel','Adulto atendido en consulta médica.','2024-12-05',63),
('Centro Médico El Buen Samaritano','',5,'San Miguel','Clínica apoyada con equipo.','2024-12-07',63),

('Comunidad Los Amates','',4,'Chalatenango','Sector beneficiado.','2024-12-10',64),
('Familia Funes','',2,'La Palma','Hogar apoyado.','2024-12-11',64),
('Escuela Nueva Vida','',5,'San Ignacio','Centro incorporado.','2024-12-12',64),
('Karen','Henríquez',3,'San Ignacio','Adulta beneficiada.','2024-12-13',64),
('Óscar','Molina',3,'La Palma','Adulto atendido.','2024-12-14',64),
('Sofía','Ríos',1,'Chalatenango','Niña beneficiada.','2024-12-15',64),
('Centro Escolar San José','',5,'La Palma','Centro reforzado.','2024-12-16',64),

('Familia Contreras','',2,'La Unión','Hogar beneficiado por programa alimentario.','2024-12-18',65),
('Comunidad El Tamarindo','',4,'La Unión','Sector atendido.','2024-12-19',65),
('Nelson','Castro',3,'Santa Rosa de Lima','Adulto beneficiado.','2024-12-20',65),
('Escuela El Porvenir','',5,'La Unión','Centro reforzado.','2024-12-21',65),

('Cooperativa La Ladera','',4,'San Vicente','Productores capacitados en nuevas técnicas.','2024-12-22',66),

('Escuela Luz y Saber','',5,'La Libertad','Centro beneficiado.','2025-01-06',68),
('Kevin','Serrano',1,'La Libertad','Estudiante apoyado.','2025-01-07',68),

('Centro Médico San Rafael','',5,'San Salvador','Clínica fortalecida.','2025-01-10',69),
('Ana','Pineda',3,'Mejicanos','Paciente atendida.','2025-01-11',69),
('Familia López','',2,'Apopa','Hogar beneficiado.','2025-01-12',69),
('Comunidad Los Laureles','',4,'Cuscatancingo','Sector incorporado.','2025-01-13',69),
('Rafael','Amaya',3,'Mejicanos','Paciente atendido.','2025-01-14',69),
('Escuela Nueva Concepción','',5,'Apopa','Centro reforzado.','2025-01-15',69),

('Familia Morales','',2,'San Miguel','Hogar beneficiado.','2025-01-20',70),
('Comunidad El Sitio','',4,'San Miguel','Sector asistido.','2025-01-21',70),
('Daniel','Roldán',3,'Chirilagua','Adulto atendido.','2025-01-22',70),

('Centro Escolar El Bosque','',5,'Ahuachapán','Centro beneficiado con material escolar.','2025-01-25',71),
('Familia Ramos','',2,'Atiquizaya','Hogar beneficiado.','2025-01-26',71),

('Comunidad Las Lomas','',4,'Santa Ana','Sector incorporado al programa comunitario.','2025-01-28',72),
('Daniela','Montes',1,'Santa Ana','Estudiante beneficiada.','2025-01-29',72),
('José','Peralta',3,'Metapán','Adulto atendido en jornada médica.','2025-01-30',72),
('Familia Portillo','',2,'Chalchuapa','Hogar apoyado.','2025-02-01',72),

('Escuela El Porvenir','',5,'Usulután','Centro reforzado.','2025-02-05',73),
('Andrea','Castañeda',1,'Usulután','Niña beneficiada.','2025-02-06',73),
('Comunidad La Ceiba','',4,'San Dionisio','Sector asistido.','2025-02-07',73),
('Marta','García',3,'Usulután','Adulta atendida.','2025-02-08',73),
('Familia Larios','',2,'Jiquilisco','Hogar beneficiado.','2025-02-09',73),
('Ricardo','Méndez',3,'Usulután','Adulto asistido.','2025-02-10',73),
('Centro Escolar El Manguito','',5,'Jiquilisco','Centro fortalecido.','2025-02-11',73),

('Familia Torres','',2,'San Miguel','Hogar beneficiado.','2025-02-15',74),
('Escuela Nueva Esperanza','',5,'San Miguel','Centro reforzado.','2025-02-16',74),
('Melissa','Villalta',1,'Chirilagua','Estudiante beneficiada.','2025-02-17',74),

('Cooperativa El Buen Sembrador','',4,'Chalatenango','Productores capacitados.','2025-02-20',75),

('Comunidad Los Robles','',4,'San Salvador','Sector fortalecido.','2025-02-25',76),
('Natalia','Peñate',2,'Mejicanos','Madre beneficiada.','2025-02-26',76),
('Centro Escolar Nueva Ilusión','',5,'Cuscatancingo','Centro incorporado.','2025-02-27',76),
('José','Alvarenga',3,'Apopa','Adulto atendido.','2025-02-28',76),
('Familia Gutiérrez','',2,'San Salvador','Hogar apoyado.','2025-03-01',76),
('Diana','Sigüenza',3,'San Salvador','Participante en el programa.','2025-03-02',76),

('Escuela Ciudad Pacífica','',5,'Sonsonate','Centro educativo modernizado.','2025-03-05',77),
('Felipe','Reyes',1,'Sonsonate','Niño beneficiado.','2025-03-06',77),
('Comunidad La Esperanza','',4,'Armenia','Sector incorporado.','2025-03-07',77),
('Familia Gálvez','',2,'Sonzacate','Hogar beneficiado.','2025-03-08',77),

('Comunidad Las Veraneras','',4,'Morazán','Sector capacitado.','2025-03-12',78),
('Escuela José Martí','',5,'Morazán','Centro reforzado.','2025-03-13',78),
('Eduardo','Campos',3,'Gotera','Adulto beneficiado.','2025-03-14',78),
('Carmen','Santos',2,'Sociedad','Madre apoyada.','2025-03-15',78),
('Familia Márquez','',2,'Sociedad','Hogar atendido.','2025-03-16',78),
('Centro Escolar Santa Clara','',5,'San Francisco','Centro incorporado.','2025-03-17',78),
('Luis','Amaya',3,'San Francisco','Adulto beneficiado.','2025-03-18',78),
('María','Iglesias',2,'Gotera','Participante del programa.','2025-03-19',78),

('Comunidad El Tesoro','',4,'La Unión','Sector asistido.','2025-03-22',79),
('Familia Carpio','',2,'La Unión','Hogar beneficiado.','2025-03-23',79),

('Centro Escolar El Faro','',5,'San Vicente','Aula digital instalada.','2025-03-26',80),
('Roxana','Zavala',1,'San Vicente','Estudiante beneficiada.','2025-03-27',80),
('Familia Rivas','',2,'Tecoluca','Hogar apoyado.','2025-03-28',80),
('Comunidad Buena Vista','',4,'San Vicente','Sector incorporado.','2025-03-29',80),
('Carlos','Lozano',3,'Verapaz','Adulto atendido.','2025-03-30',80),

('Comunidad El Pinar','',4,'Santa Tecla','Sector beneficiado con talleres ambientales.','2025-04-02',81),
('María','Cañas',2,'Antiguo Cuscatlán','Madre beneficiada.','2025-04-03',81),
('Familia Molina','',2,'Santa Tecla','Hogar apoyado por el programa.','2025-04-04',81),

('Escuela San Antonio','',5,'Ahuachapán','Centro reforzado.','2025-04-06',82),
('Juan','Castellanos',3,'Atiquizaya','Adulto atendido.','2025-04-07',82),
('Familia Ayala','',2,'Ahuachapán','Hogar beneficiado.','2025-04-08',82),
('Comunidad El Manantial','',4,'Concepción de Ataco','Sector incorporado.','2025-04-09',82),
('Karen','Sánchez',2,'Atiquizaya','Madre beneficiada.','2025-04-10',82),
('Centro Escolar La Reforma','',5,'Ahuachapán','Centro apoyado.','2025-04-11',82),

('Cooperativa Agro Unión','',4,'San Miguel','Productores fortalecidos.','2025-04-14',83),

('Comunidad Nuevo Renacer','',4,'Chalatenango','Sector beneficiado.','2025-04-17',84),
('Familia Ramos','',2,'La Palma','Hogar beneficiado.','2025-04-18',84),
('Escuela La Frontera','',5,'San Ignacio','Centro incorporado.','2025-04-19',84),
('Marta','Serrano',3,'Chalatenango','Adulta asistida.','2025-04-20',84),
('Diego','Pérez',3,'La Palma','Adulto involucrado.','2025-04-21',84),
('Centro Escolar San Antonio','',5,'La Palma','Centro reforzado.','2025-04-22',84),
('Ana','Mendoza',2,'San Ignacio','Madre beneficiada.','2025-04-23',84),
('Óscar','Galdámez',3,'Chalatenango','Beneficiario del programa.','2025-04-24',84),

('Escuela Rincón Feliz','',5,'San Miguel','Centro habilitado.','2025-04-26',85),
('Claudia','Castro',2,'Moncagua','Madre beneficiada.','2025-04-27',85),
('Comunidad El Sitio','',4,'San Miguel','Sector asistido.','2025-04-28',85),
('José','Arévalo',3,'Chapeltique','Adulto atendido.','2025-04-29',85),
('Familia Ortiz','',2,'San Miguel','Hogar beneficiado.','2025-04-30',85),

('Ana','Pineda',2,'San Salvador','Jefa de hogar beneficiada.','2025-05-02',86),
('Círculo de Mujeres Unidas','',4,'Soyapango','Colectivo apoyado.','2025-05-03',86),

('Comunidad Los Almendros','',4,'Usulután','Sector beneficiado.','2025-05-06',87),
('Pedro','Gómez',3,'Usulután','Adulto atendido.','2025-05-07',87),
('Familia Sandoval','',2,'Jiquilisco','Hogar beneficiado.','2025-05-08',87),
('Escuela San Lucas','',5,'Usulután','Centro incorporado.','2025-05-09',87),
('Karla','Herrera',2,'Jiquilisco','Madre apoyada.','2025-05-10',87),
('Comunidad Las Lajas','',4,'Usulután','Sector reforzado.','2025-05-11',87),
('Daniel','Rivas',3,'Usulután','Participante del programa.','2025-05-12',87),

('Comunidad La Perlita','',4,'La Unión','Sector incorporado.','2025-05-20',89),
('Marco','Zelaya',3,'La Unión','Adulto atendido.','2025-05-21',89),
('Familia Ramírez','',2,'Santa Rosa de Lima','Hogar apoyado.','2025-05-22',89),
('Escuela Flor de Mangle','',5,'La Unión','Centro reforzado.','2025-05-23',89),

('Centro Médico Vida Nueva','',5,'San Salvador','Clínica fortalecida.','2025-05-25',90),
('Carmen','Aguilar',3,'San Salvador','Paciente atendida.','2025-05-26',90),
('Familia López','',2,'Cuscatancingo','Hogar beneficiado.','2025-05-27',90),
('Comunidad Santo Tomás','',4,'Santo Tomás','Sector asistido.','2025-05-28',90),
('Ricardo','Ibáñez',3,'San Marcos','Adulto atendido.','2025-05-29',90),
('Escuela Santa Eduviges','',5,'Ilopango','Centro reforzado.','2025-05-30',90),

('Centro Médico Vida Nueva','',5,'San Salvador','Clínica fortalecida.','2025-05-25',90),
('Carmen','Aguilar',3,'San Salvador','Paciente atendida.','2025-05-26',90),
('Familia López','',2,'Cuscatancingo','Hogar beneficiado.','2025-05-27',90),
('Comunidad Santo Tomás','',4,'Santo Tomás','Sector asistido.','2025-05-28',90),
('Ricardo','Ibáñez',3,'San Marcos','Adulto atendido.','2025-05-29',90),
('Escuela Santa Eduviges','',5,'Ilopango','Centro reforzado.','2025-05-30',90),

('Comunidad Tierra Blanca','',4,'San Vicente','Sector acompañado.','2025-06-01',91),
('María','Cerritos',2,'Tecoluca','Madre beneficiada.','2025-06-02',91),

('Escuela Monte Verde','',5,'Santa Ana','Centro fortalecidos.','2025-06-05',92),
('Karla','Amaya',1,'Chalchuapa','Estudiante apoyada.','2025-06-06',92),
('Comunidad Las Flores','',4,'Santa Ana','Sector beneficiado.','2025-06-07',92),
('Pedro','Sigüenza',3,'Metapán','Adulto atendido.','2025-06-08',92),
('Familia Granados','',2,'Santa Ana','Hogar beneficiado.','2025-06-09',92),
('Noemí','Pérez',2,'Metapán','Madre beneficiada.','2025-06-10',92),
('Centro Escolar Bello Horizonte','',5,'Santa Ana','Centro incorporado.','2025-06-11',92),

('Cooperativa Nueva Fuerza','',4,'La Unión','Agricultores capacitados.','2025-06-12',93),

('Comunidad Los Girasoles','',4,'San Salvador','Sector asistido.','2025-06-15',94),
('Patricia','Ríos',3,'Soyapango','Madre apoyada.','2025-06-16',94),
('Familia Pérez','',2,'Ciudad Delgado','Hogar beneficiado.','2025-06-17',94),
('Escuela Parvularia Luz del Saber','',5,'San Salvador','Centro reforzado.','2025-06-18',94),
('Óscar','Hernández',3,'Ayutuxtepeque','Adulto atendido.','2025-06-19',94),
('Comunidad El Paraíso','',4,'Mejicanos','Sector apoyado.','2025-06-20',94),
('Laura','Méndez',2,'Cuscatancingo','Beneficiaria.','2025-06-21',94),

('Escuela Los Manantiales','',5,'Morazán','Centro incorporado.','2025-06-24',95),
('Familia Ventura','',2,'Sociedad','Hogar beneficiado.','2025-06-25',95),
('Roberto','Magaña',3,'San Carlos','Adulto atendido.','2025-06-26',95),

('Doris','Escalante',2,'San Miguel','Adulta apoyada.','2025-06-28',96),

('Comunidad Los Altos','',4,'Ahuachapán','Sector beneficiado.','2025-07-01',97),
('Jorge','Zepeda',3,'Atiquizaya','Adulto beneficiado.','2025-07-02',97),
('Familia Paredes','',2,'Ahuachapán','Hogar apoyado.','2025-07-03',97),
('Escuela La Esperanza','',5,'Concepción de Ataco','Centro integrado.','2025-07-04',97),

('Escuela Nueva Generación','',5,'Usulután','Centro reforzado.','2025-07-07',98),
('Familia Rosales','',2,'Jiquilisco','Hogar beneficiado.','2025-07-08',98),
('César','Portillo',3,'Usulután','Adulto atendido.','2025-07-09',98),
('Comunidad La Bendición','',4,'Santa María','Sector apoyado.','2025-07-10',98),
('Brenda','Campos',2,'Usulután','Participante.','2025-07-11',98),
('Niños del Futuro','',5,'Usulután','Programa para menores.','2025-07-12',98),
('Daniel','Lemus',3,'Jiquilisco','Adulto involucrado.','2025-07-13',98),

('Comunidad Las Mercedes','',4,'Santa Ana','Sector beneficiado.','2025-07-16',99),
('Gloria','Guevara',2,'Santa Ana','Jefa de hogar beneficiada.','2025-07-17',99),

('Escuela Fe y Alegría','',5,'San Vicente','Centro reforzado.','2025-07-20',100),
('Marcos','Flores',3,'San Vicente','Adulto atendido.','2025-07-21',100),
('Comunidad El Cedral','',4,'Tecoluca','Sector incorporado.','2025-07-22',100),
('Rosa','Landaverde',2,'San Vicente','Beneficiaria.','2025-07-23',100),
('Familia Melara','',2,'San Vicente','Hogar beneficiado.','2025-07-24',100),

('Familia Martínez','',2,'San Salvador','Hogar beneficiado.','2024-01-05',1),
('José','Ramírez',3,'Soyapango','Adulto atendido.','2024-01-07',1),

('Cooperativa El Roble','',4,'La Unión','Grupo productivo reforzado.','2024-01-16',3),

('Comunidad Santa Marta','',4,'Chalatenango','Sector apoyado.','2024-01-20',4),
('Familia Alvarado','',2,'La Palma','Hogar beneficiado.','2024-01-21',4),
('Escuela El Pinar','',5,'Chalatenango','Centro reforzado.','2024-01-22',4),
('Diego','Ramos',3,'San Ignacio','Adulto atendido.','2024-01-23',4),
('Ana','Mendoza',2,'La Palma','Madre apoyada.','2024-01-24',4),
('Centro Escolar San José','',5,'San Ignacio','Centro integrado.','2024-01-25',4),
('Grupo Las Orquídeas','',4,'Chalatenango','Colectivo beneficiado.','2024-01-26',4),

('Escuela Santa Clara','',5,'Usulután','Centro reforzado.','2024-02-01',5),
('Familia Perdomo','',2,'Jiquilisco','Hogar beneficiado.','2024-02-02',5),
('Ricardo','López',3,'Usulután','Adulto atendido.','2024-02-03',5),

('Comunidad San Fernando','',4,'Morazán','Sector atendido.','2024-02-08',6),
('Carolina','Santos',2,'Sociedad','Madre beneficiada.','2024-02-09',6),
('Centro Escolar Buenaventura','',5,'San Carlos','Centro incorporado.','2024-02-10',6),
('Óscar','Arévalo',3,'Gotera','Adulto atendido.','2024-02-11',6),
('Familia Molina','',2,'Sociedad','Hogar beneficiado.','2024-02-12',6),
('Miguel','Rivas',3,'San Carlos','Adulto beneficiado.','2024-02-13',6),

('Cooperativa Nueva Siembra','',4,'Santa Ana','Productores apoyados.','2024-02-15',7),

('Comunidad El Cedro','',4,'Ahuachapán','Sector asistido.','2024-02-18',8),
('Sara','Villalta',1,'Atiquizaya','Niña beneficiada.','2024-02-19',8),
('Escuela Los Conacastes','',5,'Ahuachapán','Centro reforzado.','2024-02-20',8),
('Jorge','Campos',3,'Concepción de Ataco','Adulto atendido.','2024-02-21',8),
('Familia Galdámez','',2,'San Lorenzo','Hogar apoyado.','2024-02-22',8),

('Centro Escolar El Triunfo','',5,'San Vicente','Centro beneficiado.','2024-02-25',9),
('Paola','Miranda',2,'Tecoluca','Madre beneficiada.','2024-02-26',9),
('Comunidad El Guayabo','',4,'San Vicente','Sector asistido.','2024-02-27',9),

('Comunidad Las Brisas','',4,'San Salvador','Sector beneficiado.','2024-03-01',10),
('Marcos','Hernández',3,'Ayutuxtepeque','Adulto atendido.','2024-03-02',10),
('Familia Magaña','',2,'Mejicanos','Hogar apoyado.','2024-03-03',10),
('Escuela San Francisco','',5,'Ilopango','Centro reforzado.','2024-03-04',10),
('Diana','Alvarado',2,'San Salvador','Beneficiaria.','2024-03-05',10),
('Comunidad San Rafael','',4,'Apopa','Sector atendido.','2024-03-06',10),
('Héctor','Ibáñez',3,'San Salvador','Adulto atendido.','2024-03-07',10),

('Familia Bonilla','',2,'Santa Ana','Hogar beneficiado.','2024-03-10',11),
('Centro Escolar La Palma','',5,'Metapán','Centro reforzado.','2024-03-11',11),

('Comunidad El Sauce','',4,'Usulután','Sector intervenido.','2024-03-14',12),
('Ana','Portillo',2,'Jiquilisco','Madre beneficiada.','2024-03-15',12),
('José','Zepeda',3,'Santa María','Adulto atendido.','2024-03-16',12),
('Familia Quintanilla','',2,'Usulután','Hogar apoyado.','2024-03-17',12),
('Escuela San Ramón','',5,'Santa María','Centro reforzado.','2024-03-18',12),
('Comunidad La Cumbre','',4,'Jiquilisco','Sector asistido.','2024-03-19',12),
('Kevin','Serrano',1,'Usulután','Niño beneficiado.','2024-03-20',12),
('Centro Escolar San Jorge','',5,'Usulután','Centro incorporado.','2024-03-21',12),

('Comunidad Los Laureles','',4,'San Miguel','Sector beneficiado.','2024-03-25',13),
('Roxana','Hernández',2,'Moncagua','Madre apoyada.','2024-03-26',13),
('Centro Escolar Nueva Luz','',5,'San Miguel','Centro reforzado.','2024-03-27',13),
('Carlos','Villatoro',3,'San Miguel','Adulto atendido.','2024-03-28',13),

('Escuela Fe y Esperanza','',5,'Chalatenango','Centro incorporado.','2024-04-01',14),
('Comunidad Las Rosas','',4,'San Ignacio','Sector asistido.','2024-04-02',14),
('Martha','Moreno',2,'Chalatenango','Beneficiaria.','2024-04-03',14),

('Comunidad San Cristóbal','',4,'La Libertad','Sector intervenido.','2024-04-06',15),
('Gloria','Escobar',2,'Santa Tecla','Madre beneficiada.','2024-04-07',15),
('Escuela Santa María','',5,'Colón','Centro reforzado.','2024-04-08',15),
('Rolando','García',3,'San Pablo Tacachico','Adulto atendido.','2024-04-09',15),
('Familia Rivera','',2,'Ciudad Arce','Hogar beneficiado.','2024-04-10',15),
('Daniela','Méndez',1,'La Libertad','Niña beneficiada.','2024-04-11',15),

('Cooperativa Agrícola El Progreso','',4,'Santa Ana','Agricultores fortalecidos.','2024-04-12',16),

('Comunidad Los Almendros','',4,'Sonsonate','Sector atendido.','2024-04-15',17),
('Henry','Ramos',3,'Armenia','Adulto atendido.','2024-04-16',17),
('Escuela San Lucas','',5,'Nahuizalco','Centro reforzado.','2024-04-17',17),
('Familia Ponce','',2,'Sonzacate','Hogar beneficiado.','2024-04-18',17),
('Claudia','Ruiz',2,'Sonsonate','Beneficiaria.','2024-04-19',17),

('Escuela Nuevo Rumbo','',5,'San Vicente','Centro fortalecido.','2024-04-22',18),
('Familia Aldana','',2,'Tecoluca','Hogar beneficiado.','2024-04-23',18),
('César','Villalobos',3,'San Vicente','Adulto atendido.','2024-04-24',18),
('Comunidad El Prado','',4,'Verapaz','Sector asistido.','2024-04-25',18),
('Karen','Zepeda',2,'San Vicente','Madre beneficiada.','2024-04-26',18),
('Centro Escolar Altamira','',5,'Tecoluca','Centro incorporado.','2024-04-27',18),
('Carlos','Segovia',3,'San Vicente','Adulto beneficiado.','2024-04-28',18),
('Familia Monterrosa','',2,'Verapaz','Hogar beneficiado.','2024-04-29',18),

('Centro Escolar Manantial','',5,'San Salvador','Centro reforzado.','2024-05-05',20),
('Héctor','Ríos',3,'Ayutuxtepeque','Adulto atendido.','2024-05-06',20),
('Comunidad Valle Nuevo','',4,'Cuscatancingo','Sector asistido.','2024-05-07',20),
('Familia Mena','',2,'Mejicanos','Hogar beneficiado.','2024-05-08',20);


INSERT INTO TipoBeneficio (id_beneficiario, id_tipo_beneficio)
VALUES
(1,3),
(1,4),
(2,2),
(3,3),
(4,4),
(5,1),
(6,5),
(7,5),
(8,2),
(9,3),
(10,5),
(11,4),
(12,4),
(13,1),
(14,4),
(15,2),
(16,5),
(17,3),
(18,4),
(19,1),
(20,4), 
(21,3),
(22,2),
(23,3),
(24,5),
(25,4),
(26,5),
(27,4),
(28,1),
(29,4),
(30,2),
(31,4),
(32,4),
(33,2),
(34,3),
(35,4),
(36,2),
(37,3),
(38,4),
(39,5),
(40,4), 
(41,4),
(42,4),
(43,3),
(44,4),
(45,3),
(46,5),
(47,4),
(48,2),
(49,3),
(50,5),
(51,3),
(52,5),
(53,4),
(54,1),
(55,4),
(56,5),
(57,3),
(58,4),
(59,5),
(60,3), 
(61,2),
(62,4),
(63,3),
(64,5),
(65,4),
(66,3),
(67,4),
(68,2),
(69,4),
(70,5),
(71,5),
(72,3),
(73,4),
(74,2),
(75,5),
(76,3),
(77,4),
(78,5),
(79,2),
(80,1), 
(81,4),
(82,5),
(83,3),
(84,4),
(85,5),
(86,4),
(87,5),
(88,4),
(89,5),
(90,3),
(91,4),
(92,2),
(93,4),
(94,3),
(95,2),
(96,4),
(97,3),
(98,3),
(99,4),
(100,2);
GO

INSERT INTO Zona_Impacto (direccion, coordenadas, id_proyecto)
VALUES
('Cantón Los Planes, Chalatenango','14.031,-88.941',1),
('San Miguel Centro','13.481,-88.183',2),
('Santa Ana Norte','13.989,-89.559',3),
('Morazán Sur','13.748,-88.085',4),
('Soyapango','13.713,-89.151',5),
('San Vicente','13.633,-88.800',6),
('El Tránsito, San Miguel','13.482,-88.180',7),
('San Vicente','13.630,-88.783',8),
('Mejicanos, San Salvador','13.725,-89.215',9),
('Soyapango','13.711,-89.150',10),
('Chalatenango','14.032,-88.941',11),
('Santa Ana','13.993,-89.556',12),
('San Salvador','13.692,-89.218',13),
('Usulután','13.348,-88.438',14),
('Ilobasco','13.880,-88.849',15),
('San Martín','13.743,-89.056',16),
('Ahuachapán','13.925,-89.845',17),
('Cuscatlán','13.725,-88.934',18),
('Santa Tecla','13.674,-89.285',19),
('Suchitoto','13.936,-89.027',20), 

('San Miguel','13.478,-88.182',21),
('Santa Ana','13.993,-89.560',22),
('Usulután','13.348,-88.436',23),
('San Vicente','13.635,-88.783',24),
('La Unión','13.330,-87.842',25),
('San Salvador','13.692,-89.219',26),
('San Miguel','13.483,-88.183',27),
('Cuscatlán','13.725,-88.932',28),
('Santa Tecla','13.674,-89.285',29),
('San Salvador','13.700,-89.220',30),
('Sonsonate','13.724,-89.721',31),
('Morazán','13.747,-88.083',32),
('Chalatenango','14.031,-88.941',33),
('San Vicente','13.633,-88.800',34),
('La Paz','13.518,-88.867',35),
('San Miguel','13.480,-88.181',36),
('Ahuachapán','13.920,-89.845',37),
('Cabañas','13.870,-88.749',38),
('La Libertad','13.488,-89.322',39),
('Morazán','13.740,-88.110',40), 

('San Vicente','13.631,-88.780',41),
('Chalatenango','14.035,-88.940',42),
('Usulután','13.348,-88.440',43),
('La Paz','13.517,-88.865',44),
('Cuscatlán','13.725,-88.933',45),
('San Salvador','13.692,-89.217',46),
('Santa Ana','13.993,-89.559',47),
('San Miguel','13.481,-88.180',48),
('La Libertad','13.486,-89.320',49),
('Usulután','13.349,-88.435',50),
('Cabañas','13.868,-88.749',51),
('Sonsonate','13.723,-89.720',52),
('La Unión','13.329,-87.842',53),
('San Vicente','13.633,-88.801',54),
('Cuscatlán','13.724,-88.934',55),
('San Salvador','13.693,-89.220',56),
('Ahuachapán','13.921,-89.846',57),
('La Paz','13.520,-88.869',58),
('San Vicente','13.630,-88.782',59),
('Santa Tecla','13.676,-89.285',60), 

('La Paz','13.519,-88.870',61),
('Chalatenango','14.032,-88.940',62),
('San Salvador','13.693,-89.220',63),
('San Vicente','13.631,-88.780',64),
('Usulután','13.348,-88.437',65),
('Santa Tecla','13.676,-89.284',66),
('Cuscatlán','13.726,-88.932',67),
('Sonsonate','13.724,-89.722',68),
('Ahuachapán','13.920,-89.844',69),
('San Miguel','13.482,-88.182',70),
('Santa Ana','13.993,-89.560',71),
('La Unión','13.330,-87.843',72),
('Cuscatlán','13.725,-88.934',73),
('San Salvador','13.695,-89.218',74),
('San Vicente','13.631,-88.781',75),
('Morazán','13.747,-88.085',76),
('La Paz','13.520,-88.868',77),
('Santa Tecla','13.675,-89.286',78),
('Usulután','13.347,-88.437',79),
('Cabañas','13.871,-88.751',80), 

('La Unión','13.332,-87.843',81),
('San Salvador','13.695,-89.220',82),
('Morazán','13.744,-88.085',83),
('San Miguel','13.483,-88.181',84),
('Cuscatlán','13.725,-88.933',85),
('La Paz','13.518,-88.866',86),
('San Vicente','13.631,-88.782',87),
('Ahuachapán','13.922,-89.846',88),
('Sonsonate','13.722,-89.722',89),
('San Salvador','13.693,-89.219',90),
('Chalatenango','14.033,-88.943',91),
('Santa Tecla','13.676,-89.282',92),
('Cabañas','13.870,-88.749',93),
('La Libertad','13.488,-89.322',94),
('San Vicente','13.631,-88.782',95),
('Morazán','13.746,-88.085',96),
('Usulután','13.345,-88.437',97),
('San Salvador','13.694,-89.220',98),
('Ahuachapán','13.921,-89.844',99),
('San Miguel','13.484,-88.180',100);

GO

INSERT INTO Objetivo (descripcion, fecha_evaluacion, id_proyecto)
VALUES
('Garantizar acceso a agua potable segura.','2023-08-30',1),
('Incrementar la tasa de escolarización infantil.','2023-12-01',2),
('Reducir enfermedades respiratorias.','2023-10-15',3),
('Mejorar la infraestructura educativa.','2024-01-15',4),
('Asegurar alimentación básica mensual.','2023-11-20',5),
('Fomentar inserción laboral juvenil.','2023-12-31',6),
('Fomentar hogares sostenibles.','2023-12-31',7),
('Reducir la brecha digital.','2024-02-10',8),
('Atender salud mental comunitaria.','2024-01-30',9),
('Empoderar económicamente a mujeres.','2024-02-15',10),
('Desarrollar huertos educativos.','2024-03-01',11),
('Proveer viviendas dignas.','2024-06-15',12),
('Fomentar cultura de reciclaje.','2024-03-01',13),
('Promover energía renovable.','2024-07-01',14),
('Garantizar transporte estudiantil seguro.','2024-05-01',15),
('Brindar formación integral juvenil.','2024-06-30',16),
('Proteger fauna nacional.','2024-05-20',17),
('Garantizar agua y saneamiento escolar.','2024-06-01',18),
('Asegurar alimentación infantil.','2024-05-30',19),
('Recuperar áreas forestales.','2024-07-15',20), 

('Disminuir la mortalidad materna.','2024-08-01',21),
('Fomentar acceso a educación superior.','2024-09-30',22),
('Promover la salud dental infantil.','2024-08-15',23),
('Mejorar ingresos mediante artesanías.','2024-09-20',24),
('Facilitar acceso a comunidades aisladas.','2024-10-01',25),
('Promover cultura y arte como inclusión social.','2024-10-20',26),
('Garantizar espacios educativos seguros.','2024-12-01',27),
('Reducir desnutrición infantil escolar.','2024-11-15',28),
('Aumentar áreas verdes urbanas.','2024-12-20',29),
('Fomentar educación inclusiva.','2024-12-30',30),
('Promover higiene escolar.','2024-12-31',31),
('Mejorar productividad agrícola rural.','2025-01-30',32),
('Promover lectura comunitaria.','2025-02-01',33),
('Mejorar salud visual en adultos mayores.','2025-01-15',34),
('Fortalecer producción agrícola familiar.','2025-03-15',35),
('Garantizar acceso digital rural.','2025-03-30',36),
('Mejorar calidad de vida de adultos mayores.','2025-04-01',37),
('Promover higiene escolar rural.','2025-05-10',38),
('Desarrollar liderazgo y cohesión social.','2025-05-15',39),
('Fomentar el acceso a energía renovable.','2025-06-30',40), 

('Proveer acceso sostenible a agua potable.','2025-07-10',41),
('Garantizar infraestructura educativa segura.','2025-08-20',42),
('Llevar servicios de salud a zonas rurales.','2025-09-05',43),
('Restaurar zonas boscosas degradadas.','2025-09-15',44),
('Mejorar salud bucal infantil.','2025-09-01',45),
('Fortalecer el voluntariado comunitario.','2025-09-30',46),
('Reducir inseguridad mediante alumbrado público.','2025-10-01',47),
('Promover acceso a la información y educación digital.','2025-10-30',48),
('Controlar enfermedades zoonóticas.','2025-11-15',49),
('Crear cultura ambiental escolar.','2025-11-30',50),
('Garantizar acceso a medicamentos básicos.','2025-12-15',51),
('Promover autonomía económica femenina.','2025-12-31',52),
('Reducir contaminación de ríos locales.','2026-01-01',53),
('Disminuir la desnutrición escolar.','2026-01-20',54),
('Mejorar condiciones habitacionales rurales.','2026-02-20',55),
('Fomentar creatividad e innovación juvenil.','2026-02-28',56),
('Detectar y corregir problemas visuales.','2026-03-01',57),
('Incrementar productividad agrícola.','2026-03-15',58),
('Guiar a jóvenes en su desarrollo personal y profesional.','2026-03-30',59),
('Dar refugio y atención médica a animales callejeros.','2026-04-01',60), 

('Reducir la brecha digital rural.','2026-04-15',61),
('Promover la protección de los ecosistemas.','2026-05-01',62),
('Brindar atención médica gratuita.','2026-05-20',63),
('Impulsar el emprendimiento local.','2026-06-01',64),
('Promover la inclusión educativa.','2026-06-30',65),
('Promover salud emocional en jóvenes.','2026-07-15',66),
('Garantizar agua segura en centros educativos.','2026-07-20',67),
('Apoyar la educación virtual familiar.','2026-08-10',68),
('Mejorar condiciones de vivienda familiar.','2026-08-30',69),
('Fomentar la creatividad estudiantil.','2026-08-31',70),
('Concientizar sobre el cuidado del agua.','2026-09-15',71),
('Ampliar cobertura médica en zonas rurales.','2026-09-30',72),
('Incentivar la educación ambiental.','2026-10-01',73),
('Brindar oportunidades educativas.','2026-10-15',74),
('Capacitar mujeres en atención de emergencias.','2026-10-30',75),
('Promover higiene bucal infantil.','2026-11-01',76),
('Fomentar agricultura ecológica y rentable.','2026-11-15',77),
('Fomentar cultura del reciclaje entre jóvenes.','2026-11-30',78),
('Reducir brecha digital en educación.','2026-12-10',79),
('Reducir inseguridad alimentaria.','2026-12-20',80),
('Garantizar acceso seguro entre comunidades.','2026-12-30',81),
('Fortalecer el vínculo familiar y educativo.','2026-12-15',82),
('Promover salud preventiva natural.','2027-01-10',83),
('Fomentar autosuficiencia alimentaria urbana.','2027-01-20',84),
('Fomentar el deporte como herramienta educativa.','2027-01-30',85),
('Proteger ecosistemas marinos y costeros.','2027-02-15',86),
('Involucrar jóvenes en servicio comunitario.','2027-02-28',87),
('Garantizar acceso eléctrico en aulas rurales.','2027-03-01',88),
('Preservar el patrimonio cultural local.','2027-03-10',89),
('Mejorar calidad de vida de pacientes crónicos.','2027-03-30',90),
('Fortalecer la economía rural sostenible.','2027-04-10',91),
('Impulsar innovación juvenil con tecnología.','2027-04-25',92),
('Restaurar zonas deforestadas críticas.','2027-05-01',93),
('Reducir accidentes y mejorar respuesta médica.','2027-05-15',94),
('Fomentar el hábito de lectura en comunidades.','2027-05-30',95),
('Promover uso de energías renovables.','2027-06-10',96),
('Mejorar condiciones de higiene escolar.','2027-06-25',97),
('Brindar apoyo integral a adultos mayores.','2027-07-05',98),
('Promover construcción sostenible.','2027-07-20',99),
('Fomentar la alfabetización digital infantil.','2027-08-01',100);

GO


INSERT INTO Metrica (descripcion, tipo_indicador, valor_obtenido, fecha_actualizacion, id_objetivo)
VALUES
('Número de familias con agua potable','Cuantitativo',120,'2023-08-15',1),
('Niños inscritos en programa','Cuantitativo',80,'2023-11-10',2),
('Personas vacunadas','Cuantitativo',200,'2023-09-20',3),
('Aulas construidas','Cuantitativo',5,'2023-12-20',4),
('Paquetes entregados mensualmente','Cuantitativo',300,'2023-10-30',5),
('Jóvenes certificados','Cuantitativo',45,'2023-12-15',6),
('Familias capacitadas','Cuantitativo',80,'2023-12-10',7),
('Escuelas equipadas','Cuantitativo',15,'2024-02-05',8),
('Personas atendidas psicológicamente','Cuantitativo',120,'2024-01-15',9),
('Mujeres capacitadas','Cuantitativo',50,'2024-02-10',10),
('Huertos implementados','Cuantitativo',10,'2024-02-25',11),
('Casas construidas','Cuantitativo',25,'2024-06-01',12),
('Toneladas recicladas','Cuantitativo',12,'2024-02-20',13),
('Paneles solares instalados','Cuantitativo',100,'2024-06-25',14),
('Estudiantes transportados','Cuantitativo',250,'2024-04-15',15),
('Jóvenes inscritos en talleres','Cuantitativo',70,'2024-06-10',16),
('Animales rescatados','Cuantitativo',35,'2024-05-10',17),
('Escuelas con agua segura','Cuantitativo',20,'2024-05-25',18),
('Niños alimentados','Cuantitativo',300,'2024-05-20',19),
('Árboles plantados','Cuantitativo',2000,'2024-07-10',20), 

('Mujeres atendidas','Cuantitativo',150,'2024-07-20',21),
('Becas otorgadas','Cuantitativo',60,'2024-09-15',22),
('Niños atendidos','Cuantitativo',200,'2024-08-01',23),
('Mujeres capacitadas','Cuantitativo',40,'2024-09-10',24),
('Puentes construidos','Cuantitativo',3,'2024-09-25',25),
('Jóvenes formados artísticamente','Cuantitativo',90,'2024-10-10',26),
('Escuelas rehabilitadas','Cuantitativo',6,'2024-11-25',27),
('Niños alimentados diariamente','Cuantitativo',400,'2024-11-10',28),
('Parques creados','Cuantitativo',4,'2024-12-10',29),
('Niños con apoyo especializado','Cuantitativo',60,'2024-12-20',30),
('Escuelas equipadas con lavamanos','Cuantitativo',15,'2024-12-20',31),
('Agricultores apoyados','Cuantitativo',80,'2025-01-10',32),
('Bibliotecas inauguradas','Cuantitativo',5,'2025-01-25',33),
('Lentes entregados','Cuantitativo',180,'2025-01-05',34),
('Familias agrícolas beneficiadas','Cuantitativo',70,'2025-03-01',35),
('Escuelas conectadas','Cuantitativo',12,'2025-03-20',36),
('Adultos mayores atendidos','Cuantitativo',90,'2025-03-20',37),
('Escuelas intervenidas','Cuantitativo',10,'2025-04-30',38),
('Líderes capacitados','Cuantitativo',45,'2025-05-05',39),
('Hogares electrificados','Cuantitativo',60,'2025-06-20',40), 

('Pozos instalados','Cuantitativo',4,'2025-07-05',41),
('Escuelas rehabilitadas','Cuantitativo',6,'2025-08-15',42),
('Personas atendidas','Cuantitativo',250,'2025-08-25',43),
('Árboles sembrados','Cuantitativo',3500,'2025-09-10',44),
('Niños atendidos','Cuantitativo',180,'2025-08-25',45),
('Voluntarios capacitados','Cuantitativo',60,'2025-09-20',46),
('Lámparas instaladas','Cuantitativo',120,'2025-09-25',47),
('Centros equipados','Cuantitativo',10,'2025-10-20',48),
('Animales vacunados','Cuantitativo',250,'2025-11-05',49),
('Escuelas participantes','Cuantitativo',15,'2025-11-25',50),
('Medicamentos entregados','Cuantitativo',5000,'2025-12-10',51),
('Microcréditos otorgados','Cuantitativo',80,'2025-12-20',52),
('Toneladas de desechos recolectados','Cuantitativo',18,'2025-12-20',53),
('Niños beneficiados','Cuantitativo',350,'2026-01-10',54),
('Viviendas reparadas','Cuantitativo',25,'2026-02-10',55),
('Jóvenes capacitados','Cuantitativo',50,'2026-02-20',56),
('Personas atendidas','Cuantitativo',120,'2026-02-25',57),
('Agricultores beneficiados','Cuantitativo',90,'2026-03-05',58),
('Jóvenes atendidos','Cuantitativo',65,'2026-03-20',59),
('Animales rescatados','Cuantitativo',150,'2026-03-25',60), 

('Puntos Wi-Fi instalados','Cuantitativo',20,'2026-04-10',61),
('Árboles sembrados','Cuantitativo',4500,'2026-04-25',62),
('Pacientes atendidos','Cuantitativo',320,'2026-05-10',63),
('Negocios apoyados','Cuantitativo',40,'2026-05-20',64),
('Escuelas adaptadas','Cuantitativo',12,'2026-06-25',65),
('Sesiones impartidas','Cuantitativo',100,'2026-07-05',66),
('Filtros instalados','Cuantitativo',25,'2026-07-10',67),
('Familias beneficiadas','Cuantitativo',50,'2026-08-01',68),
('Casas reparadas','Cuantitativo',35,'2026-08-20',69),
('Talleres realizados','Cuantitativo',25,'2026-08-20',70),
('Estudiantes capacitados','Cuantitativo',300,'2026-09-05',71),
('Pacientes atendidos','Cuantitativo',400,'2026-09-25',72),
('Huertos creados','Cuantitativo',20,'2026-09-25',73),
('Becas otorgadas','Cuantitativo',100,'2026-10-05',74),
('Mujeres capacitadas','Cuantitativo',80,'2026-10-25',75),
('Niños atendidos','Cuantitativo',250,'2026-10-25',76),
('Agricultores capacitados','Cuantitativo',70,'2026-11-05',77),
('Kilogramos reciclados','Cuantitativo',1200,'2026-11-20',78),
('Tabletas entregadas','Cuantitativo',200,'2026-12-05',79),
('Familias asistidas','Cuantitativo',150,'2026-12-10',80), 

('Puentes construidos','Cuantitativo',5,'2026-12-20',81),
('Padres capacitados','Cuantitativo',120,'2026-12-05',82),
('Talleres impartidos','Cuantitativo',30,'2026-12-30',83),
('Huertos familiares creados','Cuantitativo',100,'2027-01-10',84),
('Torneos realizados','Cuantitativo',15,'2027-01-20',85),
('Manglares restaurados','Cuantitativo',45,'2027-02-05',86),
('Voluntarios formados','Cuantitativo',60,'2027-02-15',87),
('Aulas electrificadas','Cuantitativo',20,'2027-02-20',88),
('Eventos realizados','Cuantitativo',12,'2027-02-28',89),
('Pacientes atendidos','Cuantitativo',180,'2027-03-20',90),
('Productores apoyados','Cuantitativo',60,'2027-04-01',91),
('Jóvenes capacitados','Cuantitativo',90,'2027-04-15',92),
('Árboles plantados','Cuantitativo',8000,'2027-04-25',93),
('Estaciones instaladas','Cuantitativo',10,'2027-05-10',94),
('Libros donados','Cuantitativo',1200,'2027-05-20',95),
('Paneles instalados','Cuantitativo',30,'2027-05-30',96),
('Escuelas equipadas','Cuantitativo',18,'2027-06-15',97),
('Visitas realizadas','Cuantitativo',250,'2027-06-30',98),
('Casas construidas','Cuantitativo',20,'2027-07-10',99),
('Laboratorios instalados','Cuantitativo',10,'2027-07-25',100);


GO

SELECT * FROM Donante ORDER BY id;

INSERT INTO Donaciones (fecha_donacion, monto, metodo_pago, comentarios, id_proyecto, id_donante)
VALUES
('2023-01-12',5000.00,'Transferencia','Aporte inicial al proyecto de agua.',1,2),
('2023-02-05',2500.00,'Efectivo','Apoyo educativo infantil.',2,1),
('2023-03-20',7000.00,'Cheque','Donación de Fundación Esperanza.',3,3),
('2023-04-10',15000.00,'Transferencia','Apoyo para construcción de aulas.',4,4),
('2023-05-15',3000.00,'Efectivo','Apoyo mensual de ONG Vida Nueva.',5,5),
('2023-06-18',4000.00,'Transferencia','Capacitación laboral juvenil.',6,2),
('2023-07-05',2000.00,'Transferencia','Apoyo a hogares verdes.',7,1),
('2023-07-25',8000.00,'Cheque','Apoyo a escuelas digitales.',8,2),
('2023-08-20',2500.00,'Efectivo','Campaña salud mental.',9,3),
('2023-08-30',4000.00,'Transferencia','Apoyo a mujeres emprendedoras.',10,5),
('2023-09-20',3000.00,'Efectivo','Apoyo a huertos escolares.',11,1),
('2023-10-01',12000.00,'Transferencia','Construcción de viviendas.',12,4),
('2023-10-15',1500.00,'Efectivo','Campaña de reciclaje.',13,5),
('2023-10-25',6000.00,'Transferencia','Instalación solar.',14,3),
('2023-11-10',3500.00,'Transferencia','Apoyo transporte escolar.',15,2),
('2023-11-15',5000.00,'Transferencia','Apoyo centro juvenil.',16,5),
('2023-11-30',2500.00,'Efectivo','Protección de fauna.',17,4),
('2023-12-10',4000.00,'Transferencia','Mejoras en agua escolar.',18,3),
('2023-12-20',2000.00,'Efectivo','Comedores infantiles.',19,1),
('2024-01-10',3500.00,'Transferencia','Reforestación.',20,5), 

('2024-02-15',5000.00,'Transferencia','Apoyo a salud materna rural.',21,4),
('2024-02-25',4000.00,'Cheque','Apoyo a becas estudiantiles.',22,2),
('2024-03-10',2500.00,'Efectivo','Campaña dental infantil.',23,1),
('2024-03-20',3500.00,'Transferencia','Apoyo a mujeres artesanas.',24,5),
('2024-04-15',8000.00,'Transferencia','Infraestructura comunitaria.',25,3),
('2024-04-20',3000.00,'Transferencia','Talleres de arte juvenil.',26,1),
('2024-05-15',5000.00,'Cheque','Infraestructura educativa segura.',27,2),
('2024-05-25',3000.00,'Efectivo','Programa nutricional.',28,5),
('2024-06-15',4000.00,'Transferencia','Proyecto verde urbano.',29,3),
('2024-06-25',4500.00,'Cheque','Apoyo educación inclusiva.',30,4),
('2024-07-15',3000.00,'Transferencia','Apoyo a higiene escolar.',31,2),
('2024-07-25',6000.00,'Transferencia','Apoyo agrícola.',32,5),
('2024-08-15',4000.00,'Transferencia','Bibliotecas rurales.',33,3),
('2024-08-25',2500.00,'Efectivo','Salud visual comunitaria.',34,1),
('2024-09-15',5000.00,'Transferencia','Cosechas solidarias.',35,4),
('2024-09-30',4500.00,'Cheque','Internet educativo.',36,3),
('2024-10-10',3500.00,'Transferencia','Apoyo al adulto mayor.',37,5),
('2024-10-20',4000.00,'Transferencia','Proyecto escuelas saludables.',38,4),
('2024-11-15',3000.00,'Transferencia','Capacitación en liderazgo comunitario.',39,2),
('2024-11-30',7000.00,'Transferencia','Apoyo a energía limpia rural.',40,5), 

('2025-01-20',6000.00,'Transferencia','Financiamiento para pozos de agua.',41,2),
('2025-02-01',5000.00,'Cheque','Apoyo para rehabilitación escolar.',42,4),
('2025-02-15',7000.00,'Transferencia','Apoyo a clínica móvil.',43,5),
('2025-02-25',4000.00,'Efectivo','Apoyo a reforestación.',44,1),
('2025-03-10',2500.00,'Efectivo','Campaña dental rural.',45,3),
('2025-03-25',3000.00,'Transferencia','Apoyo a formación de voluntarios.',46,2),
('2025-04-10',5000.00,'Transferencia','Alumbrado público solar.',47,4),
('2025-04-25',4000.00,'Cheque','Bibliotecas digitales rurales.',48,1),
('2025-05-10',3500.00,'Transferencia','Campaña de vacunación animal.',49,2),
('2025-05-20',4000.00,'Efectivo','Educación ambiental.',50,5),
('2025-06-10',6000.00,'Transferencia','Abastecimiento médico rural.',51,4),
('2025-06-25',5000.00,'Transferencia','Apoyo a mujeres emprendedoras.',52,5),
('2025-07-10',3500.00,'Cheque','Campaña de limpieza de ríos.',53,1),
('2025-07-20',4000.00,'Transferencia','Apoyo a desayunos escolares.',54,3),
('2025-08-01',5000.00,'Transferencia','Apoyo habitacional.',55,4),
('2025-08-10',3500.00,'Efectivo','Capacitación artística juvenil.',56,5),
('2025-08-20',2500.00,'Efectivo','Apoyo a brigadas visuales.',57,2),
('2025-09-01',5000.00,'Transferencia','Apoyo a cosechas familiares.',58,3),
('2025-09-10',3000.00,'Transferencia','Mentorías juveniles.',59,1),
('2025-09-25',4000.00,'Efectivo','Apoyo a construcción de refugio.',60,5),

('2025-10-10',4000.00,'Transferencia','Apoyo a conectividad digital.',61,3),
('2025-10-20',3500.00,'Cheque','Apoyo a conservación forestal.',62,2),
('2025-10-30',6000.00,'Transferencia','Apoyo a salud comunitaria.',63,4),
('2025-11-10',5000.00,'Transferencia','Fondo de emprendimiento rural.',64,1),
('2025-11-20',4000.00,'Efectivo','Accesibilidad escolar inclusiva.',65,5),
('2025-11-30',3000.00,'Transferencia','Terapias de bienestar juvenil.',66,3),
('2025-12-10',4000.00,'Transferencia','Agua limpia escolar.',67,2),
('2025-12-20',5000.00,'Cheque','Donación de equipos educativos.',68,4),
('2025-12-25',3500.00,'Transferencia','Apoyo a familias damnificadas.',69,3),
('2026-01-10',2500.00,'Efectivo','Apoyo a educación artística.',70,1),
('2026-01-25',2500.00,'Efectivo','Campaña ambiental educativa.',71,4),
('2026-02-05',5000.00,'Transferencia','Brigadas médicas rurales.',72,2),
('2026-02-15',3000.00,'Efectivo','Apoyo ambiental escolar.',73,5),
('2026-02-25',7000.00,'Transferencia','Fondo de becas estudiantiles.',74,4),
('2026-03-10',3500.00,'Efectivo','Talleres de primeros auxilios.',75,1),
('2026-03-20',3000.00,'Cheque','Campaña dental infantil.',76,5),
('2026-03-30',4000.00,'Transferencia','Educación agrícola ecológica.',77,2),
('2026-04-10',2500.00,'Efectivo','Programa juvenil ambiental.',78,3),
('2026-04-20',5000.00,'Transferencia','Apoyo a educación tecnológica.',79,4),
('2026-04-30',4000.00,'Transferencia','Apoyo alimentario solidario.',80,5), 

('2026-05-10',7000.00,'Transferencia','Infraestructura comunitaria segura.',81,2),
('2026-05-20',2500.00,'Efectivo','Programa familiar educativo.',82,5),
('2026-06-01',3000.00,'Cheque','Apoyo a medicina natural comunitaria.',83,1),
('2026-06-10',4000.00,'Transferencia','Fomento a agricultura urbana.',84,4),
('2026-06-20',2500.00,'Efectivo','Fomento deportivo escolar.',85,3),
('2026-06-30',6000.00,'Transferencia','Apoyo a conservación costera.',86,2),
('2026-07-10',3000.00,'Transferencia','Programa de voluntariado juvenil.',87,5),
('2026-07-20',7000.00,'Cheque','Energía solar educativa.',88,1),
('2026-07-30',3500.00,'Efectivo','Apoyo a proyectos culturales.',89,3),
('2026-08-10',5000.00,'Transferencia','Apoyo a atención médica comunitaria.',90,4),
('2026-08-20',4000.00,'Transferencia','Fomento productivo agrícola.',91,3),
('2026-08-30',5000.00,'Efectivo','Educación tecnológica juvenil.',92,1),
('2026-09-10',6000.00,'Transferencia','Apoyo a reforestación nacional.',93,5),
('2026-09-20',3000.00,'Cheque','Infraestructura sanitaria costera.',94,4),
('2026-09-30',4000.00,'Efectivo','Apoyo a educación lectora.',95,2),
('2026-10-10',3500.00,'Transferencia','Fomento a energía renovable.',96,1),
('2026-10-20',3000.00,'Efectivo','Infraestructura sanitaria educativa.',97,5),
('2026-10-30',5000.00,'Transferencia','Apoyo a tercera edad.',98,2),
('2026-11-10',6000.00,'Transferencia','Viviendas ecológicas rurales.',99,4),
('2026-11-20',7000.00,'Cheque','Apoyo a educación digital.',100,3);


GO

-- Nuevas Donaciones

INSERT INTO Donaciones (fecha_donacion, monto, metodo_pago, comentarios, id_proyecto, id_donante) VALUES
('2024-10-05', 1500.00, 'Transferencia', 'Aporte institucional', 101, 1),
('2024-10-10', 2800.50, 'Tarjeta', 'Apoyo a actividades operativas', 103, 2),
('2024-11-01', 500.00, 'Efectivo', 'Donación personal', 105, 3),
('2024-11-12', 12000.00, 'Transferencia', 'Financiamiento especial', 100, 4),
('2024-12-01', 7500.75, 'Transferencia', 'Fondo para logística', 99, 5),
('2024-12-10', 200.00, 'Tarjeta', 'Aporte individual', 72, 6),
('2025-01-05', 4300.25, 'Transferencia', 'Apoyo educativo', 86, 7),
('2025-01-12', 900.00, 'Efectivo', 'Apoyo puntual', 7, 8),
('2025-01-20', 3100.89, 'Transferencia', 'Ayuda humanitaria', 8, 9),
('2025-02-02', 15000.00, 'Transferencia', 'Fondo de desarrollo', 9, 10),

('2025-02-10', 2300.00, 'Tarjeta', 'Becas comunitarias', 4, 1),
('2025-02-15', 9800.40, 'Transferencia', 'Mejora de infraestructura', 5, 2),
('2025-02-20', 420.00, 'Efectivo', 'Colaboración voluntaria', 1, 3),
('2025-03-01', 25000.00, 'Transferencia', 'Fondo estratégico', 10, 4),
('2025-03-12', 6400.20, 'Transferencia', 'Campaña nutricional', 3, 5),
('2025-03-18', 310.00, 'Tarjeta', 'Aporte personal', 6, 6),
('2025-04-01', 8500.50, 'Transferencia', 'Desarrollo agrícola', 8, 7),
('2025-04-15', 1300.00, 'Efectivo', 'Fondo comunitario', 9, 8),
('2025-04-20', 2700.75, 'Transferencia', 'Educación superior', 10, 9),
('2025-05-02', 22000.00, 'Transferencia', 'Construcción de pozos', 7, 10);


INSERT INTO Donaciones (fecha_donacion, monto, metodo_pago, comentarios, id_proyecto, id_donante)
VALUES
('2024-12-05', 6000.00, 'Transferencia', 'Apoyo para expansión de infraestructura.', 101, 2),
('2024-12-15', 3500.00, 'Cheque', 'Donación para becas técnicas.', 101, 4),
('2024-01-05', 4200.00, 'Efectivo', 'Aporte complementario anual.', 101, 1),

('2024-12-18', 2500.00, 'Transferencia', 'Apoyo para mejoras agrícolas.', 102, 5),
('2024-01-10', 1800.00, 'Efectivo', 'Fondo para capacitación rural.', 102, 3),

('2024-12-20', 7000.00, 'Cheque', 'Aporte principal para salud comunitaria.', 103, 4),
('2024-01-15', 3000.00, 'Transferencia', 'Apoyo a centros comunitarios.', 103, 1),

('2024-12-22', 1500.00, 'Efectivo', 'Apoyo para programas juveniles.', 104, 2),
('2024-01-08', 3200.00, 'Transferencia', 'Financiamiento de talleres comunitarios.', 104, 5),
('2024-01-25', 2500.00, 'Cheque', 'Donación para infraestructura educativa.', 104, 3),

('2024-12-28', 4000.00, 'Transferencia', 'Apoyo a iniciativas verdes.', 105, 1),
('2024-01-12', 5000.00, 'Cheque', 'Fondo para equipamiento tecnológico.', 105, 4);


INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo)
VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,1,1),
(7,2,5),
(8,3,1),
(9,4,4),
(10,5,5),
(11,1,2),
(12,2,4),
(13,3,3),
(14,4,4),
(15,5,5),
(16,1,1),
(17,2,2),
(18,3,3),
(19,4,4),
(20,5,5), 
(21,1,1),
(22,2,2),
(23,3,3),
(24,5,5),
(25,4,4),
(26,2,2),
(27,3,3),
(28,4,4),
(29,5,5),
(30,1,1),
(31,3,3),
(32,2,2),
(33,4,4),
(34,1,1),
(35,2,2),
(36,3,3),
(37,5,5),
(38,1,1),
(39,2,2),
(40,1,1),
(41,1,1),
(42,2,2),
(43,3,3),
(44,4,4),
(45,5,5),
(46,2,2),
(47,3,3),
(48,4,4),
(49,1,1),
(50,5,5),
(51,3,3),
(52,2,2),
(53,4,4),
(54,5,5),
(55,1,1),
(56,2,2),
(57,4,4),
(58,5,5),
(59,3,3),
(60,2,2),
(61,1,1),
(62,2,2),
(63,3,3),
(64,4,4),
(65,5,5),
(66,2,2),
(67,1,1),
(68,5,5),
(69,4,4),
(70,2,2),
(71,3,3),
(72,2,2),
(73,1,1),
(74,3,3),
(75,5,5),
(76,2,2),
(77,1,1),
(78,4,4),
(79,5,5),
(80,1,1),
(81,2,2),
(82,3,3),
(83,1,1),
(84,4,4),
(85,5,5),
(86,2,2),
(87,1,1),
(88,4,4),
(89,5,5),
(90,2,2),
(91,4,4),
(92,2,2),
(93,3,3),
(94,1,1),
(95,5,5),
(96,3,3),
(97,4,4),
(98,5,5),
(99,1,1),
(100,2,2);
GO

INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo)
VALUES
-- Proyecto Aurora
(1, 1, 1), -- Coordinador de Proyecto
(1, 2, 2), -- Trabajador Social

-- Proyecto Solaris
(2, 3, 3), -- Facilitador Comunitario
(2, 4, 1), -- Coordinador de Proyecto
(2, 5, 6), -- Voluntario Especializado
(2, 6, 5), -- Promotor de Salud

-- Proyecto Vertex
(3, 7, 4), -- Administrador de Programa
(3, 8, 2), -- Trabajador Social
(3, 9, 6), -- Voluntario Especializado
(3, 10, 3), -- Facilitador Comunitario
(3, 11, 5), -- Promotor de Salud
(3, 12, 1), -- Coordinador de Proyecto

-- Proyecto Horizonte
(4, 13, 2), -- Trabajador Social
(4, 14, 5), -- Promotor de Salud
(4, 15, 6), -- Voluntario Especializado

-- Proyecto Atlas
(5, 16, 4), -- Administrador de Programa
(5, 17, 2), -- Trabajador Social
(5, 18, 1), -- Coordinador de Proyecto
(5, 19, 5), -- Promotor de Salud
(5, 20, 3); -- Facilitador Comunitario

-- Proyecto Atlas
INSERT INTO Contrato (id_empleado, id_proyecto, id_cargo)
VALUES
((SELECT id FROM Empleado WHERE nombre = 'José Martínez'), 21, 2),  -- Coordinador
((SELECT id FROM Empleado WHERE nombre = 'Ana Beltrán'), 21, 4);    -- Voluntario

-- Proyecto Aurora
INSERT INTO Contrato (id_empleado, id_proyecto, id_cargo)
VALUES
((SELECT id FROM Empleado WHERE nombre = 'Rosa Aguilar'), 22, 3);   -- Promotor Comunitario

-- Proyecto Horizonte
INSERT INTO Contrato (id_empleado, id_proyecto, id_cargo)
VALUES
((SELECT id FROM Empleado WHERE nombre = 'Pedro Juárez'), 23, 5);   -- Consultor Técnico

-- Proyecto Solaris
INSERT INTO Contrato (id_empleado, id_proyecto, id_cargo)
VALUES
((SELECT id FROM Empleado WHERE nombre = 'Marta Hidalgo'), 24, 4);  -- Voluntario

-- Proyecto Vertex
INSERT INTO Contrato (id_empleado, id_proyecto, id_cargo)
VALUES
((SELECT id FROM Empleado WHERE nombre = 'José Martínez'), 25, 2),  -- Coordinador
((SELECT id FROM Empleado WHERE nombre = 'Rosa Aguilar'), 25, 3);   -- Promotor Comunitario

-- ASIGNACIÓN DE EMPLEADOS A PROYECTOS (CONTRATOS)
INSERT INTO Contrato (id_empleado, id_proyecto, id_cargo)
VALUES
(31, 105, 2),  -- José Martínez - Coordinador
(32, 105, 4),  -- Ana Beltrán - Voluntario
(33, 101, 3),  -- Rosa Aguilar - Promotor Comunitario
(34, 104, 5),  -- Pedro Juárez - Consultor Técnico
(35, 102, 4),  -- Marta Hidalgo - Voluntario
(31, 103, 2),  -- José Martínez - Coordinador
(33, 103, 3);  -- Rosa Aguilar - Promotor Comunitario

-- tabla Contrato
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (1, 1, 2);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (1, 5, 3);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (1, 12, 1);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (1, 18, 4);

INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (2, 3, 1);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (2, 7, 4);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (2, 21, 2);

INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (3, 2, 4);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (3, 4, 3);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (3, 10, 1);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (3, 15, 2);

INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (4, 6, 1);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (4, 9, 5);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (4, 14, 3);

INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (5, 8, 2);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (5, 11, 4);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (5, 22, 5);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (5, 30, 1);

INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (6, 13, 2);
INSERT INTO Contrato (id_proyecto, id_empleado, id_cargo) VALUES (6, 16, 5);