CREATE TABLE Clientes (
id_cliente bigint identity (1,1) PRIMARY KEY,
nombre VARCHAR(100),
correo_electronico VARCHAR(255),
contraseña VARCHAR(255)
);

SELECT*FROM Clientes

CREATE TABLE Comics(
id_comic bigint identity (10,2) PRIMARY KEY,
titulo VARCHAR(100),
anio INT,
precio DECIMAL(10,2)
);
ALTER TABLE Comics
ALTER COLUMN anio INT;

SELECT*FROM Comics

CREATE TABLE Compras (
id_compra bigint identity (100,3) PRIMARY KEY,
id_cliente bigint,
fecha_compra DATE,
total DECIMAL(10,2),
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

SELECT*FROM Compras

CREATE TABLE Inventario(
id_inventario bigint identity(200,1) PRIMARY KEY,
id_comic bigint,
cantidad_disponible INT,
disponibilidad binary,
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);

CREATE TABLE Comic_Compras(
id_CC bigint identity (1000,2) PRIMARY KEY,
cantidad tinyint,
id_compra bigint,
id_comic bigint,
FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);

INSERT INTO Clientes (nombre, correo_electronico, contraseña)VALUES 
('Juan Perez', 'juan.perez@example.com', 'Contraseña123'),
('María López', 'maria.lopez@example.com', 'Secreta456'),
('Carlos Rodríguez', 'carlos.rodriguez@example.com', 'Clave789'),
('Ana Fernández', 'ana.fernandez@example.com', 'Password321'),
('Pedro Sánchez', 'pedro.sanchez@example.com', 'Pass1234'),
('Lucía García', 'lucia.garcia@example.com', 'Secure567'),
('Miguel Torres', 'miguel.torres@example.com', 'SuperPass789'),
('Sofía Martínez', 'sofia.martinez@example.com', 'MyPassword123'),
('Luis Gómez', 'luis.gomez@example.com', 'UltraSecret123'),
('Elena Ruiz', 'elena.ruiz@example.com', 'MegaPass456'),
('Javier Morales', 'javier.morales@example.com', 'StrongPassword789'),
('Laura Ramírez', 'laura.ramirez@example.com', 'TopSecret123');


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
(12, 0, 1),
(14, 15, 1),
(16, 10, 1),
(18, 0, 1),
(20, 25, 1),
(22, 30, 1),
(24, 18, 1),
(26, 12, 1),
(28, 8, 1),
(30, 22, 1),
(32, 6, 1),
(34, 7, 1),
(36, 14, 1),
(38, 9, 1),
(40, 11, 1);

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
