-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

WITH students_grades AS 
(select s.name as name, 
CASE
    WHEN s.marks BETWEEN g.min_mark AND g.max_mark THEN g.grade    
    ELSE NULL
END as grades,
s.marks as marks from students s
join grades g
HAVING GRADES is not null)

SELECT if(grades < 8, NULL, name) as name,
grades,
marks
FROM students_grades
order by grades desc,
CASE
    WHEN grades > 7 THEN name
    ELSE marks
END ASC;