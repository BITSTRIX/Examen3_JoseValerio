
USE MASTER
GO
DROP DATABASE BD_JoseValerio
GO

CREATE DATABASE BD_JoseValerio
GO

USE BD_JoseValerio
GO

CREATE TABLE Encuestas
(
NumeroEncuesta INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL,
FechaNacimiento DATE NOT NULL,
Correo VARCHAR(50) NOT NULL
)
GO


CREATE TABLE Partido
(
IDRegistro INT IDENTITY(1,1) PRIMARY KEY,
NumeroEncuesta INT NOT NULL,
Partido VARCHAR(10)NOT NULL,
CONSTRAINT fkNumeroEncuesta FOREIGN KEY(NumeroEncuesta) REFERENCES Encuestas(NumeroEncuesta)
)
GO

CREATE PROCEDURE SPCAgregar
@NOMBRE VARCHAR(50),
@FECHA DATE,
@CORREO VARCHAR(50),
@PARTIDO VARCHAR(10)
AS
BEGIN
    DECLARE @NumeroEncuesta INT;

    INSERT INTO Encuestas (Nombre, FechaNacimiento, Correo)
    VALUES (@NOMBRE, @FECHA, @CORREO);

    SET @NumeroEncuesta = SCOPE_IDENTITY();

    INSERT INTO Partido (NumeroEncuesta, Partido)
    VALUES (@NumeroEncuesta, @PARTIDO);
END;
GO

CREATE PROCEDURE SPCReporte
AS
BEGIN 
	SELECT 
	E.NumeroEncuesta AS 'NUMERO DE ENCUESTA',
	E.Nombre AS 'NOMBRE DEL ENCUESTADO',
	E.FechaNacimiento AS 'FECHA DE NACIMIENTO',
	E.Correo AS 'CORREO DEL ENCUESTADO',
	P.Partido AS 'PARTIDO'
	FROM Encuestas E
	INNER JOIN Partido P ON P.NumeroEncuesta = E.NumeroEncuesta;
	END
	GO

EXEC SPCAgregar 'Juan Pérez', '1990-05-15', 'juan.perez@example.com', 'PLN';
EXEC SPCAgregar 'María Rodríguez', '1985-08-25', 'maria.rodriguez@example.com', 'PUSC';
EXEC SPCAgregar 'Carlos González', '1998-02-10', 'carlos.gonzalez@example.com', 'PAC';
EXEC SPCAgregar 'Laura Fernández', '1993-11-30', 'laura.fernandez@example.com', 'PLN';


