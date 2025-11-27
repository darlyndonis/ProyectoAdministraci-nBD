-- ==========================================================
-- BASE DE DATOS: ONG "Manos Solidarias"
-- ==========================================================
CREATE DATABASE ONG_ManosSolidarias;
GO

USE ONG_ManosSolidarias;
GO

-- ==========================================================
-- 1. Tablas independientes (sin FK)
-- ==========================================================

select * from TipoDonante
select * from Tipo_beneficiario
select * from Tipo_beneficio

CREATE TABLE TipoDonante (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Pais (
    id INT PRIMARY KEY IDENTITY(1,1),
    pais VARCHAR(100) NOT NULL
);

CREATE TABLE Estado_Proyecto (
    id INT PRIMARY KEY IDENTITY(1,1),
    estado VARCHAR(100) NOT NULL
);

CREATE TABLE Tipo_beneficiario (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipo_beneficiario VARCHAR(100) NOT NULL
);

CREATE TABLE Tipo_beneficio (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipo_beneficio VARCHAR(100) NOT NULL
);

CREATE TABLE Cargo (
    id INT PRIMARY KEY IDENTITY(1,1),
    cargo VARCHAR(100) NOT NULL
);

-- ==========================================================
-- 2. Tablas dependientes de las anteriores
-- ==========================================================
CREATE TABLE Donante (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre_completo VARCHAR(150),
    nombre_organizacion VARCHAR(150),
    tipo_donante INT NOT NULL,
    email VARCHAR(120),
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    fecha_registro DATE,
    id_pais INT NOT NULL,
    FOREIGN KEY (tipo_donante) REFERENCES TipoDonante(id),
    FOREIGN KEY (id_pais) REFERENCES Pais(id)
);

CREATE TABLE Proyecto (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(150),
    descripcion TEXT,
    presupuesto DECIMAL(12,2),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_estado_proyecto INT NOT NULL,
    FOREIGN KEY (id_estado_proyecto) REFERENCES Estado_Proyecto(id)
);

CREATE TABLE Empleado (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    contacto VARCHAR(100),
    cargo VARCHAR(100),
    tipo_empleado VARCHAR(50),
    fecha_ingreso DATE
);

CREATE TABLE Donaciones (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha_donacion DATE,
    monto DECIMAL(12,2),
    metodo_pago VARCHAR(50),
    comentarios TEXT,
    id_proyecto INT NOT NULL,
    id_donante INT NOT NULL,
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id),
    FOREIGN KEY (id_donante) REFERENCES Donante(id)
);

CREATE TABLE Beneficiario (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    tipo_beneficiario INT NOT NULL,
    direccion VARCHAR(200),
    descripcion TEXT,
    fecha_registro DATE,
    id_proyecto INT NOT NULL,
    FOREIGN KEY (tipo_beneficiario) REFERENCES Tipo_beneficiario(id),
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
);

CREATE TABLE TipoBeneficio (
    id_beneficiario INT NOT NULL,
    id_tipo_beneficio INT NOT NULL,
    PRIMARY KEY (id_beneficiario, id_tipo_beneficio),
    FOREIGN KEY (id_beneficiario) REFERENCES Beneficiario(id),
    FOREIGN KEY (id_tipo_beneficio) REFERENCES Tipo_beneficio(id)
);

CREATE TABLE Zona_Impacto (
    id INT PRIMARY KEY IDENTITY(1,1),
    direccion VARCHAR(150),
    coordenadas VARCHAR(150),
    id_proyecto INT NOT NULL,
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
);

CREATE TABLE Objetivo (
    id INT PRIMARY KEY IDENTITY(1,1),
    descripcion TEXT,
    fecha_evaluacion DATE,
    id_proyecto INT NOT NULL,
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
);

CREATE TABLE Metrica (
    id INT PRIMARY KEY IDENTITY(1,1),
    descripcion TEXT,
    tipo_indicador VARCHAR(100),
    valor_obtenido DECIMAL(10,2),
    fecha_actualizacion DATE,
    id_objetivo INT NOT NULL,
    FOREIGN KEY (id_objetivo) REFERENCES Objetivo(id)
);

CREATE TABLE Contrato (
    id_contrato INT PRIMARY KEY IDENTITY(1,1),
    id_proyecto INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cargo INT NOT NULL,
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id),
    FOREIGN KEY (id_cargo) REFERENCES Cargo(id)
);
GO



--CREACION DE ROLES 
CREATE USER usuario_admin WITHOUT LOGIN;
GO

CREATE ROLE rol_admin;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO rol_admin;
GRANT CREATE VIEW TO rol_admin;
GO

ALTER ROLE rol_admin ADD MEMBER usuario_admin;
GO

EXECUTE AS USER = 'usuario_admin';
SELECT USER_NAME() AS Usuario_Actual;

-- Comprobación rápida: listar proyectos
SELECT TOP 5 nombre, presupuesto FROM Proyecto;

REVERT;
GO


-- Usuario y rol de recursos humanos
CREATE USER usuario_rrhh without login;
go

create role rol_rrhh;
go

-- Conceder permisos sobre las tablas correspondientes
GRANT SELECT, INSERT, UPDATE ON dbo.Empleado  TO rol_rrhh;
GRANT SELECT, INSERT, UPDATE ON dbo.Cargo     TO rol_rrhh;
GRANT SELECT, INSERT, UPDATE ON dbo.Contrato  TO rol_rrhh;
GO

-----el administrador debe asociar el usuario al rol 
ALTER ROLE rol_rrhh ADD MEMBER usuario_rrhh;
GO

EXECUTE AS USER = 'usuario_rrhh';
SELECT USER_NAME() AS UsuarioActual;

-- Pruebas de acceso
SELECT * FROM Empleado;
SELECT * FROM Cargo;
SELECT * FROM Contrato;

REVERT;
GO

----- Usuario y rol de proyectos
CREATE USER usuario_proyectos WITHOUT LOGIN;

CREATE ROLE rol_proyectos;

ALTER ROLE rol_proyectos ADD MEMBER usuario_proyectos;

GRANT SELECT, INSERT, UPDATE ON Proyecto TO rol_proyectos;
GRANT SELECT, INSERT, UPDATE ON Beneficiario TO rol_proyectos;
GRANT SELECT, INSERT, UPDATE ON Zona_Impacto TO rol_proyectos;
GRANT SELECT, INSERT, UPDATE ON Objetivo TO rol_proyectos;
GRANT SELECT, INSERT, UPDATE ON Metrica TO rol_proyectos;

--- user y rol de donaciones 

CREATE USER usuario_donaciones WITHOUT LOGIN;

CREATE ROLE rol_donaciones;

ALTER ROLE rol_donaciones ADD MEMBER usuario_donaciones;

