insert into animals values (1,'Agumon', '2020-02-03',0,true,10.23);
insert into animals values (2,'Gabumon', '2018-11-15',2,true,8);
insert into animals values (3,'Pikachu', '2021-01-07',1,false,15.04);
insert into animals values (4,'Devimon', '2017-05-12',5,true,11);

--day2

insert into animals values (5,'Charmander', '2020-02-08',0,false,11);
insert into animals values (6,'Plantmon', '2021-11-15',2,true,5.7);
insert into animals values (7,'Squirtle', '1993-04-02',3,false,12.13);
insert into animals values (8,'Angemon', '2005-06-12',1,true,45);
insert into animals values (9,'Boarmon', '2005-06-07',7,true,20.4);
insert into animals values (10,'Blossom', '1998-10-13',3,true,17);
insert into animals values (11,'Ditto', '2022-05-14',4,true,22);

--day3
--insert data to owners table
insert into owners (full_name, age) values ('Sam Smith', 34);
insert into owners (full_name, age) values ('Jennifer Orwell', 19);
insert into owners (full_name, age) values ('Bob', 45);
insert into owners (full_name, age) values ('Melody Pond', 77);
insert into owners (full_name, age) values ('Dean Winchester', 14);
insert into owners (full_name, age) values ('Jodie Whittaker', 38);

--insert data to species table
insert into species (name) values ('Pokemon');
insert into species (name) values ('Digimon');
 
--Modify your inserted animals so it includes the species_id value

update animals set species_id=2 where name like '%mon';
update animals set species_id=1 where species_id is null;

--Modify your inserted animals to include owner information (owner_id)
update animals set owner_id=1 where name='Agumon';
update animals set owner_id=2 where name='Gabumon' or name='Pikachu';
update animals set owner_id=3 where name='Devimon' or name='Plantmon';
update animals set owner_id=4 where name='Charmander' or name='Squirtle' or name='Blossom';
update animals set owner_id=5 where name='Angemon' or name='Boarmon';

--day4
--add vets data
insert into vets (name, age, date_of_graduation) values ('Vet William Tatcher', 45, '2000-04-23');
insert into vets (name, age, date_of_graduation) values ('Vet Maisy Smith', 26, '2019-01-17');
insert into vets (name, age, date_of_graduation) values ('Vet Stephanie Mendez', 64, '1981-05-04');
insert into vets (name, age, date_of_graduation) values ('Vet Jack Harkness', 38, '2008-01-08');

--add specializations data
insert into specializations (species_id, vets_id) values (1,1);
insert into specializations (species_id, vets_id) values (2,3);
insert into specializations (species_id, vets_id) values (2,4);

--add visits data
insert into visits (animals_id, vets_id, date_of_visit) values (1,1,'2020-05-24');
insert into visits (animals_id, vets_id, date_of_visit) values (1,3,'2020-07-22');
insert into visits (animals_id, vets_id, date_of_visit) values (2,4,'2021-02-02');
insert into visits (animals_id, vets_id, date_of_visit) values (3,2,'2020-01-05');
insert into visits (animals_id, vets_id, date_of_visit) values (3,2,'2020-03-08');
insert into visits (animals_id, vets_id, date_of_visit) values (3,2,'2020-05-14');
insert into visits (animals_id, vets_id, date_of_visit) values (4,3,'2021-05-04');
insert into visits (animals_id, vets_id, date_of_visit) values (5,4,'2021-02-24');
insert into visits (animals_id, vets_id, date_of_visit) values (6,2,'2019-12-21');
insert into visits (animals_id, vets_id, date_of_visit) values (6,1,'2020-08-10');
insert into visits (animals_id, vets_id, date_of_visit) values (6,2,'2021-04-07');
insert into visits (animals_id, vets_id, date_of_visit) values (7,3,'2019-09-29');
insert into visits (animals_id, vets_id, date_of_visit) values (8,4,'2020-10-03');
insert into visits (animals_id, vets_id, date_of_visit) values (8,4,'2020-11-04');
insert into visits (animals_id, vets_id, date_of_visit) values (9,2,'2019-01-24');
insert into visits (animals_id, vets_id, date_of_visit) values (9,2,'2019-05-15');
insert into visits (animals_id, vets_id, date_of_visit) values (9,2,'2020-02-27');
insert into visits (animals_id, vets_id, date_of_visit) values (9,2,'2020-08-03');
insert into visits (animals_id, vets_id, date_of_visit) values (10,3,'2020-05-24');
insert into visits (animals_id, vets_id, date_of_visit) values (10,1,'2021-01-11');

