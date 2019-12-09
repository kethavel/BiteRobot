USE [BitBot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pair]') AND type in (N'U'))
ALTER TABLE [dbo].[Pair] DROP CONSTRAINT IF EXISTS [FK_Pair_Currency1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pair]') AND type in (N'U'))
ALTER TABLE [dbo].[Pair] DROP CONSTRAINT IF EXISTS [FK_Pair_Currency]
GO
/****** Object:  Table [dbo].[TradeDirection]    Script Date: 10.12.2019 1:55:19 ******/
DROP TABLE IF EXISTS [dbo].[TradeDirection]
GO
/****** Object:  Table [dbo].[Trade]    Script Date: 10.12.2019 1:55:19 ******/
DROP TABLE IF EXISTS [dbo].[Trade]
GO
/****** Object:  Table [dbo].[Pair]    Script Date: 10.12.2019 1:55:19 ******/
DROP TABLE IF EXISTS [dbo].[Pair]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 10.12.2019 1:55:19 ******/
DROP TABLE IF EXISTS [dbo].[Currency]
GO
/****** Object:  User [user]    Script Date: 10.12.2019 1:55:19 ******/
DROP USER IF EXISTS [user]
GO
USE [master]
GO
/****** Object:  Login [NEUROGLIA\ketha]    Script Date: 10.12.2019 1:55:19 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NEUROGLIA\ketha')
DROP LOGIN [NEUROGLIA\ketha]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 10.12.2019 1:55:19 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
DROP LOGIN [NT SERVICE\SQLTELEMETRY]
GO
/****** Object:  Login [user]    Script Date: 10.12.2019 1:55:19 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'user')
DROP LOGIN [user]
GO
/****** Object:  Database [BitBot]    Script Date: 10.12.2019 1:55:19 ******/
DROP DATABASE IF EXISTS [BitBot]
GO
/****** Object:  Database [BitBot]    Script Date: 10.12.2019 1:55:19 ******/
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
/****** Object:  Login [user]    Script Date: 10.12.2019 1:55:19 ******/
CREATE LOGIN [user] WITH PASSWORD=N'D1gjCSlip+IR8jD1KFXPq8gDHyzihBIbCQfOtpO/J9M=', DEFAULT_DATABASE=[BitBot], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [user] DISABLE
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 10.12.2019 1:55:19 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NEUROGLIA\ketha]    Script Date: 10.12.2019 1:55:19 ******/
CREATE LOGIN [NEUROGLIA\ketha] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
ALTER AUTHORIZATION ON DATABASE::[BitBot] TO [NEUROGLIA\ketha]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NEUROGLIA\ketha]
GO
USE [BitBot]
GO
/****** Object:  User [user]    Script Date: 10.12.2019 1:55:19 ******/
CREATE USER [user] FOR LOGIN [user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [user]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT CONNECT TO [user] AS [dbo]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 10.12.2019 1:55:20 ******/
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
ALTER AUTHORIZATION ON [dbo].[Currency] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Pair]    Script Date: 10.12.2019 1:55:20 ******/
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
ALTER AUTHORIZATION ON [dbo].[Pair] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Trade]    Script Date: 10.12.2019 1:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pair] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[TradeDirection] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_Trade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Trade] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[TradeDirection]    Script Date: 10.12.2019 1:55:20 ******/
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
ALTER AUTHORIZATION ON [dbo].[TradeDirection] TO  SCHEMA OWNER 
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
SET IDENTITY_INSERT [dbo].[Trade] ON 

INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (1, 1, CAST(N'2016-05-05T04:50:46.067' AS DateTime), 2, 447.43, 1377)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (2, 1, CAST(N'2016-05-05T04:51:29.800' AS DateTime), 2, 447.41, 100)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (3, 1, CAST(N'2016-05-05T04:57:51.067' AS DateTime), 2, 447.21, 833)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (4, 1, CAST(N'2016-05-05T04:59:25.037' AS DateTime), 1, 445.94, 1541)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (5, 1, CAST(N'2016-05-05T05:19:25.040' AS DateTime), 1, 446.01, 1395)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (6, 1, CAST(N'2016-05-05T05:20:49.027' AS DateTime), 2, 447.35, 557)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (7, 1, CAST(N'2016-05-05T05:32:50.453' AS DateTime), 1, 445.9, 462)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (8, 1, CAST(N'2016-05-05T05:51:14.033' AS DateTime), 2, 447.27, 686)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (9, 1, CAST(N'2016-05-05T05:52:40.037' AS DateTime), 2, 447.27, 1143)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (10, 1, CAST(N'2016-05-05T05:57:42.030' AS DateTime), 1, 445.96, 3497)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (11, 1, CAST(N'2016-05-05T05:58:38.027' AS DateTime), 1, 445.89, 2332)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (12, 1, CAST(N'2016-05-05T06:03:00.347' AS DateTime), 2, 447.14, 620)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (13, 1, CAST(N'2016-05-05T06:13:52.077' AS DateTime), 2, 447.12, 1075)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (14, 1, CAST(N'2016-05-05T06:13:58.027' AS DateTime), 2, 447.12, 526)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (15, 1, CAST(N'2016-05-05T06:16:04.030' AS DateTime), 1, 445.83, 829)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (16, 1, CAST(N'2016-05-05T06:16:32.077' AS DateTime), 2, 447.17, 693)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (17, 1, CAST(N'2016-05-05T06:17:58.027' AS DateTime), 1, 445.64, 1924)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (18, 1, CAST(N'2016-05-05T06:19:09.027' AS DateTime), 2, 446.97, 1415)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (19, 1, CAST(N'2016-05-05T06:37:01.073' AS DateTime), 2, 447.26, 1664)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (20, 1, CAST(N'2016-05-05T06:48:41.070' AS DateTime), 1, 445.96, 1832)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (21, 1, CAST(N'2016-05-05T06:49:36.070' AS DateTime), 2, 447.31, 2504)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (22, 1, CAST(N'2016-05-05T06:49:51.070' AS DateTime), 2, 447.32, 1085)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (23, 1, CAST(N'2016-05-05T06:51:51.070' AS DateTime), 1, 445.98, 498)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (24, 1, CAST(N'2016-05-05T06:54:52.027' AS DateTime), 1, 445.88, 837)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (25, 1, CAST(N'2016-05-05T07:04:22.030' AS DateTime), 1, 446.1, 716)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (26, 1, CAST(N'2016-05-05T07:04:39.027' AS DateTime), 2, 447.44, 3357)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (27, 1, CAST(N'2016-05-05T07:06:13.027' AS DateTime), 2, 447.47, 902)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (28, 1, CAST(N'2016-05-05T07:07:34.067' AS DateTime), 1, 446.16, 637)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (29, 1, CAST(N'2016-05-05T07:15:30.133' AS DateTime), 2, 447.54, 2368)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (30, 1, CAST(N'2016-05-05T07:16:39.027' AS DateTime), 2, 447.51, 695)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (31, 1, CAST(N'2016-05-05T07:18:46.073' AS DateTime), 1, 446.17, 2030)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (32, 1, CAST(N'2016-05-05T07:21:20.040' AS DateTime), 1, 446.22, 1946)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (33, 1, CAST(N'2016-05-05T07:22:19.027' AS DateTime), 1, 446.23, 4018)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (34, 1, CAST(N'2016-05-05T07:32:59.030' AS DateTime), 1, 446.39, 1462)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (35, 1, CAST(N'2016-05-05T07:33:18.027' AS DateTime), 2, 447.73, 1374)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (36, 1, CAST(N'2016-05-05T07:34:30.137' AS DateTime), 2, 447.69, 2492)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (37, 1, CAST(N'2016-05-05T07:41:37.030' AS DateTime), 2, 447.86, 3254)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (38, 1, CAST(N'2016-05-05T07:43:56.083' AS DateTime), 1, 446.51, 459)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (39, 1, CAST(N'2016-05-05T07:46:38.043' AS DateTime), 2, 447.84, 2652)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (40, 1, CAST(N'2016-05-05T07:47:49.043' AS DateTime), 1, 446.5, 546)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (41, 1, CAST(N'2016-05-05T07:47:59.043' AS DateTime), 1, 446.5, 659)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (42, 1, CAST(N'2016-05-05T07:48:09.047' AS DateTime), 2, 447.84, 713)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (43, 1, CAST(N'2016-05-05T07:48:32.047' AS DateTime), 1, 446.5, 489)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (44, 1, CAST(N'2016-05-05T07:48:51.087' AS DateTime), 2, 447.84, 673)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (45, 1, CAST(N'2016-05-05T07:48:57.043' AS DateTime), 2, 447.84, 679)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (46, 1, CAST(N'2016-05-05T07:49:02.050' AS DateTime), 2, 447.84, 936)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (47, 1, CAST(N'2016-05-05T07:49:19.047' AS DateTime), 2, 447.84, 537)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (48, 1, CAST(N'2016-05-05T07:49:20.057' AS DateTime), 1, 446.5, 635)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (49, 1, CAST(N'2016-05-05T07:49:21.087' AS DateTime), 2, 447.84, 676)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (50, 1, CAST(N'2016-05-05T07:49:38.047' AS DateTime), 2, 447.84, 690)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (51, 1, CAST(N'2016-05-05T07:50:06.153' AS DateTime), 2, 447.85, 458)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (52, 1, CAST(N'2016-05-05T07:50:17.047' AS DateTime), 2, 447.85, 532)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (53, 1, CAST(N'2016-05-05T07:50:25.053' AS DateTime), 1, 446.51, 1276)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (54, 1, CAST(N'2016-05-05T07:50:26.087' AS DateTime), 2, 447.85, 1147)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (55, 1, CAST(N'2016-05-05T07:50:40.053' AS DateTime), 1, 446.51, 651)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (56, 1, CAST(N'2016-05-05T07:51:17.093' AS DateTime), 1, 446.51, 636)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (57, 1, CAST(N'2016-05-05T07:51:26.087' AS DateTime), 2, 447.85, 675)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (58, 1, CAST(N'2016-05-05T07:51:31.127' AS DateTime), 2, 447.85, 890)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (59, 1, CAST(N'2016-05-05T07:51:40.053' AS DateTime), 2, 447.85, 1041)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (60, 1, CAST(N'2016-05-05T07:51:54.043' AS DateTime), 1, 446.54, 1162)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (61, 1, CAST(N'2016-05-05T07:51:57.047' AS DateTime), 2, 447.88, 1042)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (62, 1, CAST(N'2016-05-05T07:53:25.053' AS DateTime), 1, 446.49, 888)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (63, 1, CAST(N'2016-05-05T07:53:45.067' AS DateTime), 1, 446.49, 536)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (64, 1, CAST(N'2016-05-05T07:53:47.047' AS DateTime), 1, 446.49, 775)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (65, 1, CAST(N'2016-05-05T07:54:05.077' AS DateTime), 1, 446.52, 626)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (66, 1, CAST(N'2016-05-05T07:54:33.043' AS DateTime), 1, 446.52, 476)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (67, 1, CAST(N'2016-05-05T07:54:50.563' AS DateTime), 2, 447.87, 466)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (68, 1, CAST(N'2016-05-05T07:54:52.047' AS DateTime), 2, 447.87, 875)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (69, 1, CAST(N'2016-05-05T07:55:17.047' AS DateTime), 2, 447.87, 541)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (70, 1, CAST(N'2016-05-05T07:57:13.087' AS DateTime), 1, 446.53, 1088)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (71, 1, CAST(N'2016-05-05T07:57:29.047' AS DateTime), 2, 447.87, 907)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (72, 1, CAST(N'2016-05-05T07:57:39.043' AS DateTime), 1, 446.53, 1085)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (73, 1, CAST(N'2016-05-05T07:57:45.067' AS DateTime), 1, 446.53, 829)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (74, 1, CAST(N'2016-05-05T07:58:17.047' AS DateTime), 2, 447.86, 1282)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (75, 1, CAST(N'2016-05-05T07:58:27.043' AS DateTime), 1, 446.52, 1412)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (76, 1, CAST(N'2016-05-05T07:58:34.047' AS DateTime), 1, 446.52, 809)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (77, 1, CAST(N'2016-05-05T07:58:39.047' AS DateTime), 1, 446.52, 515)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (78, 1, CAST(N'2016-05-05T07:58:55.060' AS DateTime), 1, 446.52, 725)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (79, 1, CAST(N'2016-05-05T07:59:03.047' AS DateTime), 2, 447.86, 1143)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (80, 1, CAST(N'2016-05-05T07:59:13.047' AS DateTime), 1, 446.52, 1357)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (81, 1, CAST(N'2016-05-05T07:59:17.047' AS DateTime), 1, 446.52, 457)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (82, 1, CAST(N'2016-05-05T07:59:23.047' AS DateTime), 2, 447.86, 697)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (83, 1, CAST(N'2016-05-05T07:59:29.047' AS DateTime), 2, 447.86, 1303)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (84, 1, CAST(N'2016-05-05T07:59:39.043' AS DateTime), 2, 447.86, 602)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (85, 1, CAST(N'2016-05-05T07:59:58.047' AS DateTime), 1, 446.48, 772)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (86, 1, CAST(N'2016-05-05T08:00:27.047' AS DateTime), 2, 447.82, 499)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (87, 1, CAST(N'2016-05-05T08:00:40.053' AS DateTime), 2, 447.82, 1177)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (88, 1, CAST(N'2016-05-05T08:00:46.090' AS DateTime), 1, 446.48, 1222)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (89, 1, CAST(N'2016-05-05T08:00:48.047' AS DateTime), 2, 447.82, 793)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (90, 1, CAST(N'2016-05-05T08:01:13.043' AS DateTime), 1, 446.48, 510)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (91, 1, CAST(N'2016-05-05T08:02:02.050' AS DateTime), 1, 446.48, 863)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (92, 1, CAST(N'2016-05-05T08:02:06.093' AS DateTime), 2, 447.82, 476)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (93, 1, CAST(N'2016-05-05T08:02:20.060' AS DateTime), 2, 447.82, 1363)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (94, 1, CAST(N'2016-05-05T08:02:27.047' AS DateTime), 1, 446.48, 640)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (95, 1, CAST(N'2016-05-05T08:02:47.097' AS DateTime), 1, 446.48, 1331)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (96, 1, CAST(N'2016-05-05T08:03:22.047' AS DateTime), 1, 446.47, 1064)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (97, 1, CAST(N'2016-05-05T08:03:32.047' AS DateTime), 2, 447.81, 989)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (98, 1, CAST(N'2016-05-05T08:03:42.047' AS DateTime), 1, 446.47, 1365)
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (99, 1, CAST(N'2016-05-05T08:03:46.130' AS DateTime), 2, 447.81, 577)
GO
INSERT [dbo].[Trade] ([Id], [Pair], [Timestamp], [TradeDirection], [Price], [Amount]) VALUES (100, 1, CAST(N'2016-05-05T08:04:15.070' AS DateTime), 2, 447.81, 472)
SET IDENTITY_INSERT [dbo].[Trade] OFF
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
USE [master]
GO
ALTER DATABASE [BitBot] SET  READ_WRITE 
GO
