use movielens

-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order. 
SELECT title, release_date
FROM movies
WHERE release_date BETWEEN 1983 AND 1993
ORDER BY release_date ASC;
