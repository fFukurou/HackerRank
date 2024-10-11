-- https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

select s.hacker_id, h.name, sum(s.score) as total_score
from hackers h
join submissions s on h.hacker_id = s.hacker_id
group by h.hacker_id, h.name
having total_score != 0
order by total_score desc, s.hacker_id asc
;



WITH highest_score AS(
select h.hacker_id, max(s.score) as score
from hackers h
join submissions s on h.hacker_id = s.hacker_id
group by h.hacker_id, s.challenge_id)

SELECT hs.hacker_id, h.name, sum(hs.score) AS total_score
FROM hackers h
JOIN highest_score hs on hs.hacker_id = h.hacker_id
GROUP BY hs.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, hs.hacker_id ASC
;


SELECT hs.hacker_id, h.name, SUM(hs.score) AS total_score
FROM hackers h
JOIN (
    SELECT h.hacker_id, s.challenge_id, MAX(s.score) AS score
    FROM hackers h
    JOIN submissions s ON h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id, s.challenge_id
) AS hs ON hs.hacker_id = h.hacker_id
GROUP BY hs.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, hs.hacker_id ASC;