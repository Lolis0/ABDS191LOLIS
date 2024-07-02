CREATE PROCEDURE sp_ActualizareInsertarSuscripcion

@UsuarioID INT,
@FechaInicio DATE,
@FechaFin DATE,
@Tipo NVARCHAR (50)

AS 
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY 
	--Insertar una nueva suscripción
	INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo)
	VALUES (@UsuarioID, @FechaInicio, @FechaFin, @Tipo)

	--Editar la feha de registro 
	UPDATE Usuarios
	SET 
	FechaRegistro = @FechaInicio
	WHERE UsuarioID = @UsuarioID


COMMIT TRANSACTION;
END TRY
	BEGIN CATCH 
	ROLLBACK TRANSACTION;
		DECLARE @ErrorMessage NVARCHAR(4000);
		SET @ErrorMessage = ERROR_MESSAGE();
		PRINT @ErrorMessage;
END CATCH;
END;

SELECT * FROM Suscripciones

EXEC  sp_ActualizareInsertarSuscripcion '1', '2024-07-01', '2024-08-01', 'Básico'


