-- Procedimientos y transacciones

CREATE PROCEDURE sp_ActualizarCantidadYPrecioComic
    @id_comic INT,
    @nueva_cantidad INT,
    @nuevo_precio DECIMAL(10,2)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Actualizar la cantidad disponible en el inventario
        UPDATE Inventario
        SET cantidad_disponible = @nueva_cantidad
        WHERE id_comic = @id_comic;

        -- Actualizar el precio en la tabla Comics
        UPDATE Comics
        SET precio = @nuevo_precio
        WHERE id_comic = @id_comic;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

Select * from Inventario
select * from Comics

EXEC sp_ActualizarCantidadYPrecioComic '10', '20', '399.99'
EXEC sp_ActualizarCantidadYPrecioComic '12', '10', '599.99'
EXEC sp_ActualizarCantidadYPrecioComic '14', '10', '379.99'


-------------------------------------------------------------

--Insertar un cliente y un autor 
CREATE PROCEDURE sp_InsertarClienteYAutor
    @nombre_cliente VARCHAR(100),
    @correo_electronico VARCHAR(255),
    @contrasena VARCHAR(255),
    @nombre_autor VARCHAR(100),
    @pais_origen VARCHAR(100)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @id_cliente INT;
        DECLARE @id_autor INT;

        -- Insertar el nuevo cliente
        INSERT INTO Clientes (nombre, correo_electronico, contraseña)
        VALUES (@nombre_cliente, @correo_electronico, @contrasena);

        -- Obtener el id del cliente insertado
        SET @id_cliente = SCOPE_IDENTITY();

        INSERT INTO Autores (nombre, pais_origen)
        VALUES (@nombre_autor, @pais_origen);

        -- Obtener el id del autor insertado
        SET @id_autor = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

select * from Clientes
select * from Autores

EXEC sp_InsertarClienteYAutor 'Maria Juan', 'juanita12@hotmail.com', '98y4rn9', 'Orlando P.', 'Canada'
EXEC sp_InsertarClienteYAutor 'Pedro Ortiz', 'Pedrito62@hotmail.com', 'kbkjio', 'Lucila H.', 'España'
EXEC sp_InsertarClienteYAutor 'Emiliano Perez', 'emi72@hotmail.com', '98t98t9g', 'Javier O.', 'India'

----------------------------
--Insertar comic y autor

CREATE PROCEDURE InsertarAutorYComic
    @nombre_autor VARCHAR(100),
    @pais_origen VARCHAR(100),
    @titulo_comic VARCHAR(100),
    @anio INT,
    @precio DECIMAL(10,2)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @id_autor INT;
        DECLARE @id_comic INT;

        INSERT INTO Autores (nombre, pais_origen)
        VALUES (@nombre_autor, @pais_origen);

        SET @id_autor = SCOPE_IDENTITY();

        INSERT INTO Comics (titulo, anio, precio)
        VALUES (@titulo_comic, @anio, @precio);

        SET @id_comic = SCOPE_IDENTITY();

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

select * from Comics
select * from Autores

exec InsertarAutorYComic 'Oswaldo P.', 'Costa Rica', 'Sandman', '1997', '456.99'
exec InsertarAutorYComic 'Luis H.', 'Costa Rica', 'Luciernagas', '2000', '256.99'
exec InsertarAutorYComic 'Patricio E.', 'Inglaterra', 'Brujas', '2005', '498.99'

---------------------------------

CREATE PROCEDURE sp_ActualizarComicYAutor
    @id_comic INT,
    @nuevo_anio INT,
    @id_autor INT,
    @nuevo_pais_origen VARCHAR(100)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        UPDATE Comics
        SET anio = @nuevo_anio
        WHERE id_comic = @id_comic;

        UPDATE Autores
        SET pais_origen = @nuevo_pais_origen
        WHERE id_autor = @id_autor;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

SELECT * FROM Comics
SELECT * FROM Autores

EXEC sp_ActualizarComicYAutor '10', '1987', '300','Canada'
EXEC sp_ActualizarComicYAutor '12', '1985', '301','Mexico'
EXEC sp_ActualizarComicYAutor '14', '1987', '303','España'


---------------------------------
--Insertar comic e inventario
CREATE PROCEDURE sp_InsertarComicEInventario
    @titulo VARCHAR(100),
    @anio INT,
    @precio DECIMAL(10,2),
    @cantidad_disponible INT,
    @disponibilidad BIT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @id_comic INT;

        INSERT INTO Comics (titulo, anio, precio)
        VALUES (@titulo, @anio, @precio);

        SET @id_comic = SCOPE_IDENTITY();

        INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad)
        VALUES (@id_comic, @cantidad_disponible, @disponibilidad);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
SELECT * FROM Inventario
SELECT * FROM Comics

exec sp_InsertarComicEInventario 'LIGAMAX', '2024', '500.00', '20', '1'
exec sp_InsertarComicEInventario 'SANDMAN2', '2003', '580.00', '10', '1'
exec sp_InsertarComicEInventario 'Caperucita Roja', '2024', '509.00', '15', '0'