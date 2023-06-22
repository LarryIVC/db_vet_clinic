
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

--day3 postgress
-- create a table owners
create table owners (
    id serial PRIMARY KEY,
    full_name varchar(50),
    age integer
);

-- Create a table named species
create table species (
    id serial PRIMARY KEY,
    name varchar(50)    
);


--Modify animals table:
create sequence animals_id_seq;
select setval('animals_id_seq', (select max(id) from animals));
alter table animals alter column id  set default nextval('animals_id_seq');
alter table animals add primary key (id);

--Remove column species
alter table animals drop column species;
--Add column species_id which is a foreign key referencing species table
alter table animals add column species_id integer references species(id);
--Add column owner_id which is a foreign key referencing the owners table
alter table animals add column owner_id integer references owners(id);
