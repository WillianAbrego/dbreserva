use dbreserva

--implementar las tablas de la base de datos
--tabla pais

create table pais(
	idpais char(4) not null primary key,
	nombre varchar(30) not null unique
)

create table pasajero(
	idpasajero char(8) not null primary key,
	nombre varchar(20) not null,
	apaterno varchar(20) not null,
	amaterno varchar(20) not null,
	tipo_documento varchar(30) not null,
	num_documento varchar(12) not null,
	fecha_nacimiento date not null,
	idpais char(4) not null,
	telefono varchar(15) null,
	email varchar (50) not null unique,
	clave varchar(20) not null
)
go

