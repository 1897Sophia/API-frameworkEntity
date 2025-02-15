USE [master]
GO
/****** Object:  Database [BDPeliculas]    Script Date: 22/05/2024 15:40:53 ******/
CREATE DATABASE [BDPeliculas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDPeliculas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.PSOFIA\MSSQL\DATA\BDPeliculas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDPeliculas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.PSOFIA\MSSQL\DATA\BDPeliculas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BDPeliculas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDPeliculas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDPeliculas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDPeliculas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDPeliculas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDPeliculas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDPeliculas] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDPeliculas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDPeliculas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDPeliculas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDPeliculas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDPeliculas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDPeliculas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDPeliculas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDPeliculas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDPeliculas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDPeliculas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDPeliculas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDPeliculas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDPeliculas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDPeliculas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDPeliculas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDPeliculas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDPeliculas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDPeliculas] SET RECOVERY FULL 
GO
ALTER DATABASE [BDPeliculas] SET  MULTI_USER 
GO
ALTER DATABASE [BDPeliculas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDPeliculas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDPeliculas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDPeliculas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDPeliculas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDPeliculas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDPeliculas', N'ON'
GO
ALTER DATABASE [BDPeliculas] SET QUERY_STORE = ON
GO
ALTER DATABASE [BDPeliculas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BDPeliculas]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdPelicula] [int] NULL,
	[IdUsuario] [int] NULL,
	[ComentarioTexto] [varchar](500) NOT NULL,
	[IdComentarioPadre] [int] NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criticos]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criticos](
	[IdCritico] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCritico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criticos_Calificacion]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criticos_Calificacion](
	[IdCriticoCalificacion] [int] IDENTITY(1,1) NOT NULL,
	[IdCritico] [int] NOT NULL,
	[IdPelicula] [int] NULL,
	[Calificacion] [int] NOT NULL,
 CONSTRAINT [PK_Criticos_Calificacion] PRIMARY KEY CLUSTERED 
(
	[IdCriticoCalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Involucrados]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Involucrados](
	[IdInvolucrado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](75) NOT NULL,
	[Facebook] [varchar](100) NULL,
	[Instagram] [varchar](100) NULL,
	[Twitter] [varchar](100) NULL,
	[Otros] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdInvolucrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Involucrados_Info]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Involucrados_Info](
	[IdInvolucradoInfo] [int] IDENTITY(1,1) NOT NULL,
	[IdInvolucrado] [int] NULL,
	[IdRol] [int] NULL,
	[IdPelicula] [int] NULL,
	[OrdenAparicion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdInvolucradoInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[IdPelicula] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Poster] [varchar](max) NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK__Pelicula__60537FD0529A3631] PRIMARY KEY CLUSTERED 
(
	[IdPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Clave] [char](20) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD FOREIGN KEY([IdComentarioPadre])
REFERENCES [dbo].[Comentarios] ([IdComentario])
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK__Comentari__IdPel__45F365D3] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK__Comentari__IdPel__45F365D3]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Criticos_Calificacion]  WITH CHECK ADD FOREIGN KEY([IdCritico])
REFERENCES [dbo].[Criticos] ([IdCritico])
GO
ALTER TABLE [dbo].[Criticos_Calificacion]  WITH CHECK ADD FOREIGN KEY([IdCritico])
REFERENCES [dbo].[Criticos] ([IdCritico])
GO
ALTER TABLE [dbo].[Criticos_Calificacion]  WITH CHECK ADD  CONSTRAINT [FK__Criticos___IdPel__49C3F6B7] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[Criticos_Calificacion] CHECK CONSTRAINT [FK__Criticos___IdPel__49C3F6B7]
GO
ALTER TABLE [dbo].[Criticos_Calificacion]  WITH CHECK ADD  CONSTRAINT [FK__Criticos___IdPel__4AB81AF0] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[Criticos_Calificacion] CHECK CONSTRAINT [FK__Criticos___IdPel__4AB81AF0]
GO
ALTER TABLE [dbo].[Involucrados_Info]  WITH CHECK ADD FOREIGN KEY([IdInvolucrado])
REFERENCES [dbo].[Involucrados] ([IdInvolucrado])
GO
ALTER TABLE [dbo].[Involucrados_Info]  WITH CHECK ADD FOREIGN KEY([IdInvolucrado])
REFERENCES [dbo].[Involucrados] ([IdInvolucrado])
GO
ALTER TABLE [dbo].[Involucrados_Info]  WITH CHECK ADD  CONSTRAINT [FK__Involucra__IdPel__4D94879B] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[Involucrados_Info] CHECK CONSTRAINT [FK__Involucra__IdPel__4D94879B]
GO
ALTER TABLE [dbo].[Involucrados_Info]  WITH CHECK ADD  CONSTRAINT [FK__Involucra__IdPel__4E88ABD4] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Peliculas] ([IdPelicula])
GO
ALTER TABLE [dbo].[Involucrados_Info] CHECK CONSTRAINT [FK__Involucra__IdPel__4E88ABD4]
GO
ALTER TABLE [dbo].[Involucrados_Info]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[Involucrados_Info]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([IdRol])
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCriticos]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtenerCriticos]
@Nombre VARCHAR(50)
as
begin
        SELECT *
        FROM Criticos
        WHERE (@Nombre IS NULL OR @Nombre = '' OR @Nombre = Nombre)
