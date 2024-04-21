-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public._prisma_migrations
(
    id character varying(36) COLLATE pg_catalog."default" NOT NULL,
    checksum character varying(64) COLLATE pg_catalog."default" NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    logs text COLLATE pg_catalog."default",
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone NOT NULL DEFAULT now(),
    applied_steps_count integer NOT NULL DEFAULT 0,
    CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.record
(
    id_record integer NOT NULL DEFAULT nextval('record_id_record_seq'::regclass),
    created_at timestamp(3) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(3) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT record_pkey PRIMARY KEY (id_record)
);

CREATE TABLE IF NOT EXISTS public.room
(
    id_room integer NOT NULL DEFAULT nextval('room_id_room_seq'::regclass),
    room_code text COLLATE pg_catalog."default" NOT NULL,
    "position" text COLLATE pg_catalog."default" NOT NULL,
    room_name text COLLATE pg_catalog."default" NOT NULL,
    nama_ruangan text COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp(3) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT room_pkey PRIMARY KEY (id_room)
);

CREATE TABLE IF NOT EXISTS public.room_information
(
    id_inform integer NOT NULL DEFAULT nextval('room_information_id_inform_seq'::regclass),
    room_id integer NOT NULL,
    room_head integer NOT NULL,
    room_type text COLLATE pg_catalog."default" NOT NULL,
    information_room text COLLATE pg_catalog."default" NOT NULL,
    research_list text COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp(3) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT room_information_pkey PRIMARY KEY (id_inform)
);

CREATE TABLE IF NOT EXISTS public.room_lecture
(
    id_lecture integer NOT NULL DEFAULT nextval('room_lecture_id_lecture_seq'::regclass),
    room_id integer NOT NULL,
    name_lecture text COLLATE pg_catalog."default" NOT NULL,
    nim integer NOT NULL,
    major text COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp(3) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT room_lecture_pkey PRIMARY KEY (id_lecture)
);

CREATE TABLE IF NOT EXISTS public.room_student
(
    id_student integer NOT NULL DEFAULT nextval('room_student_id_student_seq'::regclass),
    room_id integer NOT NULL,
    name_student text COLLATE pg_catalog."default" NOT NULL,
    nrp integer NOT NULL,
    major text COLLATE pg_catalog."default" NOT NULL,
    study_program text COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp(3) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT room_student_pkey PRIMARY KEY (id_student)
);

CREATE TABLE IF NOT EXISTS public.users
(
    password text COLLATE pg_catalog."default" NOT NULL,
    id_user integer NOT NULL DEFAULT nextval('users_id_user_seq'::regclass),
    username text COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp(3) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_pkey PRIMARY KEY (id_user)
);

ALTER TABLE IF EXISTS public.room_information
    ADD CONSTRAINT room_information_room_head_fkey FOREIGN KEY (room_head)
    REFERENCES public.room_lecture (id_lecture) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT;
CREATE INDEX IF NOT EXISTS room_information_room_head_key
    ON public.room_information(room_head);


ALTER TABLE IF EXISTS public.room_information
    ADD CONSTRAINT room_information_room_id_fkey FOREIGN KEY (room_id)
    REFERENCES public.room (id_room) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT;
CREATE INDEX IF NOT EXISTS room_information_room_id_key
    ON public.room_information(room_id);


ALTER TABLE IF EXISTS public.room_lecture
    ADD CONSTRAINT room_lecture_room_id_fkey FOREIGN KEY (room_id)
    REFERENCES public.room (id_room) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT;
CREATE INDEX IF NOT EXISTS room_lecture_room_id_key
    ON public.room_lecture(room_id);


ALTER TABLE IF EXISTS public.room_student
    ADD CONSTRAINT room_student_room_id_fkey FOREIGN KEY (room_id)
    REFERENCES public.room (id_room) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT;
CREATE INDEX IF NOT EXISTS room_student_room_id_key
    ON public.room_student(room_id);

END;