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

--tabla aeropuerto
create table aeropuerto(
	idaeropuerto char(5) not null,
	nombre varchar(50) not null,
	idpais char(4) not null
)
go

alter table aeropuerto
add constraint PK_AEROPUERTO_PAIS
primary key nonclustered(idaeropuerto)
go

alter table aeropuerto 
add constraint UQ_AEROPUERTO_NOMBRE
unique (nombre)
go

--tabla aerolinea
create table aerolinea(
	idaerolinea int not null primary key,
	ruc char(11) not null,
	nombre varchar(40) not null
)
go
--tabla avion 
create table avion(
	idavion char(5) not null primary key,
	idaerolinea int not null,
	fabricante varchar(40) null,
	tipo varchar(3) not null
)
go

--agregando el campo capacidad
alter table avion 
add capacidad int not null
go

alter table avion 
drop column capacidad
go

--modificando el campo tipo
alter table avion 
alter column tipo varchar(30) not null
go

--tabla asiento
create table asiento(
	idasiento int not null primary key,
	letra char(2) not  null,
	fila int not null
)
go

--tabla tarifa
create table tarifa(
	idtarifa int not null primary key,
	clase varchar(20) not null unique,
	precion money not null,
	impuesto money not null
)
go

--tabla reserva 
create table reserva(
	idreserva int not null primary key,
	costo money not null,
	fecha date null,
	observacion varchar(200) null
)
go

--restricciones check, default
--restricion default
alter table reserva
add constraint DFL_RESERVA_FECHA
default GETDATE() FOR fecha
go

--tabla vuelo
create table vuelo(
	idasiento int not null,
	idaeropuerto char(5) not null,
	idreserva int not null,
	idavion char(5) not null
)
go
--implementar las llaves primarios de la tabla vuelo
alter table vuelo 
add primary key(idasiento,idaeropuerto,idreserva,idavion)
go

--tabla pago 
create table pago(
	idpago int not null primary key identity,
	idreserva int not null,
	fecha date default getdate(),
	idpasajero char(8) not null,
	monto money not null,
	tipo_comprobante varchar(20) not null,
	num_comprobante varchar(15) not null,
	impuesto decimal (5,2) not null
)
go

--agregar una restriccion check, controlar que no se ingresen 
--fechas mayores a la fecha actual

alter table pago
add constraint CHK_PAGO_FECHA
CHECK (fecha<=getdate())
go
