

CREATE PROCEDURE sp_InsertarClientes
	@Nombre NVARCHAR (100),
	@Direccion NVARCHAR (200),
	@Telefono NVARCHAR (15),
	@Email NVARCHAR (100)
AS 
BEGIN
	INSERT INTO Clientes (Nombre, Direccion, Telefono, Email)
	VALUES (@Nombre, @Direccion, @Telefono, @Email)
	
END; 

select * from Clientes
EXEC sp_InsertarClientes 'Lolis Zuñiga', 'La Palma, Pedro Escobedo', '4421263765', 'lolis_380@hotmail.com'
EXEC sp_InsertarClientes 'Juan Peréz', 'Querétaro, Quet', '4421843843', 'juan.p@hotmail.com'
EXEC sp_InsertarClientes 'Antonio Ortíz', 'Querétaro, Querétaro', '4421675432', 'toño@hotmail.com'
EXEC sp_InsertarClientes 'Maria Ortíz', 'Querétaro, Querétaro', '4421245678', 'maria@hotmail.com'
EXEC sp_InsertarClientes 'Francisco Piña', 'Querétaro, Querétaro', '4421980987', 'francisco@hotmail.com'
------------------------------------------------------------------------------

CREATE PROCEDURE sp_Eliminar
	@TransaccionID INT,
	@ClienteID INT
AS 
BEGIN 
 BEGIN TRANSACTION;
BEGIN TRY 
	
	DELETE FROM Cuentas
	WHERE CLienteID = @ClienteID;

	DELETE FROM Clientes
	WHERE CLienteID = @ClienteID;

	        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

END;

select * from Clientes
SELECT * FROM Cuentas

EXEC sp_EliminarClienTEO 4
EXEC sp_EliminarClieTEO 5


---------------------------------------------

UPDATE = RETIRO
INSERT = DEPOSITO

CREATE PROCEDURE sp_DepositoRetiro
	@