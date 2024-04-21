CREATE TABLE "users" (
  "id_user" integer PRIMARY KEY,
  "username" varchar,
  "password" varchar,
  "created_at" timestamp
);

CREATE TABLE "record" (
  "id_record" integer PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "room" (
  "id_room" integer PRIMARY KEY,
  "room_code" varchar,
  "position" varchar,
  "room_name" varchar,
  "nama_ruangan" varchar,
  "created_at" timestamp
);

CREATE TABLE "room_information" (
  "id_inform" integer PRIMARY KEY,
  "room_id" integer,
  "room_type" varchar,
  "room_head" integer,
  "information_room" varchar,
  "research_list" varchar,
  "created_at" timestamp
);

CREATE TABLE "room_lecture" (
  "id_lecture" integer PRIMARY KEY,
  "room_id" integer,
  "name_lecture" varchar,
  "nim" integer,
  "major" varchar,
  "created_at" timestamp
);

CREATE TABLE "room_student" (
  "id_student" integer PRIMARY KEY,
  "room_id" integer,
  "name_student" varchar,
  "nrp" integer,
  "major" varchar,
  "study_program" varchar,
  "created_at" timestamp
);

ALTER TABLE "room_information" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("id_room");

ALTER TABLE "room_information" ADD FOREIGN KEY ("room_head") REFERENCES "room_lecture" ("id_lecture");

ALTER TABLE "room_lecture" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("id_room");

ALTER TABLE "room_student" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("id_room");
