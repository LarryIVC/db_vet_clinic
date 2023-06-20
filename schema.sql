
CREATE DATABASE vet_clinic;

CREATE TABLE animals
(
    id integer NOT NULL,
    name varchar,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg double precision
);