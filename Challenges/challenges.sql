select c.hacker_id,
    h.name,
    count(c.challenge_id) as cnt
from hackers h
    inner join challenges c on h.hacker_id = c.hacker_id
group by c.hacker_id,
    h.name
having cnt =(
        select count(c1.challenge_id)
        from challenges c1
        group by c1.hacker_id
        order by count(*) desc
        limit 1
    )
    or cnt not in (
        select count(c2.challenge_id)
        from challenges c2
        group by c2.hacker_id
        having c2.hacker_id <> c.hacker_id
    )
order by cnt desc,
    c.hacker_id;