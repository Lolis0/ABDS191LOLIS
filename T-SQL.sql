/*
--TSQL
--DECLARAR VARIABLES
declare @idCliente int

--Inicializar o asignar un valos a la variable
set @idCliente = 8

--if
--IF @idCliente = 8
	--select * from Clientes  where id_cliente = @idCliente

--Imprimir algo es especifico 
declare @edad int
set @idCliente = 9
--BEGIN para delimitar
IF @idCliente = 9
BEGIN
	set @edad = 25
-- Selecionar e imprimir
Select *from Clientes where id_cliente = @idCliente
print @edad

--Anidar los condicionales, verifica si existe el valor que le accinemos y te devuelve la opcion con un valor booleano,
--si existe la condición se ejecutará
IF EXISTS(select * from Clientes where id_cliente =10)
print 'Si existe'

END
--ELSE 
ELSE 
--Delimitamos
	BEGIN
		print 'Error'
		print 'id no autorizado para la consulta'
	END
*/

/* 

-- WHILE
declare @contador int = 0
WHILE @contador<=10
BEGIN
	print @contador
-- Para ir avanzando de 1 en 1
	set @contador = @contador + 1

END

*/

--RETURN
declare @contador int = 0
WHILE @contador<=10
BEGIN
	print @contador
-- Para ir avanzando de 1 en 1
	set @contador = @contador + 1
-- Cuando llega a 3 rompe la condición
	IF  @contador = 3
-- Rompe la condicion pero deja continuar
--          RETURN (No deja continuar)
			BREAK
	print ('Hola')
END
print ('Aquí contunia el flujo')
--Asignamos una excepción con un error personalizado
BEGIN TRY
set @contador = 'Lolis zp'
END TRY
BEGIN CATCH
	print ('la variables contador solo acepta enteros ')
END CATCH
print ('Soy otra consulta')
print ('yo tambien')
