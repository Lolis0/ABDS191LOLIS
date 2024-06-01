-- Inner Join
Select c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
from Compras c
JOIN Clientes cl ON c.id_cliente = cl.id_cliente;

-- LEFT Join
Select c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
from Compras c
LEFT JOIN Clientes cl ON c.id_cliente = cl.id_cliente;

-- RIGHT JOIN
Select c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
from Compras c
RIGHT JOIN Clientes cl ON c.id_cliente = cl.id_cliente;

--FULL JOIN 
SELECT * 
FROM Clientes cl
FULL JOIN Compras c
ON c.id_cliente = cl.id_cliente;