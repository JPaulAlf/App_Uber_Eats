USE [master]
GO
/****** Object:  Database [JustEat_Pry5CT]    Script Date: 18/8/2020 12:24:34 ******/
CREATE DATABASE [JustEat_Pry5CT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JustEat_Pry5CT', FILENAME = N'C:\DB\JustEat_Pry5CT.mdf' , SIZE = 18432KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'JustEat_Pry5CT_log', FILENAME = N'C:\DB\JustEat_Pry5CT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JustEat_Pry5CT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JustEat_Pry5CT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JustEat_Pry5CT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET ARITHABORT OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JustEat_Pry5CT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JustEat_Pry5CT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JustEat_Pry5CT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JustEat_Pry5CT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET RECOVERY FULL 
GO
ALTER DATABASE [JustEat_Pry5CT] SET  MULTI_USER 
GO
ALTER DATABASE [JustEat_Pry5CT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JustEat_Pry5CT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JustEat_Pry5CT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JustEat_Pry5CT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JustEat_Pry5CT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JustEat_Pry5CT', N'ON'
GO
ALTER DATABASE [JustEat_Pry5CT] SET QUERY_STORE = OFF
GO
USE [JustEat_Pry5CT]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [nvarchar](25) NOT NULL,
	[Nombre] [nvarchar](25) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Fotografia] [varbinary](max) NOT NULL,
	[Precio] [float] NOT NULL,
	[CodigoQR] [varbinary](max) NULL,
	[FechaVencimiento] [smalldatetime] NULL,
	[IDUsuario] [int] NOT NULL,
	[IDCategoriaArticulo] [int] NOT NULL,
	[Activo/Inactivo] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Articulo__D6F931E5825635E2] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaArticulo]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaArticulo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriaArticulo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaTarjeta]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaTarjeta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_CategoriaTarjeta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaTransporte]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaTransporte](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_CategoriaTransporte] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaUsuario]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaUsuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [nvarchar](50) NOT NULL,
	[RecibeCalificacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriaUsuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetFactura]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetFactura](
	[IDEncFactura] [int] NOT NULL,
	[IDArticulo] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_DetFactura] PRIMARY KEY CLUSTERED 
