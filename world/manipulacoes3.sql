
-- INNER JOIN

select * from country;
select * from countrylanguage;
select * from city;

-- SELECIONO O QUE QUERO DAS TABELAS ESCOLHIDAS COM nometabela.nomecoluna, o FROM SELECIONA A TABELA
-- BASE ESCOLHIDA, FAÇO O INNERJOIN COM A OUTRA TABELA E O ON SÃO AS COLUNAS EM COMUM
select
	country.code,
    country.name,
    country.continent,
    countrylanguage.language
from country
inner join countrylanguage
on country.code = countrylanguage.code;

select
	country.code,
    country.name,
    country.continent,
    countrylanguage.language,
    city.population
from country
inner join countrylanguage
	on country.code = countrylanguage.code
inner join city
	on country.code = city.CountryCode;

select
	country.code,
    country.name,
    country.continent,
    countrylanguage.language
from country
inner join countrylanguage
	on country.code = countrylanguage.code
where countrylanguage.Percentage > 51;

SELECT
    country.code,
    country.name,
    country.continent,
    countrylanguage.language
FROM country
INNER JOIN countrylanguage
    ON country.code = countrylanguage.code
WHERE countrylanguage.Percentage > 40
AND country.code IN (
    SELECT country.code
    FROM country
    INNER JOIN countrylanguage
        ON country.code = countrylanguage.code
    WHERE countrylanguage.Percentage > 45
    GROUP BY country.code
    HAVING COUNT(countrylanguage.language) > 1
);
SELECT
    countrylanguage.language,
    COUNT(*) AS total_falado
FROM countrylanguage
INNER JOIN country
ON countrylanguage.code = country.code
GROUP BY countrylanguage.language 
ORDER BY total_falado desc;

SELECT 
	country.name,
    sum(city.Population) as "City Populations"
from 
	country
inner join
	city
on country.code = city.CountryCode
group by country.code