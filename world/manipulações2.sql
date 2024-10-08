SELECT * FROM country;
SELECT * FROM countrylanguage;

-- COUNT, SUM, AVG, MIN, MAX, GROUP BY

-- -------- COUNT --------------------------------------------------------------------------
-- FAZ A CONTAGEM DE QUANTIDADE DE VERIFICAÇÕES ENCONTRADAS
-- DESCONSIDERA VALORES NULOS
-- * CONTA VALORES NULOS TAMBÉM

SELECT count(continent) from country;
SELECT count(IndepYear) from country;
SELECT count(*) from country;

-- -------- SUM --------------------------------------------------------------------------

SELECT sum(surfacearea) from country;
SELECT sum(surfacearea) from country
	where region like "caribbean";

-- -------- AVG --------------------------------------------------------------------------

SELECT
	avg(surfacearea),
    min(surfacearea),
    max(surfacearea)
from country;

SELECT -- COLOCA UM ALIAS COMO NOME DE COLUNA
	avg(surfacearea) as Media_Preco,
    min(surfacearea) as Menor_Preco,
    max(surfacearea) as Maior_Preco
from country;

-- -------- GROUP BY -------------------------------------------------------------------
-- AGRUPA O RESULTA NA COLUNA SELECIONADA

SELECT 
    region,
    COUNT(*) AS total_caribbean
FROM 
    country
WHERE 
    region LIKE '%Caribbean%'
GROUP BY 
    region;

SELECT
	language,
    count(*) AS total_language
FROM
	countrylanguage
WHERE
	language LIKE "%portuguese%"
GROUP BY 
	Language;
    
SELECT
	language,
    count(*) AS total_language
FROM
	countrylanguage
GROUP BY 
	Language
having count(*) >=10;










-- https://www.youtube.com/watch?v=6M-jFECiHog 2:38