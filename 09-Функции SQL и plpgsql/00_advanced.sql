14. Query to Display User Tables
A user-defined table is a representation of defined information in a table, and they can be used as arguments for procedures or user-defined functions. Because they’re so useful, it’s useful to keep track of them using the following query.

1
SELECT * FROM Sys.objects WHERE Type='u'
15. Query to Display Primary Keys
A primary key uniquely identifies all values within a table. The following SQL query lists all the fields in a table’s primary key.

1
SELECT * from Sys.Objects WHERE Type='PK'
16. Query for Displaying Unique Keys
A Unique Key allows a column to ensure that all of its values are different.

1
SELECT * FROM Sys.Objects WHERE Type='uq'
17. Displaying Foreign Keys
Foreign keys link one table to another – they are attributes in one table which refer to the primary key of another table.

1
SELECT * FROM Sys.Objects WHERE Type='f'
18. Displaying Triggers
A Trigger is sort of an ‘event listener’ – i.e, it’s a pre-specified set of instructions that execute when a certain event occurs. The list of defined triggers can be viewed using the following query.

1
SELECT * FROM Sys.Objects WHERE Type='tr'
19. Displaying Internal Tables
Internal tables are formed as a by-product of a user-action and are usually not accessible. The data in internal tables cannot be manipulated; however, the metadata of the internal tables can be viewed using the following query.

1
SELECT * FROM Sys.Objects WHERE Type='it'
20. Displaying a List of Procedures
A stored procedure is a group of advanced SQL queries that logically form a single unit and perform a particular task. Thus, using the following query you can keep track of them:

1
SELECT * FROM Sys.Objects WHERE Type='p'