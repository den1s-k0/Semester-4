CREATE TABLE [Participants] (
	[Participant_ID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Full_Name] int NOT NULL,
	[Email] nvarchar(max) NOT NULL UNIQUE,
	[Address] nvarchar(max) NOT NULL,
	[Accommodation] nvarchar(max),
	[Company] nvarchar(max),
	[Post] nvarchar(max),
	[Role_ID] int NOT NULL,
	PRIMARY KEY ([Participant_ID])
);

CREATE TABLE [Reports] (
	[Report_ID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Report_Title] nvarchar(max) NOT NULL,
	[Session_ID] int NOT NULL,
	[Report_Summary] nvarchar(max) NOT NULL,
	PRIMARY KEY ([Report_ID])
);

CREATE TABLE [Roles] (
	[Role_ID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Role_name] nvarchar(max) NOT NULL UNIQUE,
	[Role_description] nvarchar(max) NOT NULL,
	PRIMARY KEY ([Role_ID])
);

CREATE TABLE [Sections] (
	[Section_ID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Section_name] nvarchar(max) NOT NULL,
	[Section_description] nvarchar(max) NOT NULL,
	PRIMARY KEY ([Section_ID])
);

CREATE TABLE [Sessions] (
	[Session_ID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Section_ID] int NOT NULL,
	[Session_Date] date NOT NULL,
	[Start_Time] time(7) NOT NULL,
	[End_Time] time(7) NOT NULL,
	[Room_Id] int NOT NULL,
	PRIMARY KEY ([Session_ID])
);

CREATE TABLE [Report_Authors] (
	[Report_Author_ID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Report_ID] int NOT NULL,
	[Participant_ID] int NOT NULL,
	PRIMARY KEY ([Report_Author_ID])
);

CREATE TABLE [Rooms] (
	[Room_ID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Room_Name] nvarchar(max) NOT NULL,
	[Room_Description] nvarchar(max) NOT NULL,
	PRIMARY KEY ([Room_ID])
);

ALTER TABLE [Participants] ADD CONSTRAINT [Participants_fk7] FOREIGN KEY ([Role_ID]) REFERENCES [Roles]([Role_ID]);
ALTER TABLE [Reports] ADD CONSTRAINT [Reports_fk2] FOREIGN KEY ([Session_ID]) REFERENCES [Sessions]([Session_ID]);


ALTER TABLE [Sessions] ADD CONSTRAINT [Sessions_fk1] FOREIGN KEY ([Section_ID]) REFERENCES [Sections]([Section_ID]);

ALTER TABLE [Sessions] ADD CONSTRAINT [Sessions_fk5] FOREIGN KEY ([Room_Id]) REFERENCES [Rooms]([Room_ID]);
ALTER TABLE [Report_Authors] ADD CONSTRAINT [Report_Authors_fk1] FOREIGN KEY ([Report_ID]) REFERENCES [Reports]([Report_ID]);

ALTER TABLE [Report_Authors] ADD CONSTRAINT [Report_Authors_fk2] FOREIGN KEY ([Participant_ID]) REFERENCES [Participants]([Participant_ID]);
