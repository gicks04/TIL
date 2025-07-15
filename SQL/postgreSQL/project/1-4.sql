select
	country,
	sum(customer_id) as 고객수
from customers
group by country
order by 고객수 desc;