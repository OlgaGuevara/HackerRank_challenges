select s.name
from students s
    join friends f on f.id = s.id
    join packages p on p.id = s.id
    join packages fp on fp.id = f.friend_id
where p.salary < fp.salary
order by fp.salary;