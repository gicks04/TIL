-- pg-03-explain-analyze.sql

--실행계획을 보자
explain
select * from large_customers where customer_type='VIP';

-- Seq Scan on large_customers  (cost=0.00..3746.00 rows=10093 width=159byte)
-- cost = 점수(낮을수록 좋음) rows * wids = 총 메모리 사용량
-- Filter: (customer_type = 'VIP'::text)

--실행 + 통계
explain analyze
select * from large_customers where customer_type='VIP';

--Seq Scan on large_customers  (cost=0.00..3746.00 rows=10093 width=159)
-- 인덱스 없고
-- 테이블 대부분의 행을 읽어야 하고
-- 순차 스캔이 빠를 때 
-- Seq scan(Sequential Scan)을 사용함

-- explain 옵션들
-- 버퍼 사용량 포함 ()
explain (analyze, buffers)
select * from large_customers where loyalty_points > 8000;
--   Buffers: shared hit=2496
-- Planning:   Buffers: shared hit=3

-- 상세 정보 포함
explain (analyze, verbose, buffers)
select * from large_customers where loyalty_points > 8000;

-- JSON 형태로 출력
explain (analyze, verbose, buffers, format JSON)
select * from large_customers where loyalty_points > 8000;

--진단 (score is too high)
explain analyze
select
	c.customer_name,
	count(o.order_id)
from large_customers c
left join large_orders o on c.customer_name = o.customer_id -- 잘못된 join 조건
group by c.customer_name;

-- 메모리 부족
explain (analyze, verbose, buffers)
select
  c.customer_id,
  c.customer_name,
  avg(o.amount) as avg_amount,
  sum(o.amount * o.amount) / count(*) as heavy_calc,
  (select count(*) from large_orders lo2 where lo2.customer_id = c.customer_id) as subquery_count
from large_customers c
join large_orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by heavy_calc desc, avg_amount desc;



