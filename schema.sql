
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

--Add a column species of type string to your animals
alter table animals add column species varchar;

