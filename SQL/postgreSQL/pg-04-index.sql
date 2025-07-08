-- pg-04-index.sql

-- 인덱스 조회
select
	tablename,
	indexname,
	indexdef
from pg_indexes
where tablename in ('large_orders', 'large_customers');

analyze large_orders;
analyze large_customers;

-- 실제 운영에서는 X (캐시 날리기)
select pg_stat_reset();

explain analyze
select * from large_orders
where customer_id='CUST-25000.'; -- 37506 / 49.097 ms 인덱싱 후 -> 87.22 / 0.559ms

explain analyze
select * from large_orders
where amount between 800000 and 1000000; --46496 / 98.256ms ->

explain analyze
select * from large_orders
where region='서울' and amount > 500000 and order_date >= '2024-07-08'; -- 41341 / 52.091ms

explain analyze
select * from large_orders
where region = '서울'
order by amount desc
limit 100; -- 53877 / 49.413ms

--인덱싱
create index idx_orders_customer_id on large_orders(customer_id);
create index idx_orders_amount on large_orders(amount);
create index idx_orders_region on large_orders(region);

explain analyze
select count(*) from large_orders where region='서울'; -- 3567 / 15ms

--복합 인덱스
create index idx_orders_region_amount on large_orders(region, amount);

explain analyze
select * from large_orders
where region='서울' and amount > 800000; -- 35051 / 86.586ms -> 복합인덱스 생성 후 751.52 / 54.560ms

create index idx_orders_id_order_date on large_orders(customer_id, order_date);

explain analyze
select * from large_orders
where customer_id = 'cust-25000.'
and order_date >= '2024-07-01'
order by order_date desc; -- 0.667ms -> 0.047ms

--복합 인덱스는 순서의 중요도
create index idx_orders_region_amount on large_orders(region, amount); 
create index idx_orders_amount_region on large_orders(amount, region); --밑에껄로 변환

select
	indexname,
	pg_size_pretty(pg_relation_size(indexname::regclass)) as index_size
from pg_indexes
where tablename='large_orders'
	and indexname like '%region%amount%' or indexname like '%amount%region%'
order by indexname;

--Index 순서 가이드 라인

--고유값 비율 -> 선택도가 높은 얘들을 앞으로 오게 하면 됨
select
	count(distinct region) as 고유지역수,
	count(*) as 전체행수,
	round(count(distinct region) *100 / count(*), 11) as 선택도
from large_orders; -- 선택도 0.0007%

select
	count(distinct amount) as 고유금액수,
	count(*) as 전체행수
from large_orders; -- 선택도가 99%

select
	count(distinct customer_id) as 고유고객수,
	count(*) as 전체행수
from large_orders; -- 선택도 5%
