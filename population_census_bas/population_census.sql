select sum(ci.population)from city ci INNER JOIN country co ON ci.countrycode = co.code where continent='Asia';