GRANT SELECT, INSERT, UPDATE ON Donaciones TO rol_donaciones;
GO

GRANT SELECT, INSERT, UPDATE ON Donante TO rol_donaciones;
GO

GRANT SELECT ON Proyecto TO rol_donaciones;
GO

---Probando que funcione el rol 
EXECUTE AS USER = 'usuario_donaciones';
GO

SELECT * FROM Donaciones;
SELECT * FROM Donante;
SELECT * FROM Proyecto;

DELETE FROM Donaciones WHERE id = 1;

REVERT;
GO

-- Usuario y rol de Auditoria 
CREATE USER usuario_auditor WITHOUT LOGIN;
GO

CREATE ROLE rol_auditor;
GO

GRANT SELECT ON SCHEMA::dbo TO rol_auditor;
GO

-- el administrador debe asociar el usuario al rol
ALTER ROLE rol_auditor ADD MEMBER usuario_auditor;
GO

EXECUTE AS USER = 'usuario_auditor';
SELECT USER_NAME() AS Usuario_Actual;

SELECT nombre, descripcion FROM Proyecto;
SELECT nombre, apellido FROM Beneficiario;
SELECT monto, fecha_donacion FROM Donaciones;
REVERT;
GO

-- Migracion e importacion
USE ONG_ManosSolidarias;
GO

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

-- 1. TipoDonante
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.TipoDonante" queryout "C:\ONG_Manos_Solidarias\tipo_donante.csv" -c -t, -T -S localhost';

-- 2. Donante
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Donante" queryout "C:\ONG_Manos_Solidarias\donante.csv" -c -t, -T -S localhost';

-- 3. Proyecto
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Proyecto" queryout "C:\ONG_Manos_Solidarias\proyecto.csv" -c -t, -T -S localhost';

-- 4. Beneficiario
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Beneficiario" queryout "C:\ONG_Manos_Solidarias\beneficiario.csv" -c -t, -T -S localhost';

-- 5. Empleado
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Empleado" queryout "C:\ONG_Manos_Solidarias\empleado.csv" -c -t, -T -S localhost';

-- 6. Donaciones
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Donaciones" queryout "C:\ONG_Manos_Solidarias\donaciones.csv" -c -t, -T -S localhost';

-- 7. Metrica
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Metrica" queryout "C:\ONG_Manos_Solidarias\metrica.csv" -c -t, -T -S localhost';

-- 8. Contrato
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Contrato" queryout "C:\ONG_Manos_Solidarias\contrato.csv" -c -t, -T -S localhost';

-- 9. Cargo
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Cargo" queryout "C:\ONG_Manos_Solidarias\cargo.csv" -c -t, -T -S localhost';

-- 10. Estado_Proyecto
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Estado_Proyecto" queryout "C:\ONG_Manos_Solidarias\estado_proyecto.csv" -c -t, -T -S localhost';

-- 11. Pais
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Pais" queryout "C:\ONG_Manos_Solidarias\pais.csv" -c -t, -T -S localhost';

-- 12. Tipo_beneficiario
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Tipo_beneficiario" queryout "C:\ONG_Manos_Solidarias\tipo_beneficiario.csv" -c -t, -T -S localhost';

-- 13. Tipo_beneficio
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Tipo_beneficio" queryout "C:\ONG_Manos_Solidarias\tipo_beneficio.csv" -c -t, -T -S localhost';

-- 14. TipoBeneficio (tabla intermedia)
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.TipoBeneficio" queryout "C:\ONG_Manos_Solidarias\tipoBeneficio.csv" -c -t, -T -S localhost';

-- 15. Zona_Impacto
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Zona_Impacto" queryout "C:\ONG_Manos_Solidarias\zona_impacto.csv" -c -t, -T -S localhost';

-- 16. Objetivo
EXEC xp_cmdshell 'bcp "SELECT * FROM ONG_ManosSolidarias.dbo.Objetivo" queryout "C:\ONG_Manos_Solidarias\objetivo.csv" -c -t, -T -S localhost';

-- IMPORTACION DE ARCHIVOS
BULK INSERT TipoDonante
FROM 'C:\ImportarFundacion\tipo_donante.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Pais
FROM 'C:\ONG_Manos_Solidarias\pais.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Estado_Proyecto
FROM 'C:\ONG_Manos_Solidarias\estado_proyecto.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Tipo_beneficiario
FROM 'C:\ONG_Manos_Solidarias\tipo_beneficiario.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO


BULK INSERT Tipo_beneficio
FROM 'C:\ONG_Manos_Solidarias\tipo_beneficio.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO


BULK INSERT Cargo
FROM 'C:\ONG_Manos_Solidarias\cargo.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO


BULK INSERT Donante
FROM 'C:\ONG_Manos_Solidarias\donante.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO


BULK INSERT Proyecto
FROM 'C:\ONG_Manos_Solidarias\proyecto.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Empleado
FROM 'C:\ONG_Manos_Solidarias\empleado.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Beneficiario
FROM 'C:\ONG_Manos_Solidarias\beneficiario.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Donaciones
FROM 'C:\ONG_Manos_Solidarias\donaciones.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT TipoBeneficio
FROM 'C:\ONG_Manos_Solidarias\tipoBeneficio.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Zona_Impacto
FROM 'C:\ONG_Manos_Solidarias\zona_impacto.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Objetivo
FROM 'C:\ONG_Manos_Solidarias\objetivo.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Metrica
FROM 'C:\ONG_Manos_Solidarias\metrica.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Contrato
FROM 'C:\ONG_Manos_Solidarias\contrato.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

-------------------------------------------------------------
--Funcion ventana 1
-- Mostrar los proyectos con su estado, presupuesto, 
-- monto total donado y número de beneficiarios asociados.
-------------------------------------------------------------

WITH resumen AS (
    SELECT 
        p.id AS ID_Proyecto,
        p.nombre AS Proyecto,
        ep.estado AS Estado,
        p.presupuesto AS Presupuesto_USD,
        ISNULL(SUM(d.monto), 0) AS Total_Donado,
        COUNT(DISTINCT b.id) AS Beneficiarios
    FROM Proyecto p
    INNER JOIN Estado_Proyecto ep ON p.id_estado_proyecto = ep.id
    LEFT JOIN Donaciones d ON p.id = d.id_proyecto
    LEFT JOIN Beneficiario b ON p.id = b.id_proyecto
    GROUP BY p.id, p.nombre, ep.estado, p.presupuesto
)
SELECT
    *,
    DENSE_RANK() OVER(ORDER BY Total_Donado DESC) AS RankingDonaciones
FROM resumen
ORDER BY Total_Donado DESC;
GO

--Indice GROUP BY 
CREATE INDEX IX_Proyecto_Nombre
ON Proyecto(nombre);
GO

