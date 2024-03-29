USE [master]
GO
/****** Object:  Database [Labb2_Rasmus]    Script Date: 2024-01-26 18:58:41 ******/
CREATE DATABASE [Labb2_Rasmus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Labb2_Rasmus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Labb2_Rasmus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Labb2_Rasmus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Labb2_Rasmus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Labb2_Rasmus] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Labb2_Rasmus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Labb2_Rasmus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET ARITHABORT OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Labb2_Rasmus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Labb2_Rasmus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Labb2_Rasmus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Labb2_Rasmus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET RECOVERY FULL 
GO
ALTER DATABASE [Labb2_Rasmus] SET  MULTI_USER 
GO
ALTER DATABASE [Labb2_Rasmus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Labb2_Rasmus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Labb2_Rasmus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Labb2_Rasmus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Labb2_Rasmus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Labb2_Rasmus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Labb2_Rasmus', N'ON'
GO
ALTER DATABASE [Labb2_Rasmus] SET QUERY_STORE = ON
GO
ALTER DATABASE [Labb2_Rasmus] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Labb2_Rasmus]
GO
/****** Object:  Table [dbo].[tblKurs]    Script Date: 2024-01-26 18:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKurs](
	[KursID] [int] IDENTITY(1,1) NOT NULL,
	[KursNamn] [varchar](50) NULL,
 CONSTRAINT [PK__tblKurs__BCCFFF3B9915B108] PRIMARY KEY CLUSTERED 
(
	[KursID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBetyg]    Script Date: 2024-01-26 18:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBetyg](
	[StudentID] [int] NULL,
	[KursID] [int] NULL,
	[Betyg] [int] NULL,
	[Betygsdatum] [date] NULL,
	[PersonalID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vWKursBetygSnittMaxMin]    Script Date: 2024-01-26 18:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vWKursBetygSnittMaxMin]
as
select tblKurs.KursNamn as Kurs, 
	avg(Betyg) as BetygSnitt, 
	max(Betyg) as HögstaBetyg, 
	min(Betyg) as LägstaBetyg
from tblBetyg
Join tblKurs on tblBetyg.KursID = tblKurs.KursID
Group by tblKurs.KursNamn
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2024-01-26 18:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPersonal]    Script Date: 2024-01-26 18:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonal](
	[PersonalID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Befattning] [varchar](50) NULL,
 CONSTRAINT [PK__tblPerso__28343713D1BDB47D] PRIMARY KEY CLUSTERED 
(
	[PersonalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 2024-01-26 18:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudent](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Personnr] [nchar](13) NULL,
	[Klass] [varchar](25) NULL,
 CONSTRAINT [PK__tblStude__32C52A793A19FAEC] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240124114558_Initial Creation', N'8.0.1')
GO
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (1, 1, 4, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (2, 1, 2, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (3, 1, 3, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (4, 1, 1, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (5, 1, 4, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (6, 1, 2, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (7, 1, 3, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (8, 1, 5, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (9, 1, 3, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (10, 1, 2, CAST(N'2023-06-10' AS Date), 2)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (1, 2, 3, CAST(N'2024-01-10' AS Date), 4)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (2, 2, 4, CAST(N'2024-01-10' AS Date), 5)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (3, 3, 5, CAST(N'2024-01-10' AS Date), 6)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (4, 4, 2, CAST(N'2024-01-10' AS Date), 5)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (5, 6, 2, CAST(N'2022-06-10' AS Date), 5)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (6, 5, 1, CAST(N'2022-06-10' AS Date), 4)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (7, 7, 3, CAST(N'2022-06-10' AS Date), 4)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (8, 7, 3, CAST(N'2022-06-10' AS Date), 4)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (9, 4, 3, CAST(N'2022-06-10' AS Date), 5)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (1, 2, 3, CAST(N'2023-03-10' AS Date), 4)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (2, 3, 4, CAST(N'2023-03-10' AS Date), 4)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (3, 4, 4, CAST(N'2023-03-10' AS Date), 6)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (4, 5, 4, CAST(N'2023-03-10' AS Date), 6)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (2, 6, 1, CAST(N'2021-06-10' AS Date), 5)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (1, 7, 5, CAST(N'2021-06-10' AS Date), 4)
INSERT [dbo].[tblBetyg] ([StudentID], [KursID], [Betyg], [Betygsdatum], [PersonalID]) VALUES (1, 3, 2, CAST(N'2021-06-10' AS Date), 4)
GO
SET IDENTITY_INSERT [dbo].[tblKurs] ON 

INSERT [dbo].[tblKurs] ([KursID], [KursNamn]) VALUES (1, N'Svenska')
INSERT [dbo].[tblKurs] ([KursID], [KursNamn]) VALUES (2, N'Engelska')
INSERT [dbo].[tblKurs] ([KursID], [KursNamn]) VALUES (3, N'Matematik')
INSERT [dbo].[tblKurs] ([KursID], [KursNamn]) VALUES (4, N'Historia')
INSERT [dbo].[tblKurs] ([KursID], [KursNamn]) VALUES (5, N'Samhällskunskap')
INSERT [dbo].[tblKurs] ([KursID], [KursNamn]) VALUES (6, N'Naturvetenskap')
INSERT [dbo].[tblKurs] ([KursID], [KursNamn]) VALUES (7, N'Programmering')
SET IDENTITY_INSERT [dbo].[tblKurs] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPersonal] ON 

INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (1, N'Mathias', N'Jansson', N'Rektor')
INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (2, N'Erik', N'Eriksson', N'Lärare')
INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (3, N'Lisa', N'Johansson', N'SYV')
INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (4, N'Thomas', N'Svensson', N'Lärare')
INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (5, N'Miriam', N'Gustavsson', N'Lärare')
INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (6, N'Lisa', N'Bengtsson', N'Lärare')
INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (7, N'Lennart', N'Johansson', N'Vaktmästare')
INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (8, N'Sture', N'Svensson', N'Administratör')
INSERT [dbo].[tblPersonal] ([PersonalID], [FirstName], [LastName], [Befattning]) VALUES (9, N'Stig', N'Pärsson', N'Lärare')
SET IDENTITY_INSERT [dbo].[tblPersonal] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStudent] ON 

INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (1, N'Jessica', N'Persson', N'20001023-1234', N'A1')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (2, N'Johan', N'Trygg', N'19960223-2345', N'B2')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (3, N'Filip', N'Åkemark', N'19991212-3456', N'B2')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (4, N'William', N'Lundkvist', N'20010311-4567', N'B2')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (5, N'Jessica', N'Persson', N'20001023-1234', N'A1')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (6, N'Emma', N'Andersson', N'19900101-1234', N'C3')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (7, N'Oscar', N'Nilsson', N'19871210-5678', N'B2')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (8, N'Amanda', N'Eriksson', N'19930305-9876', N'C3')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (9, N'Viktor', N'Lundgren', N'19891122-1122', N'A1')
INSERT [dbo].[tblStudent] ([StudentID], [FirstName], [LastName], [Personnr], [Klass]) VALUES (10, N'Sofia', N'Persson', N'19920415-3344', N'B2')
SET IDENTITY_INSERT [dbo].[tblStudent] OFF
GO
ALTER TABLE [dbo].[tblBetyg]  WITH CHECK ADD  CONSTRAINT [tblBetyg_KursID_FK] FOREIGN KEY([KursID])
REFERENCES [dbo].[tblKurs] ([KursID])
GO
ALTER TABLE [dbo].[tblBetyg] CHECK CONSTRAINT [tblBetyg_KursID_FK]
GO
ALTER TABLE [dbo].[tblBetyg]  WITH CHECK ADD  CONSTRAINT [tblBetyg_PersonalID_FK] FOREIGN KEY([PersonalID])
REFERENCES [dbo].[tblPersonal] ([PersonalID])
GO
ALTER TABLE [dbo].[tblBetyg] CHECK CONSTRAINT [tblBetyg_PersonalID_FK]
GO
ALTER TABLE [dbo].[tblBetyg]  WITH CHECK ADD  CONSTRAINT [tblBetyg_StudentID_FK] FOREIGN KEY([StudentID])
REFERENCES [dbo].[tblStudent] ([StudentID])
GO
ALTER TABLE [dbo].[tblBetyg] CHECK CONSTRAINT [tblBetyg_StudentID_FK]
GO
USE [master]
GO
ALTER DATABASE [Labb2_Rasmus] SET  READ_WRITE 
GO
