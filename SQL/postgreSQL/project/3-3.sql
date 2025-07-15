with customer_invoice as (
	select
		c.customer_id,
		i.invoice_id
	from customers c
	join invoices i on c.customer_id = i.customer_id
	order by c.customer_id
),
고객별누적구매액 as (
	select
		ci.customer_id as 고객명,
		sum(it.unit_price*it.quantity) as 누적구매액
	from customer_invoice ci
	join invoice_items it on ci.invoice_id = it.invoice_id
	group by ci.customer_id
),
누적구매액등급 as (
	select
		고객명,
		누적구매액,
		NTILE(5) over (order by 누적구매액 desc) as 등급구간
	from 고객별누적구매액
)
select
	고객명,
	누적구매액,
	case
		when 등급구간  = 1 then 'VIP'
		when 등급구간  = 5 then 'LOW'
		else 'Normal'
	end as 등급
from 누적구매액등급;