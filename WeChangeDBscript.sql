USE [master]
GO
/****** Object:  Database [WeChangeDB]    Script Date: 5/5/2017 8:03:16 AM ******/
CREATE DATABASE [WeChangeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WeChangeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.URGENTINSTANCE\MSSQL\DATA\WeChangeDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WeChangeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.URGENTINSTANCE\MSSQL\DATA\WeChangeDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WeChangeDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WeChangeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WeChangeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WeChangeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WeChangeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WeChangeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WeChangeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WeChangeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WeChangeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WeChangeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WeChangeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WeChangeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WeChangeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WeChangeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WeChangeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WeChangeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WeChangeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WeChangeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WeChangeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WeChangeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WeChangeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WeChangeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WeChangeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WeChangeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WeChangeDB] SET RECOVERY FULL 
GO
ALTER DATABASE [WeChangeDB] SET  MULTI_USER 
GO
ALTER DATABASE [WeChangeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WeChangeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WeChangeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WeChangeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WeChangeDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WeChangeDB', N'ON'
GO
USE [WeChangeDB]
GO
/****** Object:  Table [dbo].[MillionDollarTable]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MillionDollarTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Petitions]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Petitions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PetitionerID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[PDescription] [nvarchar](max) NULL,
	[DecisionMaker] [nvarchar](max) NULL,
	[Decision] [nvarchar](max) NULL,
	[DecisionDesc] [nvarchar](max) NULL,
	[DecisionDT] [nvarchar](max) NULL,
	[DT] [nvarchar](max) NULL,
	[Signs] [int] NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Pname] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Signatures]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Signatures](
	[Sno] [int] IDENTITY(1,1) NOT NULL,
	[PetitionID] [int] NULL,
	[userID] [int] NULL,
	[DT] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[ID] [int] NOT NULL,
	[Pe] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Regno] [int] NOT NULL,
	[Pass] [nvarchar](max) NULL,
	[DT] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Regno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[pet]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[pet] as select * from Petitions

GO
ALTER TABLE [dbo].[Signatures]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([Regno])
GO
/****** Object:  StoredProcedure [dbo].[AddNewPetition]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 /*STORED PROCEDURES*/
CREATE PROCEDURE [dbo].[AddNewPetition]
@PetitionerID int,@title nvarchar(max),@Desc nvarchar(max),@DMaker nvarchar(max),@Decision nvarchar(max),@DecisionDesc nvarchar(max),@DecisionDescDT nvarchar(max),@Signs int,@ImagePath nvarchar(max),@CreationDT nvarchar(max)
as 
insert into Petitions(PetitionerID,Title,PDescription,DecisionMaker,Decision,DecisionDesc,DecisionDT,Signs,ImagePath,DT) values(@PetitionerID,@title,@Desc,@DMaker,@Decision,@DecisionDesc,@DecisionDescDT,@Signs,@ImagePath,@CreationDT)
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewUser]
@UserID int,
@name nvarchar(max),
@email nvarchar(max),
@Pass nvarchar(max),
@DT nvarchar(Max)
as 
insert into Users(Name,Email,Regno,Pass,DT) values(@name,@email,@UserID,@Pass,@DT)

GO
/****** Object:  StoredProcedure [dbo].[LogInUser]    Script Date: 5/5/2017 8:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[LogInUser] @UserID int, @Pass nvarchar(Max)
as 
select count(*) from users where Regno=@UserID and Pass=@Pass
GO
USE [master]
GO
ALTER DATABASE [WeChangeDB] SET  READ_WRITE 
GO
