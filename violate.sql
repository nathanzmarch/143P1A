-- Primary Key Constraints
INSERT INTO Movie VALUES(272, 'Primary Key Violation', 1999, 'PG', 'Constraint');
-- Movie table already has tuple with id = 272
-- ERROR 1062 (23000): Duplicate entry '272' for key 'PRIMARY'

INSERT INTO Actor VALUES(67295, 'Violation', 'Primary Key', 'Male', 1999-01-01, NULL);
-- Actor table already has tuple with id = 67295
-- ERROR 1062 (23000): Duplicate entry '67295' for key 'PRIMARY'

INSERT INTO Director VALUES(37146, 'Violation', 'Primary Key', 1999-01-01, NULL);
-- Director table already has tuple with id = 37146
-- ERROR 1062 (23000): Duplicate entry '37146' for key 'PRIMARY'


-- Check Constraints
INSERT INTO Movie VALUES(1001, 'Check Violation', 9999, 'PG', 'Constraint');
-- Movie table tuples must have year values of 1500 < year < 3000

INSERT INTO Sales VALUES(272, -1, 1000000);
-- ticketsSold value in Sales tuples must be >= 0

INSERT INTO MovieRating VALUES(272, 401, 50);
-- MovieActor table tuples must have imdb values or 0 < imdb < 101

INSERT INTO MovieRating VALUES(272, 89, 0);
-- MovieActor table tuples must have rot values or 0 < rot < 101


-- Foreign Key Constraints
INSERT INTO Sales VALUES(999, 20, 1000000);
-- No tuple exists in table Movie with id = 999
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`Sales`, CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

INSERT INTO MovieGenre VALUES(999, 'Drama');
-- No tuple exists in table Movie with id = 999
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

INSERT INTO MovieDirector VALUES(999, 37146);
-- No tuple exists in table Movie with id = 999
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

INSERT INTO MovieDirector VALUES(272, 1000);
-- No tuple exists in table Director with id = 1000
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))

INSERT INTO MovieActor VALUES(999, 1, 'Foreign Key Violator');
-- No tuple exists in table Movie with id = 999
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

INSERT INTO MovieActor VALUES(272, 20010, 'Foreign Key Violator');
-- No tuple exists in table Actor with id = 20010
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))

INSERT INTO MovieRating VALUES(999, 401, 50);
-- No tuple exists in table Movie with id = 999
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieRating`, CONSTRAINT `MovieRating_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))