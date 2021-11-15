-- DB 생성
CREATE DATABASE SURVEY_ZONE;

-- 테이블 구조 정의
CREATE TABLE IF NOT EXISTS T_SURVEY(
    idx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    item Text NOT NULL
);

CREATE TABLE IF NOT EXISTS T_USER(
    idx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account Text NOT NULL --마이페이지에서 설정한 관심사가 JSON 형태로 저장
    interests Text NOT NULL --마이페이지에서 설정한 관심사가 JSON 형태로 저장
);

-- 더미 데이터 삽입
INSERT INTO T_SURVEY(item) VALUES('This is Test JSON');

-- 데이터 조회
SELECT * FROM T_SURVEY;