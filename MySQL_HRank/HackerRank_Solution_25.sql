-- https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true

select s.hacker_id, h.name
from hackers h
join submissions s on h.hacker_id = s.hacker_id
join challenges c on c.challenge_id = s.challenge_id
join difficulty d on d.difficulty_level = c.difficulty_level
where d.score = s.score
group by s.hacker_id, h.name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, h.hacker_id asc
;



SELECT s.hacker_id, h.name
FROM hackers h
JOIN submissions s ON h.hacker_id = s.hacker_id
JOIN challenges c ON c.challenge_id = s.challenge_id
WHERE s.score = c.max_score  -- Ensuring full score is achieved
GROUP BY s.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1  -- Full scores on more than one challenge
ORDER BY COUNT(s.challenge_id) DESC, s.hacker_id ASC;
