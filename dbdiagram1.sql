CREATE TABLE `users` (
  `id_user` integer PRIMARY KEY,
  `username` varchar(255),
  `password` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `record` (
  `id_record` integer PRIMARY KEY,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `room` (
  `id_room` integer PRIMARY KEY,
  `room_code` varchar(255),
  `position` varchar(255),
  `room_name` varchar(255),
  `nama_ruangan` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `room_information` (
  `id_inform` integer PRIMARY KEY,
  `room_id` integer,
  `room_type` varchar(255),
  `room_head` integer,
  `information_room` varchar(255),
  `research_list` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `room_lecture` (
  `id_lecture` integer PRIMARY KEY,
  `room_id` integer,
  `name_lecture` varchar(255),
  `nim` integer,
  `major` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `room_student` (
  `id_student` integer PRIMARY KEY,
  `room_id` integer,
  `name_student` varchar(255),
  `nrp` integer,
  `major` varchar(255),
  `study_program` varchar(255),
  `created_at` timestamp
);

ALTER TABLE `room_information` ADD FOREIGN KEY (`room_id`) REFERENCES `room` (`id_room`);

ALTER TABLE `room_information` ADD FOREIGN KEY (`room_head`) REFERENCES `room_lecture` (`id_lecture`);

ALTER TABLE `room_lecture` ADD FOREIGN KEY (`room_id`) REFERENCES `room` (`id_room`);

ALTER TABLE `room_student` ADD FOREIGN KEY (`room_id`) REFERENCES `room` (`id_room`);
