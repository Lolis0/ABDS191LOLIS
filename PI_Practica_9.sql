SELECT * FROM roles
INSERT INTO roles (id_roles, nombre, permiso) VALUES 
(1,'Administrador', 'Todos'),
(2, 'Editor', 'Crear y editar'),
(3, 'Autor', 'Crear'),
(4, 'Moderador', 'Revisar'),
(5, 'Usuario', 'Ver');

SELECT * FROM usuarios
INSERT INTO usuarios (id_usuario, nombre, apellido_1, apellido_2, contrase�a, telefono, correo_electronico, fecha_nacimiento, id_rol) VALUES
(1,'Juan', 'P�rez', 'G�mez', 'password1', 1234567890, 'juanperez@example.com', '1985-05-15', 1),
(2,'Mar�a', 'L�pez', 'Mart�nez', 'password2', 1234567891, 'marialopez@example.com', '1990-07-20', 2),
(3,'Carlos', 'Rodr�guez', 'S�nchez', 'password3', 1234567892, 'carlosrodriguez@example.com', '1988-02-10', 3),
(4,'Ana', 'Garc�a', 'Fern�ndez', 'password4', 1234567893, 'anagarcia@example.com', '1992-09-12', 4),
(5,'Luis', 'Mart�n', 'Gonz�lez', 'password5', 1234567894, 'luismartin@example.com', '1983-11-30', 5),
(6,'Laura', 'Hern�ndez', 'Ruiz', 'password6', 1234567895, 'laura.hernandez@example.com', '1987-04-25', 1),
(7,'Pedro', 'D�az', 'Torres', 'password7', 1234567896, 'pedro.diaz@example.com', '1995-06-18', 2);

SELECT * FROM articulos
INSERT INTO articulos (id_articulo,texto, id_usuario) VALUES
(1,'Texto del art�culo 1', 5),
(2,'Texto del art�culo 2', 10),
(3,'Texto del art�culo 3', 15),
(4,'Texto del art�culo 4', 20),
(5,'Texto del art�culo 5', 20);

SELECT *FROM categorias
INSERT INTO categorias (id_categoria, nombre) VALUES
(1,'Electr�nica'),
(2,'Ropa'),
(3,'Hogar'),
(4,'Deportes'),
(5,'Alimentaci�n');
select*from productos
INSERT INTO productos (id_productos, nombre, links, id_categoria, id_usuario) VALUES
(1,'Producto 1', 'link1', 1, 2),
(2,'Producto 2', 'link2', 2, 2),
(3,'Producto 3', 'link3', 3, 2),
(4,'Producto 4', 'link4', 4, 2),
(5,'Producto 5', 'link5', 5, 3);
select*from clasificaciones
INSERT INTO clasificaciones (id_clasificacion, numero, id_producto, id_usuario) VALUES
(1,1, 1, 1),
(2,2, 2, 2),
(3,3, 3, 2),
(4,4, 4, 2),
(5,5, 5, 2);

select * from comentarios
INSERT INTO comentarios (id_comentario,fecha_creacion, id_producto, id_usuario) VALUES
(1,'10-20-2024', 1, 5),
(2,'10-20-2024', 2, 2),
(3,'10-20-2024', 3, 1),
(4,'10-20-2024',  4, 1),
(5,'10-20-2024', 5, 5);