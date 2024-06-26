CREATE TABLE roles (
    id_rol int identity (1,1) PRIMARY KEY,
    nombre VARCHAR(55),
    permiso VARCHAR(55)
);

CREATE TABLE usuarios (
    id_usuario int identity (1,1) PRIMARY KEY,
    nombre VARCHAR(55),
    apellido_1 VARCHAR(55),
    apellido_2 VARCHAR(55),
    contrase�a VARCHAR(255),
    telefono INT,
    correo_electronico VARCHAR(255),
    fecha_de_nacimiento DATE,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES roles (id_rol)
);

CREATE TABLE articulos (
    id_articulos int identity (100,1) PRIMARY KEY,
    texto TEXT,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE TABLE categoria (
    id_categoria int identity (1,1) PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE productos (
    id_producto int identity (1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    links VARCHAR(255),
    id_categoria INT,
    id_usuario INT,
     FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
     FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE TABLE clasificacion (
    id_clasificacion int identity (1,1) PRIMARY KEY,
    numero INT,
    id_producto INT,
    id_usuario INT,
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE TABLE comentarios (
    id_comentarios int identity (1,1) PRIMARY KEY,
    texto TEXT,
    fecha_de_creacion TIMESTAMP,
    id_producto INT,
    id_usuario INT,
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

SELECT * FROM roles
INSERT INTO roles (nombre, permiso) VALUES 
('Administrador', 'Todos'),
('Editor', 'Crear y editar'),
('Autor', 'Crear'),
('Moderador', 'Revisar'),
('Usuario', 'Ver');

SELECT * FROM usuarios
INSERT INTO usuarios (nombre, apellido_1, apellido_2, contrase�a, telefono, correo_electronico, fecha_de_nacimiento, id_rol) VALUES
('Juan', 'P�rez', 'G�mez', 'password1', 1234567890, 'juanperez@example.com', '1985-05-15', 1),
('Mar�a', 'L�pez', 'Mart�nez', 'password2', 1234567891, 'marialopez@example.com', '1990-07-20', 2),
('Carlos', 'Rodr�guez', 'S�nchez', 'password3', 1234567892, 'carlosrodriguez@example.com', '1988-02-10', 3),
('Ana', 'Garc�a', 'Fern�ndez', 'password4', 1234567893, 'anagarcia@example.com', '1992-09-12', 4),
('Luis', 'Mart�n', 'Gonz�lez', 'password5', 1234567894, 'luismartin@example.com', '1983-11-30', 5),
('Laura', 'Hern�ndez', 'Ruiz', 'password6', 1234567895, 'laura.hernandez@example.com', '1987-04-25', 1),
('Pedro', 'D�az', 'Torres', 'password7', 1234567896, 'pedro.diaz@example.com', '1995-06-18', 2);

SELECT * FROM articulos
INSERT INTO articulos (texto, id_usuario) VALUES
('Texto del art�culo 1', 5),
('Texto del art�culo 2', 10),
( 'Texto del art�culo 3', 15),
( 'Texto del art�culo 4', 20),
( 'Texto del art�culo 5', 20),
( 'Texto del art�culo 6', 1),
( 'Texto del art�culo 7', 3),
( 'Texto del art�culo 8', 5),
( 'Texto del art�culo 9', 2),
( 'Texto del art�culo 10', 20);

SELECT *FROM categoria
INSERT INTO categoria (nombre) VALUES
('Electr�nica'),
('Ropa'),
('Hogar'),
('Deportes'),
('Alimentaci�n'),
('Libros'),
('Juguetes'),
('M�sica');


INSERT INTO productos (nombre, links, id_categoria, id_usuario) VALUES
('Producto 1', 'link1', 1, 2),
('Producto 2', 'link2', 2, 2),
('Producto 3', 'link3', 3, 2),
('Producto 4', 'link4', 4, 2),
('Producto 5', 'link5', 5, 3),
('Producto 6', 'link6', 6, 2),
('Producto 7', 'link7', 7, 2),
('Producto 8', 'link8', 8, 2),
('Producto 9', 'link9', 1, 1),
('Producto 10', 'link10', 2, 2);

INSERT INTO clasificacion (numero, id_producto, id_usuario) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2);

select * from comentarios
INSERT INTO comentarios (texto,fecha_de_creacion, id_producto, id_usuario) VALUES
('Comentario 1',DEFAULT, 1, 5),
('Comentario 2', DEFAULT, 2, 10),
('Comentario 3', DEFAULT, 3, 20),
('Comentario 4', DEFAULT, 4, 15),
('Comentario 5', DEFAULT, 5, 5);

INSERT INTO comentarios (fecha_de_creacion)
VALUES 
(DEFAULT)

