--Implementando base de datos en SQL
--Creando base de datos
create database dbprueba

--Eliminar base de datos 
drop database dbprueba

--Implementando base de datos dbreserva
--verificar que la base de datos no este creada
IF DB_ID('dbreserva') IS NOT NULL
BEGIN 
	USE MASTER
	DROP DATABASE dbreserva
END

--crear la base de datos en blanco

create database DBRESERVA
on primary(
	NAME='DBRESERVA_MDF', --ALT + 39
	FILENAME='C:\Users\willian\Desktop\dbscript\DBRESERVA.MDF', --ALT +92
	SIZE=15MB,
	MAXSIZE=250MB,
	FILEGROWTH=10MB
),(
	NAME='DBRESERVA_NDF', --ALT + 39
	FILENAME='C:\Users\willian\Desktop\dbscript\DBRESERVA.NDF', --ALT +92
	SIZE=15MB,
	MAXSIZE=UNLIMITED,
	FILEGROWTH=10MB
	)
LOG ON(
	NAME='DBRESERVA_LDF',--ALT + 39
	FILENAME='C:\Users\willian\Desktop\dbscript\DBRESERVA.LDF',--ALT +92
	SIZE=15MB,
	MAXSIZE=500MB,
	FILEGROWTH=10%
)
GO