-- Using COUNT, get the number of cities in the USA. 
use world;
select count(ID)
from city
where city.CountryCode="USA";

-- Find out the population and life expectancy for people in Argentina. 
select population, LifeExpectancy
from country
where name="Argentina";

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy? 
select LifeExpectancy
from country
where LifeExpectancy is not null
order by LifeExpectancy desc
limit 1;

-- Using JOIN ... ON, find the capital city of Spain. 
select city.name 
from city
join country as c on c.capital=city.id
where c.name="Spain";

-- Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
select countrylanguage.Language
from countrylanguage
join country as c on countrylanguage.CountryCode=c.Code
where c.Region="Southeast Asian";

-- Using a single query, list 25 cities around the world that start with the letter F. 
select name from city where name LIKE "F%" limit 25;

-- Using COUNT and JOIN ... ON, get the number of cities in China. 
select count(ID)
from city
join country on city.CountryCode=country.Code 
where country.Name="China";

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations. 
select name, population from country where population is not null order by population asc limit 10;

-- Using aggregate functions, return the number of countries the database contains. 
select count(distinct Code) from country;

-- What are the top ten largest countries by area? 
select SurfaceArea from country order by SurfaceArea desc limit 10;

-- List the five largest cities by population in Japan. 
select city.population from city
join country on city.CountryCode=Country.Code
order by city.Population desc
limit 5;

-- List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
update country set HeadofState="Elizabeth II"
where HeadOfState="Elisabeth II";

select Name, Code from country
where HeadOfState="Elizabeth II";

-- List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

-- List every unique world language. 
select distinct Language from CountryLanguage;

-- List the names and GNP of the world's top 10 richest countries. 
select Name, GNP from country
order by GNP desc
limit 10;

-- List the names of, and number of languages spoken by, the top ten most multilingual countries.

select Language, count(Language) as LCount from countrylanguage
group by Language
order by LCount Desc
limit 10;

-- List every country where over 50% of its population can speak German. 
select Name, countrylanguage.percentage from country as c
join countrylanguage on c.Code=countrylanguage.CountryCode
where countrylanguage.Language="German" and countryLanguage.percentage>50;

-- Which country has the worst life expectancy? Discard zero or null values. 
select Name, LifeExpectancy from country
where LifeExpectancy is not null
order by LifeExpectancy asc
limit 1;

-- List the top three most common government forms. 
select GovernmentForm, count(Name) as cnt from country
group by GovernmentForm
order by cnt desc
limit 3;

-- How many countries have gained independence since records began? 

select Name from country
where IndepYear is not null;

