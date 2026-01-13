select
	name,
	unit_price,
	milliseconds
from tracks 
where milliseconds >= 300000;