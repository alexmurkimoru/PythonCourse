-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.2
-- PostgreSQL version: 15.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
CREATE DATABASE new_database;
-- ddl-end --


-- object: public."user" | type: TABLE --
-- DROP TABLE IF EXISTS public."user" CASCADE;
CREATE TABLE public."user" (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar,
	weight bigint,
	height bigint,
	gender varchar,
	age bigint,
	CONSTRAINT user_id_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public."user" OWNER TO postgres;
-- ddl-end --

-- object: public.directory | type: TABLE --
-- DROP TABLE IF EXISTS public.directory CASCADE;
CREATE TABLE public.directory (
	id bigint NOT NULL,
	directory_name varchar,
	CONSTRAINT directory_id_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.directory OWNER TO postgres;
-- ddl-end --

-- object: public.exersice | type: TABLE --
-- DROP TABLE IF EXISTS public.exersice CASCADE;
CREATE TABLE public.exersice (
	id bigint NOT NULL,
	exersice_name varchar,
	exersice_description text,
	CONSTRAINT exersice_id_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.exersice OWNER TO postgres;
-- ddl-end --

-- object: public.training | type: TABLE --
-- DROP TABLE IF EXISTS public.training CASCADE;
CREATE TABLE public.training (
	id bigint NOT NULL,
	id_user bigint,
	training_time time,
	CONSTRAINT training_id_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.training OWNER TO postgres;
-- ddl-end --

-- object: public.article | type: TABLE --
-- DROP TABLE IF EXISTS public.article CASCADE;
CREATE TABLE public.article (
	id bigint NOT NULL,
	id_directory bigint,
	article_content text,
	article_title varchar,
	CONSTRAINT article_id_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.article OWNER TO postgres;
-- ddl-end --

-- object: public.action | type: TABLE --
-- DROP TABLE IF EXISTS public.action CASCADE;
CREATE TABLE public.action (
	id bigint NOT NULL,
	id_habit bigint,
	id_user bigint,
	CONSTRAINT action_id_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.action OWNER TO postgres;
-- ddl-end --

-- object: user_fk | type: CONSTRAINT --
-- ALTER TABLE public.training DROP CONSTRAINT IF EXISTS user_fk CASCADE;
ALTER TABLE public.training ADD CONSTRAINT user_fk FOREIGN KEY (id_user)
REFERENCES public."user" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: directory_fk | type: CONSTRAINT --
-- ALTER TABLE public.article DROP CONSTRAINT IF EXISTS directory_fk CASCADE;
ALTER TABLE public.article ADD CONSTRAINT directory_fk FOREIGN KEY (id_directory)
REFERENCES public.directory (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.training_exercise | type: TABLE --
-- DROP TABLE IF EXISTS public.training_exercise CASCADE;
CREATE TABLE public.training_exercise (
	id_training bigint,
	id_exersice bigint,
	reps bigint,
	sets bigint

);
-- ddl-end --
ALTER TABLE public.training_exercise OWNER TO postgres;
-- ddl-end --

-- object: training_fk | type: CONSTRAINT --
-- ALTER TABLE public.training_exercise DROP CONSTRAINT IF EXISTS training_fk CASCADE;
ALTER TABLE public.training_exercise ADD CONSTRAINT training_fk FOREIGN KEY (id_training)
REFERENCES public.training (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: exersice_fk | type: CONSTRAINT --
-- ALTER TABLE public.training_exercise DROP CONSTRAINT IF EXISTS exersice_fk CASCADE;
ALTER TABLE public.training_exercise ADD CONSTRAINT exersice_fk FOREIGN KEY (id_exersice)
REFERENCES public.exersice (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.habit | type: TABLE --
-- DROP TABLE IF EXISTS public.habit CASCADE;
CREATE TABLE public.habit (
	id bigint NOT NULL,
	habit_name varchar,
	habit_description text,
	CONSTRAINT habit_id_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.habit OWNER TO postgres;
-- ddl-end --

-- object: habit_fk | type: CONSTRAINT --
-- ALTER TABLE public.action DROP CONSTRAINT IF EXISTS habit_fk CASCADE;
ALTER TABLE public.action ADD CONSTRAINT habit_fk FOREIGN KEY (id_habit)
REFERENCES public.habit (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: user_fk | type: CONSTRAINT --
-- ALTER TABLE public.action DROP CONSTRAINT IF EXISTS user_fk CASCADE;
ALTER TABLE public.action ADD CONSTRAINT user_fk FOREIGN KEY (id_user)
REFERENCES public."user" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.walk | type: TABLE --
-- DROP TABLE IF EXISTS public.walk CASCADE;
CREATE TABLE public.walk (
	id bigint NOT NULL,
	id_user bigint,
	walk_steps bigint,
	walk_length bigint,
	CONSTRAINT walk_id_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.walk OWNER TO postgres;
-- ddl-end --

-- object: user_fk | type: CONSTRAINT --
-- ALTER TABLE public.walk DROP CONSTRAINT IF EXISTS user_fk CASCADE;
ALTER TABLE public.walk ADD CONSTRAINT user_fk FOREIGN KEY (id_user)
REFERENCES public."user" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


