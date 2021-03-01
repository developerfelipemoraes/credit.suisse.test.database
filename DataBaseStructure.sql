
USE [master]
GO

/****** Object:  Database [dbCreditSuisseTest]    Script Date: 28/02/2021 20:51:13 ******/
CREATE DATABASE [dbCreditSuisseTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbCreditSuisseTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_V1\MSSQL\DATA\dbCreditSuisseTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbCreditSuisseTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_V1\MSSQL\DATA\dbCreditSuisseTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

USE [dbCreditSuisseTest]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ClientSector](
	[Id] [int] NOT NULL,
	[ClientSector] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClientSector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Trade](
	[Id] [bigint] NOT NULL,
	[Value] [decimal](18, 4) NOT NULL,
	[ClientSectorId] [int] NOT NULL,
 CONSTRAINT [PK_Trade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Trade]  WITH CHECK ADD  CONSTRAINT [FK_Trade_Sector_Client] FOREIGN KEY([ClientSectorId])
REFERENCES [dbo].[ClientSector] ([Id])
GO

ALTER TABLE [dbo].[Trade] CHECK CONSTRAINT [FK_Trade_Sector_Client]
GO

PRINT('Insert Client Sector')

INSERT INTO ClientSector VALUES(1,'Private')

INSERT INTO ClientSector VALUES(2,'Public')

PRINT('Insert Trades')
INSERT INTO Trade VALUES(1,2000000, 1)
INSERT INTO Trade VALUES(2,400000, 2)
INSERT INTO Trade VALUES(3,500000, 2)
INSERT INTO Trade VALUES(4,3000000, 2)







