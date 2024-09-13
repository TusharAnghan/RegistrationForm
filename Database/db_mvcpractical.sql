USE [master]
GO
/****** Object:  Database [db_mvcpractical]    Script Date: 13-09-2024 4.43.29 PM ******/
CREATE DATABASE [db_mvcpractical]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_mvcpractical', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\db_mvcpractical.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_mvcpractical_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\db_mvcpractical_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_mvcpractical] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_mvcpractical].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_mvcpractical] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_mvcpractical] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_mvcpractical] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_mvcpractical] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_mvcpractical] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_mvcpractical] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_mvcpractical] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_mvcpractical] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_mvcpractical] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_mvcpractical] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_mvcpractical] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_mvcpractical] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_mvcpractical] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_mvcpractical] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_mvcpractical] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_mvcpractical] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_mvcpractical] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_mvcpractical] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_mvcpractical] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_mvcpractical] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_mvcpractical] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_mvcpractical] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_mvcpractical] SET RECOVERY FULL 
GO
ALTER DATABASE [db_mvcpractical] SET  MULTI_USER 
GO
ALTER DATABASE [db_mvcpractical] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_mvcpractical] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_mvcpractical] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_mvcpractical] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_mvcpractical] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_mvcpractical] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_mvcpractical', N'ON'
GO
ALTER DATABASE [db_mvcpractical] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_mvcpractical] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_mvcpractical]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[City_ID] [int] IDENTITY(1,1) NOT NULL,
	[State_ID] [int] NULL,
	[City_Name] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_State]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_State](
	[State_ID] [int] IDENTITY(1,1) NOT NULL,
	[State_Name] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_State] PRIMARY KEY CLUSTERED 
(
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserInformation]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserInformation](
	[UserInformation_ID] [int] IDENTITY(1,1) NOT NULL,
	[State_ID] [int] NULL,
	[City_ID] [int] NULL,
	[Name] [varchar](100) NULL,
	[Email_Address] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [varchar](200) NULL,
 CONSTRAINT [PK_tbl_UserInformation] PRIMARY KEY CLUSTERED 
(
	[UserInformation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_City] ON 

INSERT [dbo].[tbl_City] ([City_ID], [State_ID], [City_Name]) VALUES (1, 1, N'Surat')
INSERT [dbo].[tbl_City] ([City_ID], [State_ID], [City_Name]) VALUES (2, 1, N'Bardoli')
INSERT [dbo].[tbl_City] ([City_ID], [State_ID], [City_Name]) VALUES (3, 1, N'Baroda')
INSERT [dbo].[tbl_City] ([City_ID], [State_ID], [City_Name]) VALUES (4, 2, N'Mumbai')
INSERT [dbo].[tbl_City] ([City_ID], [State_ID], [City_Name]) VALUES (5, 2, N'Pune')
SET IDENTITY_INSERT [dbo].[tbl_City] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_State] ON 

INSERT [dbo].[tbl_State] ([State_ID], [State_Name]) VALUES (1, N'Gujarat')
INSERT [dbo].[tbl_State] ([State_ID], [State_Name]) VALUES (2, N'Maharashtra')
SET IDENTITY_INSERT [dbo].[tbl_State] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_UserInformation] ON 

INSERT [dbo].[tbl_UserInformation] ([UserInformation_ID], [State_ID], [City_ID], [Name], [Email_Address], [Phone], [Address]) VALUES (23, 2, 5, N'Test1', N'test@gmail.com', N'9898989898', N'Street1')
INSERT [dbo].[tbl_UserInformation] ([UserInformation_ID], [State_ID], [City_ID], [Name], [Email_Address], [Phone], [Address]) VALUES (24, 2, 4, N'Test2', N'test2@gmail.com', N'9898989898', N'Street1')
SET IDENTITY_INSERT [dbo].[tbl_UserInformation] OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteRecord]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteRecord] @UserInformation_ID int
as
delete from tbl_UserInformation where UserInformation_ID = @UserInformation_ID
GO
/****** Object:  StoredProcedure [dbo].[GetCitiesByState]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCitiesByState] @State_ID int
as
select City_ID, City_Name from tbl_City where State_ID = @State_ID
GO
/****** Object:  StoredProcedure [dbo].[GetRecords]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetRecords]
as 
SELECT * FROM tbl_UserInformation
Go;
GO
/****** Object:  StoredProcedure [dbo].[GetRecordsUsingID]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetRecordsUsingID] @UserInformation_ID int
as 
begin
select * from tbl_UserInformation where UserInformation_ID = @UserInformation_ID 
end;
GO
/****** Object:  StoredProcedure [dbo].[GetStates]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetStates]
as
select * from tbl_State
GO
/****** Object:  StoredProcedure [dbo].[InsertNewRecord]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertNewRecord] @State_ID int, @City_ID int, @Name varchar(100), @Email_Address varchar(100), @Phone varchar(20), @Address varchar(200)
as
insert into tbl_UserInformation(State_ID, City_ID, Name, Email_Address, Phone, Address) VALUES(@State_ID, @City_ID, @Name, @Email_Address, @Phone, @Address)
GO
/****** Object:  StoredProcedure [dbo].[UpdateRecord]    Script Date: 13-09-2024 4.43.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateRecord] @UserInformation_ID int, @State_ID int, @City_ID int, @Name varchar(100), @Email_Address varchar(100), @Phone varchar(20), @Address varchar(200)
as
update tbl_UserInformation set State_ID = @State_ID, City_ID = @City_ID, Name = @Name, Email_Address = @Email_Address, Phone = @Phone, Address = @Address where UserInformation_ID = @UserInformation_ID
GO
USE [master]
GO
ALTER DATABASE [db_mvcpractical] SET  READ_WRITE 
GO
