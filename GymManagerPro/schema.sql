-- Script Date: 28/7/2017 11:39 μμ  - ErikEJ.SqlCeScripting version 3.5.2.69
-- Database information:
-- Locale Identifier: 1032
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: C:\Users\steve\Projects\GymManagerPro\GymManagerPro\Database.sdf
-- ServerVersion: 4.0.8482.1
-- DatabaseSize: 324 KB
-- SpaceAvailable: 3,999 GB
-- Created: 28/7/2017 10:37 μμ

-- User Table information:
-- Number of tables: 5
-- Checkin: 16 row(s)
-- Members: 16 row(s)
-- Memberships: 21 row(s)
-- Plans: 5 row(s)
-- Trainers: 3 row(s)

CREATE TABLE [Trainers] (
  [Id] int IDENTITY (1,1) NOT NULL
, [LastName] nvarchar(50) NULL
, [FirstName] nvarchar(50) NULL
, [DOB] datetime NULL
, [Sex] nvarchar(6) NULL
, [Street] nvarchar(100) NULL
, [Suburb] nvarchar(100) NULL
, [City] nvarchar(100) NULL
, [HomePhone] nvarchar(50) NULL
, [CellPhone] nvarchar(50) NULL
, [Email] nvarchar(50) NULL
, [Salary] money NULL
, [Notes] nvarchar(200) NULL
);
GO
CREATE TABLE [Plans] (
  [Id] int IDENTITY (1,1) NOT NULL
, [Name] nvarchar(100) NULL
, [Duration] int NULL
, [Price] money NULL
, [Notes] nvarchar(255) NULL
);
GO
CREATE TABLE [Members] (
  [Id] int IDENTITY (1,1) NOT NULL
, [CardNumber] int NULL
, [LastName] nvarchar(50) NULL
, [FirstName] nvarchar(50) NULL
, [DOB] datetime NULL
, [Sex] nvarchar(6) NULL
, [Street] nvarchar(100) NULL
, [Suburb] nvarchar(100) NULL
, [City] nvarchar(100) NULL
, [PostalCode] int NULL
, [CellPhone] nvarchar(100) NULL
, [HomePhone] nvarchar(100) NULL
, [Email] nvarchar(100) NULL
, [Occupation] nvarchar(100) NULL
, [PersonalTrainer] int NULL
, [Image] image NULL
, [Notes] nvarchar(200) NULL
);
GO
CREATE TABLE [Memberships] (
  [Id] int IDENTITY (1,1) NOT NULL
, [Plan] int NOT NULL
, [StartDate] datetime NOT NULL
, [EndDate] datetime NULL
, [Price] money NULL
, [Member] int NOT NULL
);
GO
CREATE TABLE [Checkin] (
  [Id] int IDENTITY (1,1) NOT NULL
, [MemberID] int NULL
, [Time] datetime NULL
);
GO
ALTER TABLE [Trainers] ADD CONSTRAINT [PK_Trainers] PRIMARY KEY ([Id]);
GO
ALTER TABLE [Plans] ADD CONSTRAINT [PK_Plans] PRIMARY KEY ([Id]);
GO
ALTER TABLE [Members] ADD CONSTRAINT [PK_Members] PRIMARY KEY ([Id]);
GO
ALTER TABLE [Memberships] ADD CONSTRAINT [PK_Memberships] PRIMARY KEY ([Id]);
GO
ALTER TABLE [Checkin] ADD CONSTRAINT [PK_Checkin] PRIMARY KEY ([Id]);
GO
ALTER TABLE [Trainers] ADD CONSTRAINT [UQ__Trainers__00000000000000C4] UNIQUE ([Id]);
GO
ALTER TABLE [Plans] ADD CONSTRAINT [UQ__Plans__000000000000008C] UNIQUE ([Id]);
GO
ALTER TABLE [Members] ADD CONSTRAINT [UQ__Members__0000000000000114] UNIQUE ([Id]);
GO
ALTER TABLE [Members] ADD CONSTRAINT [UQ__Members__00000000000002C7] UNIQUE ([CardNumber]);
GO
ALTER TABLE [Memberships] ADD CONSTRAINT [UQ__Memberships__00000000000001D2] UNIQUE ([Id]);
GO
ALTER TABLE [Checkin] ADD CONSTRAINT [UQ__Checkin__00000000000001E2] UNIQUE ([Id]);
GO
ALTER TABLE [Memberships] ADD CONSTRAINT [FK_Memberships_Members] FOREIGN KEY ([Member]) REFERENCES [Members]([Id]) ON DELETE CASCADE ON UPDATE CASCADE;
GO
ALTER TABLE [Memberships] ADD CONSTRAINT [FK_Memberships_Plans] FOREIGN KEY ([Plan]) REFERENCES [Plans]([Id]) ON DELETE CASCADE ON UPDATE CASCADE;
GO
ALTER TABLE [Checkin] ADD CONSTRAINT [checkin-members] FOREIGN KEY ([MemberID]) REFERENCES [Members]([Id]) ON DELETE CASCADE ON UPDATE CASCADE;
GO

