--------Vista que nos muestre a los usuarios y sus roles 
CREATE VIEW VistaUsuariosRoles AS
SELECT u.id_usuario, u.nombre, u.apellido_1, u.apellido_2, r.nombre AS rol, r.permiso
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_roles;

select * from VistaUsuariosRoles

CREATE VIEW VistaComentarios AS
SELECT cm.id_comentario, cm.texto, cm.fecha_creacion, p.nombre AS producto, u.nombre AS usuario, u.apellido_1, u.apellido_2
FROM comentarios cm
JOIN productos p 
ON cm.id_producto = p.id_productos
JOIN usuarios u 
ON cm.id_usuario = u.id_usuario

select * from VistaComentarios


---------------------------

CREATE VIEW VistaProductosDetalles AS
SELECT p.id_productos, p.nombre AS productos, p.links, c.nombre AS categoria, u.nombre AS usuarios, u.apellido_1, u.apellido_2
FROM productos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN usuarios u ON p.id_usuario = u.id_usuario;

select * from VistaProductosDetalles

---------------------------------
--PROCEDIMIENTOS ALMACENADOS

--AGREGAR UN ROL
CREATE PROCEDURE sp_AgregarRol2
	@id_roles int,
    @nombre VARCHAR(55),
    @permiso VARCHAR(55)
AS
BEGIN
    INSERT INTO roles (id_roles,nombre, permiso)
    VALUES (@id_roles,@nombre, @permiso);
END;
select * from Roles
EXEC sp_AgregarRol2 '6','Maria Dolores Zuñiga', 'Crear y editar'
EXEC sp_AgregarRol2 '7','Angel Maqueda', 'Todos'
EXEC sp_AgregarRol2 '8', 'Gabriel Resendez', 'Todos'

---------------------------------------------
--seleccionar usuario
CREATE PROCEDURE sp_Verusuario2
 @id_usuario int 
AS
BEGIN
    SELECT U.id_usuario, u.nombre, u.telefono 
	FROM usuarios u
	WHERE id_usuario = @id_usuario;
END;

EXEC sp_Verusuario2 '7'

-----------------------------------
--Eliminar un usuario 

CREATE PROCEDURE sp_EliminarUsuario
	@id_usuario INT
AS 
BEGIN
	DELETE FROM Usuarios
	WHERE id_usuario = @id_usuario
END;

SELECT * FROM Usuarios
EXEC sp_EliminarUsuario '6'
--------------------------
--Editar un nombre de un producto
CREATE PROCEDURE sp_EditarNombreProducto2
	@id_productos INT,
	@nombre NVARCHAR (100)
	
AS 
BEGIN 
	UPDATE Productos
	SET
		nombre=@nombre
	WHERE
		id_productos = @id_productos
END;
SELECT * FROM Productos
EXEC sp_EditarNombreProducto2 1, 'Cepillo dental'

--------------------------------
--Eliminar una articulo

CREATE PROCEDURE sp_Eliminararticulo
	@id_articulo INT 
AS
BEGIN 
	DELETE FROM Articulos
	WHERE 
	id_articulo = @id_articulo
END;

SELECT * FROM Articulos

exec sp_Eliminararticulo '1'


--------------------
--PROCEDIMIENTOS CON TRANSACCIONES


CREATE PROCEDURE sp_InsertarActualizarUsuario1
    
    @nombre VARCHAR(55),
    @apellido_1 VARCHAR(55),
    @apellido_2 VARCHAR(55),
    @contraseña VARCHAR(55),
    @telefono INT,
    @correo_electronico VARCHAR(255),
    @fecha_nacimiento DATE,
    @id_rol INT,
	@texto TEXT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
	DECLARE @id_usuario INT;
    INSERT INTO usuarios (nombre, apellido_1, apellido_2, contraseña, telefono, correo_electronico, fecha_nacimiento, id_rol)
    VALUES (@nombre, @apellido_1, @apellido_2, @contraseña, @telefono, @correo_electronico, @fecha_nacimiento, @id_rol);
    
	SET @id_usuario = SCOPE_IDENTITY();

        -- Insertar un nuevo artículo asociado con el usuario recién creado
        INSERT INTO articulos (texto, id_usuario)
        VALUES (@texto, @id_usuario);
       

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

exec sp_InsertarActualizarUsuario1 'Juan', 'Piña', 'Avila', 'jbdskbcs', 4421263768, 'juan@hotmail.com','2001-11-09','5','Hola Hola'
