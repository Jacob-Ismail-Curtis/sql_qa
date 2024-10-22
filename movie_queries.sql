use movielens;

-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order. 
SELECT title, release_date
FROM movies
WHERE release_date BETWEEN 1983 AND 1993
ORDER BY release_date ASC;

-- Without using LIMIT, list the titles of the movies with the lowest average rating. 

select m.title, r.rating from movies as m
join ratings as r on m.id=r.movie_id
order by r.rating asc;

-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings. 

select distinct m.title, r.rating, u.age from movies as m
join ratings as r on r.movie_id=m.id
join users as u on u.id=r.user_id
where u.age=24 and rating=5 and u.gender="m";


-- List the unique titles of each of the movies released on the most popular release day. 

SELECT DISTINCT title
FROM movies AS m
WHERE release_date = (
    SELECT release_date
    FROM movies AS m
    GROUP BY release_date
    ORDER BY COUNT(release_date) DESC
    LIMIT 1
);

select g.name, count(gm.movie_id) as c from genres_movies as gm
join genres as g on gm.genre_id=g.id
group by g.id
order by c ASC;
