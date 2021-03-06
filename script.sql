USE [master]
GO
/****** Object:  Database [dbreserva]    Script Date: 4/4/2022 12:47:23 ******/
CREATE DATABASE [dbreserva]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbreserva', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dbreserva.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbreserva_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dbreserva_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbreserva] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbreserva].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbreserva] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbreserva] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbreserva] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbreserva] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbreserva] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbreserva] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbreserva] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbreserva] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbreserva] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbreserva] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbreserva] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbreserva] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbreserva] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbreserva] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbreserva] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbreserva] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbreserva] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbreserva] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbreserva] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbreserva] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbreserva] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbreserva] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbreserva] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbreserva] SET  MULTI_USER 
GO
ALTER DATABASE [dbreserva] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbreserva] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbreserva] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbreserva] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbreserva] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbreserva] SET QUERY_STORE = OFF
GO
USE [dbreserva]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [dbreserva]
GO
/****** Object:  Table [dbo].[aerolinea]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aerolinea](
	[idaerolinea] [int] NOT NULL,
	[ruc] [char](11) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_aerolinea] PRIMARY KEY CLUSTERED 
(
	[idaerolinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aeropuerto]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aeropuerto](
	[idaeropuerto] [char](5) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[idpais] [char](4) NOT NULL,
 CONSTRAINT [PK_aeropuerto] PRIMARY KEY CLUSTERED 
(
	[idaeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asiento]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asiento](
	[idasiento] [int] NOT NULL,
	[letra] [char](1) NOT NULL,
	[fila] [int] NOT NULL,
 CONSTRAINT [PK_asiento] PRIMARY KEY CLUSTERED 
(
	[idasiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[avion]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avion](
	[idavion] [char](5) NOT NULL,
	[idaerolinea] [int] NOT NULL,
	[fabricante] [varchar](70) NULL,
	[tipo] [varchar](30) NOT NULL,
	[capacidad] [int] NOT NULL,
 CONSTRAINT [PK_avion] PRIMARY KEY CLUSTERED 
(
	[idavion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[idpago] [int] IDENTITY(1,1) NOT NULL,
	[idreserva] [int] NOT NULL,
	[idpasajero] [char](8) NOT NULL,
	[fecha] [date] NOT NULL,
	[monto] [money] NOT NULL,
	[tipo_documento] [varchar](30) NOT NULL,
	[num_comprobante] [varchar](15) NOT NULL,
	[impuesto] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_pago] PRIMARY KEY CLUSTERED 
(
	[idpago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pais](
	[idpais] [char](4) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pais] PRIMARY KEY CLUSTERED 
(
	[idpais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasajero]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasajero](
	[idpasajero] [char](8) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apaterno] [varchar](20) NOT NULL,
	[amaterno] [varchar](20) NOT NULL,
	[tipo_documento] [varchar](30) NOT NULL,
	[num_documento] [varchar](15) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[idpais] [char](4) NOT NULL,
	[telefono] [varchar](15) NULL,
	[email] [varchar](50) NOT NULL,
	[clave] [varchar](20) NULL,
 CONSTRAINT [PK_pasajero] PRIMARY KEY CLUSTERED 
(
	[idpasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reserva]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserva](
	[idreserva] [int] NOT NULL,
	[costo] [money] NOT NULL,
	[fecha] [date] NOT NULL,
	[observacion] [varchar](200) NULL,
 CONSTRAINT [PK_reserva] PRIMARY KEY CLUSTERED 
(
	[idreserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarifa]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarifa](
	[idtarifa] [int] NOT NULL,
	[clase] [varchar](20) NOT NULL,
	[precio] [money] NOT NULL,
	[impuesto] [money] NOT NULL,
 CONSTRAINT [PK_tarifa] PRIMARY KEY CLUSTERED 
(
	[idtarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vuelo]    Script Date: 4/4/2022 12:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vuelo](
	[idasiento] [int] NOT NULL,
	[idavion] [char](5) NOT NULL,
	[idaeropuerto] [char](5) NOT NULL,
	[idreserva] [int] NOT NULL,
	[idtarifa] [int] NOT NULL,
 CONSTRAINT [PK_vuelo] PRIMARY KEY CLUSTERED 
(
	[idasiento] ASC,
	[idavion] ASC,
	[idaeropuerto] ASC,
	[idreserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aeropuerto]  WITH CHECK ADD  CONSTRAINT [FK_aeropuerto_pais] FOREIGN KEY([idpais])
REFERENCES [dbo].[pais] ([idpais])
GO
ALTER TABLE [dbo].[aeropuerto] CHECK CONSTRAINT [FK_aeropuerto_pais]
GO
ALTER TABLE [dbo].[avion]  WITH CHECK ADD  CONSTRAINT [FK_avion_aerolinea] FOREIGN KEY([idaerolinea])
REFERENCES [dbo].[aerolinea] ([idaerolinea])
GO
ALTER TABLE [dbo].[avion] CHECK CONSTRAINT [FK_avion_aerolinea]
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD  CONSTRAINT [FK_pago_pasajero] FOREIGN KEY([idpasajero])
REFERENCES [dbo].[pasajero] ([idpasajero])
GO
ALTER TABLE [dbo].[pago] CHECK CONSTRAINT [FK_pago_pasajero]
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD  CONSTRAINT [FK_pago_reserva] FOREIGN KEY([idreserva])
REFERENCES [dbo].[reserva] ([idreserva])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pago] CHECK CONSTRAINT [FK_pago_reserva]
GO
ALTER TABLE [dbo].[pasajero]  WITH CHECK ADD  CONSTRAINT [FK_pasajero_pais] FOREIGN KEY([idpais])
REFERENCES [dbo].[pais] ([idpais])
GO
ALTER TABLE [dbo].[pasajero] CHECK CONSTRAINT [FK_pasajero_pais]
GO
ALTER TABLE [dbo].[vuelo]  WITH CHECK ADD  CONSTRAINT [FK_vuelo_aeropuerto] FOREIGN KEY([idaeropuerto])
REFERENCES [dbo].[aeropuerto] ([idaeropuerto])
GO
ALTER TABLE [dbo].[vuelo] CHECK CONSTRAINT [FK_vuelo_aeropuerto]
GO
ALTER TABLE [dbo].[vuelo]  WITH CHECK ADD  CONSTRAINT [FK_vuelo_asiento] FOREIGN KEY([idasiento])
REFERENCES [dbo].[asiento] ([idasiento])
GO
ALTER TABLE [dbo].[vuelo] CHECK CONSTRAINT [FK_vuelo_asiento]
GO
ALTER TABLE [dbo].[vuelo]  WITH CHECK ADD  CONSTRAINT [FK_vuelo_avion] FOREIGN KEY([idavion])
REFERENCES [dbo].[avion] ([idavion])
GO
ALTER TABLE [dbo].[vuelo] CHECK CONSTRAINT [FK_vuelo_avion]
GO
ALTER TABLE [dbo].[vuelo]  WITH CHECK ADD  CONSTRAINT [FK_vuelo_reserva] FOREIGN KEY([idreserva])
REFERENCES [dbo].[reserva] ([idreserva])
GO
ALTER TABLE [dbo].[vuelo] CHECK CONSTRAINT [FK_vuelo_reserva]
GO
ALTER TABLE [dbo].[vuelo]  WITH CHECK ADD  CONSTRAINT [FK_vuelo_tarifa] FOREIGN KEY([idtarifa])
REFERENCES [dbo].[tarifa] ([idtarifa])
GO
ALTER TABLE [dbo].[vuelo] CHECK CONSTRAINT [FK_vuelo_tarifa]
GO
USE [master]
GO
ALTER DATABASE [dbreserva] SET  READ_WRITE 
GO
