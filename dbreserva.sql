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

--implementar las relaciones entre las tablas de la base de datos
--relacion entre la tabla pais y pasajero

alter table pasajero
add constraint FK_PASAJERO_PAIS
FOREIGN KEY (idpais) references pais(idpais)
go

--relacion entre la tabla aeropuerto y pais

alter table aeropuerto
add constraint FK_AEROPUERTO_PAIS
foreign key (idpais) references pais(idpais)
go

--relacion entre la tabla pago y pasajero
alter table pago
add constraint FK_PAGO_PASAJERO
foreign key (idpasajero) references pasajero(idpasajero)
go

--relacion entre la tabla pago y reserva
alter table pago
add constraint FK_PAGO_RESERVA
foreign key (idreserva) references reserva(idreserva)
go

--relacion entre la tabla avion y aerolinea
alter table avion
add constraint FK_AVION_AEROLINEA
foreign key (idaerolinea) references aerolinea (idaerolinea)
go

--eliminar una relacion
alter table avion
drop constraint FK_AVION_AEROLINEA

--RELACION entre la tabla vuelo y asiento
alter table vuelo
add constraint FK_VUELO_ASIENTO
foreign key (idasiento)references asiento(idasiento)
go

--relacion entre la tabla vuelo y avion 
alter table vuelo
add constraint FK_VUELO_AVION
foreign key (idavion) references avion (idavion)
go

--relacion entre la tabla vuelo y reserva
alter table vuelo
add constraint FK_VUELO_RESERVA
foreign key (idreserva) references reserva (idreserva)
go

--relacion entr la tabla vuelo y tarifa
alter table vuelo
add constraint FK_VUELO_TARIFA
foreign key (idtarifa) references tarifa(idtarifa)
go

--relacion entre tabla vuelo y aeropuerto
alter table vuelo 
add constraint FK_VUELO_AEROPUERTO
foreign key (idaeropuerto) references aeropuerto(idaeropuerto)
go

--separa base de datos
SP_DETACH_DB @DBNAME='NOMBREBD'
GO