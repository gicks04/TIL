select
	e.employee_id,
	e.first_name,
	e.last_name,
	count(c.customer_id) as 고객수
from employees e
left join customers c on e.employee_id = c.support_rep_id
group by e.employee_id
order by 고객수 desc;