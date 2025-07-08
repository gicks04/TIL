# 2025-07-08
## 데이터베이스 관리 (DDL)
```SQL
-- 데이터베이스 생성
CREATE DATABASE database_name;
-- 데이터베이스 선택
USE database_name;
-- 데이터베이스 목록 조회
SHOW DATABASES;
-- 데이터베이스 삭제
DROP DATABASE IF EXITS databse_name;
```

## 테이블 관리 (DDL)
```SQL
-- 테이블 생성
CREATE TABLE table_name (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    created at DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- 테이블 구조 확인
-- 테이블 목록 확인
SHOW TABLES;

-- 테이블 구조
DESC table_name;

-- 테이블 구조 변경
-- 컬럼추가
ALTER TABLE table_name ADD COLUMN column datatype;
-- 컬럼추가 + 데이터 타입 수정
ALTER TABLE members CHANGE COLUMN column_name new_name datatype;
-- 컬럼 데이터 타입 수정
ALTER TABLE members MODIFY COLUMN column_name datatype;
-- 컬럼 삭제
ALTER TABLE table_name DROP COLUMN column_name;
-- 테이블 삭제
DROP TABLE IF EXITS table_name;
```
