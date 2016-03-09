## Which collars have a known owner? Display only collars with known owners and those owners' names.

SELECT dog_owners.name, lost_dog_collars.dog_name
  FROM dog_owners
  JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

--  name   | dog_name
-- ---------+----------
-- Evan    | Bogie
-- Whitney | Gilly
-- Spencer | Lilly
-- Dan     | Linux
-- Omid    | Bronson

#############################################################

## For which collars is there no known owner? Display only collars without known owners.

SELECT dog_owners.name AS owner_name, lost_dog_collars.dog_name AS collar_name
  FROM dog_owners
  RIGHT OUTER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name)
  WHERE dog_owners.name IS NULL;

-- owner_name | collar_name
-- ------------+----------
--            | Lassie
--            | Fido
--            | Goose

#############################################################

## What collars are in our possession? Display all collars in our possession. If an owner exists for a given collar, display that also.

SELECT dog_owners.name AS owner_name, lost_dog_collars.dog_name AS collar_name
  FROM dog_owners
  RIGHT OUTER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

--  owner_name | collar_name
-- ------------+----------
--  Evan       | Bogie
--             | Lassie
--  Whitney    | Gilly
--  Spencer    | Lilly
--             | Fido
--  Dan        | Linux
--  Omid       | Bronson
--             | Goose

#############################################################

## What owners do we know about? Display all owners known to us. If a collar matches that owner, display the collar also.

SELECT dog_owners.name AS owner_name, lost_dog_collars.dog_name
  FROM dog_owners
  LEFT JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- owner_name | dog_name
-- ------------+----------
-- Evan       | Bogie
-- Whitney    | Gilly
-- Spencer    | Lilly
-- Dan        | Linux
-- Omid       | Bronson
-- Dan        |
