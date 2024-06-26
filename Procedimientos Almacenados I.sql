
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

EXEC sp_InsertarUsuarios @Nombre = 'Juana P�rez', @Email = 'juana.perez@example.com', @Pass = 'password103', @FechaRegistro = '2024-06-25'

EXEC sp_InsertarUsuarios @Nombre = 'Mar�a L�pez', @Email = 'mari.lopez@example.com', @Pass = 'securePass456',@FechaRegistro = '2024-06-25'

EXEC sp_InsertarUsuarios @Nombre = 'Carlos Garc�a', @Email = 'carlos.garcia@example.com', @Pass = 'pass789secure', @FechaRegistro = '2024-06-24';

SELECT * FROM Usuarios

-----------------------------------------------------------------------

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

EXEC sp_EditarSuscripcion @SuscripcionID = '2', @UsuarioID = '3', @FechaInicio = '2023-05-02', @FechaFin = '2023-02-01', @Tipo = 'B�sico'

EXEC sp_EditarSuscripcion @SuscripcionID = '3', @UsuarioID = '3', @FechaInicio = '2024-02-23', @FechaFin = '2024-03-10', @Tipo = 'Premium'

Select * from Suscripciones

----------------------------------------------------------------

CREATE PROCEDURE sp_EliminarHistorialVisualizacion
    @HistorialID INT
AS
BEGIN
    DELETE FROM HistorialVisualizacion
    WHERE HistorialID = @HistorialID
END;

EXEC sp_EliminarHistorialVisualizacion @HistorialID = '1'

SELECT * FROM HistorialVisualizacion

-------------------------------------------------------------

CREATE PROCEDURE sp_ConsultarUsuariosPorTipoSuscripcion
@Tipo NVARCHAR (50)
AS
BEGIN
    SELECT 
        U.UsuarioID,
        S.SuscripcionID,
        S.Tipo
    FROM 
        Usuarios U
    INNER JOIN 
        Suscripciones S ON U.UsuarioID = S.UsuarioID
    WHERE 
        S.Tipo = @Tipo
END;

EXEC sp_ConsultarUsuariosPorTipoSuscripcion @Tipo = 'Premium'

Select * from Suscripciones

------------------------------------------------------------------------

CREATE PROCEDURE sp_ConsultarPeliculasReproducidas
@UsuarioID INT,
@Genero NVARCHAR (50)

AS
BEGIN
    SELECT 
		P.PeliculaId,
        P.Titulo,
        P.Genero,
        H.FechaVisualizacion
    FROM 
        HistorialVisualizacion H
    INNER JOIN 
        Peliculas P ON H.PeliculaID = P.PeliculaID
    WHERE 
		H.UsuarioID = @UsuarioID
		AND
        P.Genero = @Genero
END;

select * from HistorialVisualizacion
SELECT * FROM Peliculas
EXEC sp_ConsultarPeliculasReproducidas @UsuarioID= '3', @Genero = 'Drama'
EXEC sp_ConsultarPeliculasReproducidas @UsuarioID= '2', @Genero = 'Romance'
EXEC sp_ConsultarPeliculasReproducidas @UsuarioID= '1', @Genero = 'Cienicia Ficcion'

se

Select * from Suscripciones