CREATE INDEX IX_Estado_Proyecto_Estado
ON Estado_Proyecto(estado);
GO

-------------------------------------------------------------
-- Funcion ventana 2
-- Total y promedio de donaciones por país
-------------------------------------------------------------
WITH datos AS (
        SELECT 
            pa.pais AS Pais,
            SUM(doa.monto) AS Total_Donado,
            ROUND(AVG(doa.monto), 2) AS Promedio_Donacion
        FROM Donaciones doa
        INNER JOIN Donante don ON doa.id_donante = don.id
        INNER JOIN Pais pa ON don.id_pais = pa.id
        GROUP BY pa.pais
    )
    SELECT 
        *,
        RANK() OVER(
            ORDER BY Total_Donado DESC
        ) AS Ranking_Pais
    FROM datos
    ORDER BY Total_Donado DESC;
GO

-- Índice para optimizar ya que pais es un texto corto y categórico dentro de GROUP BY
CREATE INDEX IX_Pais_Pais
ON Pais(pais);
GO

-------------------------------------------------------------
--Funcion Ventana 3
-- Mostrar los empleados y su cargo dentro de cada proyecto
-------------------------------------------------------------
SELECT 
    p.nombre AS Proyecto,
    e.nombre AS Empleado,
    c.cargo AS Cargo,
    e.tipo_empleado AS Tipo_Empleado,
    e.fecha_ingreso AS Fecha_Ingreso,

    ROW_NUMBER() OVER(
        PARTITION BY p.id
        ORDER BY e.fecha_ingreso
    ) AS OrdenIngreso,

    COUNT(e.id) OVER(
        PARTITION BY p.id
    ) AS TotalEmpleadosProyecto

FROM Proyecto p
LEFT JOIN Contrato ct ON p.id = ct.id_proyecto
LEFT JOIN Empleado e ON ct.id_empleado = e.id
LEFT JOIN Cargo c ON ct.id_cargo = c.id
ORDER BY p.nombre, OrdenIngreso;
GO

-- Índices para optimizar
--Este índice mejora el ORDER BY p.nombre, ya que evita ordenamiento completo en memoria

CREATE INDEX IX_Proyecto_Nombre
ON Proyecto(nombre);
GO

-------------------------------------------------------------
--Funcion Ventana 4
-- Mostrar las zonas de impacto activas con sus proyectos y fechas de ejecución
-------------------------------------------------------------
SELECT 
        z.direccion AS Zona_Impacto,
        p.nombre AS Proyecto,
        p.fecha_inicio,
        p.fecha_fin,
        ep.estado AS Estado_Proyecto,
        ROW_NUMBER() OVER(
            PARTITION BY z.direccion 
            ORDER BY p.fecha_inicio
        ) AS Orden_de_Inicio
    FROM Zona_Impacto z
    INNER JOIN Proyecto p 
        ON z.id_proyecto = p.id
    INNER JOIN Estado_Proyecto ep 
        ON p.id_estado_proyecto = ep.id
    ORDER BY 
        z.direccion,
        p.fecha_inicio;
GO

-- Índice para optimizar (Zonas de impacto)
--Se creó un índice sobre zona_impacto.direccion porque participa directamente en el ORDER BY
--y PARTITION BY, y es una columna de texto permitida para indexar según el módulo

CREATE INDEX IX_ZonaImpacto_Direccion
ON Zona_Impacto(direccion);
GO

-------------------------------------------------------------
--Funcion Ventana 5
-- Mostrar los proyectos con mejor eficiencia (total donado / presupuesto asignado)
-------------------------------------------------------------
    SELECT 
        p.nombre AS Proyecto,
        p.presupuesto AS Presupuesto_Asignado,
        ISNULL(SUM(d.monto),0) AS Total_Donado,
        ROUND(ISNULL(SUM(d.monto),0) / NULLIF(p.presupuesto,0) * 100,2) AS Porcentaje_Ejecutado,

        RANK() OVER(
            ORDER BY 
                ROUND(ISNULL(SUM(d.monto),0) / NULLIF(p.presupuesto,0) * 100,2) DESC
        ) AS Ranking_Ejecucion

    FROM Proyecto p
    LEFT JOIN Donaciones d ON p.id = d.id_proyecto
    GROUP BY p.nombre, p.presupuesto
    ORDER BY Porcentaje_Ejecutado DESC;
GO

--El indice necesario llamado IX_Proyecto_Nombre ya existe en la consulta numero 3 
-- y se usa porque participa en el GROUP BY y es una columna de tipo texto

-------------------------------------------------------------
--Funcion Ventana 6
-- Consulta de reporte de objetivos, métricas y resultados.
-------------------------------------------------------------
WITH datos AS (
    SELECT 
        p.nombre AS Proyecto,
        o.descripcion AS Objetivo,
        m.tipo_indicador AS Tipo_Indicador,
        m.valor_obtenido AS Valor_Obt,
        m.fecha_actualizacion AS Fecha_Act,
        DENSE_RANK() OVER(ORDER BY m.valor_obtenido DESC) AS RankingMetrica
    FROM Proyecto p
    INNER JOIN Objetivo o ON p.id = o.id_proyecto
    INNER JOIN Metrica m ON o.id = m.id_objetivo
)
SELECT *
FROM datos
WHERE RankingMetrica <= 10
ORDER BY RankingMetrica ASC; 
GO

-------------------------------------------------------------
-- Ejercicio 10
-- Listar los donantes y la cantidad de proyectos en los que han participado
-------------------------------------------------------------

BEGIN 
SELECT don.nombre_completo AS Donante, COUNT(DISTINCT d.id_proyecto) AS Proyectos_Aportados
FROM Donaciones d
JOIN Donante don ON d.id_donante = don.id
GROUP BY don.nombre_completo
ORDER BY Proyectos_Aportados DESC;
END; 
GO

-------------------------------------------------------------
--FUNCIONES
-------------------------------------------------------------
--Ejercicio 1
-- Crear función fn_ProyectosPorEstado(@estado) 
-- que devuelve los proyectos filtrados por su estado.
-------------------------------------------------------------
CREATE OR ALTER FUNCTION fn_ProyectosPorEstado(@estado VARCHAR(100))
RETURNS TABLE
AS
RETURN
	SELECT 
		p.id AS ID_Proyecto,
		p.nombre AS Proyecto,
		p.presupuesto AS Presupuesto,
		p.fecha_inicio,
		p.fecha_fin,
		ep.estado AS Estado,
		ISNULL(SUM(d.monto),0) AS Total_Donado
	FROM Proyecto p
	INNER JOIN Estado_Proyecto ep ON p.id_estado_proyecto = ep.id
	LEFT JOIN Donaciones d ON p.id = d.id_proyecto
	WHERE ep.estado = @estado
	GROUP BY p.id, p.nombre, p.presupuesto, p.fecha_inicio, p.fecha_fin, ep.estado;
