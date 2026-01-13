select
	g.name,
	count(t.name) as 트랙수
from genres g
inner join tracks t on g.genre_id = t.genre_id
group by g.name
order by 트랙수 desc;