
CREATE VIEW VISTA_ClientesCompras AS 
SELECT c.id_cliente, c.nombre AS CLIENTE, c.correo_electronico, cm.id_compra, cm.fecha_compra, cm.total
FROM Clientes c
LEFT JOIN Compras cm
ON C.id_cliente = cm.id_cliente;

SELECT * FROM VISTA_ClientesCompras



SELECT dbo.Comics.titulo AS COMIC, dbo.Comics.id_comic, dbo.Inventario.disponibilidad, dbo.Inventario.cantidad_disponible, dbo.Inventario.id_inventario
FROM  dbo.Comics 
INNER JOIN dbo.Inventario ON dbo.Comics.id_comic = dbo.Inventario.id_comic;

SELECT        dbo.Autores.id_autor, dbo.Autores.pais_origen AS Nacionalidad, dbo.Clientes.nombre, dbo.Clientes.correo_electronico, dbo.Compras.fecha_compra, dbo.Compras.id_cliente, dbo.Inventario.cantidad_disponible, 
                         dbo.Inventario.id_inventario
FROM            dbo.Compras INNER JOIN
                         dbo.Clientes ON dbo.Compras.id_cliente = dbo.Clientes.id_cliente CROSS JOIN
                         dbo.Autores CROSS JOIN
                         dbo.Inventario