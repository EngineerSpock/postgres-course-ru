CREATE SEQUENCE seq;

SELECT nextval('seq');
SELECT currval('seq');
SELECT lastval();

--
SELECT setval('seq', 10);
SELECT currval('seq');
SELECT nextval('seq');

SELECT setval('seq', 16, false);
SELECT currval('seq');
SELECT nextval('seq');

--
CREATE SEQUENCE IF NOT EXISTS seq2 INCREMENT 16;
SELECT nextval('seq2');

--
CREATE SEQUENCE IF NOT EXISTS seq3
INCREMENT 16
MINVALUE 0
MAXVALUE 128
START WITH 0

SELECT nextval('seq3');

ALTER SEQUENCE seq3 RENAME TO seq4
ALTER SEQUENCE seq4 RESTART WITH 16
SELECT nextval('seq4');

DROP SEQUENCE seq4;