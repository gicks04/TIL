-- pg-05-various-index.sql

--  Data Structure (Graph,Tree, List, Hash...)

-- B-Tree 인덱스 생성 (기본)
create index <index_name> on <table_name (<col_name>)
--범위검색 between, >, < 에서 효과 좋음
-- 정렬 order by
--  부분일치 like

-- hash 인덱스
create index <index_name> on <table_name> using hash(<col>)
--정확한 일치 검색 = 에서 효과가 좋음(B-Tree보다)
-- 범위 x, 정렬 x

-- 부분 인덱스
create index <index_name> on <table_name>(<col_name>)
where 조건='blah'

-- 특정 조건의 데이터만 자주 검색할때
-- 공간/비용 모두 절약

-- 인덱스 사용여부는 DB가 알아서 결정함

-- 인덱스를 사용하지 않음
-- 함수사용시
select * from users where upper(name) = 'JOHN';
-- 타입 변환
select * from users where age='25'; --age는 숫자인데 문자를 넣음
-- 앞쪽 와일드카드
select * from users where like = '%김'; -- Like -> 앞쪽 와일드카드
-- 부정조건
select * from users where age != 25;

-- 해결방법
-- 함수기반 인덱싱
create index <name> on users (upper(name))

-- 타입 알맞게 잘쓰기
select * from users where age=25;

-- 전체 텍스트 검색 인덱스 고려(인덱스를 다시 거는걸 고려)

-- 부정조건 -> 범위조건
select * from users where age < 25 or age > 25;

-- 인덱스는 무조건 옳은가?
--  NOPE, 인덱스는 검색성능은 +(조회가 많을수록 좋음) / 저장공간이 추가필요 / 수정성능(update,delete)이 떨어짐
--  실제 쿼리 패턴을 분석 후 -> 인덱스 설계
-- 성능 측정은 실제 데이터를 가지고 해야함





