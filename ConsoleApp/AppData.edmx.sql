
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/16/2020 10:31:32
-- Generated from EDMX file: C:\Users\russe\source\repos\CSC200_SPR2020_DB\ConsoleApp\AppData.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AppData];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [Id] uniqueidentifier  NOT NULL,
    [Title] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [Id] uniqueidentifier  NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [GradeLevel] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Enrollments'
CREATE TABLE [dbo].[Enrollments] (
    [Id] uniqueidentifier  NOT NULL,
    [CourseId] uniqueidentifier  NOT NULL,
    [StudentId] uniqueidentifier  NOT NULL,
    [Grade] nchar(1)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Enrollments'
ALTER TABLE [dbo].[Enrollments]
ADD CONSTRAINT [PK_Enrollments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CourseId] in table 'Enrollments'
ALTER TABLE [dbo].[Enrollments]
ADD CONSTRAINT [FK_CourseEnrollment]
    FOREIGN KEY ([CourseId])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseEnrollment'
CREATE INDEX [IX_FK_CourseEnrollment]
ON [dbo].[Enrollments]
    ([CourseId]);
GO

-- Creating foreign key on [StudentId] in table 'Enrollments'
ALTER TABLE [dbo].[Enrollments]
ADD CONSTRAINT [FK_StudentEnrollment]
    FOREIGN KEY ([StudentId])
    REFERENCES [dbo].[Students]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentEnrollment'
CREATE INDEX [IX_FK_StudentEnrollment]
ON [dbo].[Enrollments]
    ([StudentId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------