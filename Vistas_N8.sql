CREATE VIEW Vista_Compras AS
SELECT cc.id_CC, cc.cantidad, co.titulo AS nombre_comic, cc.id_compra, c.fecha_compra, c.total
FROM Comic_Compras cc
JOIN Compras c
ON cc.id_compra = c.id_compra
JOIN Comics co
ON co.id_comic = cc.id_comic

CREATE VIEW Vista_ComprasComprados AS
SELECT cl.id_cliente, cl.nombre As combre_cliente, cc.cantidad AS caantidad_comics_comprados
FROM Clientes cl
JOIN Compras co
ON  cl.id_cliente = co.id_cliente
JOIN Comic_Compras cc
ON cc.id_compra = co.id_compra

select * from Comics

SELECT        dbo.Autores.id_autor, dbo.Autores.nombre, dbo.Autores.pais_origen, dbo.Comics.id_comic, dbo.Comics.titulo AS nombre_comic, dbo.Comics.anio, dbo.Comics.precio
FROM            dbo.Comics INNER JOIN
                         dbo.Autores ON dbo.Comics.id_autor = dbo.Autores.id_autor


SELECT        dbo.Compras.id_compra, dbo.Clientes.nombre AS CLIENTE, dbo.Comics.titulo AS COMIC, dbo.Autores.nombre AS AUTOR, dbo.Comics.anio, dbo.Comics.precio, dbo.Comic_Compras.cantidad, 
                         dbo.Comics.precio * dbo.Comic_Compras.cantidad AS subtotal
FROM            dbo.Autores INNER JOIN
                         dbo.Comics ON dbo.Autores.id_autor = dbo.Comics.id_autor INNER JOIN
                         dbo.Comic_Compras ON dbo.Comics.id_comic = dbo.Comic_Compras.id_comic INNER JOIN
                         dbo.Compras INNER JOIN
                         dbo.Clientes ON dbo.Compras.id_cliente = dbo.Clientes.id_cliente ON dbo.Comic_Compras.id_compra = dbo.Compras.id_compra


