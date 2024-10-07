-- https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true

select sum(city.population) from city, country
where country.continent = 'Asia' and city.countrycode = country.code;

select sum(c1.population)
from city c1
join country c2 on c1.countrycode = c2.code
where c2.continent = 'Asia';