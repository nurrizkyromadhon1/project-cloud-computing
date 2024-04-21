CREATE TABLE [users] (
  [id_user] integer PRIMARY KEY,
  [username] nvarchar(255),
  [password] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [record] (
  [id_record] integer PRIMARY KEY,
  [created_at] timestamp,
  [updated_at] timestamp
)
GO

CREATE TABLE [room] (
  [id_room] integer PRIMARY KEY,
  [room_code] nvarchar(255),
  [position] nvarchar(255),
  [room_name] nvarchar(255),
  [nama_ruangan] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [room_information] (
  [id_inform] integer PRIMARY KEY,
  [room_id] integer,
  [room_type] nvarchar(255),
  [room_head] integer,
  [information_room] nvarchar(255),
  [research_list] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [room_lecture] (
  [id_lecture] integer PRIMARY KEY,
  [room_id] integer,
  [name_lecture] nvarchar(255),
  [nim] integer,
  [major] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [room_student] (
  [id_student] integer PRIMARY KEY,
  [room_id] integer,
  [name_student] nvarchar(255),
  [nrp] integer,
  [major] nvarchar(255),
  [study_program] nvarchar(255),
  [created_at] timestamp
)
GO

ALTER TABLE [room_information] ADD FOREIGN KEY ([room_id]) REFERENCES [room] ([id_room])
GO

ALTER TABLE [room_information] ADD FOREIGN KEY ([room_head]) REFERENCES [room_lecture] ([id_lecture])
GO

ALTER TABLE [room_lecture] ADD FOREIGN KEY ([room_id]) REFERENCES [room] ([id_room])
GO

ALTER TABLE [room_student] ADD FOREIGN KEY ([room_id]) REFERENCES [room] ([id_room])
GO
