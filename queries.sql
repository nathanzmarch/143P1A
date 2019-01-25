-- Give me the names of all the actors in the movie 'Die Another Day'.
SELECT CONCAT(a.first, " ", a.last) AS name
FROM Actor a, Movie m, MovieActor ma
WHERE a.id = ma.aid AND ma.mid = m.id AND m.title = 'Die Another Day';

-- Give me the count of all the actors who acted in multiple movies.
SELECT COUNT(*) as num_actors
FROM (SELECT aid
      FROM MovieActor
      GROUP BY aid
      HAVING COUNT(mid) > 1) as ActorCount;

-- Give me the title of movies that sell more than 1,000,000 tickets.
SELECT title
FROM Movie
WHERE id IN (SELECT mid
            FROM Sales
            WHERE ticketsSold > 1000000);

-- Sci-Fi and comedy movies with rating greater than 75
SELECT m.title as GoodMovies
FROM Movie m, MovieRating mr, MovieGenre mg
WHERE mr.mid = m.id AND mr.imdb > 75 AND mr.rot > 75 AND mg.mid = m.id
AND (mg.genre = 'Sci-Fi' OR mg.genre = 'Comedy');

-- Alive dirctors with total income over 300,000,000 sorted by income descending;
SELECT DISTINCT(CONCAT(d.first, " ", d.last)) AS Director
FROM Director d, MovieDirector md, Sales s
WHERE md.did = d.id AND s.mid = md.mid AND d.dod IS NULL AND s.totalIncome > 15000000
ORDER BY s.totalIncome DESC;
