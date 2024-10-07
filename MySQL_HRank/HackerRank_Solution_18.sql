-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true

SELECT months * salary AS total_salary, COUNT(employee_id)
FROM employee
WHERE months * salary = (SELECT MAX(months * salary) FROM employee)
GROUP BY months * salary;