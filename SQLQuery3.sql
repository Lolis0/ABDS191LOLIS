CREATE TABLE Clientes (
id_cliente int identity (1,1) PRIMARY KEY,
nombre VARCHAR(100),
correo_electronico VARCHAR(255),
contrase�a VARCHAR(255)
);

SELECT*FROM Clientes

CREATE TABLE Comics(
id_comic int identity (10,2) PRIMARY KEY,
titulo VARCHAR(100),
anio INT,
precio DECIMAL(10,2)
);

SELECT*FROM Comics

CREATE TABLE Compras (
id_compra int identity (100,3) PRIMARY KEY,
id_cliente INT,
fecha_compra DATE,
total DECIMAL(10,2),
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

SELECT*FROM Compras

CREATE TABLE Inventario(
id_inventario int identity(200,1) PRIMARY KEY,
id_comic INT,
cantidad_disponible INT,
disponibilidad binary,
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);

SELECT*FROM Inventario
CREATE TABLE Comic_Compras(
id_CC int identity (1000,2) PRIMARY KEY,
cantidad INT,
id_compra INT,
id_comic int,
FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);

Select * from Clientes
INSERT INTO Clientes (nombre, correo_electronico, contrase�a)VALUES 
('Juan Perez', 'juan.perez@example.com', 'Contrase�a123'),
('Mar�a L�pez', 'maria.lopez@example.com', 'Secreta456'),
('Carlos Rodr�guez', 'carlos.rodriguez@example.com', 'Clave789'),
('Ana Fern�ndez', 'ana.fernandez@example.com', 'Password321'),
('Pedro S�nchez', 'pedro.sanchez@example.com', 'Pass1234'),
('Luc�a Garc�a', 'lucia.garcia@example.com', 'Secure567'),
('Miguel Torres', 'miguel.torres@example.com', 'SuperPass789'),
('Sof�a Mart�nez', 'sofia.martinez@example.com', 'MyPassword123'),
('Luis G�mez', 'luis.gomez@example.com', 'UltraSecret123'),
('Elena Ruiz', 'elena.ruiz@example.com', 'MegaPass456'),
('Javier Morales', 'javier.morales@example.com', 'StrongPassword789'),
('Laura Ram�rez', 'laura.ramirez@example.com', 'TopSecret123');


Select * from Comics
INSERT INTO Comics (titulo, anio, precio)
VALUES 
('Watchmen', 1986, 399.00),
('The Dark Knight Returns', 1986, 599.00),
('Maus', 1991, 379.00),
('V for Vendetta', 1988, 339.00),
('Sandman: Preludes & Nocturnes', 1989, 259.00),
('Batman: Year One', 1987, 199.00),
('Saga: Volume 1', 2012, 199.00),
('Y: The Last Man - Unmanned', 2002, 999.00),
('Spider-Man: Blue', 2002, 359.00),
('Batman: The Killing Joke', 1988, 699.00),
('Civil War', 2006, 499.00),
('All-Star Superman', 2006, 599.00),
('Persepolis', 2000, 259.00),
('Black Panther: A Nation Under Our Feet', 2016, 339.00),
('Ms. Marvel: No Normal', 2014, 859.00);


INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad)
VALUES 
(10, 0, 0),
(12, 15, 1),
(14, 10, 1),
(16, 0, 0),
(18, 25, 1),
(20, 30, 1),
(22, 18, 1),
(24, 12, 1),
(26, 8, 1),
(28, 22, 1),
(30, 6, 1),
(32, 7, 1),
(34, 14, 1),
(36, 9, 1),
(38, 11, 1);

INSERT INTO Compras (id_cliente, fecha_compra, total)
VALUES 
(1, '2024-05-01', 999.00),
(2, '2024-05-02', 699.00),
(3, '2024-05-03', 259.00),
(4, '2024-05-04', 859.00),
(5, '2024-05-05', 859.00),
(6, '2024-05-06', 199.00),
(7, '2024-05-07', 259.00);

INSERT INTO Comic_Compras (cantidad, id_compra, id_comic)
VALUES 
(3, 100, 12),
(2, 103, 16),
(4, 109, 28);


