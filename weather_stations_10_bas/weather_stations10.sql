SELECT DISTINCT (city)
FROM station
WHERE NOT city LIKE '%a'
    AND NOT city LIKE '%e'
    AND NOT city LIKE '%i'
    AND NOT city LIKE '%o'
    AND NOT city LIKE '%u';