GO

--Ejemplo de uso:
SELECT * FROM fn_ProyectosPorEstado('Planificación');
GO

-------------------------------------------------------------
--Ejercicio 2
-- Crear función fn_ClasificarImpacto() 
-- que clasifique los proyectos según el monto total donado.
-- Bajo < 5000, Medio 5000–15000, Alto > 15000
-------------------------------------------------------------
CREATE OR ALTER FUNCTION fn_ClasificarImpacto()
RETURNS TABLE
AS
RETURN
	SELECT 
		p.id AS ID_Proyecto,
		p.nombre AS Proyecto,
		ISNULL(SUM(d.monto), 0) AS Total_Donado,
		COUNT(DISTINCT b.id) AS Beneficiarios,
		CASE 
			WHEN ISNULL(SUM(d.monto), 0) < 5000 THEN 'Bajo impacto'
			WHEN ISNULL(SUM(d.monto), 0) BETWEEN 5000 AND 15000 THEN 'Impacto medio'
			ELSE 'Alto impacto'
		END AS Nivel_Impacto
	FROM Proyecto p
	LEFT JOIN Donaciones d ON p.id = d.id_proyecto
	LEFT JOIN Beneficiario b ON p.id = b.id_proyecto
	GROUP BY p.id, p.nombre;
GO

--Ejemplo de uso:
SELECT * FROM fn_ClasificarImpacto();
GO

-------------------------------------------------------------
-- Ejercicio 3
-- Función para calcular el total de donaciones de un proyecto
-------------------------------------------------------------
CREATE FUNCTION fn_TotalDonacionesProyecto (@idProyecto INT)
RETURNS DECIMAL(12,2)
AS
BEGIN
    DECLARE @total DECIMAL(12,2);
    SELECT @total = SUM(monto)
    FROM Donaciones
    WHERE id_proyecto = @idProyecto;
    RETURN ISNULL(@total, 0);
END;
GO

-- Probamos la funcion con el id del proyecto como parámetro
SELECT dbo.fn_TotalDonacionesProyecto(3) AS Total_Donado;

-- total de donaciones de todos los proyectos
SELECT 
    P.nombre AS Proyecto,
    dbo.fn_TotalDonacionesProyecto(P.id) AS Total_Donado
FROM Proyecto P;

-------------------------------------------------------------
-- Ejercicio 4 
-- Función para obtener la duración en días de un proyecto
-------------------------------------------------------------
CREATE FUNCTION fn_DuracionProyecto (@idProyecto INT)
RETURNS INT
AS
BEGIN
    DECLARE @dias INT;
    SELECT @dias = DATEDIFF(DAY, fecha_inicio, fecha_fin)
    FROM Proyecto
    WHERE id = @idProyecto;
    RETURN @dias;
END;
GO

-- Ver la duración en días de todos los proyectos
SELECT 
    p.nombre AS Proyecto,
    dbo.fn_DuracionProyecto(p.id) AS Duracion_Dias
FROM Proyecto P;

----------------------------------------------------------------------------
--Ejercicio 5
--Función para calcular el total donado por un donante
--Recibe como parámetro el id_donante y devuelve el monto total que ha donado.
------------------------------------------------------------------------------

CREATE OR ALTER FUNCTION fn_TotalDonado(@ID_DONANTE INT)
RETURNS DECIMAL(12,2)
AS
BEGIN
	DECLARE @TOTAL DECIMAL(12,2);
	SELECT @TOTAL = SUM(DN.MONTO)
	FROM DONACIONES DN
	WHERE DN.ID_DONANTE = @ID_DONANTE;
	RETURN ISNULL(@TOTAL, 0);
END;
GO

-- Formas de uso: 
SELECT DBO.FN_TOTALDONADO(1) AS TOTAL_DONADO;


SELECT 
	D.NOMBRE_COMPLETO AS DONANTE,
	DBO.FN_TOTALDONADO(D.ID) AS TOTAL_DONADO
FROM DONANTE D;
GO

-----------------------------------------------------------------------------------------
--Ejercicio 6
--Crear una función que muestre todas las donaciones realizadas a un proyecto específico, 
--incluyendo el nombre del donante, el monto y la fecha.
------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION fn_DonacionesRealizadas(@id_proyecto int)
RETURNS TABLE
AS
RETURN
	SELECT 
		P.ID AS ID_PROYECTO,
		P.NOMBRE AS PROYECTO,
		D.NOMBRE_COMPLETO AS DONANTE,
		SUM(DN.MONTO) AS TOTAL_DONADO,
		DN.FECHA_DONACION
	FROM DONACIONES DN
	INNER JOIN DONANTE D ON DN.ID_DONANTE = D.ID
	INNER JOIN PROYECTO P ON DN.ID_PROYECTO = P.ID
	WHERE P.ID = @ID_PROYECTO
	GROUP BY P.ID, P.NOMBRE, D.NOMBRE_COMPLETO, DN.FECHA_DONACION;
GO


SELECT * FROM DBO.FN_DONACIONESREALIZADAS(1);
GO

-------------------------------------------------------------
-- Ejercicio 7
-- Obtener el nombre del país de un donante
-------------------------------------------------------------

