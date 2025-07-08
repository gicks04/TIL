-- 04-update-delete.sql

-- 테이블의 모든 열 선택 
SELECT * FROM members;

-- 데이터를 추가
INSERT INTO members(name) VALUES ('익명');

-- Update(데이터 수정)
UPDATE members SET name='홍길동', email='hong@a.com' WHERE id=6;
-- 원치 않는 케이스 (name이 같으면 동시 수정, 즉 동명이인이 있다면 모두 이름이 바뀌게 됨)
UPDATE members SET name='NO name' WHERE name='유태영';

-- DELETE(데이터 삭제)
DELETE FROM members WHERE id=7;
-- 테이블 모든 데이터 삭제(위험)
DELETE FROM members;
