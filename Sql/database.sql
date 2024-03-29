if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblFirstName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblFirstName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblLastName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblLastName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sproc_GetNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sproc_GetNames]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sproc_InsertFirstName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sproc_InsertFirstName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sproc_InsertLastName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sproc_InsertLastName]
GO

/* create the name tables */
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

CREATE    PROCEDURE dbo.sproc_GetNames
-- used to restrict the size of batch received
@maxCount int = 1
	 
AS
SET ROWCOUNT @maxCount

select firstname, lastname 
from tblname 
FOR XML AUTO, ELEMENTS --, XMLDATA

SET ROWCOUNT 0
GO

CREATE PROCEDURE dbo.sproc_InsertFirstName
	@fname varchar(50) 
AS
insert into tblFirstName(fname) values (@fname)
GO

CREATE PROCEDURE dbo.sproc_InsertLastName
	@lname varchar(50) 
AS
insert into tblLastName(lname) values (@lname)
GO

insert into tblname(firstname, lastname) values ('Joe', 'Bloggs')
GO
insert into tblname(firstname, lastname) values ('John', 'Doe')
GO

exec sproc_GetNames 0