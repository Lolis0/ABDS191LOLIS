-- 1. Explorar las propiedades de una base de datos 
-- Usamos ' ' para especificar
EXEC sp_helpdb 

EXEC sp_helpdb 'ABDS191'

--2. Explorar las propiedades de un objeto de la base de datos

EXEC sp_help 'Clientes'

-- 3. Ver las llaves primarioas de una tabla
EXEC sp_helpindex 'Clientes'

-- 4. Información de los usuarios y los procesos actuales
EXEC sp_who

-- 5. Rendimeintos del servidor
EXEC sp_monitor

-- 6. Espacio que usa la base de datos

EXEC sp_spaceused

-- 7. Puerto de escucha del SQL Server
EXEC sp_readerrorlog 0,1

-----------------------------------------------------------------------------------------------------------------------------------

-- NUESTROS PROCEDIMIENTOS 

--Procedimiento para obtener el historial
CREATE PROCEDURE sp_OptenerHistorial
	@usuarioId INT
AS
BEGIN

SELECT h.HistorialId, p.titulo, h.fechaVisualizacion
FROM HistorialVisualizacion h
JOIN  Peliculas p ON h.PeliculaID = p.PeliculaID
WHERE h.UsuarioID = @usuarioId
ORDER BY h.FechaVisualizacion DESC

END;

-- Ver nuestro procedimiento
EXEC sp_OptenerHistorial 1


-- SP para Insertar películas

CREATE PROCEDURE sp_InsertarPeliculas
@titulo NVARCHAR(100),
@genero NVARCHAR(50),
@fechaEstreno DATE
AS
BEGIN 

	INSERT INTO Peliculas (Titulo, Genero, FechaEstreno)
	VALUES (@Titulo, @Genero, @FechaEstreno)
END;

EXEC sp_InsertarPeliculas @titulo='Intensamente 2', @genero='Infantil', @fechaEstreno='2024-06-13'

select * from Peliculas