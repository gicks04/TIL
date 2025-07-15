select
	i.billing_country as 국가명,
	sum(it.quantity*it.unit_price) as 총매출
from invoices i
join invoice_items it on i.invoice_id = it.invoice_id
group by i.billing_country
order by 총매출 desc
limit 10;