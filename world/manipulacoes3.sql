
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
group by country.code;

-- SUBQUERY
SELECT avg(population) from city; -- 350468.2236

SELECT format(population, 2, 'de_DE') as population_format
from city; -- SÓ ALTERA A COLUNA, NÃO ALTERA O BANCO

ALTER TABLE city ADD population_formated VARCHAR(50);

UPDATE city
SET population_formated = FORMAT(Population, 2, 'de_DE');

ALTER TABLE city DROP COLUMN Population;
ALTER TABLE city CHANGE COLUMN population_formated Population VARCHAR(50);

-- SUBQUERY ----------------------------------------------

SELECT avg(population) from city; -- 350468.2236

SELECT * from city -- COLOCA A MÉDIA COMO FÓRMULA, NÃO COM NÚMERO, PARA CASO ALGUM VALOR SEJA
			       -- INSERIDO, A MÉDIA SEJA ATUALIZADA
WHERE population >= (SELECT avg(population) from city)
order by Name;

-- CREATE VIEW ----------------------------------------------

CREATE VIEW language_total as
SELECT
    countrylanguage.language,
    COUNT(*) AS total_falado
FROM countrylanguage
INNER JOIN country
ON countrylanguage.code = country.code
GROUP BY countrylanguage.language 
ORDER BY total_falado desc;

select * from language_total;

select * from viewpopulation