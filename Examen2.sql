CREATE DATABASE DBBank
CREATE TABLE Clientes (
	ClienteID INT IDENTITY (1,1) PRIMARY KEY,
	Nombre NVARCHAR (100),
	Direccion NVARCHAR (200),
	Telefono NVARCHAR (15),
	Email NVARCHAR (100)
);

CREATE TABLE Cuentas (
	CuentaID INT IDENTITY (1,1) PRIMARY KEY,
	ClienteID INT, 
	TipoCuenta NVARCHAR(50),
	Saldo DECIMAL (18,2),
	FechaApertura DATE,
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
	);

CREATE TABLE Transacciones (
	TransaccionID INT IDENTITY (1,1) PRIMARY KEY,
	CuentaID INT,
	TipoTransaccion NVARCHAR (50),
	Monto DECIMAL (18,2),
	FechaTansaccion DATETIME,
	FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
	);

CREATE TABLE Empleados (
	EmpleadoID INT IDENTITY (1,1) PRIMARY KEY,
	Nombre NVARCHAR (100),
	Posicion NVARCHAR (50),
	Departamento NVARCHAR (50),
	FechaContratacion DATE
	);



-----------------------------------
CREATE PROCEDURE sp_EliminarUsuarioConSuscripcionesYHistorial
    @UsuarioID INT
AS 
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        
        DELETE FROM HistorialVisualizacion
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Suscripciones
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Usuarios
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

CREATE PROCEDURE sp_InsertarNuevaPeliculaRegistroHistorial
@UsuarioID INT,
@Titulo NVARCHAR (100),
@Genero NVARCHAR (50),
@FechaEstreno DATE 
AS
BEGIN 
	BEGIN TRANSACTION;
	BEGIN TRY 
	INSERT INTO Peliculas (Titulo, Genero, FechaEstreno)
	VALUES (@Titulo, @Genero, @FechaEstreno);
	
	DECLARE @PeliculaID INT;
	SET @PeliculaID=SCOPE_IDENTITY();

	INSERT INTO HistorialVisualizacion (UsuarioID,PeliculaID,FechaVisualizacion)
	VALUES (@UsuarioID, @PeliculaID,GETDATE());

	COMMIT TRANSACTION;
END TRY
	BEGIN CATCH 
	ROLLBACK TRANSACTION;
		DECLARE @ErrorMessage NVARCHAR(4000);
		SET @ErrorMessage = ERROR_MESSAGE();
		PRINT @ErrorMessage;
END CATCH;
END;

CREATE PROCEDURE sp_EditarSuscripcion
    @SuscripcionID INT,
    @UsuarioID INT,
    @FechaInicio DATE,
    @FechaFin DATE,
    @Tipo NVARCHAR(50)
AS
BEGIN
    UPDATE Suscripciones
    SET 
        UsuarioID = @UsuarioID,
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        Tipo = @Tipo
    WHERE 
        SuscripcionID = @SuscripcionID
END;

CREATE PROCEDURE sp_EliminarHistorialVisualizacion
    @HistorialID INT
AS
BEGIN
    DELETE FROM HistorialVisualizacion
    WHERE HistorialID = @HistorialID
END;

EXEC sp_EliminarHistorialVisualizacion @HistorialID = '1'

SELECT * FROM HistorialVisualizacion


------------------------------

CREATE PROCEDURE sp_InsertarClientes
	@Nombre NVARCHAR (100),
	@Direccion NVARCHAR (200),
	@Telefono NVARCHAR (15),
	@Email NVARHAR (100)
AS 
BEGIN
	INSERT INTO Clientes
	Nombre = @Nom