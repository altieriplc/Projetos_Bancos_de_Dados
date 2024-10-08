-- https://www.youtube.com/watch?v=6M-jFECiHog 3:25

use world;

select * from country;
select * from city;
select * from countrylanguage;

-- FILTROS AND, OR, IN, BETWEEN ---------------------------------------------
-- IN alternativa ao OR
-- BETWEEN alternativa ao AND

select name, surfacearea from country
	where surfacearea > 555550.00
    order by name, surfacearea asc;
    
select name, surfacearea, headofstate from country -- DOIS FILTROS SENDO UTILIZADOS DE UMA VEZ
	where headofstate = "Elisabeth II"
    and surfacearea > 100000.00;

select name, surfacearea, headofstate from country -- DOIS FILTROS SENDO UTILIZADOS DE UMA VEZ
	where headofstate = "Elisabeth II"
    or surfacearea > 100000.00;

select * from country -- MANEIRA MAIS SIMPLES DO QUE USAR VÁRIOS "OR's"
	where region in('caribbean', 'central africa');

select * from city
	where district in("buenos aires", "entre rios");
    
select name, headofstate from country -- DIFERENTE DE...
	where headofstate <> "Elisabeth II";
    
select name, LifeExpectancy life from country
	where LifeExpectancy <= 50
    order by lifeexpectancy desc;

select name from country
	where population between 10000 and 15000;

-- ----------LIKE / WILDCARD-----------------------------------
-- SINAL % FAZ ENTENDER QUE É O TEXTO CONTIDO E NÃO EXATO

select * from country
	where name like "%Ang%" AND region like "%car%";

select * from country -- NESSE CASO BUSCA O QUE COMEÇA COM ANG
	where name like "Ang%";

select * from country -- NESSE CASO BUSCA O QUE TERMINA COM L
	where name like "%l";
    
select code from countrylanguage
	where Language like "portuguese" and percentage > 50;

-- --------NULL, IS NOT NULL----------------------------------

SELECT * FROM country
	WHERE IndepYear IS NOT NULL 
     AND continent LIKE "%america%" 

-- https://www.youtube.com/watch?v=6M-jFECiHog

