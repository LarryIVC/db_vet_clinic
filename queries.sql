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

--day3

--What animals belong to Melody Pond? using join
select a.name from animals a join owners o on a.owner_id = o.id where o.full_name = 'Melody Pond';
--List of all animals that are pokemon (their type is Pokemon).
select a.name from animals a join species s on a.species_id = s.id where s.name = 'Pokemon';
--List all owners and their animals, remember to include those that don't own any animal.
select o.full_name, a.name from owners o left join animals a on o.id = a.owner_id;
--How many animals are there per species?
select s.name, count(*) as num_animals from animals a join species s on a.species_id = s.id group by s.name;
--List all Digimon owned by Jennifer Orwell.
select a.name, o.full_name from animals a join owners o on a.owner_id = o.id join species s on a.species_id = s.id where o.full_name = 'Jennifer Orwell' and s.name = 'Digimon';
--List all animals owned by Dean Winchester that haven't tried to escape.
select a.name, o.full_name from animals a join owners o on a.owner_id = o.id where o.full_name = 'Dean Winchester' and a.escape_attempts = 0;
--Who owns the most animals?
select o.full_name, count(*) as num_animals from animals a join owners o on a.owner_id = o.id group by o.full_name order by num_animals desc limit 1;

--day4
--Who was the last animal seen by William Tatcher?
select a.name from animals a
join visits v on a.id = v.animals_id
join vets vt on vt.id = v.vets_id
where vt.name = 'Vet William Tatcher'
order by v.date_of_visit asc limit 1;

--How many different animals did Stephanie Mendez see?
select count(distinct a.id) from animals a
join visits v on a.id = v.animals_id
join vets vt on vt.id = v.vets_id
where vt.name = 'Vet Stephanie Mendez';

--List all vets and their specialties, including vets with no specialties.
select vt.name, s.name from vets vt
left join specializations sp on vt.id = sp.vets_id
left join species s on sp.species_id = s.id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select a.name, v.date_of_visit from animals a
join visits v on a.id = v.animals_id
join vets vt on vt.id = v.vets_id
where vt.name = 'Vet Stephanie Mendez' 
and v.date_of_visit between '2020-04-01' and '2020-08-30';

--What animal has the most visits to vets?
select a.name, count(*) as num_visits from animals a
join visits v on a.id = v.animals_id
group by a.name
order by num_visits desc limit 1;

--Who was Maisy Smith's first visit?
select o.full_name, v.date_of_visit from animals a
join visits v on a.id = v.animals_id
join vets vt on vt.id = v.vets_id
join owners o on o.id = a.owner_id
where vt.name = 'Vet Maisy Smith'
order by v.date_of_visit asc limit 1;

--Details for most recent visit: animal information, vet information, and date of visit.
select a.name, a.date_of_birth, a.escape_attempts, a.neutered, a.weight_kg, vt.name, vt.age, vt.date_of_graduation, v.date_of_visit from animals a
join visits v on a.id = v.animals_id
join vets vt on vt.id = v.vets_id
order by v.date_of_visit desc limit 1;

--How many visits were with a vet that did not specialize in that animal's species?
select count(*) as number_visits from animals a
join visits v on a.id = v.animals_id
join vets vt on vt.id = v.vets_id
join specializations sp on sp.vets_id = vt.id
where sp.species_id != a.species_id;

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select s.name, count(*) as n_visits from visits v
join animals a on a.id = v.animals_id
join vets vt on vt.id = v.vets_id
join species s on s.id = a.species_id
where vt.name = 'Vet Maisy Smith'
group by s.name 
order by n_visits desc limit 1;

--week2_day1

--after
explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vets_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

--before
explain analyze SELECT COUNT(animals_id) FROM visits where animals_id = 4;
explain analyze SELECT animals_id FROM visits where vets_id = 2;
explain analyze SELECT id FROM owners where email = 'owner_18327@mail.com';