select
    c.customer_id,
	i.invoice_id,
    i.invoice_date,
    i.total
from (
    select *,
           row_number() over (partition by customer_id order by invoice_date desc) as rn
    from invoices
) i
join customers c on c.customer_id = i.customer_id
where i.rn = 1
order by i.invoice_date;