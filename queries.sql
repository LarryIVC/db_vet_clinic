--Find all animals whose name ends in "mon".
select * from animals
where name like '%mon';

--List the name of all animals born between 2016 and 2019.
select name from animals
where date_of_birth between '2016-01-01' and '2019-12-31';

--List the name of all animals that are neutered and have less than 3 escape attempts.
select name from animals
where neutered=true and escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
select date_of_birth from animals
where name='Agumon' or name='Pikachu';

--List name and escape attempts of animals that weigh more than 10.5kg
select name, escape_attempts from animals
where weight_kg > 10.5;

--Find all animals that are neutered.
select * from animals
where neutered=true;

--Find all animals not named Gabumon.
select * from animals
where name != 'Gabumon';

--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select * from animals
where weight_kg between 10.4 and 17.3;

--day2

--Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
begin;
update animals set species='unspecified';
select * from animals;
rollback;
select * from animals;

--Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
begin;
update animals set species='digimon'
where name like '%mon';
select * from animals;

--Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
update animals set species='pokemon'
where species is null;

--Verify that changes were made.
select * from animals;

--Commit the transaction.
commit;

--Verify that changes persist after commit.
select * from animals;

--Inside a transaction delete all records in the animals table, then roll back the transaction.
begin;
delete from animals;
select * from animals;
rollback;
select * from animals;

--Delete all animals born after Jan 1st, 2022.
begin;
delete from animals
where date_of_birth > '2022-01-01';
select * from animals;

--Create a savepoint for the transaction.
begin;
savepoint delete_savepoint;

--Update all animals' weight to be their weight multiplied by -1.
update animals set weight_kg = weight_kg * -1;
select * from animals;

--Rollback to the savepoint
rollback to delete_savepoint;
select * from animals;

--Update all animals' weights that are negative to be their weight multiplied by -1.
begin;
update animals set weight_kg = weight_kg * -1
where weight_kg < 0;
select * from animals;

--Commit transaction
commit;

--How many animals are there?
select count(*) from animals;

--How many animals have never tried to escape?
select count(*) from animals where escape_attempts = 0;

--What is the average weight of animals?
select avg(weight_kg) from animals;

--Who escapes the most, neutered or not neutered animals?
select neutered, avg(escape_attempts) from animals group by neutered;

--What is the minimum and maximum weight of each type of animal?
select species, min(weight_kg), max(weight_kg) from animals group by species;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;
