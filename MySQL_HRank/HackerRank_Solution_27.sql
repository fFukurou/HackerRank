-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true

SELECT
    w.id, 
    wp.age, 
    w.coins_needed, 
    w.power
FROM Wands w
JOIN Wands_Property wp
    ON w.code=wp.code
WHERE wp.is_evil != 1
AND w.coins_needed = 
(SELECT min(coins_needed) from wands w2
join wands_property as wp2 on w2.code = wp2.code
where w2.power = w.power and wp2.age = wp.age
)
ORDER BY
    w.power DESC,
    wp.age DESC;