select c.contest_id,
    c.hacker_id,
    c.name,
    sum(total_submissions),
    sum(total_accepted_submissions),
    sum(vs.total_views),
    sum(total_unique_views)
from Contests c
    join Colleges col on c.contest_id = col.contest_id
    join challenges ch on col.college_id = ch.college_id
    left join (
        select challenge_id,
            sum(total_views) as total_views,
            sum(total_unique_views) as total_unique_views
        from view_stats
        group by challenge_id
    ) vs on ch.challenge_id = vs.challenge_id
    left join (
        select challenge_id,
            sum(total_submissions) as total_submissions,
            sum(total_accepted_submissions) as total_accepted_submissions
        from submission_stats
        group by challenge_id
    ) ss on ch.challenge_id = ss.challenge_id
group by c.contest_id,
    c.hacker_id,
    c.name
having sum(total_submissions) != 0
    or sum(total_accepted_submissions) != 0
    or sum(total_views) != 0
    or sum(total_unique_views) != 0
order by contest_id;