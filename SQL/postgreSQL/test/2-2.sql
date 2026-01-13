select
	t.track_id,
	t.name,
	sum(i.quantity) as 총판매수량
from tracks t
inner join invoice_items i on t.track_id = i.track_id
group by t.track_id
order by 총판매수량 desc, t.name asc
limit 5;