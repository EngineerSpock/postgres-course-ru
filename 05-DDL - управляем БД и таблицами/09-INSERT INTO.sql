INSERT INTO author
VALUES (10, 'John Silver', 4.5);

SELECT * FROM author;

INSERT INTO author(author_id, full_name)
VALUES
(12, 'Name 1'),
(13, 'Name 2'),
(14, 'Name 3');

SELECT *
INTO best_authors
FROM author
WHERE rating > 4.5;

SELECT * FROM best_authors;

