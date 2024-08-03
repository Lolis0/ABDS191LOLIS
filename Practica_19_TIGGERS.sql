CREATE TRIGGER Alert_Insert_Cliente
ON Clientes
AFTER INSERT
AS
BEGIN
    PRINT 'Se ha insertado un nuevo cliente.'
END;

select * from Clientes
INSERT INTO Clientes (Nombre, Direccion, Telefono, Email)
values ('Lolis Perrusquia', 'La Palma', 4425600440, 'lolis-90@hotmail.com');


---------------------------------------------------------

CREATE TRIGGER Alert_eliminar_Cliente
ON Clientes
AFTER DELETE
AS
BEGIN
    PRINT 'Se ha eliminado un cliente.'
END;

select * from Clientes
DELETE FROM Clientes WHERE ClienteID = 8;

----------------------------------------------------------

CREATE TRIGGER Alert_clientenoregistrado
ON Cuentas
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @ClienteID INT;
    SELECT @ClienteID = ClienteID FROM INSERTED;

    IF NOT EXISTS (SELECT 1 FROM Clientes WHERE ClienteID = @ClienteID)
    BEGIN
        PRINT 'El cliente no existe. No se puede crear la cuenta.';
    END
    ELSE
    BEGIN
        INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
        SELECT ClienteID, TipoCuenta, Saldo, FechaApertura  FROM INSERTED;
        PRINT 'Cuenta creada exitosamente.';
    END
END;

select* from Clientes
select * from Cuentas
INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
VALUES (7,'Básica', 1000.00,'2024-08-02');


----------------------------------------------------------------------------
CREATE TRIGGER Alert_Editar_Cuenta_negativo
ON Cuentas
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM INSERTED WHERE Saldo < 0)
    BEGIN
        PRINT 'No se puede ingresar un saldo negativo.';
    END
    ELSE
    BEGIN
        UPDATE Cuentas
        SET ClienteID = i.ClienteID, TipoCuenta = i.TipoCuenta, Saldo = i.Saldo
        FROM INSERTED i
        WHERE Cuentas.CuentaID = i.CuentaID;
        PRINT 'Cuenta actualizada exitosamente.';
    END
END;

select * from Cuentas
UPDATE Cuentas
SET Saldo = -500.00
WHERE CuentaID = 1;

UPDATE Cuentas
SET Saldo = 1500.00
WHERE CuentaID = 1;

---------------------------------------------------------------





CREATE TRIGGER Alert_Eliminar_Prestamo
ON Prestamos
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Pagos WHERE PrestamoID IN (SELECT PrestamoID FROM DELETED))
    BEGIN
        PRINT 'No se puede eliminar el préstamo porque tiene pagos asociados.';
    END
    ELSE
    BEGIN
        DELETE FROM Prestamos WHERE PrestamoID IN (SELECT PrestamoID FROM DELETED);
        PRINT 'Préstamo eliminado exitosamente.';
    END
END;

select * from Prestamos
DELETE FROM Prestamos WHERE PrestamoID = 1;



------------------------------------------------------

CREATE TABLE logClientes (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Operacion NVARCHAR(10),
    FechaHora DATETIME DEFAULT GETDATE()
);

