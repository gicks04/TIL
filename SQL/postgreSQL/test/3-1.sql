with month_total as (
	select 
		TO_CHAR(i.invoice_date,'YYYY-MM') as 연월,
		sum(it.unit_price*it.quantity) as 월별매출
	from invoices i
	join invoice_items it on i.invoice_id = it.invoice_id
	group by 연월
	order by 연월
)
select
	연월,
	월별매출,
	월별매출 - lag(월별매출) over (order by 연월) as 전월대비매출증감률
from month_total;