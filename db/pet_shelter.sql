DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  address varchar(255)
);

CREATE TABLE animals (
  id serial4 primary key,
  name varchar(255),
  species varchar(255),
  breed varchar(255),
  admission date,
  adopted BOOLEAN,
  trained BOOLEAN,
  healthy BOOLEAN,
  adoptable BOOLEAN,
  profile_pic varchar(255),
  owner_id int4 REFERENCES owners(id)
);
