--Crea un procedimiento que inserte una nueva película, y que al mismo 
--tiempo inserte un registro en Historial Visualización de esa misma película a cualquier usuario

CREATE PROCEDURE sp_InsertarNuevaPeliculaRegistroHistorial
@UsuarioID INT,
@Titulo NVARCHAR (100),
@Genero NVARCHAR (50),
@FechaEstreno DATE 
AS
BEGIN 
	BEGIN TRANSACTION;
	BEGIN TRY 
	INSERT INTO Peliculas (Titulo, Genero, FechaEstreno)
	VALUES (@Titulo, @Genero, @FechaEstreno);
	
	DECLARE @PeliculaID INT;
	SET @PeliculaID=SCOPE_IDENTITY();

	INSERT INTO HistorialVisualizacion (UsuarioID,PeliculaID,FechaVisualizacion)
	VALUES (@UsuarioID, @PeliculaID,GETDATE());

	COMMIT TRANSACTION;
END TRY
	BEGIN CATCH 
	ROLLBACK TRANSACTION;
		DECLARE @ErrorMessage NVARCHAR(4000);
		SET @ErrorMessage = ERROR_MESSAGE();
		PRINT @ErrorMessage;
END CATCH;
END;

SELECT * FROM HistorialVisualizacion
SELECT * FROM Peliculas

EXEC sp_InsertarNuevaPeliculaRegistroHistorial '13','Megamente', 'Infantil', '2010-12-16'

-- Crea un procedimiento que permita insertar un usuario, con su respectiva
-- suscripción y una visualización de cualquier película

CREATE PROCEDURE sp_InsertarUsuarioSuscripcionVisualizacion
@Nombre NVARCHAR(100),
@Email NVARCHAR (100),
@Pass NVARCHAR (100), 
@PeliculaID INT,
@FechaInicio DATE,
@FechaFin DATE, 
@Tipo NVARCHAR (50)

AS
BEGIN 
	BEGIN TRANSACTION;
	BEGIN TRY
	INSERT INTO Usuarios (Nombre, Email,Pass, FechaRegistro)
	VALUES (@Nombre, @Email, @Pass, GETDATE());
	
	DECLARE @UsuarioID INT;
	SET @UsuarioID = SCOPE_IDENTITY();

	INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo)
	VALUES (@UsuarioID, @FechaInicio, @FechaFin, @Tipo)

	INSERT INTO HistorialVisualizacion (UsuarioID,PeliculaID,FechaVisualizacion)
	VALUES (@UsuarioID, @PeliculaID,GETDATE());

COMMIT TRANSACTION;
END TRY
	BEGIN CATCH 
	ROLLBACK TRANSACTION;
		DECLARE @ErrorMessage NVARCHAR(4000);
		SET @ErrorMessage = ERROR_MESSAGE();
		PRINT @ErrorMessage;
END CATCH;
END;

select * from Usuarios
select * from Suscripciones
Select * from HistorialVisualizacion

EXEC sp_InsertarUsuarioSuscripcionVisualizacion 'Lolis ZP', 'lolis_38@hotmail.com','olod90','1','2024-07-03','2024-08-03','Básica'


--Crea un procedimiento que permita actualizar el correo de los usuarios y al
--mismo tiempo cambie el tipo suscripción a Anual

CREATE PROCEDURE sp_ActualizarCorreoYCambiarSuscripcion
    @UsuarioID INT,
    @NuevoEmail NVARCHAR(255)
AS 
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        
        UPDATE Usuarios
        SET Email = @NuevoEmail
        WHERE UsuarioID = @UsuarioID;

        UPDATE Suscripciones
        SET Tipo = 'Anual'
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

SELECT * FROM Usuarios
SELECT * FROM Suscripciones
EXEC sp_ActualizarCorreoYCambiarSuscripcion '3', 'carlosgmez@hotmail.com'

--Crea un procedimiento que permita eliminar una película y al mismo tiempo
--todos los registros de esa misma película en Historial de visualización

CREATE PROCEDURE sp_EliminarPeliculaYHistorial
    @PeliculaID INT
AS 
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        
        DELETE FROM HistorialVisualizacion
        WHERE PeliculaID = @PeliculaID;

        DELETE FROM Peliculas
        WHERE PeliculaID = @PeliculaID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

SELECT * FROM Peliculas
SELECT * FROM HistorialVisualizacion

EXEC sp_EliminarPeliculaYHistorial '1'

-- Crea un procedimiento que Elimine un usuario con todas sus suscripciones y
--registros en historial de visualización

CREATE PROCEDURE sp_EliminarUsuarioConSuscripcionesYHistorial
    @UsuarioID INT
AS 
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        
        DELETE FROM HistorialVisualizacion
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Suscripciones
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Usuarios
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

SELECT * FROM Usuarios
SELECT * FROM HistorialVisualizacion
SELECT * FROM Suscripciones
EXEC sp_EliminarUsuarioConSuscripcionesYHistorial '3'