end
GO
/****** Object:  StoredProcedure [dbo].[ObtenerInvolucrados]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtenerInvolucrados]
@Nombre VARCHAR(50)
as
begin
        SELECT *
        FROM Involucrados
        WHERE (@Nombre IS NULL OR @Nombre = '' OR @Nombre = Nombre)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ActivarInactivarUsuario]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActivarInactivarUsuario]
(
    @IdUsuario INT, 
    @Activar BIT       
)
AS
BEGIN
    DECLARE @Success BIT = 0;

    UPDATE Usuarios
    SET Estado = CASE WHEN @Activar = 1 THEN 1 ELSE 0 END
    WHERE IdUsuario = @IdUsuario;
    
    IF @@ROWCOUNT > 0
    BEGIN
        SET @Success = 1;
    END

    SELECT @Success AS Result;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarPeliculaPorNombre]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BuscarPeliculaPorNombre]
    @NombrePelicula VARCHAR(50)
AS
BEGIN
    SELECT
		idPelicula,
        Nombre,
        Descripcion,
        Poster,
        Fecha
    FROM
        Peliculas
    WHERE
        Nombre LIKE '%' + @NombrePelicula + '%';
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Mantenimiento_Comentarios]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_Mantenimiento_Comentarios]
    @IdComentario int,
    @IdUsuario INT,
    @IdPelicula INT,
    @ComentarioTexto VARCHAR(500),
    @IdComentarioPadre INT = NULL,
    @OP int
as
begin
    if @OP = 1
    begin
        -- Obtiene la fecha actual
        DECLARE @FechaActual DATETIME;
        SET @FechaActual = GETDATE();

        INSERT INTO Comentarios (IdPelicula, IdUsuario, ComentarioTexto, IdComentarioPadre, Fecha)
        VALUES (@IdPelicula, @IdUsuario, @ComentarioTexto, @IdComentarioPadre, @FechaActual)
    end

    if @OP = 2
    begin
        UPDATE Comentarios
        SET ComentarioTexto = @ComentarioTexto
        WHERE IdComentario = @IdComentario
    end

    if @OP = 3
    begin
        DELETE FROM Comentarios
        WHERE IdComentario = @IdComentario
    end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Mantenimiento_InfoInv]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Mantenimiento_InfoInv]
@IdInvolucradoInfo int,
@IdInvolucrado int,
@IdRol int,
@IdPelicula int,
@OrdenAparicion int,
@OP int 
AS
BEGIN 
	IF @OP = 1
	BEGIN 
	Insert into Involucrados_Info(IdInvolucrado,IdRol,IdPelicula,OrdenAparicion) values(@IdInvolucrado,@IdRol,@IdPelicula,@OrdenAparicion)
	End

	ELSE IF @OP = 2
	BEGIN 
	Update Involucrados_Info
	Set IdInvolucrado = @IdInvolucrado,
		IdRol = @IdRol,
		IdPelicula = @IdPelicula,
		OrdenAparicion = @OrdenAparicion
	where IdInvolucradoInfo = @IdInvolucradoInfo
	End

	ELSE IF @OP = 3
	BEGIN 
	Delete from Involucrados_Info
	where IdInvolucradoInfo = @IdInvolucradoInfo
	End
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mantenimiento_Peliculas]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Mantenimiento_Peliculas]
	@IdPelicula INT,
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(200),
    @Poster varchar(max),
    @Fecha DATE,
	@OP int
as
begin
	if @OP=1
	begin
		INSERT INTO Peliculas (Nombre, Descripcion, Poster, Fecha)
		VALUES (@Nombre, @Descripcion, @Poster, @Fecha)		
	end
	
	if @OP=2
	begin
		UPDATE Peliculas
		SET Nombre = @Nombre,
			Descripcion = @Descripcion,
			Poster = @Poster,
			Fecha = @Fecha
		WHERE IdPelicula = @IdPelicula
	end

	if @OP=3
	begin
		DELETE FROM Peliculas
		WHERE IdPelicula = @IdPelicula
	end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientoInvolucrados]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MantenimientoInvolucrados]
@IdInvolucrado int,
@Nombre varchar(50),
@Apellidos varchar(75),
@Facebook varchar(100),
@Twiter varchar(100),
@Instagram varchar(100),
@Otros varchar(100),
@OP int 
AS
BEGIN 
	IF @OP = 1
	BEGIN 
		Insert into Involucrados(Nombre,Apellidos,Facebook,Instagram,Twitter,Otros) 
					values(@Nombre,@Apellidos,@Facebook,@Instagram,@Twiter,@Otros)
	End

	ELSE IF @OP = 2
	BEGIN 
	Update Involucrados
		set Apellidos = @Apellidos,
		Facebook = @Facebook,
		Instagram = @Instagram,
		Twitter = @Twiter,
		Otros =@Otros
	where IdInvolucrado = @IdInvolucrado and Nombre = @Nombre
	End

	ELSE IF @OP = 3
	BEGIN 
	Delete from Involucrados
	where IdInvolucrado = @IdInvolucrado
	End
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientosCalificacion]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MantenimientosCalificacion]
@IdCriticoCalificacion int,
@IdCritico int,
@IdPelicula int,
@Calificacion int,
@OP int 
AS
BEGIN 
	IF @OP = 1
	BEGIN 
	Insert into Criticos_Calificacion(IdCritico,IdPelicula,Calificacion) values(@IdCritico,@IdPelicula,@Calificacion)
	End

	ELSE IF @OP = 2
	BEGIN 
	Update Criticos_Calificacion
	Set IdPelicula = @IdPelicula,
		Calificacion = @Calificacion
	where IdCriticoCalificacion = @IdCriticoCalificacion
	End

	ELSE IF @OP = 3
	BEGIN 
	Delete from Criticos_Calificacion
	where IdCriticoCalificacion = @IdCriticoCalificacion
	End
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientosCriticos]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MantenimientosCriticos]
@IdCritico int,
@Nombre varchar(50),
@OP int 
AS
BEGIN 
	IF @OP = 1
	BEGIN 
	Insert into Criticos(Nombre) values(@Nombre)
	End

	ELSE IF @OP = 2
	BEGIN 
	Update Criticos
	Set Nombre = @Nombre
	where IdCritico = @IdCritico
	End

	ELSE IF @OP = 3
	BEGIN 
	Delete from Criticos
	where IdCritico = @IdCritico
	End
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientosRoles]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MantenimientosRoles]
@IdRol int,
@Nombre varchar(25),
@OP int 
AS
BEGIN 
	IF @OP = 1
	BEGIN 
	Insert into Roles(Nombre) values(@Nombre)
	End

	ELSE IF @OP = 2
	BEGIN 
	Update Roles
	Set Nombre = @Nombre
	where IdRol = @IdRol
	End

	ELSE IF @OP = 3
	BEGIN 
	Delete from Roles
	where IdRol = @IdRol
	End
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientoUsuarios]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MantenimientoUsuarios]
(
    @Operacion INT,
    @IdUsuario INT,
    @Usuario VARCHAR(50),
    @Clave CHAR(20),
	@Nombre varchar(50),
	@Apellidos varchar(100),
    @Correo VARCHAR(50),
    @Estado INT
)
AS
BEGIN
    IF @Operacion = 1
    BEGIN
        INSERT INTO Usuarios (Usuario, Clave, Nombre,Apellidos,Correo, Estado)
        VALUES (@Usuario, @Clave,@Nombre,@Apellidos,@Correo, 1)
        PRINT('Usuario incorporado con éxito!')
    END
    IF @Operacion = 2
    BEGIN
        UPDATE Usuarios SET
            Usuario = @Usuario,
            Clave = @Clave,
			Nombre = @Nombre,
			Apellidos = @Apellidos,
            Correo = @Correo,
            Estado = @Estado
        WHERE IdUsuario = @IdUsuario
    END
    IF @Operacion = 3
    BEGIN
        DELETE FROM Usuarios WHERE IdUsuario = @IdUsuario
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerInformacionPeliculaPorID]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerInformacionPeliculaPorID]
@IdPelicula INT
AS
BEGIN
    SELECT
        P.IdPelicula,
		P.Poster,
        P.Nombre AS NombrePelicula,
		P.Descripcion,
		P.Fecha,

        (
            SELECT
                I.Nombre + ' ' + I.Apellidos AS Involucrado
            FROM Involucrados_Info II
            INNER JOIN Involucrados I ON II.IdInvolucrado = I.IdInvolucrado
            WHERE II.IdPelicula = P.IdPelicula
            FOR XML PATH(''), TYPE
        ).value('.', 'VARCHAR(MAX)') AS Involucrados,
        (
            SELECT
                C.ComentarioTexto
            FROM Comentarios C
            WHERE C.IdPelicula = P.IdPelicula
            FOR XML PATH(''), TYPE
        ).value('.', 'VARCHAR(MAX)') AS Comentarios,
        (
            SELECT
                CC.Calificacion
            FROM Criticos_Calificacion CC
            WHERE CC.IdPelicula = P.IdPelicula
            FOR XML PATH(''), TYPE
        ).value('.', 'VARCHAR(MAX)') AS Calificaciones
    FROM Peliculas P
    WHERE P.IdPelicula = @IdPelicula;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerInformacionPeliculaRecientes]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerInformacionPeliculaRecientes]
AS
BEGIN
    SELECT
        P.IdPelicula,
        P.Poster,
        P.Nombre AS NombrePelicula,
        P.Descripcion,
        P.Fecha,
        (
            SELECT
                I.Nombre + ' ' + I.Apellidos AS Involucrado
            FROM Involucrados_Info II
            INNER JOIN Involucrados I ON II.IdInvolucrado = I.IdInvolucrado
            WHERE II.IdPelicula = P.IdPelicula
            FOR XML PATH(''), TYPE
        ).value('.', 'VARCHAR(MAX)') AS Involucrados,
        (
            SELECT
                C.ComentarioTexto
            FROM Comentarios C
            WHERE C.IdPelicula = P.IdPelicula
            FOR XML PATH(''), TYPE
        ).value('.', 'VARCHAR(MAX)') AS Comentarios,
        (
            SELECT
                CC.Calificacion
            FROM Criticos_Calificacion CC
            WHERE CC.IdPelicula = P.IdPelicula
            FOR XML PATH(''), TYPE
        ).value('.', 'VARCHAR(MAX)') AS Calificaciones
    FROM Peliculas P
    WHERE P.Fecha >= DATEADD(YEAR, -100, GETDATE()) 
    ORDER BY P.Fecha DESC
    OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarUsuario]    Script Date: 22/05/2024 15:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_VerificarUsuario]
(
    @Usuario VARCHAR(50),
    @Clave CHAR(20)
)
AS
BEGIN
    DECLARE @Resultado BIT;

    IF EXISTS (SELECT 1 FROM Usuarios WHERE Usuario = @Usuario AND Clave = @Clave AND Estado = 1)
    BEGIN
        SET @Resultado = 1;
    END
    ELSE
    BEGIN
        SET @Resultado = 0; 
    END

    SELECT @Resultado AS Resultado;
END
GO
USE [master]
GO
ALTER DATABASE [BDPeliculas] SET  READ_WRITE 
GO
