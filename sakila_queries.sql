-- List all actors
use sakila;
select * from actor;

-- 2 Find the surname of the actor with the forename 'John'. 

select last_name from actor
where first_name = "John"; 

-- Find all actors with surname 'Neeson'. 
select * from actor
where last_name = "Neeson";

-- Find all actors with ID numbers divisible by 10.
select * from actor
where actor_id%10=0;

-- What is the description of the movie with an ID of 100?
select description from film_text
where film_id =100;
 
 -- Find every R-rated movie.
 select * from film
 where rating="R";
 
 -- Find every non-R-rated movie. 
  select * from film
 where rating!="R";
 
 -- Find the ten shortest movies. 
 select * from film
 order by length asc
 limit 10;
 
 -- Find the movies with the longest runtime, without using LIMIT. 
  select * from film
 order by length desc;
 
 -- Find all movies that have deleted scenes. 
 select * from film
 where special_features like "%Deleted Scenes%";
 
 -- Using HAVING, reverse-alphabetically list the last names that are not repeated. 
 select last_name from actor
group by last_name
having count(last_name)=1
order by last_name desc;
 
 -- Using HAVING, list the last names that appear more than once, from highest to lowest frequency. 
 select last_name from actor
 group by last_name
 having count(last_name)>1
 order by count(last_name) desc;
 
 -- Which actor has appeared in the most films? 
 select a.first_name, a.last_name, f.actor_id, count(f.film_id) as n
 from film_actor as f
 inner join actor as a on f.actor_id=a.actor_id
 group by actor_id
 order by n desc
 limit 1;
 
 -- When is 'Academy Dinosaur' due? 
 
--  What is the average runtime of all film?  
select avg(length) as average from film;

-- List the average runtime for every film category. 
SELECT c.name, AVG(f.length) AS average_runtime
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.name;

 --  List all movies featuring a robot. 
SELECT title, description
FROM film
WHERE CONCAT(title, ' ', description) LIKE '%robot%';

-- How many movies were released in 2010? 
select count(film_id) as count from film
where release_year=2010;

-- Find the titles of all the horror movies. 
SELECT f.title, c.name
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
where c.name="Horror";

-- List the full name of the staff member with the ID of 2. 
select first_name, last_name
from staff
where staff_id=2;

-- List all the movies that Fred Costner has appeared in. 
SELECT f.title, a.first_name
FROM film AS f
JOIN film_actor AS fa ON fa.film_id = f.film_id
JOIN actor AS a ON a.actor_id = fa.actor_id
WHERE a.first_name = 'Fred' AND a.last_name = 'Costner';

-- How many distinct countries are there? 
 select count(distinct country) from country;
 
 -- List the name of every language in reverse-alphabetical order. 
 select distinct name from language
 order by name desc;
 
 -- List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename. 
 select first_name, last_name from actor as a
 where last_name LIKE "%son";
 
 -- Which category contains the most films? 
SELECT c.category_id, c.name, COUNT(fc.film_id) AS film_count
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY film_count DESC
LIMIT 1;