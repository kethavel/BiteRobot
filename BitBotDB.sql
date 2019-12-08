USE [master]
GO
/****** Object:  Database [BitBot]    Script Date: 08.12.2019 22:18:27 ******/
CREATE DATABASE [BitBot]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BitBot', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BitBot.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BitBot_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BitBot_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BitBot] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BitBot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BitBot] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BitBot] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BitBot] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BitBot] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BitBot] SET ARITHABORT OFF 
GO
ALTER DATABASE [BitBot] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BitBot] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BitBot] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BitBot] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BitBot] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BitBot] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BitBot] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BitBot] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BitBot] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BitBot] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BitBot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BitBot] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BitBot] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BitBot] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BitBot] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BitBot] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BitBot] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BitBot] SET RECOVERY FULL 
GO
ALTER DATABASE [BitBot] SET  MULTI_USER 
GO
ALTER DATABASE [BitBot] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BitBot] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BitBot] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BitBot] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BitBot] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BitBot', N'ON'
GO
ALTER DATABASE [BitBot] SET QUERY_STORE = OFF
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [user]    Script Date: 08.12.2019 22:18:27 ******/
CREATE LOGIN [user] WITH PASSWORD=N'pqpOXdEFqrBgygVY898CvZOef1+CHJoCRMKV+tswgZ8=', DEFAULT_DATABASE=[BitBot], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [user] DISABLE
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 08.12.2019 22:18:27 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NEUROGLIA\ketha]    Script Date: 08.12.2019 22:18:27 ******/
CREATE LOGIN [NEUROGLIA\ketha] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NEUROGLIA\ketha]
GO
USE [BitBot]
GO
/****** Object:  User [user]    Script Date: 08.12.2019 22:18:27 ******/
CREATE USER [user] FOR LOGIN [user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [user]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 08.12.2019 22:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ticker] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pair]    Script Date: 08.12.2019 22:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pair](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ticker] [nchar](10) NOT NULL,
	[BaseCurrency] [int] NOT NULL,
	[QuoteCurrency] [int] NOT NULL,
 CONSTRAINT [PK_Pair] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trade]    Script Date: 08.12.2019 22:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pair] [int] NOT NULL,
	[Timestamp] [float] NOT NULL,
	[TradeDirection] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_Trade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TradeDirection]    Script Date: 08.12.2019 22:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TradeDirection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Direction] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TradeDirection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([Id], [Ticker]) VALUES (1, N'BTC       ')
INSERT [dbo].[Currency] ([Id], [Ticker]) VALUES (2, N'USD       ')
INSERT [dbo].[Currency] ([Id], [Ticker]) VALUES (3, N'EUR       ')
INSERT [dbo].[Currency] ([Id], [Ticker]) VALUES (4, N'ETH       ')
SET IDENTITY_INSERT [dbo].[Currency] OFF
SET IDENTITY_INSERT [dbo].[Pair] ON 

INSERT [dbo].[Pair] ([Id], [Ticker], [BaseCurrency], [QuoteCurrency]) VALUES (1, N'BTCUSD    ', 2, 1)
INSERT [dbo].[Pair] ([Id], [Ticker], [BaseCurrency], [QuoteCurrency]) VALUES (3, N'BTCEUR    ', 3, 1)
SET IDENTITY_INSERT [dbo].[Pair] OFF
SET IDENTITY_INSERT [dbo].[TradeDirection] ON 

INSERT [dbo].[TradeDirection] ([Id], [Direction]) VALUES (1, N'Sell      ')
INSERT [dbo].[TradeDirection] ([Id], [Direction]) VALUES (2, N'Buy       ')
SET IDENTITY_INSERT [dbo].[TradeDirection] OFF
ALTER TABLE [dbo].[Pair]  WITH CHECK ADD  CONSTRAINT [FK_Pair_Currency] FOREIGN KEY([BaseCurrency])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[Pair] CHECK CONSTRAINT [FK_Pair_Currency]
GO
ALTER TABLE [dbo].[Pair]  WITH CHECK ADD  CONSTRAINT [FK_Pair_Currency1] FOREIGN KEY([QuoteCurrency])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[Pair] CHECK CONSTRAINT [FK_Pair_Currency1]
GO
ALTER TABLE [dbo].[Trade]  WITH CHECK ADD  CONSTRAINT [FK_Trade_Pair] FOREIGN KEY([Pair])
REFERENCES [dbo].[Pair] ([Id])
GO
ALTER TABLE [dbo].[Trade] CHECK CONSTRAINT [FK_Trade_Pair]
GO
ALTER TABLE [dbo].[Trade]  WITH CHECK ADD  CONSTRAINT [FK_Trade_TradeDirection] FOREIGN KEY([TradeDirection])
REFERENCES [dbo].[TradeDirection] ([Id])
GO
ALTER TABLE [dbo].[Trade] CHECK CONSTRAINT [FK_Trade_TradeDirection]
GO
USE [master]
GO
ALTER DATABASE [BitBot] SET  READ_WRITE 
GO
