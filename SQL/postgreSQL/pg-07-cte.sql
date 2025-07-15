-- pg-07-cte

-- CTE(Common Table Expression) - > 쿼리 속의 '이름이 있는' 임시 테이블
with 이름 as (
	select ....
)

select * FROM 이름;

-- [평균 주문 금액]보다 큰 주문들의 고객정보
select c.customer_name, o.amount
from customers c
inner join orders o on c.customer_id=o.customer_id
where o.amount > (select avg(amount) from orders)
limit 10;

explain analyse
-- 1단계: 평균 주문 금액 계산
with avg_order as (
	select avg(amount) as avg_amount
	from orders
)
-- 2단계: 평균보다 큰 주문 찾기
select c.customer_name, o.amount, ao.avg_amount
from customers c
join orders o on c.customer_id=o.customer_id
join avg_order ao on o.amount > ao.avg_amount
limit 10;

-- 각 지역별 고객수와 지역별 주문수
-- 지역별 평균주문 금액
select * from orders;

with region_summary as (
select 
	c.region as 지역명, 
	count(DISTINCT c.customer_id) as 고객수,
	count(o.order_id) as 주문수,
	coalesce(avg(o.amount), 0) as 평균주문금액
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.region
)
select
	지역명,
	고객수,
	주문수,
	round(평균주문금액) as 평균주문금액
from region_summary
order by 고객수 desc;



