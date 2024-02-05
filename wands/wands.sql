select w.id,
    p.age,
    w.coins_needed,
    w.power
from wands w
    join wands_property p on w.code = p.code
where p.is_evil = 0
    and w.coins_needed =(
        select min(w1.coins_needed)
        from wands w1
            join wands_property p1 on w1.code = p1.code
        where p.age = p1.age
            and w.power = w1.power
    )
order by w.power desc,
    p.age desc;