CREATE OR ALTER FUNCTION fn_PaisDonante (@idDonante INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @pais VARCHAR(100);
    SELECT @pais = p.pais
    FROM Donante d
    INNER JOIN Pais p ON d.id_pais = p.id
    WHERE d.id = @idDonante;
    RETURN ISNULL(@pais, 'No registrado');
END;
GO

SELECT 
    d.id AS ID_Donante,
    d.nombre_completo AS Donante,
    dbo.fn_PaisDonante(d.id) AS Pais
FROM Donante d;

-------------------------------------------------------------
--Triggers
-------------------------------------------------------------

-------------------------------------------------------------
--Ejercicio 1 
-- Crear triggers para actualizar el campo total_donado 
-- en la tabla Proyecto después de insertar o eliminar donaciones.
-------------------------------------------------------------
ALTER TABLE Proyecto ADD total_donado DECIMAL(12,2) DEFAULT 0;

-- Trigger AFTER INSERT
CREATE OR ALTER TRIGGER trg_Donacion_Insert
ON Donaciones
AFTER INSERT
AS
BEGIN
	-- Actualiza el total donado del proyecto correspondiente
	UPDATE Proyecto
	SET total_donado = total_donado + i.monto
	FROM Proyecto p
	INNER JOIN inserted i ON p.id = i.id_proyecto;

	PRINT 'Se actualizó el total donado del proyecto (nueva donación).';
END;
GO

-------------------------------------------------------------
--Ejercicio 2
--Trigger AFTER DELETE
-------------------------------------------------------------
CREATE OR ALTER TRIGGER trg_Donacion_Delete
ON Donaciones
AFTER DELETE
AS
BEGIN
	-- Resta el monto eliminado del total del proyecto
	UPDATE Proyecto
	SET total_donado = total_donado - d.monto
	FROM Proyecto p
	INNER JOIN deleted d ON p.id = d.id_proyecto;

	PRINT 'Se actualizó el total donado del proyecto (donación eliminada).';
END;
GO

INSERT INTO Donaciones (fecha_donacion, monto, metodo_pago, comentarios, id_proyecto, id_donante)
VALUES (GETDATE(), 500.00, 'Transferencia', 'Prueba de trigger insert', 1, 1);


-- Actualizar los registros del total donacion para que no sea el total donado + NULL 

UPDATE Proyecto
SET total_donado = 0
WHERE total_donado IS NULL;


SELECT id, nombre, total_donado 
FROM Proyecto
WHERE id = 1;

-------------------------------------------------------------
--Ejercicio 3
-- Trigger: registrar cambio de estado de proyecto
-------------------------------------------------------------
CREATE TABLE Historial_EstadoProyecto (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_proyecto INT,
    estado_anterior INT,
    nuevo_estado INT,
    fecha_cambio DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
);
GO

CREATE OR ALTER TRIGGER trg_ActualizarEstadoProyecto
ON Proyecto
AFTER UPDATE
AS
BEGIN
    IF UPDATE(id_estado_proyecto)
    BEGIN
        INSERT INTO Historial_EstadoProyecto (id_proyecto, estado_anterior, nuevo_estado)
        SELECT i.id, d.id_estado_proyecto, i.id_estado_proyecto
        FROM inserted i
        INNER JOIN deleted d ON i.id = d.id;
    END
END;
GO

-- verificamos la tabla que hizo el trigger
SELECT * FROM Historial_EstadoProyecto;

-- realizamos un update en la tabla proyecto
UPDATE Proyecto
SET id_estado_proyecto = 3   -- por ejemplo, "Completado"
WHERE id = 2;

-- aqui visualizamos los cambios:
SELECT * FROM Historial_EstadoProyecto;

--------------------------------------------------------
--Ejercicio 4
--Trigger: Validar Donacion Antes De Insertar
--------------------------------------------------------

CREATE TRIGGER trg_ValidarDonacionAntesDeInsertar
ON Donaciones
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si algún registro no cumple las validaciones
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN Donante d ON i.id_donante = d.id
        WHERE i.monto <= 0 OR d.id IS NULL
    )
    BEGIN
        RAISERROR('Error: El monto debe ser mayor a 0 y el donante debe existir.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Si todo está correcto, insertar los datos válidos
    INSERT INTO Donaciones (id_donante, id_proyecto, monto, fecha_donacion)
    SELECT id_donante, id_proyecto, monto, fecha_donacion
    FROM inserted;

    PRINT 'Donación registrada correctamente.';
END;
GO

-----Prueba
INSERT INTO Donaciones (id_donante, id_proyecto, monto, fecha_donacion)
VALUES (1, 2, 150.00, '2025-10-03');

-------------------------------------------------------------
--Ejercicio 5 
-- Evitar que se registre un proyecto con presupuesto menor a 1000
-------------------------------------------------------------

CREATE TRIGGER trg_ValidarPresupuestoProyecto
ON Proyecto
FOR INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE presupuesto < 1000)
    BEGIN
        RAISERROR('El presupuesto mínimo de un proyecto debe ser $1,000.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

--prueba (debe de fallar)
INSERT INTO Proyecto (nombre, descripcion, presupuesto, fecha_inicio, fecha_fin, id_estado_proyecto)
VALUES ('Proyecto Inválido', 'Debe fallar por presupuesto bajo.', 800, '2025-11-01', '2025-12-01', 1);


-------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS
-------------------------------------------------------------

-------------------------------------------------------------
--Ejercicio 1
-- Crear procedimiento sp_EliminarContrato
-- que elimine un contrato según su ID.
-------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_EliminarContrato
	@id_contrato INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Contrato WHERE id_contrato = @id_contrato)
	BEGIN
		PRINT 'El contrato no existe.';
		RETURN;
	END

	DELETE FROM Contrato WHERE id_contrato = @id_contrato;
	PRINT 'Contrato eliminado correctamente.';
END;
GO

--Ejemplo de uso:
EXEC sp_EliminarContrato 2;
GO

-------------------------------------------------------------
--Ejercicio 2
--Agregar una nueva donación
-------------------------------------------------------------

CREATE OR ALTER PROCEDURE sp_AgregarDonacion
    @fecha DATE,
    @monto DECIMAL(12,2),
    @metodo VARCHAR(50),
    @comentarios TEXT,
    @idProyecto INT,
    @idDonante INT
AS
BEGIN
    INSERT INTO Donaciones (fecha_donacion, monto, metodo_pago, comentarios, id_proyecto, id_donante)
    VALUES (@fecha, @monto, @metodo, @comentarios, @idProyecto, @idDonante);
END;
GO

-- probamos el procedimiento almacenado insertando 
EXEC sp_AgregarDonacion 
@fecha = '2025-11-07', 
@monto = 2500.00, 
@metodo = 'Transferencia',
@comentarios = 'Donación de prueba para verificación del procedimiento almacenado',
@idProyecto = 1,
@idDonante = 2;

-- verificamos si se insertó correctamente
SELECT * FROM Donaciones WHERE comentarios LIKE '%verificación%';

-------------------------------------------------------------
--Ejercicio 3
--  Actualizar el estado de un proyecto
-------------------------------------------------------------

CREATE OR ALTER PROCEDURE sp_ActualizarEstadoProyecto
    @idProyecto INT,
    @nuevoEstado INT
AS
BEGIN
    UPDATE Proyecto
    SET id_estado_proyecto = @nuevoEstado
    WHERE id = @idProyecto;
END;
GO

-- verificamos estado actual del proyecto
SELECT id, nombre, id_estado_proyecto FROM Proyecto WHERE id = 1;
SELECT * FROM Estado_Proyecto;

-- ejecutamos el procedimiento para cambiar el estado, por ejemplo: 'Cancelado'
EXEC sp_ActualizarEstadoProyecto @idProyecto = 1, @nuevoEstado = 5; 

-- volvemos a verificar estado actual del proyecto
SELECT id, nombre, id_estado_proyecto FROM Proyecto WHERE id = 1;


--------------------------------------------------
--Ejercicio 4
--Registrar una nueva donación
--Inserta un registro en la tabla Donacion y actualiza el 
--total recaudado del proyecto correspondiente.
------------------------------------------------------