(
	[IDEncFactura] ASC,
	[IDArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EncFactura]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncFactura](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FechaPago] [smalldatetime] NOT NULL,
	[MontoSubtotal] [float] NOT NULL,
	[MontoExpress] [float] NOT NULL,
	[Impuesto] [float] NOT NULL,
	[MontoColones] [float] NOT NULL,
	[MontoDolares] [float] NOT NULL,
	[EstaPago] [nvarchar](10) NULL,
	[EstaAceptado] [nvarchar](10) NULL,
	[EstaAceptadoRepartidor] [nvarchar](10) NULL,
	[EstaEntregado] [nvarchar](10) NULL,
	[RespaldoXML] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EncFactura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EncFacturaUsuario]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncFacturaUsuario](
	[IDEncFactura] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[Calificacion] [float] NULL,
	[Comentario] [nvarchar](250) NULL,
	[EstaCalificado] [nvarchar](10) NULL,
 CONSTRAINT [PK_EncFacturaUsuario] PRIMARY KEY CLUSTERED 
(
	[IDEncFactura] ASC,
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumeroTarjeta] [nvarchar](25) NOT NULL,
	[CVV] [nvarchar](5) NOT NULL,
	[FechaVencimiento] [smalldatetime] NOT NULL,
	[IDCategoriaTarjeta] [int] NOT NULL,
 CONSTRAINT [PK_Tarjeta_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Tarjeta__BC163C0A894390C2] UNIQUE NONCLUSTERED 
(
	[NumeroTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NumeroTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NumeroTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transporte]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transporte](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [nvarchar](20) NOT NULL,
	[Modelo] [nvarchar](20) NOT NULL,
	[Color] [nvarchar](20) NOT NULL,
	[NumeroPlaca] [int] NULL,
	[EstaAlDia] [nvarchar](10) NULL,
	[IDCategoriaTransporte] [int] NOT NULL,
 CONSTRAINT [PK_Transporte] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NULL,
	[NumeroTelefono] [nvarchar](20) NOT NULL,
	[Latitud] [nvarchar](50) NOT NULL,
	[Longitud] [nvarchar](50) NOT NULL,
	[DescripcionUbicacion] [nvarchar](250) NOT NULL,
	[CorreoElectronico] [nvarchar](50) NOT NULL,
	[Contrasenna] [nvarchar](32) NOT NULL,
	[IDTarjeta] [int] NOT NULL,
	[IDCategoriaUsuario] [int] NOT NULL,
	[IDTransporte] [int] NULL,
	[Calificacion] [float] NULL,
	[Activo/Inactivo] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NumeroTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NumeroTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_CategoriaArticulo] FOREIGN KEY([IDCategoriaArticulo])
REFERENCES [dbo].[CategoriaArticulo] ([ID])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_CategoriaArticulo]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Usuario]
GO
ALTER TABLE [dbo].[DetFactura]  WITH CHECK ADD  CONSTRAINT [PK_FK_DetFactura_Articulo] FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[Articulo] ([ID])
GO
ALTER TABLE [dbo].[DetFactura] CHECK CONSTRAINT [PK_FK_DetFactura_Articulo]
GO
ALTER TABLE [dbo].[DetFactura]  WITH CHECK ADD  CONSTRAINT [PK_FK_DetFactura_EncFactura] FOREIGN KEY([IDEncFactura])
REFERENCES [dbo].[EncFactura] ([ID])
GO
ALTER TABLE [dbo].[DetFactura] CHECK CONSTRAINT [PK_FK_DetFactura_EncFactura]
GO
ALTER TABLE [dbo].[EncFacturaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EncFacturaUsuario_EncFactura] FOREIGN KEY([IDEncFactura])
REFERENCES [dbo].[EncFactura] ([ID])
GO
ALTER TABLE [dbo].[EncFacturaUsuario] CHECK CONSTRAINT [FK_EncFacturaUsuario_EncFactura]
GO
ALTER TABLE [dbo].[EncFacturaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EncFacturaUsuario_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[EncFacturaUsuario] CHECK CONSTRAINT [FK_EncFacturaUsuario_Usuario]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_CategoriaTarjeta] FOREIGN KEY([IDCategoriaTarjeta])
REFERENCES [dbo].[CategoriaTarjeta] ([ID])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_CategoriaTarjeta]
GO
ALTER TABLE [dbo].[Transporte]  WITH CHECK ADD  CONSTRAINT [FK_Transporte_CategoriaTransporte] FOREIGN KEY([IDCategoriaTransporte])
REFERENCES [dbo].[CategoriaTransporte] ([ID])
GO
ALTER TABLE [dbo].[Transporte] CHECK CONSTRAINT [FK_Transporte_CategoriaTransporte]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_CategoriaUsuario] FOREIGN KEY([IDCategoriaUsuario])
REFERENCES [dbo].[CategoriaUsuario] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_CategoriaUsuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Tarjeta1] FOREIGN KEY([IDTarjeta])
REFERENCES [dbo].[Tarjeta] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Tarjeta1]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Transporte] FOREIGN KEY([IDTransporte])
REFERENCES [dbo].[Transporte] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Transporte]
GO
/****** Object:  StoredProcedure [dbo].[PA_Actualiza_AceptaOrden]    Script Date: 18/8/2020 12:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_Actualiza_AceptaOrden]
	@vIDOrden int
	AS 
	BEGIN
	BEGIN TRY

	update EncFactura set EstaAceptado='true' where ID=@vIDOrden

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ACTUALIZA_ARTICULO_Cupon]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_ACTUALIZA_ARTICULO_Cupon]
		@vIdentificacion nvarchar(25) ,
		@vNombre nvarchar(25),
		@vDescripcion nvarchar(50),
		@vFotografia varbinary(MAX),
		@vPrecio float,
		
		@vCodigoQR varbinary(MAX),
		@vFechaVencimiento nvarchar(30),

		@vIdentificacionUsuario int,
		@vIdentificacionOriginalProducto  nvarchar(25)
	AS 
	BEGIN
	BEGIN TRY	
	
	Declare @vIDUsuario int,@vIDProducto int;
	select @vIDUsuario= ID from Usuario where Identificacion=@vIdentificacionUsuario;
	select @vIDProducto=ID from  Articulo where Identificacion=@vIdentificacionOriginalProducto

	
	UPDATE Articulo 
	SET Articulo.Identificacion=@vIdentificacion,  Articulo.Nombre=@vNombre,  Articulo.Descripcion=@vDescripcion,
	 Articulo.Fotografia=@vFotografia, Articulo.Precio=@vPrecio, Articulo.CodigoQR=@vCodigoQR, Articulo.FechaVencimiento=@vFechaVencimiento
	WHERE  Articulo.ID=@vIDProducto and  Articulo.IDUsuario=@vIDUsuario


	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ACTUALIZA_ARTICULO_Producto]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_ACTUALIZA_ARTICULO_Producto]
		@vIdentificacion nvarchar(25) ,
		@vNombre nvarchar(25),
		@vDescripcion nvarchar(50),
		@vFotografia varbinary(MAX),
		@vPrecio float,
		
		@vIdentificacionUsuario int,
		@vIdentificacionOriginalProducto nvarchar(25)
	AS 
	BEGIN
	BEGIN TRY	
	
	Declare @vIDUsuario int,@vIDProducto int;
	select @vIDUsuario= ID from Usuario where Identificacion=@vIdentificacionUsuario;
	select @vIDProducto=ID from  Articulo where Identificacion=@vIdentificacionOriginalProducto

	
	UPDATE Articulo 
	SET Articulo.Identificacion=@vIdentificacion,  Articulo.Nombre=@vNombre,  Articulo.Descripcion=@vDescripcion,
	 Articulo.Fotografia=@vFotografia, Articulo.Precio=@vPrecio
	WHERE  Articulo.ID=@vIDProducto and  Articulo.IDUsuario=@vIDUsuario


	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_ESTADO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_ARTICULO_ESTADO]
		@vIdentificacion nvarchar(25) 
	AS 
	BEGIN
	BEGIN TRY	
	select 
	t.[Activo/Inactivo]
	from 
	Articulo t 
	where 
	t.Identificacion= @vIdentificacion

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_ESTADO_Activa]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[PA_ARTICULO_ESTADO_Activa]
		@vIdentificacion nvarchar(25) 
	AS 
	BEGIN
	BEGIN TRY	
		UPDATE Articulo
		SET Articulo.[Activo/Inactivo]='ACTIVO'
		WHERE Identificacion= @vIdentificacion

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_ESTADO_Desactiva]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_ARTICULO_ESTADO_Desactiva]
		@vIdentificacion nvarchar(25) 
	AS 
	BEGIN
	BEGIN TRY	
		UPDATE Articulo
		SET Articulo.[Activo/Inactivo]='INACTIVO'
		WHERE Identificacion= @vIdentificacion

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_ESTADO_Identificacion]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_ARTICULO_ESTADO_Identificacion]
		@vIdentificacion nvarchar(25) 
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Articulo t where t.Identificacion=@vIdentificacion and t.[Activo/Inactivo]='ACTIVO' ) >= 1) 
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if((select COUNT(*) from Articulo t where t.Identificacion=@vIdentificacion and t.[Activo/Inactivo]='ACTIVO' ) = 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_ESTADO_Identificacion_SinFiltro]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[PA_ARTICULO_ESTADO_Identificacion_SinFiltro]
		@vIdentificacion nvarchar(25) 
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Articulo t where t.Identificacion=@vIdentificacion ) >= 1) 
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if((select COUNT(*) from Articulo t where t.Identificacion=@vIdentificacion  ) = 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_RETORNA_IDENTIFICACIONES_CUPONES]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_ARTICULO_RETORNA_IDENTIFICACIONES_CUPONES]
		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY


	DECLARE @vIDUser int 
	SELECT @vIDUser=ID from Usuario where Usuario.Identificacion=@vIdentificacionUsuario
	SELECT a.Identificacion FROM Articulo a WHERE a.IDUsuario=@vIDUser and a.IDCategoriaArticulo=2 and a.[Activo/Inactivo]='ACTIVO'

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_RETORNA_IDENTIFICACIONES_CUPONES_SinFiltro]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[PA_ARTICULO_RETORNA_IDENTIFICACIONES_CUPONES_SinFiltro]
		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY

	DECLARE @vIDUser int 
	SELECT @vIDUser=ID from Usuario where Usuario.Identificacion=@vIdentificacionUsuario
	SELECT a.Identificacion FROM Articulo a WHERE a.IDUsuario=@vIDUser and a.IDCategoriaArticulo=2

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_RETORNA_IDENTIFICACIONES_PRODUCTOS]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[PA_ARTICULO_RETORNA_IDENTIFICACIONES_PRODUCTOS]
		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY


	DECLARE @vIDUser int 
	SELECT @vIDUser=ID from Usuario where Usuario.Identificacion=@vIdentificacionUsuario
	SELECT a.Identificacion FROM Articulo a WHERE a.IDUsuario=@vIDUser and a.IDCategoriaArticulo=1 and a.[Activo/Inactivo]='ACTIVO'

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_ARTICULO_RETORNA_IDENTIFICACIONES_PRODUCTOS_SinFiltro]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_ARTICULO_RETORNA_IDENTIFICACIONES_PRODUCTOS_SinFiltro]
		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY

	DECLARE @vIDUser int 
	SELECT @vIDUser=ID from Usuario where Usuario.Identificacion=@vIdentificacionUsuario
	SELECT a.Identificacion FROM Articulo a WHERE a.IDUsuario=@vIDUser and a.IDCategoriaArticulo=1

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTA_AceptaOrdenEntregar]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_INSERTA_AceptaOrdenEntregar]
	@vIDOrden int,
	@vIdentificacion int 
	AS 
	BEGIN
	BEGIN TRY

	declare @vIDUser int
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacion


	update EncFactura set EstaAceptadoRepartidor='true' where ID=@vIDOrden
	insert into  EncFacturaUsuario values (@vIDOrden,@vIDUser,0,'','false');

	Select u.CorreoElectronico,u.Contrasenna, sum(dt.Cantidad)'Cantidad'
	from Usuario u,CategoriaUsuario ca, EncFactura ef, EncFacturaUsuario eu, DetFactura dt
	where eu.IDUsuario=u.ID and ef.ID=dt.IDEncFactura and ca.ID=u.IDCategoriaUsuario and
	ca.NombreCategoria='USUARIO_CLIENTE' and ef.EstaPago='true' and ef.EstaAceptado='true'
	and ef.EstaEntregado='false' and ef.EstaAceptadoRepartidor='true' and ef.ID=eu.IDEncFactura	 and ef.ID=@vIDOrden
	group by u.CorreoElectronico,u.Contrasenna
	order by u.CorreoElectronico

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTA_ARTICULO_Cupon]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_INSERTA_ARTICULO_Cupon]
		@vIdentificacion nvarchar(25) ,
		@vNombre nvarchar(25),
		@vDescripcion nvarchar(50),
		@vFotografia varbinary(MAX),
		@vPrecio float,
		
		@vCodigoQR varbinary(MAX),
		@vFechaVencimiento nvarchar(30),

		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY	
	
	Declare @vIDUsuario int;
	select @vIDUsuario= ID from Usuario where Identificacion=@vIdentificacionUsuario;

	insert into Articulo 
	values 
	(@vIdentificacion,@vNombre,@vDescripcion,@vFotografia,@vPrecio,@vCodigoQR,@vFechaVencimiento,@vIDUsuario,2,'ACTIVO');


	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTA_ARTICULO_Producto]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_INSERTA_ARTICULO_Producto]
		@vIdentificacion nvarchar(25) ,
		@vNombre nvarchar(25),
		@vDescripcion nvarchar(50),
		@vFotografia varbinary(MAX),
		@vPrecio float,
		
		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY	
	
	Declare @vIDUsuario int;
	select @vIDUsuario= ID from Usuario where Identificacion=@vIdentificacionUsuario;

	insert into Articulo 
	values 
	(@vIdentificacion,@vNombre,@vDescripcion,@vFotografia,@vPrecio,null,null,@vIDUsuario,1,'ACTIVO');


	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTA_CALIFICACION]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_INSERTA_CALIFICACION]
		@vIdentificacionUsuario int,
		@vNumeroTelefonoComercio nvarchar(20),
		@vNuevaCalificacion int,
		@vComentario nvarchar(250)
	AS 
	BEGIN
	BEGIN TRY

	--Variables que se usan para su correcto funcionamiento
	declare @vIDUser int,@vIDEnc int,@vCantCalificaciones int, @vSumCalificaciones int, @vIDLocalUser int

	select @vIDLocalUser=ID from Usuario where Identificacion= @vIdentificacionUsuario;--ID Usuario normal
	select @vIDUser=ID from Usuario where NumeroTelefono= @vNumeroTelefonoComercio;--ID Comercio

	select  @vIDEnc=max(ef.ID)			--Obtengo el ID, de la ultima compra del usuario
	from EncFactura ef, Usuario u, EncFacturaUsuario eu
	where eu.IDUsuario=@vIDLocalUser and ef.ID=eu.IDEncFactura and u.ID=@vIDLocalUser 

	----Calculo la cantidad y sumatoria de las calificaciones de ese negocio
	--select @vCantCalificaciones=count(IDUsuario), @vSumCalificaciones=sum(calificacion) from EncFacturaUsuario where IDUsuario=@vIDUser and Calificacion>0;

	--ingreso las calificaciones en la tabla de EncFactura
	update EncFacturaUsuario set Calificacion=@vNuevaCalificacion, Comentario=@vComentario , EstaCalificado='true'
	where IDUsuario=@vIDUser and IDEncFactura=@vIDEnc

	--Calculo la cantidad y sumatoria de las calificaciones de ese negocio
	select @vCantCalificaciones=count(Calificacion), @vSumCalificaciones=sum(calificacion) from EncFacturaUsuario where IDUsuario=@vIDUser and Calificacion>0;
	--+@vNuevaCalificacion
	--Actualizo el campo de calificaciones
	update Usuario set Calificacion=(@vSumCalificaciones/@vCantCalificaciones)*10
	where Usuario.ID=@vIDUser
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END


	select * from EncFacturaUsuario where Calificacion>0 
	select * from Usuario
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTA_DetFactura]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PA que inserta articulos a la factura
	CREATE PROCEDURE [dbo].[PA_INSERTA_DetFactura]
		@vIdentificacion nvarchar(25),
		@vCantidad int,
		@vPrecio float
		
	AS 
	BEGIN
	BEGIN TRY

	declare @vIDArticulo int;
	select @vIDArticulo=a.ID from Articulo a where a.Identificacion=@vIdentificacion

	insert into DetFactura values ((select max(ID)from EncFactura),@vIDArticulo,@vCantidad,@vPrecio)
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTA_EncFactura]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_INSERTA_EncFactura]
		@vFechaPago nvarchar(25),
		@vMontoSubTotal float,
		@vMontoExpress float,
		@vImpuesto float,
		@vMontoColones float,
		@MontoDolares float,
		@vRespaldoXML nvarchar(max)
	AS 
	BEGIN
	BEGIN TRY
	
	insert into EncFactura values ( @vFechaPago,@vMontoSubTotal,@vMontoExpress,
	@vImpuesto,@vMontoColones,@MontoDolares,'true','false','false','false',@vRespaldoXML)
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTA_EncFacturaUsuario]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[PA_INSERTA_EncFacturaUsuario]
		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY
	
	declare @vIDUsuario int;
	select @vIDUsuario=u.ID from Usuario u where u.Identificacion=@vIdentificacionUsuario

	insert into EncFacturaUsuario values ((Select max(ID) from EncFactura),@vIDUsuario,0,'','false');

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTA_OrdenEntregada]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_INSERTA_OrdenEntregada]
	@vIDOrden int
	AS 
	BEGIN
	BEGIN TRY

	update EncFactura set EstaEntregado='true' where ID=@vIDOrden

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_OBTENER_ARTICULO_Cupon]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_OBTENER_ARTICULO_Cupon]
		@vIdentificacion nvarchar(25) ,

		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY	
	
	Declare @vIDUsuario int;
	select @vIDUsuario= ID from Usuario where Identificacion=@vIdentificacionUsuario;

	
	select a.Identificacion,a.Nombre,a.Descripcion,a.Fotografia,a.Precio ,a.CodigoQR,a.FechaVencimiento
	from Articulo a, Usuario u 
	where a.IDUsuario= @vIDUsuario and
	a.Identificacion=@vIdentificacion and
	a.[Activo/Inactivo]='ACTIVO' 


	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_OBTENER_ARTICULO_Cupon_SinFiltro]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PA_OBTENER_ARTICULO_Cupon_SinFiltro]
		@vIdentificacion nvarchar(25) ,

		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY	
	
	Declare @vIDUsuario int;
	select @vIDUsuario= ID from Usuario where Identificacion=@vIdentificacionUsuario;

	
	select a.Identificacion,a.Nombre,a.Descripcion,a.Fotografia,a.Precio,a.CodigoQR,a.FechaVencimiento
	from Articulo a, Usuario u 
	where a.IDUsuario= @vIDUsuario and a.Identificacion=@vIdentificacion 


	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_OBTENER_ARTICULO_Producto]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_OBTENER_ARTICULO_Producto]
		@vIdentificacion nvarchar(25) ,

		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY	
	
	Declare @vIDUsuario int;
	select @vIDUsuario= ID from Usuario where Identificacion=@vIdentificacionUsuario;

	
	select a.Identificacion,a.Nombre,a.Descripcion,a.Fotografia,a.Precio
	from Articulo a, Usuario u 
	where a.IDUsuario= @vIDUsuario and
	a.Identificacion=@vIdentificacion and
	a.[Activo/Inactivo]='ACTIVO' 


	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_OBTENER_ARTICULO_Producto_SinFiltro]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_OBTENER_ARTICULO_Producto_SinFiltro]
		@vIdentificacion nvarchar(25) ,

		@vIdentificacionUsuario int
	AS 
	BEGIN
	BEGIN TRY	
	
	Declare @vIDUsuario int;
	select @vIDUsuario= ID from Usuario where Identificacion=@vIdentificacionUsuario;

	
	select a.Identificacion,a.Nombre,a.Descripcion,a.Fotografia,a.Precio
	from Articulo a, Usuario u 
	where a.IDUsuario= @vIDUsuario and a.Identificacion=@vIdentificacion 


	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_PRUEBA]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_PRUEBA]
	@vIdentificacionUser int,
	@vIdentificacionNeg int
	AS
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDNeg int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacionUser
    select @vIDNeg=ID from Usuario where Identificacion= @vIdentificacionNeg


			declare @tTablaAux table
								(
								 Fecha smalldatetime,
								 IDOrden int,
								 Nombre nvarchar(25),
								 Cantidad int,
								 Express float,
								 Comentario nvarchar(250)
								);


	 DECLARE cFacturas CURSOR FOR  
	 select ef.IDEncFactura, COUNT(*) as Contador 
	 from EncFacturaUsuario ef
	 where ef.IDUsuario = @vIDUser or ef.IDUsuario = @vIDNeg 
	 group by ef.IDEncFactura

open cFacturas

declare @vIDEncFactura int, @vContador int

fetch cFacturas into @vIDEncFactura, @vContador

while(@@FETCH_STATUS = 0)
begin
SET NOCOUNT ON;
	IF(@vContador > 1)
	BEGIN 

	-- Inserta dentro de una tabla auxiliar para retornar todos los valores juntos
	insert @tTablaAux 
	select ef.FechaPago,ef.ID,a.Nombre,dt.Cantidad,ef.MontoExpress,eu.Comentario
	from EncFactura ef , DetFactura dt, EncFacturaUsuario eu,Articulo a,usuario us, CategoriaUsuario ca
	where ef.ID = @vIDEncFactura and ef.ID=dt.IDEncFactura and a.ID=dt.IDArticulo and ef.ID=eu.IDEncFactura 
	and eu.Calificacion<=4 and eu.Calificacion>0 and eu.EstaCalificado='true'
	and eu.IDUsuario=us.ID and us.IDCategoriaUsuario=ca.ID and ca.ID=3 and us.ID=@vIDUser

	END
	fetch cFacturas into @vIDEncFactura, @vContador
end
close cFacturas

deallocate cFacturas

select * from @tTablaAux order by FECHA desc

END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RegistroNuevoUsuario_CLIENTE]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RegistroNuevoUsuario_CLIENTE]
		@vIdentificacion int,
		@vNombre nvarchar(50),
		@vApellido nvarchar(50),
		@vNumeroTelefono nvarchar(20),
		@vLatitud nvarchar(50),
		@vLongitud nvarchar(50),
		@vDescripcionUbicacion nvarchar(250),
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32),

		@vNumeroTarjeta nvarchar(20),
		@vCVV nvarchar(5),
		@vFechaVencimiento nvarchar(30),
		@vTipoTarjeta int
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vIDTarjeta int 
		INSERT INTO Tarjeta VALUES (@vNumeroTarjeta,@vCVV,@vFechaVencimiento,@vTipoTarjeta);
		select @vIDTarjeta=t.ID from Tarjeta t where t.NumeroTarjeta= @vNumeroTarjeta

		INSERT INTO Usuario VALUES (@vIdentificacion,@vNombre,@vApellido,@vNumeroTelefono,@vLatitud,@vLongitud,@vDescripcionUbicacion,
									@vCorreoElectronico,@vContrasenna,@vIDTarjeta,1,null,null,'ACTIVO');
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RegistroNuevoUsuario_NEGOCIO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RegistroNuevoUsuario_NEGOCIO]
		@vIdentificacion int,
		@vNombre nvarchar(50),
		@vNumeroTelefono nvarchar(20),
		@vLatitud nvarchar(50),
		@vLongitud nvarchar(50),
		@vDescripcionUbicacion nvarchar(250),
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32),

		@vNumeroTarjeta nvarchar(20),
		@vCVV nvarchar(5),
		@vFechaVencimiento nvarchar(30),
		@vTipoTarjeta int
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE  @vIDTarjeta int 
		INSERT INTO Tarjeta VALUES (@vNumeroTarjeta,@vCVV,@vFechaVencimiento,@vTipoTarjeta);
		SELECT @vIDTarjeta=t.ID FROM Tarjeta t WHERE t.NumeroTarjeta= @vNumeroTarjeta
		INSERT INTO Usuario VALUES (@vIdentificacion,@vNombre,null,@vNumeroTelefono,@vLatitud,@vLongitud,@vDescripcionUbicacion,
									@vCorreoElectronico,@vContrasenna,@vIDTarjeta,2,null,0.0,'ACTIVO');
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RegistroNuevoUsuario_REPARTIDOR_BICICLETA]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RegistroNuevoUsuario_REPARTIDOR_BICICLETA]
		@vIdentificacion int ,
		@vNombre nvarchar(50),
		@vApellido nvarchar(50),
		@vNumeroTelefono nvarchar(20),
		@vLatitud nvarchar(50),
		@vLongitud nvarchar(50),
		@vDescripcionUbicacion nvarchar(250),
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32),

		@vNumeroTarjeta nvarchar(20),
		@vCVV nvarchar(5),
		@vFechaVencimiento nvarchar(30),
		@vTipoTarjeta int,

		@vMarca nvarchar(20),
		@vModelo nvarchar(20),
		@vColor nvarchar(20)
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vIDTransporte int,  @vIDTarjeta int 

		INSERT INTO Transporte VALUES(@vMarca,@vModelo,@vColor,null,null,3);
		SELECT @vIDTransporte=MAX(ID) FROM Transporte

		INSERT INTO Tarjeta VALUES (@vNumeroTarjeta,@vCVV,@vFechaVencimiento,@vTipoTarjeta);
		SELECT @vIDTarjeta=t.ID FROM Tarjeta t WHERE t.NumeroTarjeta= @vNumeroTarjeta

		INSERT INTO Usuario VALUES (@vIdentificacion,@vNombre,@vApellido,@vNumeroTelefono,@vLatitud,@vLongitud,@vDescripcionUbicacion,
									@vCorreoElectronico,@vContrasenna,@vIDTarjeta,3,@vIDTransporte,0.0,'ACTIVO');
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RegistroNuevoUsuario_REPARTIDOR_MOTORVEHCULO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RegistroNuevoUsuario_REPARTIDOR_MOTORVEHCULO]
		@vIdentificacion int,
		@vNombre nvarchar(50),
		@vApellido nvarchar(50),
		@vNumeroTelefono nvarchar(20),
		@vLatitud nvarchar(50),
		@vLongitud nvarchar(50),
		@vDescripcionUbicacion nvarchar(250),
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32),

		@vNumeroTarjeta nvarchar(20),
		@vCVV nvarchar(5),
		@vFechaVencimiento nvarchar(30),
		@vTipoTarjeta int,

		@vMarca nvarchar(20),
		@vModelo nvarchar(20),
		@vColor nvarchar(20),
		@vNumeroPlaca int,
		@vEstaAlDia nvarchar(10),
		@vIDCategoriaVechiclo int

	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vIDTransporte int,  @vIDTarjeta int 

		INSERT INTO Transporte VALUES(@vMarca,@vModelo,@vColor,@vNumeroPlaca,@vEstaAlDia,@vIDCategoriaVechiclo);
		SELECT @vIDTransporte=MAX(ID) FROM Transporte

		INSERT INTO Tarjeta VALUES (@vNumeroTarjeta,@vCVV,@vFechaVencimiento,@vTipoTarjeta);
		SELECT @vIDTarjeta=t.ID FROM Tarjeta t WHERE t.NumeroTarjeta= @vNumeroTarjeta

		INSERT INTO Usuario VALUES (@vIdentificacion,@vNombre,@vApellido,@vNumeroTelefono,@vLatitud,@vLongitud,@vDescripcionUbicacion,
									@vCorreoElectronico,@vContrasenna,@vIDTarjeta,3,@vIDTransporte,0.0,'ACTIVO');
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_REPORTE_CLIENTE_CuponesObtenidos]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_REPORTE_CLIENTE_CuponesObtenidos]
		@vIdentificacion int 
	AS 
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDOrden int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacion

	select a.Nombre,a.Precio,dt.Cantidad,a.FechaVencimiento,a.Fotografia,a.CodigoQR
	from Usuario u, EncFacturaUsuario eu, EncFactura ef,DetFactura dt ,Articulo a, CategoriaArticulo ca
	where u.ID=eu.IDUsuario and ef.ID=eu.IDEncFactura and ef.ID=dt.IDEncFactura and
	a.ID=dt.IDArticulo and ca.ID=a.IDCategoriaArticulo and ca.NombreCategoria='CUPON'
	and u.ID=@vIDUser 
	order by a.FechaVencimiento
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
	
GO
/****** Object:  StoredProcedure [dbo].[PA_REPORTE_NEGOCIO_ComentariosNegativos]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_REPORTE_NEGOCIO_ComentariosNegativos]
		@vIdentificacion int 
	AS 
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDOrden int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacion
	
	select ef.FechaPago,ef.ID, eu.Calificacion, eu.Comentario
	from Usuario u, EncFacturaUsuario eu, EncFactura ef
	where u.ID=eu.IDUsuario and ef.ID=eu.IDEncFactura and u.ID=@vIDUser
	and eu.Calificacion<=4 and eu.Calificacion>0
	order by ef.ID
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_REPORTE_NEGOCIO_CuponesAplicados]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_REPORTE_NEGOCIO_CuponesAplicados]
		@vIdentificacion int 
	AS 
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDOrden int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacion
	
	select ef.FechaPago, a.Nombre,a.Precio
	from Usuario u, EncFacturaUsuario eu, EncFactura ef,DetFactura dt ,Articulo a, CategoriaArticulo ca
	where u.ID=eu.IDUsuario and ef.ID=eu.IDEncFactura and ef.ID=dt.IDEncFactura and
	a.ID=dt.IDArticulo and ca.ID=a.IDCategoriaArticulo and ca.NombreCategoria='CUPON'
	and u.ID=@vIDUser
	order by ef.FechaPago
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_REPORTE_NEGOCIO_Recaudacion]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_REPORTE_NEGOCIO_Recaudacion]
		@vIdentificacion int 
	AS 
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDOrden int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacion
	
	select Convert(date,ef.FechaPago)as FechaPago,ef.ID,sum(dt.Cantidad) as Cantidad,ef.MontoColones 
	from Usuario u, EncFacturaUsuario eu, EncFactura ef, DetFactura dt
	where u.ID=eu.IDUsuario and ef.ID=eu.IDEncFactura and u.ID=@vIDUser and
	dt.IDEncFactura=ef.ID
	group by  ef.FechaPago,ef.ID,ef.MontoColones
	order by ef.FechaPago desc

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END

	
	
GO
/****** Object:  StoredProcedure [dbo].[PA_REPORTE_OrdenesCliente]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_REPORTE_OrdenesCliente]
	@vIdentificacionUser int,
	@vIdentificacionNeg int
	AS
	BEGIN TRY

	declare @vIDUser int,@vIDNeg int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacionUser
    select @vIDNeg=ID from Usuario where Identificacion= @vIdentificacionNeg


			declare @tTablaAux table
								(
								 Fecha smalldatetime,
								 IDOrden int,
								 Nombre nvarchar(25),
								 Cantidad int,
								 PrecioIndividual float,
								 PrecioTotal float,
								 PrecioExpress float,
								 PrecioTotalOrden float
								);


	 DECLARE cFacturas CURSOR FOR  
	 select ef.IDEncFactura, COUNT(*) as Contador 
	 from EncFacturaUsuario ef
	 where ef.IDUsuario = @vIDUser or ef.IDUsuario = @vIDNeg
	 group by ef.IDEncFactura

open cFacturas

declare @vIDEncFactura int, @vContador int

fetch cFacturas into @vIDEncFactura, @vContador

while(@@FETCH_STATUS = 0)
begin
SET NOCOUNT ON;
	IF(@vContador > 1)
	BEGIN 

	-- Inserta dentro de una tabla auxiliar para retornar todos los valores juntos
	insert @tTablaAux 
	select Convert(date,ef.FechaPago),ef.ID,a.Nombre,dt.Cantidad,a.Precio,dt.Precio,ef.MontoExpress,ef.MontoColones
	from EncFactura ef , DetFactura dt, Articulo a
	where ef.ID = @vIDEncFactura and ef.ID=dt.IDEncFactura and a.ID=dt.IDArticulo
	order by ef.FechaPago desc 
	END
	fetch cFacturas into @vIDEncFactura, @vContador
end

close cFacturas

deallocate cFacturas

select * from @tTablaAux order by Fecha desc

END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PA_REPORTE_REPARTIDOR_EntregasCalificadasMal]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--REPORTE DE ENTREGAS Y CON OMENTARIOS MALOS, REPARTIDOR
	CREATE PROCEDURE [dbo].[PA_REPORTE_REPARTIDOR_EntregasCalificadasMal]
	@vIdentificacionUser int,
	@vIdentificacionNeg int
	AS
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDNeg int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacionUser
    select @vIDNeg=ID from Usuario where Identificacion= @vIdentificacionNeg


			declare @tTablaAux table
								(
								 Fecha smalldatetime,
								 IDOrden int,
								 Nombre nvarchar(25),
								 Cantidad int,
								 Express float,
								 Comentario nvarchar(250)
								);


	 DECLARE cFacturas CURSOR FOR  
	 select ef.IDEncFactura, COUNT(*) as Contador 
	 from EncFacturaUsuario ef
	 where ef.IDUsuario = @vIDUser or ef.IDUsuario = @vIDNeg
	 group by ef.IDEncFactura

open cFacturas

declare @vIDEncFactura int, @vContador int

fetch cFacturas into @vIDEncFactura, @vContador

while(@@FETCH_STATUS = 0)
begin
SET NOCOUNT ON;
	IF(@vContador > 1)
	BEGIN 

	-- Inserta dentro de una tabla auxiliar para retornar todos los valores juntos
	insert @tTablaAux 
	select ef.FechaPago,ef.ID,a.Nombre,dt.Cantidad,ef.MontoExpress,eu.Comentario
	from EncFactura ef , DetFactura dt, EncFacturaUsuario eu,Articulo a,usuario us, CategoriaUsuario ca
	where ef.ID = @vIDEncFactura and ef.ID=dt.IDEncFactura and a.ID=dt.IDArticulo and ef.ID=eu.IDEncFactura 
	and eu.Calificacion<=4 and eu.Calificacion>0 and eu.EstaCalificado='true'
	and eu.IDUsuario=us.ID and us.IDCategoriaUsuario=ca.ID and ca.ID=3 and us.ID=@vIDUser

	END
	fetch cFacturas into @vIDEncFactura, @vContador
end

close cFacturas

deallocate cFacturas

select * from @tTablaAux order by FECHA desc

END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_REPORTE_REPARTIDOR_EntregasRealizadas]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[PA_REPORTE_REPARTIDOR_EntregasRealizadas]
	@vIdentificacionUser int,
	@vIdentificacionNeg int
	AS
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDNeg int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacionUser
    select @vIDNeg=ID from Usuario where Identificacion= @vIdentificacionNeg


			declare @tTablaAux table
								(
								 Fecha smalldatetime,
								 IDOrden int,
								 Nombre nvarchar(25),
								 Cantidad int,
								 Express float
								);


	 DECLARE cFacturas CURSOR FOR  
	 select ef.IDEncFactura, COUNT(*) as Contador 
	 from EncFacturaUsuario ef
	 where ef.IDUsuario = @vIDUser or ef.IDUsuario = @vIDNeg
	 group by ef.IDEncFactura

open cFacturas

declare @vIDEncFactura int, @vContador int

fetch cFacturas into @vIDEncFactura, @vContador

while(@@FETCH_STATUS = 0)
begin
SET NOCOUNT ON;
	IF(@vContador > 1)
	BEGIN 

	-- Inserta dentro de una tabla auxiliar para retornar todos los valores juntos
	insert @tTablaAux 
	select Convert(date,ef.FechaPago),ef.ID,a.Nombre,dt.Cantidad,ef.MontoExpress
	from EncFactura ef , DetFactura dt, Articulo a
	where ef.ID = @vIDEncFactura and ef.ID=dt.IDEncFactura and a.ID=dt.IDArticulo and ef.EstaEntregado='true'

	END
	fetch cFacturas into @vIDEncFactura, @vContador
end

close cFacturas

deallocate cFacturas

select * from @tTablaAux order by FECHA desc

END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_CalificacionUltimaCompra]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_CalificacionUltimaCompra]
		@vIdentificacionUsuario int 
	AS 
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDOrden int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacionUsuario
	
	select  @vIDOrden=max(ef.ID)
	from EncFactura ef, Usuario u, EncFacturaUsuario eu
	where eu.IDUsuario=@vIDUser and ef.ID=eu.IDEncFactura and u.ID=@vIDUser

	select u.Nombre,u.NumeroTelefono,ef.MontoColones,u.Calificacion
	from EncFactura ef,EncFacturaUsuario eu , Usuario u, CategoriaUsuario cu
	where ef.ID=eu.IDEncFactura and ef.ID=@vIDOrden and u.ID=eu.IDUsuario 
	and u.IDCategoriaUsuario=cu.ID and cu.RecibeCalificacion='true' and eu.EstaCalificado='false'
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_NegocioVenta]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_NegocioVenta]
	@vIDOrden int
	AS 
	BEGIN
	BEGIN TRY


	Select u.CorreoElectronico,u.Contrasenna, sum(dt.Cantidad)'Cantidad'
	from Usuario u,CategoriaUsuario ca, EncFactura ef, EncFacturaUsuario eu, DetFactura dt
	where eu.IDUsuario=u.ID and ef.ID=dt.IDEncFactura and ca.ID=u.IDCategoriaUsuario and
	ca.NombreCategoria='USUARIO_EMPRESA' and ef.EstaPago='true' and ef.EstaAceptado='true'
	and ef.EstaEntregado='false' and ef.EstaAceptadoRepartidor='true' and ef.ID=eu.IDEncFactura	 and ef.ID=@vIDOrden
	group by u.CorreoElectronico,u.Contrasenna
	order by u.CorreoElectronico

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_OrdenesAceptadas]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_OrdenesAceptadas]
	AS 
	BEGIN
	BEGIN TRY


	Select u.Nombre,ef.ID,sum(dt.Cantidad)'Cantidad',u.DescripcionUbicacion
	from Usuario u,CategoriaUsuario ca, EncFactura ef, EncFacturaUsuario eu, DetFactura dt
	where eu.IDUsuario=u.ID and ef.ID=dt.IDEncFactura and ca.ID=u.IDCategoriaUsuario and
	ca.NombreCategoria='USUARIO_EMPRESA' and ef.EstaPago='true' and ef.EstaAceptado='true'
	and ef.EstaEntregado='false' and ef.EstaAceptadoRepartidor='false'and ef.ID=eu.IDEncFactura	
	group by ef.ID,u.Nombre,u.DescripcionUbicacion
	order by ef.ID

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_OrdenesDisponibles]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_OrdenesDisponibles]
		@vIdentificacionUsuario int 
	AS 
	BEGIN
	BEGIN TRY


	declare @vIDUser int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacionUsuario
	
	select ef.ID,ef.FechaPago,ef.MontoColones
	from EncFactura ef, Usuario u, EncFacturaUsuario eu
	where eu.IDUsuario=@vIDUser and ef.ID=eu.IDEncFactura and u.ID=@vIDUser
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_OrdenesPagadas]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_OrdenesPagadas]
	@vIdentificacion int
	AS 
	BEGIN
	BEGIN TRY

	declare @vIDUser int,@vIDOrden int;
	select @vIDUser=ID from Usuario where Identificacion= @vIdentificacion

	Select ef.ID,ef.FechaPago,sum(dt.Cantidad)'Cantidad',ef.MontoColones 
	from Usuario u,CategoriaUsuario ca, EncFactura ef, EncFacturaUsuario eu, DetFactura dt
	where eu.IDUsuario=u.ID and ef.ID=dt.IDEncFactura and ca.ID=u.IDCategoriaUsuario and
	ca.NombreCategoria='USUARIO_EMPRESA' and ef.EstaPago='true' and ef.EstaAceptado='false'
	and ef.EstaEntregado='false' and ef.ID=eu.IDEncFactura	and u.ID=@vIDUser
	group by ef.ID,ef.FechaPago,ef.MontoColones 
	order by ef.ID

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_OrdenesPagadas_Detalle]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_OrdenesPagadas_Detalle]
	@vIdOrden int
	AS 
	BEGIN
	BEGIN TRY


	Select a.Nombre,dt.Cantidad, a.Fotografia
	from  EncFactura ef,  DetFactura dt, Articulo a
	where ef.ID=dt.IDEncFactura and dt.IDArticulo=a.ID and ef.ID=@vIdOrden

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_SujetosDisponiblesCalificar]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_SujetosDisponiblesCalificar]
		@vIDOrden int 
	AS 
	BEGIN
	BEGIN TRY


	select cu.NombreCategoria,u.Nombre,u.NumeroTelefono,u.Calificacion
	from EncFactura ef,EncFacturaUsuario eu , Usuario u, CategoriaUsuario cu
	where ef.ID=eu.IDEncFactura and ef.ID=@vIDOrden and u.ID=eu.IDUsuario 
	and u.IDCategoriaUsuario=cu.ID and cu.RecibeCalificacion='true'
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_ADMINISTRADOR]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_ADMINISTRADOR]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	

	select 
	u.Identificacion,u.Nombre,u.NumeroTelefono,u.Latitud,u.Longitud,u.DescripcionUbicacion,u.CorreoElectronico,u.Contrasenna,
	t.NumeroTarjeta,t.CVV,t.FechaVencimiento, ct.NombreCategoria
	from 
	Usuario u , Tarjeta t, CategoriaTarjeta ct
	where 
	u.IDTarjeta = t.ID and
	t.IDCategoriaTarjeta=ct.ID and
	u.CorreoElectronico=@vCorreoElectronico and 
	u.Contrasenna=@vContrasenna and 
	u.IDCategoriaUsuario=4 and
	u.[Activo/Inactivo]='ACTIVO'

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_CLIENTE]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_CLIENTE]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	
		select 
		u.Identificacion,u.Nombre,u.Apellido,u.NumeroTelefono,u.Latitud,u.Longitud,u.DescripcionUbicacion,u.CorreoElectronico,u.Contrasenna,
		t.NumeroTarjeta, t.CVV,t.FechaVencimiento, ct.NombreCategoria
		from 
		Usuario u , Tarjeta t, CategoriaTarjeta ct
		where 
		u.IDTarjeta = t.ID and
		t.IDCategoriaTarjeta=ct.ID and
		u.CorreoElectronico=@vCorreoElectronico and 
		u.Contrasenna=@vContrasenna and 
		u.IDCategoriaUsuario=1 and
		u.[Activo/Inactivo]='ACTIVO'

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_CLIENTE_SIN_FILTRO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_CLIENTE_SIN_FILTRO]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	
		select 
		u.Identificacion,u.Nombre,u.Apellido,u.NumeroTelefono,u.Latitud,u.Longitud,u.DescripcionUbicacion,u.CorreoElectronico,u.Contrasenna,
		t.NumeroTarjeta, t.CVV,t.FechaVencimiento, ct.NombreCategoria
		from 
		Usuario u , Tarjeta t, CategoriaTarjeta ct
		where 
		u.IDTarjeta = t.ID and
		t.IDCategoriaTarjeta=ct.ID and
		u.CorreoElectronico=@vCorreoElectronico and 
		u.Contrasenna=@vContrasenna and 
		u.IDCategoriaUsuario=1 

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_CORREO_Y_CONTRASENNA]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_CORREO_Y_CONTRASENNA]
	AS 
	BEGIN
	BEGIN TRY	

	select 
	u.CorreoElectronico,u.Contrasenna
	from 
	Usuario u 

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_ESTADO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_ESTADO]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	
	select 
	u.[Activo/Inactivo]
	from 
	Usuario u 
	where 
	u.Contrasenna=@vContrasenna and
	u.CorreoElectronico=@vCorreoElectronico

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_NEGOCIO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_NEGOCIO]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	

	select 
	u.Identificacion,u.Nombre,u.NumeroTelefono,u.Latitud,u.Longitud,u.DescripcionUbicacion,u.CorreoElectronico,u.Contrasenna,
	t.NumeroTarjeta, t.CVV, t.FechaVencimiento, ct.NombreCategoria,
	u.Calificacion
	from 
	Usuario u , Tarjeta t, CategoriaTarjeta ct
	where 
	u.IDTarjeta = t.ID and
	t.IDCategoriaTarjeta=ct.ID and
	u.CorreoElectronico=@vCorreoElectronico and 
	u.Contrasenna=@vContrasenna and 
	u.IDCategoriaUsuario=2 and
	u.[Activo/Inactivo]='ACTIVO'

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_NEGOCIO_CALIFICACION]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_NEGOCIO_CALIFICACION]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	

	select 
	eu.Comentario, eu.Calificacion
	from 
	Usuario u , EncFacturaUsuario eu
	where 
	u.ID=eu.IDUsuario and
	u.CorreoElectronico=@vCorreoElectronico and 
	u.Contrasenna=@vContrasenna and 
	u.IDCategoriaUsuario=2 and
	u.[Activo/Inactivo]='ACTIVO'

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_NEGOCIO_SIN_FILTRO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_NEGOCIO_SIN_FILTRO]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	

	select 
	u.Identificacion,u.Nombre,u.NumeroTelefono,u.Latitud,u.Longitud,u.DescripcionUbicacion,u.CorreoElectronico,u.Contrasenna,
	t.NumeroTarjeta, t.CVV, t.FechaVencimiento, ct.NombreCategoria,
	u.Calificacion
	from 
	Usuario u , Tarjeta t, CategoriaTarjeta ct
	where 
	u.IDTarjeta = t.ID and
	t.IDCategoriaTarjeta=ct.ID and
	u.CorreoElectronico=@vCorreoElectronico and 
	u.Contrasenna=@vContrasenna and 
	u.IDCategoriaUsuario=2 

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_REPARTIDOR]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	DEVULEVE Informacion DE USUARIO DE LOGIN
	CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_REPARTIDOR]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	

	select 
	u.Identificacion,u.Nombre,u.Apellido,u.NumeroTelefono,u.Latitud,u.Longitud,u.DescripcionUbicacion,u.CorreoElectronico,u.Contrasenna,
	t.NumeroTarjeta, t.CVV, t.FechaVencimiento, ct.NombreCategoria,
	u.Calificacion,
	ts.Marca,ts.Modelo,ts.Color,ts.NumeroPlaca,ts.EstaAlDia, ts.IDCategoriaTransporte
	from 
	Usuario u , Tarjeta t, CategoriaTarjeta ct, Transporte ts, CategoriaTransporte cts
	where 
	u.IDTarjeta = t.ID and
	t.IDCategoriaTarjeta=ct.ID and
	u.CorreoElectronico=@vCorreoElectronico and 
	u.IDTransporte=ts.ID and
	ts.IDCategoriaTransporte=cts.ID and
	u.Contrasenna=@vContrasenna and 
	u.IDCategoriaUsuario=3 and
	u.[Activo/Inactivo]='ACTIVO'

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_RETORNA_USUARIO_REPARTIDOR_SIN_FILTRO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_RETORNA_USUARIO_REPARTIDOR_SIN_FILTRO]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	

	select 
	u.Identificacion,u.Nombre,u.Apellido,u.NumeroTelefono,u.Latitud,u.Longitud,u.DescripcionUbicacion,u.CorreoElectronico,u.Contrasenna,
	t.NumeroTarjeta, t.CVV, t.FechaVencimiento, ct.NombreCategoria,
	u.Calificacion,
	ts.Marca,ts.Modelo,ts.Color,ts.NumeroPlaca,ts.EstaAlDia, ts.IDCategoriaTransporte
	from 
	Usuario u , Tarjeta t, CategoriaTarjeta ct, Transporte ts, CategoriaTransporte cts
	where 
	u.IDTarjeta = t.ID and
	t.IDCategoriaTarjeta=ct.ID and
	u.CorreoElectronico=@vCorreoElectronico and 
	u.IDTransporte=ts.ID and
	ts.IDCategoriaTransporte=cts.ID and
	u.Contrasenna=@vContrasenna and 
	u.IDCategoriaUsuario=3 

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_USUARIO_CLIENTE_ActualizaDatos]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[PA_USUARIO_CLIENTE_ActualizaDatos]
		@vIDentificacionOriginal int,

		@vIdentificacion int,
		@vNombre nvarchar(50),
		@vApellido nvarchar(50),
		@vNumeroTelefono nvarchar(20),
		@vLatitud nvarchar(50),
		@vLongitud nvarchar(50),
		@vDescripcionUbicacion nvarchar(250),
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32),

		@vNumeroTarjeta nvarchar(20),
		@vCVV nvarchar(5),
		@vFechaVencimiento nvarchar(30),
		@vTipoTarjeta int
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vIDTarjeta int, @vID int;
		select @vIDTarjeta=u.IDTarjeta from Usuario u where u.Identificacion=@vIDentificacionOriginal;
		select @vID=u.ID from Usuario u where u.Identificacion=@vIDentificacionOriginal;

		UPDATE Tarjeta 
		SET Tarjeta.NumeroTarjeta=@vNumeroTarjeta,Tarjeta.CVV= @vCVV, Tarjeta.FechaVencimiento = @vFechaVencimiento,Tarjeta.IDCategoriaTarjeta=@vTipoTarjeta 
		where Tarjeta.ID=@vIDTarjeta;

		UPDATE Usuario
		SET Usuario.Identificacion=@vIdentificacion,Usuario.Nombre=@vNombre, Usuario.Apellido=@vApellido,Usuario.NumeroTelefono=@vNumeroTelefono,Usuario.Latitud=@vLatitud,Usuario.Longitud=@vLongitud,
		Usuario.DescripcionUbicacion=@vDescripcionUbicacion,Usuario.CorreoElectronico=@vCorreoElectronico,Usuario.Contrasenna=@vContrasenna
		WHERE Usuario.ID=@vID and Usuario.IDTarjeta=@vIDTarjeta
		
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_USUARIO_ESTADO_Activa]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	  CREATE PROCEDURE [dbo].[PA_USUARIO_ESTADO_Activa]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	
		UPDATE Usuario
		SET Usuario.[Activo/Inactivo]='ACTIVO'
		WHERE Usuario.CorreoElectronico=@vCorreoElectronico and Usuario.Contrasenna=Contrasenna

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END

GO
/****** Object:  StoredProcedure [dbo].[PA_USUARIO_ESTADO_Desactiva]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	   CREATE PROCEDURE [dbo].[PA_USUARIO_ESTADO_Desactiva]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	
		UPDATE Usuario
		SET Usuario.[Activo/Inactivo]='INACTIVO'
		WHERE Usuario.CorreoElectronico=@vCorreoElectronico and Usuario.Contrasenna=Contrasenna

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_USUARIO_ESTADO_Desactiva_Cuenta]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[PA_USUARIO_ESTADO_Desactiva_Cuenta]
		@vIDentificacionOriginal int

	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vID int;
		select @vID=u.ID from Usuario u where u.Identificacion=@vIDentificacionOriginal;

		UPDATE Usuario
		SET Usuario.[Activo/Inactivo]='INACTIVO'
		WHERE Usuario.ID= @vID

	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_USUARIO_NEGOCIO_ActualizaDatos]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_USUARIO_NEGOCIO_ActualizaDatos]
		@vIDentificacionOriginal int,

		@vIdentificacion int,
		@vNombre nvarchar(50),
		@vNumeroTelefono nvarchar(20),
		@vLatitud nvarchar(50),
		@vLongitud nvarchar(50),
		@vDescripcionUbicacion nvarchar(250),
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32),

		@vNumeroTarjeta nvarchar(20),
		@vCVV nvarchar(5),
		@vFechaVencimiento nvarchar(30),
		@vTipoTarjeta int
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vIDTarjeta int, @vID int;
		select @vIDTarjeta=u.IDTarjeta from Usuario u where u.Identificacion=@vIDentificacionOriginal;
		select @vID=u.ID from Usuario u where u.Identificacion=@vIDentificacionOriginal;

		UPDATE Tarjeta 
		SET Tarjeta.NumeroTarjeta=@vNumeroTarjeta,Tarjeta.CVV= @vCVV, Tarjeta.FechaVencimiento = @vFechaVencimiento,Tarjeta.IDCategoriaTarjeta=@vTipoTarjeta 
		where Tarjeta.ID=@vIDTarjeta;

		UPDATE Usuario
		SET Usuario.Identificacion=@vIdentificacion,Usuario.Nombre=@vNombre,Usuario.NumeroTelefono=@vNumeroTelefono,Usuario.Latitud=@vLatitud,Usuario.Longitud=@vLongitud,
		Usuario.DescripcionUbicacion=@vDescripcionUbicacion,Usuario.CorreoElectronico=@vCorreoElectronico,Usuario.Contrasenna=@vContrasenna
		WHERE Usuario.ID=@vID and Usuario.IDTarjeta=@vIDTarjeta
		
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_USUARIO_REPARTIDOR_ActualizaDatos]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_USUARIO_REPARTIDOR_ActualizaDatos]
		@vIDentificacionOriginal int,

		@vIdentificacion int,
		@vNombre nvarchar(50),
		@vApellido nvarchar(50),
		@vNumeroTelefono nvarchar(20),
		@vLatitud nvarchar(50),
		@vLongitud nvarchar(50),
		@vDescripcionUbicacion nvarchar(250),
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32),

		@vNumeroTarjeta nvarchar(20),
		@vCVV nvarchar(5),
		@vFechaVencimiento nvarchar(30),
		@vTipoTarjeta int,

		@vMarca nvarchar(20),
		@vModelo nvarchar(20),
		@vColor nvarchar(20),
		@vNumeroPlaca int,
		@vEstaAlDia nvarchar(10),
		@vIDCategoriaVechiclo int

	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vIDTarjeta int,@vIDTransporte int, @vID int;
		select @vIDTarjeta=u.IDTarjeta from Usuario u where u.Identificacion=@vIDentificacionOriginal;
		select @vID=u.ID from Usuario u where u.Identificacion=@vIDentificacionOriginal;
		select @vIDTransporte =u.IDTransporte from Usuario u where u.ID=@vID;

		UPDATE Transporte
		SET TRANSPORTE.Marca= @vMarca,  TRANSPORTE.Modelo=@vModelo, TRANSPORTE.Color=@vColor, TRANSPORTE.NumeroPlaca=@vNumeroPlaca, TRANSPORTE.EstaAlDia=@vEstaAlDia, TRANSPORTE.IDCategoriaTransporte=@vIDCategoriaVechiclo
		WHERE Transporte.ID=@vIDTransporte

		UPDATE Tarjeta 
		SET Tarjeta.NumeroTarjeta=@vNumeroTarjeta,Tarjeta.CVV= @vCVV, Tarjeta.FechaVencimiento = @vFechaVencimiento,Tarjeta.IDCategoriaTarjeta=@vTipoTarjeta 
		where Tarjeta.ID=@vIDTarjeta;

		UPDATE Usuario
		SET Usuario.Identificacion=@vIdentificacion,Usuario.Nombre=@vNombre, Usuario.Apellido=@vApellido,Usuario.NumeroTelefono=@vNumeroTelefono,Usuario.Latitud=@vLatitud,Usuario.Longitud=@vLongitud,
		Usuario.DescripcionUbicacion=@vDescripcionUbicacion,Usuario.CorreoElectronico=@vCorreoElectronico,Usuario.Contrasenna=@vContrasenna
		WHERE Usuario.ID=@vID and Usuario.IDTarjeta=@vIDTarjeta and Usuario.IDTransporte=@vIDTransporte
		
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_VerificaUsuario_Actualiza_Contrasenna]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_VerificaUsuario_Actualiza_Contrasenna]
		@vContrasenna nvarchar(32),
		@vCorreoElectronico nvarchar(50)
	AS 
	BEGIN
	BEGIN TRY	

			update Usuario set Contrasenna=@vContrasenna where Usuario.CorreoElectronico=@vCorreoElectronico
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_VerificaUsuario_Correo]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_VerificaUsuario_Correo]
		@vCorreoElectronico nvarchar(50)
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=1 ) >= 1 )
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=2 ) >= 1 )
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=3 ) >= 1 )
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end


	if((select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO'and u.IDCategoriaUsuario=4 ) >= 1 and
	(select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=1 ) >= 0 and
	(select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=1 ) >= 0 and
	(select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=1 ) >= 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_VerificaUsuario_Existencia_CorreoElectronico]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_VerificaUsuario_Existencia_CorreoElectronico]
		@vCorreoElectronico nvarchar(50)
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO' ) >= 1) 
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if((select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.[Activo/Inactivo]='ACTIVO' ) = 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_VerificaUsuario_Existencia_Identificacion]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_VerificaUsuario_Existencia_Identificacion]
		@vIdentificacion int
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Usuario u where u.Identificacion=@vIdentificacion and u.[Activo/Inactivo]='ACTIVO' ) >= 1) 
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if((select COUNT(*) from Usuario u where u.Identificacion=@vIdentificacion and u.[Activo/Inactivo]='ACTIVO' ) = 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_VerificaUsuario_Existencia_NumeroTelefono]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_VerificaUsuario_Existencia_NumeroTelefono]
		@vNumTelefono nvarchar(50)
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Usuario u where u.NumeroTelefono=@vNumTelefono and u.[Activo/Inactivo]='ACTIVO' ) >= 1) 
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if((select COUNT(*) from Usuario u where u.NumeroTelefono=@vNumTelefono and u.[Activo/Inactivo]='ACTIVO' ) = 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_VerificaUsuario_Existencia_Tarjeta]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_VerificaUsuario_Existencia_Tarjeta]
		@vNumTarjeta nvarchar(50)
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Tarjeta t where t.NumeroTarjeta=@vNumTarjeta ) >= 1) 
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if( (select COUNT(*) from Tarjeta t where t.NumeroTarjeta=@vNumTarjeta ) = 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_VerificaUsuario_TIPO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[PA_VerificaUsuario_TIPO]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=1) >= 1) 
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=2) >= 1) 
	begin
	set @vNumero= 2;
	SELECT @vNumero 'Numero'
	end

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=3) >= 1) 
	begin
	set @vNumero= 3;
	SELECT @vNumero'Numero'
	end

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=4) >= 1) 
	begin
	set @vNumero= 4;
	SELECT @vNumero 'Numero'
	end

	if((select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=1) = 0 and
		(select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=2) = 0 and
		(select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=3) = 0 and
	    (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.[Activo/Inactivo]='ACTIVO' and u.IDCategoriaUsuario=4) = 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[PA_VerificaUsuario_TIPO_SIN_FILTRO]    Script Date: 18/8/2020 12:24:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[PA_VerificaUsuario_TIPO_SIN_FILTRO]
		@vCorreoElectronico nvarchar(50),
		@vContrasenna nvarchar(32)
	AS 
	BEGIN
	BEGIN TRY	
		DECLARE @vNumero int 

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.IDCategoriaUsuario=1) >= 1) 
	begin
	set @vNumero= 1;
	SELECT @vNumero 'Numero'
	end

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and  u.IDCategoriaUsuario=2) >= 1) 
	begin
	set @vNumero= 2;
	SELECT @vNumero 'Numero'
	end

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.IDCategoriaUsuario=3) >= 1) 
	begin
	set @vNumero= 3;
	SELECT @vNumero'Numero'
	end

	if( (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna  and u.IDCategoriaUsuario=4) >= 1) 
	begin
	set @vNumero= 4;
	SELECT @vNumero 'Numero'
	end

	if((select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.IDCategoriaUsuario=1) = 0 and
		(select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna  and u.IDCategoriaUsuario=2) = 0 and
		(select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna and u.IDCategoriaUsuario=3) = 0 and
	    (select COUNT(*) from Usuario u where u.CorreoElectronico=@vCorreoElectronico and u.Contrasenna=@vContrasenna  and u.IDCategoriaUsuario=4) = 0 )
	  begin
	  set @vNumero= -1;
	  SELECT @vNumero 'Numero'
	  end
	
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_NUMBER() AS ErrorNumber
		, ERROR_SEVERITY() AS ErrorSeverity
		, ERROR_STATE() AS ErrorState
		, ERROR_PROCEDURE() AS ErrorProcedure
		, ERROR_LINE() AS ErrorLine
		, ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	END
GO
USE [master]
GO
ALTER DATABASE [JustEat_Pry5CT] SET  READ_WRITE 
GO
