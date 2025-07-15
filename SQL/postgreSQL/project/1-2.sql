select
	ab.title,
	ar.name
from albums ab
inner join artists ar on ab.artist_id = ar.artist_id
order by title ASC;