CREATE OR ALTER PROCEDURE sp_RegistrarDonacion
    @id_donante INT,
    @id_proyecto INT,
    @monto DECIMAL(10,2),
    @fecha_donacion DATE,
	@metodo_pago NVARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Donaciones(id_donante, id_proyecto, monto, metodo_pago, fecha_donacion)
    VALUES (@id_donante, @id_proyecto, @monto, @metodo_pago, @fecha_donacion);

  
    UPDATE Proyecto
    SET presupuesto = ISNULL(presupuesto, 0) + @monto
    WHERE id = @id_proyecto;

    PRINT 'Donación registrada y total del proyecto actualizado correctamente.';
END;
GO
----comprobar
EXEC sp_RegistrarDonacion 
    @id_donante = 1,
    @id_proyecto = 2,
    @monto = 150.00,
	@metodo_pago = 'Cheque',
    @fecha_donacion = '2025-10-03';

SELECT * FROM Donaciones;
SELECT nombre, presupuesto FROM Proyecto;

--------------------------------------------------
--Ejercicio 5
-- 1️.Registrar nuevo beneficiario
--------------------------------------------------

CREATE PROCEDURE sp_RegistrarBeneficiario
    @nombre VARCHAR(100),
    @apellido VARCHAR(100),
    @tipo INT,
    @direccion VARCHAR(200),
    @descripcion TEXT,
    @fecha DATE,
    @idProyecto INT
AS
BEGIN
    INSERT INTO Beneficiario (nombre, apellido, tipo_beneficiario, direccion, descripcion, fecha_registro, id_proyecto)
    VALUES (@nombre, @apellido, @tipo, @direccion, @descripcion, @fecha, @idProyecto);
END;
GO

--------------------------------------------------
--Ejercicio 6
-- Mostrar resumen de donaciones por tipo de donante
--------------------------------------------------

CREATE PROCEDURE sp_ResumenPorTipoDonante
AS
BEGIN
    SELECT td.tipo AS TipoDonante, SUM(d.monto) AS Total_Donado
    FROM Donaciones d
    JOIN Donante don ON d.id_donante = don.id
    JOIN TipoDonante td ON don.tipo_donante = td.id
    GROUP BY td.tipo
    ORDER BY Total_Donado DESC;
END;
GO

-------------------------------------------------------------
--VISTAS
-------------------------------------------------------------
-- ESQUEMAS 

-- CREACION DE ESQUEMAS

USE ONG_ManosSolidarias;
GO

-- Esquema para catálogos (tablas estáticas)
CREATE SCHEMA catalogos AUTHORIZATION dbo;
GO

-- Esquema para operaciones principales (proyectos, donantes, etc.)
CREATE SCHEMA operaciones AUTHORIZATION dbo;
GO

-- Esquema para evaluación y métricas
CREATE SCHEMA evaluacion AUTHORIZATION dbo;
GO

-- MOVER LAS TABLAS A CADA ESQUEMA

-------------------------
--   ESQUEMA CATALOGOS --
-------------------------
ALTER SCHEMA catalogos TRANSFER dbo.Pais;
ALTER SCHEMA catalogos TRANSFER dbo.Estado_Proyecto;
ALTER SCHEMA catalogos TRANSFER dbo.TipoDonante;
ALTER SCHEMA catalogos TRANSFER dbo.Tipo_beneficiario;
ALTER SCHEMA catalogos TRANSFER dbo.Tipo_beneficio;
ALTER SCHEMA catalogos TRANSFER dbo.Cargo;
ALTER SCHEMA catalogos TRANSFER dbo.Zona_Impacto;
GO


-------------------------
--  ESQUEMA OPERACIONES --
-------------------------
ALTER SCHEMA operaciones TRANSFER dbo.Donante;
ALTER SCHEMA operaciones TRANSFER dbo.Donaciones;
ALTER SCHEMA operaciones TRANSFER dbo.Proyecto;
ALTER SCHEMA operaciones TRANSFER dbo.Beneficiario;
ALTER SCHEMA operaciones TRANSFER dbo.TipoBeneficio;
GO


-------------------------
--  ESQUEMA EVALUACION --
-------------------------
ALTER SCHEMA evaluacion TRANSFER dbo.Objetivo;
ALTER SCHEMA evaluacion TRANSFER dbo.Metrica;
GO

-- ASIGNAR PERMISOS POR ESQUEMA
-- PERMISOS PARA EL ESQUEMA CATALOGOS
-- Lectura para todos los roles operativos
GRANT SELECT ON SCHEMA::catalogos TO rol_proyectos;
GRANT SELECT ON SCHEMA::catalogos TO rol_donaciones;
GRANT SELECT ON SCHEMA::catalogos TO rol_auditor;

-- Solo el administrador puede modificar
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::catalogos TO rol_admin;
GO

-- PERMISOS PARA EL ESQUEMA OPERACIONES
-- Admin tiene control total
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::operaciones TO rol_admin;

-- Proyectos
GRANT SELECT, INSERT, UPDATE ON SCHEMA::operaciones TO rol_proyectos;

-- Donaciones (solo lo que aplica)
GRANT SELECT, INSERT, UPDATE ON operaciones.Donaciones TO rol_donaciones;
GRANT SELECT, INSERT, UPDATE ON operaciones.Donante TO rol_donaciones;
GRANT SELECT ON operaciones.Proyecto TO rol_donaciones;

-- Auditor (solo lectura)
GRANT SELECT ON SCHEMA::operaciones TO rol_auditor;
GO

-- PERMISOS PARA EL ESQUEMA EVALLUACION
-- Admin control total
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::evaluacion TO rol_admin;

-- Proyectos
GRANT SELECT, INSERT, UPDATE ON SCHEMA::evaluacion TO rol_proyectos;

-- Donaciones sólo lectura
GRANT SELECT ON SCHEMA::evaluacion TO rol_donaciones;

-- Auditor lectura total
GRANT SELECT ON SCHEMA::evaluacion TO rol_auditor;
GO

-- VER LOS ESQUEMAS Y SUS OBJETOS
SELECT name AS Esquema, USER_NAME(principal_id) AS Propietario
FROM sys.schemas;

SELECT 
    s.name AS Esquema,
    t.name AS Tabla
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
ORDER BY s.name, t.name;

-- VER PERMISOS ASIGNADOS A LOS ROLES
SELECT 
    dp.name AS Rol,
    dp2.name AS Usuario,
    o.name AS Objeto,
    p.permission_name AS Permiso
FROM sys.database_permissions p
JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
LEFT JOIN sys.database_principals dp2 ON dp.principal_id = dp2.principal_id
LEFT JOIN sys.objects o ON p.major_id = o.object_id
ORDER BY Rol, Objeto;

