
CREATE TRIGGER alerta_creacion_tablas
ON DATABASE
FOR CREATE_TABLE
AS 
BEGIN
    PRINT 'Se ha creado una nueva tabla en DBBANK.'
END;

CREATE TABLE Prestamos (
    PrestamoID INT PRIMARY KEY,
    ClienteID INT,
    Monto DECIMAL(18, 2),
    FechaPrestamo DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE TABLE Pagos (
    PagoID INT PRIMARY KEY,
    PrestamoID INT,
    Monto DECIMAL(18, 2),
    FechaPago DATE,
    FOREIGN KEY (PrestamoID) REFERENCES Prestamos(PrestamoID)
);

INSERT INTO Prestamos (PrestamoID, ClienteID, Monto, FechaPrestamo)
VALUES 
(1, 3, 10000.00, '2024-07-01'),
(2, 5, 15000.00, '2024-07-02');

select *  from Prestamos

INSERT INTO Pagos(PagoID, PrestamoID, Monto, FechaPago)
VALUES 
(1, 1, 1000.00, '2024-03-01'),
(2, 2, 8000.00, '2023-12-07');

select * from Pagos

CREATE TRIGGER After_Create_Procedure
ON DATABASE 
FOR CREATE_PROCEDURE
AS 
BEGIN
    PRINT 'Se ha creado un Nuevo Procedimiento en DBBANK.'
END;

CREATE PROCEDURE Insert_Prestamo_Pago
    @ClienteID INT,
    @MontoPrestamo DECIMAL(18, 2),
    @MontoPago DECIMAL(18, 2),
    @FechaPrestamo DATE,
    @FechaPago DATE
AS
BEGIN
    DECLARE @PrestamoID INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar el nuevo préstamo
        INSERT INTO Prestamos (ClienteID, Monto, FechaPrestamo)
        VALUES (@ClienteID, @MontoPrestamo, @FechaPrestamo);

        -- Obtener el ID del préstamo recién insertado
        SET @PrestamoID = SCOPE_IDENTITY();

        -- Insertar el primer pago del préstamo
        INSERT INTO Pagos (PrestamoID, Monto, FechaPago)
        VALUES (@PrestamoID, @MontoPago, @FechaPago);

        COMMIT TRANSACTION;
        PRINT 'Préstamo y primer pago ingresados exitosamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error al ingresar el préstamo y pago. Transacción revertida.';
    END CATCH
END;

EXEC Insert_Prestamo_Pago 
    @ClienteID = 100, 
    @MontoPrestamo = 5000.00, 
    @MontoPago = 500.00, 
    @FechaPrestamo = '2024-07-10', 
    @FechaPago = '2024-07-11';

---------------------



CREATE PROCEDURE sp_Consultar_Clientes_Prestamos_Pagos
AS
BEGIN
    SELECT 
        c.ClienteID, c.Nombre, C.Direccion, c.Telefono, c.Email,
        p.PrestamoID, p.Monto AS MontoPrestamo, p.FechaPrestamo,
        pg.PagoID, pg.Monto AS MontoPago, pg.FechaPago
    FROM 
        Clientes c
    LEFT JOIN 
        Prestamos p ON c.ClienteID = p.ClienteID
    LEFT JOIN 
        Pagos pg ON p.PrestamoID = pg.PrestamoID;
END;

EXEC sp_Consultar_Clientes_Prestamos_Pagos

select * from Prestamos

Select * from Pagos


select * from Clientes
select * from Prestamos
select * from Pagos

