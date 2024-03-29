if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblFirstName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblFirstName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblLastName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblLastName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblName]
GO

CREATE TABLE [dbo].[tblFirstName] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[fname] [varchar] (50) COLLATE Latin1_General_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblLastName] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[lname] [varchar] (50) COLLATE Latin1_General_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblName] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[firstname] [varchar] (50) COLLATE Latin1_General_CI_AS NULL ,
	[lastname] [varchar] (50) COLLATE Latin1_General_CI_AS NULL 
) ON [PRIMARY]
GO