-- PROBAR PERMISOS 
EXECUTE AS USER = 'usuario_donaciones';
SELECT * FROM operaciones.Donaciones;
SELECT * FROM operaciones.Donante;
SELECT * FROM catalogos.Pais;
REVERT;
GO

EXECUTE AS USER = 'usuario_proyectos';
SELECT * FROM operaciones.Proyecto;
SELECT * FROM evaluacion.Objetivo;
REVERT;
GO


SELECT 
    p.nombre AS Proyecto,
    e.nombre AS Empleado,
    c.cargo AS Cargo,
    e.tipo_empleado AS Tipo_Empleado,
    e.fecha_ingreso AS Fecha_Ingreso,

    ROW_NUMBER() OVER(
        PARTITION BY p.id
        ORDER BY e.fecha_ingreso
    ) AS OrdenIngreso,

    COUNT(e.id) OVER(
        PARTITION BY p.id
    ) AS TotalEmpleadosProyecto

FROM Proyecto p
LEFT JOIN Contrato ct ON p.id = ct.id_proyecto
LEFT JOIN Empleado e ON ct.id_empleado = e.id
LEFT JOIN Cargo c ON ct.id_cargo = c.id
ORDER BY p.nombre, OrdenIngreso;
GO

SELECT 
        z.direccion AS Zona_Impacto,
        p.nombre AS Proyecto,
        p.fecha_inicio,
        p.fecha_fin,
        ep.estado AS Estado_Proyecto,
        ROW_NUMBER() OVER(
            PARTITION BY z.direccion 
            ORDER BY p.fecha_inicio
        ) AS Orden_de_Inicio
    FROM Zona_Impacto z
    INNER JOIN Proyecto p 
        ON z.id_proyecto = p.id
    INNER JOIN Estado_Proyecto ep 
        ON p.id_estado_proyecto = ep.id
    ORDER BY 
        z.direccion,
        p.fecha_inicio;
GO

    SELECT 
        p.nombre AS Proyecto,
        p.presupuesto AS Presupuesto_Asignado,
        ISNULL(SUM(d.monto),0) AS Total_Donado,
        ROUND(ISNULL(SUM(d.monto),0) / NULLIF(p.presupuesto,0) * 100,2) AS Porcentaje_Ejecutado,

        RANK() OVER(
            ORDER BY 
                ROUND(ISNULL(SUM(d.monto),0) / NULLIF(p.presupuesto,0) * 100,2) DESC
        ) AS Ranking_Ejecucion

    FROM Proyecto p
    LEFT JOIN Donaciones d ON p.id = d.id_proyecto
    GROUP BY p.nombre, p.presupuesto
    ORDER BY Porcentaje_Ejecutado DESC;
GO

--- VISTAS
CREATE OR ALTER VIEW v_EmpleadosPorProyecto AS
SELECT 
    p.nombre AS Proyecto,
    e.nombre AS Empleado,
    c.cargo AS Cargo,
    e.tipo_empleado AS Tipo_Empleado,
    e.fecha_ingreso AS Fecha_Ingreso,

    ROW_NUMBER() OVER(
        PARTITION BY p.id
        ORDER BY e.fecha_ingreso
    ) AS OrdenIngreso,

    COUNT(e.id) OVER(
        PARTITION BY p.id
    ) AS TotalEmpleadosProyecto

FROM Proyecto p
LEFT JOIN Contrato ct ON p.id = ct.id_proyecto
LEFT JOIN Empleado e ON ct.id_empleado = e.id
LEFT JOIN Cargo c ON ct.id_cargo = c.id;
GO


CREATE OR ALTER VIEW v_ZonasProyecto AS
SELECT 
    z.direccion AS Zona_Impacto,
    p.nombre AS Proyecto,
    p.fecha_inicio,
    p.fecha_fin,
    ep.estado AS Estado_Proyecto,

    ROW_NUMBER() OVER(
        PARTITION BY z.direccion 
        ORDER BY p.fecha_inicio
    ) AS Orden_de_Inicio

FROM Zona_Impacto z
INNER JOIN Proyecto p ON z.id_proyecto = p.id
INNER JOIN Estado_Proyecto ep ON p.id_estado_proyecto = ep.id;
GO


CREATE OR ALTER VIEW v_EjecucionDonaciones AS
SELECT 
    p.nombre AS Proyecto,
    p.presupuesto AS Presupuesto_Asignado,
    ISNULL(SUM(d.monto),0) AS Total_Donado,
    ROUND(ISNULL(SUM(d.monto),0) / NULLIF(p.presupuesto,0) * 100,2) AS Porcentaje_Ejecutado,

    RANK() OVER(
        ORDER BY 
            ROUND(ISNULL(SUM(d.monto),0) / NULLIF(p.presupuesto,0) * 100,2) DESC
    ) AS Ranking_Ejecucion

FROM Proyecto p
LEFT JOIN Donaciones d ON p.id = d.id_proyecto
GROUP BY p.nombre, p.presupuesto;
GO



--Ejercicio 1
-- Crear vista vw_ResumenProyectos 
-- para reportes y conexión Power BI.
-------------------------------------------------------------
CREATE OR ALTER VIEW vw_ResumenProyectos AS
SELECT 
	p.id AS ID_Proyecto,
	p.nombre AS Proyecto,
	ep.estado AS Estado,
	p.presupuesto AS Presupuesto,
	ISNULL(SUM(d.monto), 0) AS Total_Donado,
	COUNT(DISTINCT b.id) AS Beneficiarios,
	p.fecha_inicio,
	p.fecha_fin
FROM Proyecto p
	INNER JOIN Estado_Proyecto ep ON p.id_estado_proyecto = ep.id
	LEFT JOIN Donaciones d ON p.id = d.id_proyecto
	LEFT JOIN Beneficiario b ON p.id = b.id_proyecto
GROUP BY p.id, p.nombre, ep.estado, p.presupuesto, p.fecha_inicio, p.fecha_fin;
GO

--Ejemplo de uso:
SELECT * FROM vw_ResumenProyectos;
GO


-------------------------- AUDITORIA COMPLETA ------------------------------

--Auditoria: en nuestro caso:
--La auditoría creada sirve para registrar y monitorear todas las acciones importantes que los 
--usuarios realizan en la base de datos

-- 1) Crear la Auditoría del Servidor (archivo de logs)
USE master;
GO

-- Crear la carpeta de auditoría
-- C:\SQLAudit\
-- SQL Server debe tener permisos para escribir allí.

CREATE SERVER AUDIT AuditONG
TO FILE (
    FILEPATH = 'C:\SQLAudit\',   -- Ruta del archivo
    MAXSIZE = 100 MB,
    MAX_FILES = 100               -- retención de logs
)
WITH (
    QUEUE_DELAY = 1000,
    ON_FAILURE = CONTINUE
);
GO

ALTER SERVER AUDIT AuditONG WITH (STATE = ON);
GO

