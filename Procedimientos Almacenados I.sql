
CREATE PROCEDURE sp_InsertarUsuarios
@Nombre NVARCHAR (100),
@Email NVARCHAR (100),
@Pass NVARCHAR (100),
@FechaRegistro DATE

AS
BEGIN 
	INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro)
	VALUES (@Nombre, @Email, @Pass, @FechaRegistro)
END;

EXEC sp_InsertarUsuarios @Nombre = 'Juana Pérez', @Email = 'juana.perez@example.com', @Pass = 'password103', @FechaRegistro = '2024-06-25'

EXEC sp_InsertarUsuarios @Nombre = 'María López', @Email = 'mari.lopez@example.com', @Pass = 'securePass456',@FechaRegistro = '2024-06-25'

EXEC sp_InsertarUsuarios @Nombre = 'Carlos García', @Email = 'carlos.garcia@example.com', @Pass = 'pass789secure', @FechaRegistro = '2024-06-24';

SELECT * FROM Usuarios

CREATE PROCEDURE sp_EditarSuscripcion
    @SuscripcionID INT,
    @UsuarioID INT,
    @FechaInicio DATE,
    @FechaFin DATE,
    @Tipo NVARCHAR(50)
AS
BEGIN
    UPDATE Suscripciones
    SET 
        UsuarioID = @UsuarioID,
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        Tipo = @Tipo
    WHERE 
        SuscripcionID = @SuscripcionID
END;

EXEC sp_EditarSuscripcion @SuscripcionID = '1', @UsuarioID = '1', @FechaInicio = '2024-02-03', @FechaFin = '2024-03-03', @Tipo = 'Standar'

EXEC sp_EditarSuscripcion @SuscripcionID = '2', @UsuarioID = '3', @FechaInicio = '2023-05-02', @FechaFin = '2023-02-01', @Tipo = 'Básico'

EXEC sp_EditarSuscripcion @SuscripcionID = '3', @UsuarioID = '3', @FechaInicio = '2024-02-23', @FechaFin = '2024-03-10', @Tipo = 'Premium'

Select * from Suscripciones


CREATE PROCEDURE sp_EliminarHistorialVisualizacion
    @IdHistorial INT
AS
BEGIN
    DELETE FROM HistorialVisualizacion
    WHERE HistorialD = @IdHistorial
END;