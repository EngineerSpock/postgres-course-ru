DROP TABLE chair;
CREATE TABLE chair
(
	cathedra_id serial PRIMARY KEY,
	chair_name varchar,
	dean varchar
);

INSERT INTO chair
VALUES (1, 'name', 'dean');

--no duplicates
INSERT INTO chair
VALUES (1, 'name', 'dean');

--no NULLs
INSERT INTO chair
VALUES (NULL, 'name', 'dean');

--only UNIQUE NOT NULLs
INSERT INTO chair
VALUES (2, 'name', 'dean');

--equivalent (almost) to:
DROP TABLE chair;
CREATE TABLE chair
(
	cathedra_id serial UNIQUE NOT NULL,
	chair_name varchar,
	dean varchar
);
ALTER TABLE chair
DROP CONSTRAINT chair_cathedra_id_key

select constraint_name
from information_schema.key_column_usage
where table_name = 'chair'
  and table_schema = 'public'
  and column_name = 'cathedra_id';
  
ALTER TABLE chair
ADD PRIMARY KEY(chair_id);