-- 2) Auditoría a nivel servidor (logins, fallos, permisos)

CREATE SERVER AUDIT SPECIFICATION ServerAuditSpecONG
FOR SERVER AUDIT AuditONG
    ADD (SUCCESSFUL_LOGIN_GROUP),
    ADD (FAILED_LOGIN_GROUP),
    ADD (LOGOUT_GROUP),
    ADD (SERVER_PERMISSION_CHANGE_GROUP),
    ADD (DATABASE_PERMISSION_CHANGE_GROUP),
    ADD (SCHEMA_OBJECT_PERMISSION_CHANGE_GROUP)
WITH (STATE = ON);
GO


-- 3) Auditoría a nivel Base de Datos ONG_ManosSolidarias

USE ONG_ManosSolidarias;
GO

-- 3.1) Auditar eventos DDL
CREATE DATABASE AUDIT SPECIFICATION AuditDB_ONG
FOR SERVER AUDIT AuditONG
    ADD (SCHEMA_OBJECT_CHANGE_GROUP)
WITH (STATE = ON);
GO

-- 3.1.1 Realizamos esto antes de ejecutar lo que le sigue
ALTER DATABASE AUDIT SPECIFICATION AuditDB_ONG
WITH (STATE = OFF);

-- 3.2) Auditar DML en TODAS las tablas de la bd
ALTER DATABASE AUDIT SPECIFICATION AuditDB_ONG
ADD (INSERT, UPDATE, DELETE ON dbo.TipoDonante BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Pais BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Estado_Proyecto BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Tipo_beneficiario BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Tipo_beneficio BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Cargo BY PUBLIC),

ADD (INSERT, UPDATE, DELETE ON dbo.Donante BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Proyecto BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Empleado BY PUBLIC),

ADD (INSERT, UPDATE, DELETE ON dbo.Beneficiario BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.TipoBeneficio BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Zona_Impacto BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Objetivo BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Metrica BY PUBLIC),
ADD (INSERT, UPDATE, DELETE ON dbo.Contrato BY PUBLIC)
;
GO

-- Auditoria SELECT en la tabla Donaciones por ser contenido sensible
ALTER DATABASE AUDIT SPECIFICATION AuditDB_ONG
ADD (SELECT ON dbo.Donaciones BY PUBLIC);
GO

-- 3.3) Activar todo
ALTER DATABASE AUDIT SPECIFICATION AuditDB_ONG WITH (STATE = ON);
GO

-- 4) Consulta de Logs (para ver eventos)
-- Consultar TODOS los eventos:
SELECT *
FROM sys.fn_get_audit_file('C:\SQLAudit\*.sqlaudit', DEFAULT, DEFAULT)
ORDER BY event_time DESC;

-- Ver solo DML:
SELECT event_time, action_id, statement, object_name, database_name, session_server_principal_name
FROM sys.fn_get_audit_file('C:\SQLAudit\*.sqlaudit', DEFAULT, DEFAULT)
WHERE action_id IN ('UP', 'IN', 'DL')
ORDER BY event_time DESC;

-- Ver fallos de inicio de sesion
SELECT event_time, session_server_principal_name, statement, additional_information
FROM sys.fn_get_audit_file('C:\SQLAudit\*.sqlaudit', DEFAULT, DEFAULT)
WHERE action_id = 'LGIF'
ORDER BY event_time DESC;

-- Ver DDL (cambios de estructura):
SELECT event_time, action_id, statement, object_name, database_name
FROM sys.fn_get_audit_file('C:\SQLAudit\*.sqlaudit', DEFAULT, DEFAULT)
WHERE action_id LIKE '%DDL%'
   OR action_id IN ('CR', 'AL', 'DR')
ORDER BY event_time DESC;

-- Para ver si estan habilitadas las auditorias
SELECT name, is_state_enabled
FROM sys.server_audits;

SELECT name, is_state_enabled 
FROM sys.server_audit_specifications;

SELECT name, is_state_enabled 
FROM sys.database_audit_specifications;

-- Prueba 1
INSERT INTO Donante (nombre_completo, tipo_donante, id_pais)
VALUES ('Carla María Fuentes', 1, 1);

-- Prueba 2
UPDATE Donante
SET tipo_donante = 2
WHERE nombre_completo = 'Carla María Fuentes';

-- Prueba 3
DELETE FROM Donante
WHERE nombre_completo = 'Carla María Fuentes';

-- Prueba 4
SELECT * FROM Donaciones;

-- Prueba 5: Login exitoso
-- Cierra sesión de SSMS y vuelve a iniciar.

-- Prueba 6: Login fallido
-- Ingresa una contraseña incorrecta adrede.

-- Consultar los registros del archivo de auditoría
SELECT *
FROM sys.fn_get_audit_file ('C:\SQLAudit\*', NULL, NULL);

-- Ver solo las operaciones de tablas
SELECT event_time, server_principal_name, object_name, statement, action_id
FROM sys.fn_get_audit_file ('C:\SQLAudit\*', NULL, NULL)
WHERE action_id IN ('IN', 'UP', 'DL'); -- Insert, Update, Delete

-- Ver solo los logins fallidos
SELECT event_time, server_principal_name, session_server_principal_name, statement, action_id
FROM sys.fn_get_audit_file ('C:\SQLAudit\*', NULL, NULL)
WHERE action_id = 'LGIF'; -- Failed Login

-- Ver solo logins exitosos
SELECT event_time, server_principal_name, action_id
FROM sys.fn_get_audit_file('C:\SQLAudit\*', NULL, NULL)
WHERE action_id = 'LGIS'; -- Login Success

-- Ver solo operaciones de donaciones
SELECT event_time, action_id, object_name, statement
FROM sys.fn_get_audit_file ('C:\SQLAudit\*', NULL, NULL)
WHERE object_name = 'Donaciones';


-------------------------------- FIN AUDITORIA ----------------------------------------------------------

--------------------------------Backup mixto-------------------------------------------------------------
USE master;
GO

--backup FULL 
BACKUP DATABASE ONG_ManosSolidarias
TO DISK = 'C:\Backups\ONG_ManosSolidarias_FULL.bak'
WITH FORMAT, CHECKSUM, COMPRESSION, STATS = 10;
GO

--backup diferencial
BACKUP DATABASE ONG_ManosSolidarias
TO DISK = 'C:\Backups\ONG_ManosSolidarias_DIFF.bak'
WITH DIFFERENTIAL, CHECKSUM, COMPRESSION, STATS = 10;
GO

--backup LOG
BACKUP LOG ONG_ManosSolidarias
TO DISK = 'C:\Backups\ONG_ManosSolidarias_LOG.trn'
WITH INIT, CHECKSUM, COMPRESSION, STATS = 10;

















