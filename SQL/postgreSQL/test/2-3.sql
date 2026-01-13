select 
	c.customer_id,
	c.first_name,
	c.last_name,
	min(i.invoice_date) as 첫구매일
from customers c
join invoices i on c.customer_id = i.customer_id
where i.invoice_date < '2020-01-01'
group by c.customer_id, c.first_name, c.last_name
order by 첫구매일;
