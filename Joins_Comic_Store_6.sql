--1 Crea una consulta para obtener el nombre del cómic con los disponibles en el inventario

Select com.titulo AS NOMBRE, i.cantidad_disponible
from Comics com
JOIN Inventario i ON com.id_comic = i.id_comic;

--2 Crea una consulta para desplegar los detalles de las compras realizadas por cada cliente y los cómics comprados

SELECT compras.id_compra, c.nombre AS Nombre_Cliente, Comics.titulo AS Nombre_Comic,Comic_Compras.cantidad AS Cantidad_Comprada
FROM Clientes c
JOIN Compras ON c.id_cliente = Compras.id_cliente
JOIN Comic_Compras ON Compras.id_compra = Comic_Compras.id_compra
JOIN Comics ON Comic_Compras.id_comic = Comics.id_comic;

--3
SELECT  Compras.id_compra AS ID_Compra, Comics.titulo AS Nombre_Comic, Inventario.cantidad_disponible AS Disponibles
FROM Comics
LEFT JOIN Inventario ON Comics.id_comic = Inventario.id_comic
LEFT JOIN Comic_Compras ON Comics.id_comic = Comic_Compras.id_comic
LEFT JOIN Compras ON Comic_Compras.id_compra = Compras.id_compra;

--4
SELECT Comics.titulo AS Nombre_Comic, Inventario.cantidad_disponible AS Disponibles
FROM Comics
JOIN Inventario ON Comics.id_comic = Inventario.id_comic;

-- 5
SELECT Comics.id_comic, Comics.titulo AS Nombre_Comic, Comics.anio AS Año, Comics.precio AS Precio, Inventario.id_inventario, Comics.id_comic,
 Inventario.cantidad_disponible AS Disponibles, Inventario.disponibilidad AS En_Stock, Comic_Compras.id_CC, 
 Comic_Compras.cantidad AS Cantidad_Comprada, Comic_Compras.id_compra 
FROM Comics
LEFT JOIN Comic_Compras ON Comics.id_comic = Comic_Compras.id_comic
LEFT JOIN Inventario ON Comics.id_comic = Inventario.id_comic;

--6
SELECT Clientes.id_cliente, Clientes.nombre AS Nombre_Cliente, Comics.titulo AS Nombre_Comic,
Comic_Compras.cantidad AS Cantidad_Comprada, Inventario.cantidad_disponible AS Disponibles
FROM Clientes
INNER JOIN Compras ON Clientes.id_cliente = Compras.id_cliente
INNER JOIN Comic_Compras ON Compras.id_compra = Comic_Compras.id_compra
INNER JOIN Comics ON Comic_Compras.id_comic = Comics.id_comic
INNER JOIN Inventario ON Comics.id_comic = Inventario.id_comic
WHERE  Comic_Compras.cantidad > 0;






