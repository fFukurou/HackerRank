-- https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

select c.company_code, max(c.founder),
(select count(distinct lm.lead_manager_code) from Lead_Manager lm where lm.company_code = c.company_code),
(select count(distinct sm.senior_manager_code) from Senior_Manager sm where sm.company_code = c.company_code),
(select count(distinct m.manager_code) from Manager m where m.company_code = c.company_code),
(select count(distinct e.employee_code) from Employee e where e.company_code = c.company_code)

from company c
group by c.company_code
order by c.company_code
;


select c.company_code, max(c.founder), 
	count(distinct l.lead_manager_code), 
    count(distinct s.senior_manager_code), 
    count(distinct m.manager_code),
    count(distinct e.employee_code)
from Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e 
where c.company_code = l.company_code 
    and l.lead_manager_code=s.lead_manager_code 
    and s.senior_manager_code=m.senior_manager_code 
    and m.manager_code=e.manager_code 
group by c.company_code 
order by c.company_code;