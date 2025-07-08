--pg-010datatype.sql

select version();

show shared_buffers;
show work_mem;
show maintenance_work_mem;

CREATE table datatype_demo(
	--mtsql에도 있음. 이름이 다를 수 는 있음
	id serial primary key,
	name varchar(100) not null,
	age integer,
	salary numeric(12,2),
	is_active boolean default true,
	created_at timestamp default now(),
	-- postgresql 특화 타입
	tags TEXT[], -- 배열
	metadata JSONB, -- JSONB json binary 타입
	ip_addres INET, -- IP 주소 저장 전용
	location POINT, --기하학에서 점의 정의 (x, y)
	salary_range INT4RANGE -- 범위
);

ALTER TABLE datatype_demo
RENAME COLUMN ip_addres TO ip_address;

INSERT INTO datatype_demo (
    name, age, salary, tags, metadata, ip_address, location, salary_range
) VALUES
(
    '김철수',
    30,
    5000000.50,
    ARRAY['개발자', 'PostgreSQL', '백엔드'],        -- 배열
    '{"department": "IT", "skills": ["SQL", "Python"], "level": "senior"}'::JSONB,  -- JSONB
    '192.168.1.100'::INET,                         -- IP 주소
    POINT(37.5665, 126.9780),                      -- 서울 좌표
    '[3000000,7000000)'::INT4RANGE                 -- 연봉 범위
),
(
    '이영희',
    28,
    4500000.00,
    ARRAY['디자이너', 'UI/UX'],
    '{"department": "Design", "skills": ["Figma", "Photoshop"], "level": "middle"}'::JSONB,
    '10.0.0.1'::INET,
    POINT(35.1796, 129.0756),                      -- 부산 좌표
    '[4000000,6000000)'::INT4RANGE
);

select * from datatype_demo;
--배열(tags)
select
	name,
	tags,
	tags[1] as first_tag,
	'PostgreSQL' = any(tags) as pg_dev
from datatype_demo;
-- JSONB(metadata)
select
	name,
	metadata,
	metadata->>'department' as 부서, --두개일땐 text
	metadata->'skills' as 능력 --한개일땐 jsonb
from datatype_demo;

select 
	name, 
	metadata->>'department' as 부서
from datatype_demo;

select 
	name, 
	metadata->>'department' as 부서
from datatype_demo
where metadata @> '{"level":"senior"}'; -- '@>'의 의미는 오른쪽의 객체가 왼쪽의 metadata안에 존재하는지 검사

--범위(salary_range)
select
	name,
	salary,
	salary_range, -- 범위에서 대괄호가 '이상,이하' , 소괄호가 '초과,미만'을 뜻함
	salary::int <@ salary_range as 연봉범위, -- int로 바꾼 salary값이 salary_range범위안에 포함되는지 검사
	upper(salary_range),
	lower(salary_range), --이상 미만 여부는 안보여주고 범위 양끝 숫자를 리턴
	upper(salary_range) - lower(salary_range) as 연봉폭
from datatype_demo;

-- 좌표(location)
select
	name,
	location,
	location[0] as 위도,
	location[1] as 경도,
	point(37.505027, 127.005011) <-> location as 고터거리
from datatype_demo;