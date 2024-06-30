CREATE PROCEDURE InsertarCliente
    @nombre VARCHAR(100),
    @correo_electronico VARCHAR(255),
    @contraseña VARCHAR(255)
AS
BEGIN
    INSERT INTO Clientes (nombre, correo_electronico, contraseña)
    VALUES (@nombre, @correo_electronico, @contraseña);
END;

EXEC InsertarCliente 'Diego Rivera', 'diego.rivera@example.com', 'Contraseña456';
EXEC InsertarCliente 'Natalia Ortega', 'natalia.ortega@example.com', 'Secreta789';
EXEC InsertarCliente 'Alejandro Ruiz', 'alejandro.ruiz@example.com', 'Clave321';

Select * from clientes 
--------------------------------------------------------

CREATE PROCEDURE InsertarComic
    @titulo VARCHAR(100),
    @anio INT,
    @precio DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Comics (titulo, anio, precio)
    VALUES (@titulo, @anio, @precio);
END;

EXEC InsertarComic 'Superman: Red Son', 2003, 499.00;
EXEC InsertarComic 'Kingdom Come', 1996, 599.00;
EXEC InsertarComic 'Planetary', 1999, 399.00;

select * from Comics

-----------------------------------------------------

CREATE PROCEDURE EditarCliente
    @id_cliente INT,
    @nombre VARCHAR(100),
    @correo_electronico VARCHAR(255),
    @contraseña VARCHAR(255)
AS
BEGIN
    UPDATE Clientes
    SET nombre = @nombre,
        correo_electronico = @correo_electronico,
        contraseña = @contraseña
    WHERE id_cliente = @id_cliente;
END;


EXEC EditarCliente 1, 'Juan Pérez', 'juan.perez_updated@example.com', 'NuevaContraseña123';
EXEC EditarCliente 2, 'María López', 'maria.lopez_updated@example.com', 'NuevaSecreta456';
EXEC EditarCliente 3, 'Carlos Rodríguez', 'carlos.rodriguez_updated@example.com', 'NuevaClave789';

select * from Clientes

-----------------------------------------------------------

CREATE PROCEDURE sp_EditarComic
    @id_comic INT,
    @titulo VARCHAR(100),
    @anio INT,
    @precio DECIMAL(10,2)
AS
BEGIN
    UPDATE Comics
    SET titulo = @titulo,
        anio = @anio,
        precio = @precio
    WHERE id_comic = @id_comic;
END;


EXEC sp_EditarComic 10, 'Batman: The Killing Joke', 1988, 799.00;
EXEC sp_EditarComic 12, 'Civil War', 2006, 549.00;
EXEC sp_EditarComic 14, 'All-Star Superman', 2006, 629.00;

select * from Comics

---------------------------------------

CREATE PROCEDURE sp_EliminarCliente
    @id_cliente INT
AS
BEGIN
    DELETE FROM Clientes
    WHERE id_cliente = @id_cliente;
END;


EXEC sp_EliminarCliente 15;
EXEC sp_EliminarCliente 12;
EXEC sp_EliminarCliente 14;

select * from Clientes

-------------------------------------

CREATE PROCEDURE sp_EliminarComic
    @id_comic INT
AS
BEGIN
    DELETE FROM Comics
    WHERE id_comic = @id_comic;
END;

EXEC sp_EliminarComic 44;
EXEC sp_EliminarComic 42;
EXEC sp_EliminarComic 40;

select * from Comics
------------------------------------------------

CREATE PROCEDURE sp_ConsultarComprasPorCliente
    @id_cliente INT
AS
BEGIN
    SELECT c.id_compra, c.fecha_compra, c.total, cl.nombre, cl.correo_electronico
    FROM Compras c
    INNER JOIN Clientes cl ON c.id_cliente = cl.id_cliente
    WHERE cl.id_cliente = @id_cliente;
END;

EXEC sp_ConsultarComprasPorCliente 1;
EXEC sp_ConsultarComprasPorCliente 2;
EXEC sp_ConsultarComprasPorCliente 3;


----------------------------------------------


CREATE PROCEDURE sp_ConsultarInventarioPorComic
    @id_comic INT
AS
BEGIN
    SELECT i.id_inventario, i.cantidad_disponible, i.disponibilidad, cm.titulo, cm.precio
    FROM Inventario i
    INNER JOIN Comics cm ON i.id_comic = cm.id_comic
    WHERE cm.id_comic = @id_comic;
END;

EXEC sp_ConsultarInventarioPorComic 10;
EXEC sp_ConsultarInventarioPorComic 12;
EXEC sp_ConsultarInventarioPorComic 22;

-----------------------------------------

CREATE PROCEDURE sp_ConsultarDetallesDeCompras
    @id_compra INT
AS
BEGIN
    SELECT cc.id_CC, cc.cantidad, cm.titulo, cm.precio
    FROM Comic_Compras cc
    INNER JOIN Comics cm ON cc.id_comic = cm.id_comic
    WHERE cc.id_compra = @id_compra;
END;

EXEC sp_ConsultarDetallesDeCompras 100;
EXEC sp_ConsultarDetallesDeCompras 103;
EXEC sp_ConsultarDetallesDeCompras 109;






