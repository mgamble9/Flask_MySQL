SELECT countries.name, languages.language, languages.percentage
FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE languages.language = 'Slovene'
ORDER BY languages.percentage DESC;

SELECT countries.name, COUNT(cities.id) as num_cities
FROM countries
JOIN cities ON countries.id = cities.country_id
GROUP BY countries.id
ORDER BY num_cities DESC;

SELECT cities.name, cities.population
FROM countries
JOIN cities ON countries.id = cities.country_id
WHERE countries.name = 'Mexico' AND cities.population>500000
ORDER BY cities.population DESC;

SELECT country.name, languages.language
FROM countries
JOIN languages ON country.id = languages.county_id
WHERE languages.percentage > 89
ORDER BY languages.percentage DESC;

