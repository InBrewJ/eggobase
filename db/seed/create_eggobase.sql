CREATE DATABASE eggobase;

\c eggobase;

-- public.eggs definition

-- Drop table

-- DROP TABLE public.eggs;

CREATE TABLE public.eggs (
	id serial NOT NULL,
	color varchar NULL,
	quality varchar NULL
);