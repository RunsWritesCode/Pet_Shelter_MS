DROP TABLE owners;
DROP TABLE animals;


CREATE TABLE owners (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255)
);

CREATE TABLE animals (
  id serial4 primary key,
  name varchar(255),
  admission varchar(255),
  adopted BOOLEAN,
  trained BOOLEAN,
  healthy BOOLEAN,
  adoptable BOOLEAN,
  owner_id int4 REFERENCES owner(id)
);
