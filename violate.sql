-- Primary Key Constraints
INSERT INTO Movie VALUES(272, 'Primary Key Violation', 1999, 'PG', 'Constraint');
-- Movie table already has tuple with id = 272

INSERT INTO Actor VALUES(126, 'Violation', 'Primary Key', 'Male', 1999-01-01, NULL);
-- Actor table already has tuple with id = 999

INSERT INTO Director VALUES(37146, 'Violation', 'Primary Key', 1999-01-01, NULL);
-- Director table already has tuple with id = 974


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

INSERT INTO MovieGenre VALUES(999, 'Drama');
-- No tuple exists in table Movie with id = 999

INSERT INTO MovieDirector VALUES(999, 37146);
-- No tuple exists in table Movie with id = 999

INSERT INTO MovieDirector VALUES(272, 1000);
-- No tuple exists in table Director with id = 1000

INSERT INTO MovieActor VALUES(999, 1, 'Foreign Key Violator');
-- No tuple exists in table Movie with id = 999

INSERT INTO MovieActor VALUES(272, 20010, 'Foreign Key Violator');
-- No tuple exists in table Actor with id = 20010

INSERT INTO MovieRating VALUES(999, 401, 50);
-- No tuple exists in table Movie with id = 999