-- DB 생성
CREATE DATABASE SURVEY_ZONE;


-- 테이블 구조 정의
CREATE TABLE IF NOT EXISTS T_SURVEY(
    idx         INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
    item        TEXT    NOT NULL -- JSON 형태로 저장된 설문지 정보 
);
CREATE TABLE IF NOT EXISTS T_USER(
    idx         INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account     TEXT    NOT NULL, -- 메타마스크 주소 저장
    kakao       CHAR(1) NOT NULL, -- 카카오 계정 인증 여부
    interests   TEXT    NOT NULL  -- JSON 형태로 저장된 관심사 정보
);


-- 더미 데이터 삽입
-- 1
INSERT INTO T_SURVEY(item) VALUES('{"id":1,"category":0,"img":"cute.jpg","title":"배달 음식 관련 조사","desc":"설명","sdate":201105,"edate":201106,"reward":6,"vp":{"age":1,"name":2}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":2,"category":0,"img":"cute2.jpg","title":"습관에 대한 설문조사","desc":"설명","sdate":201105,"edate":201106,"reward":6,"vp":{"age":2,"name":2}}');
INSERT INTO T_SURVEY(item) VALUES('{"id":3,"category":0,"img":"cute.jpg","title":"2021 정부혁신 국민인식조사 설문지","desc":"정부는 2018년 3월 19일 ‘정부혁신 종합 추진계획’을 발표하고, 국민이 주인인 정부를 실현하는 새 정부혁신을 국민께 약속했습니다. ∎ 정부혁신 첫 번째 전략은 ‘정부 운영을 사회적 가치 중심으로 전환’하는 것입니다. 정부의 정책과 재원 배분을 공공의 이익과 공동체 발전에 이바지하는 사회적 가치 중심으로 전환합니다. ∎ 두 번째 전략은 ‘참여와 협력’을 통해 할 일을 하는 정부를 구현하는 것입니다. 기관 간 칸막이를 허물고, 국민을 정책 제안과 결정, 집행, 평가 과정에 함께 참여하게 합니다. ∎ 세 번째 전략은 낡은 관행을 혁신하여 ‘신뢰받는 정부’를 구현하는 것으로 국민이 원하는 깨끗한 공직사회를 만드는 것이 목표입니다. 청와대 국민청원, 정부24, 국민·주민참여예산제, 광화문1번가 열린 포럼, 국민청원 안전검사제 등이 정부혁신 실제 사례로, 국민의 더 나은 삶을 위한 모든 정책, 사업 등을 통칭합니다. ","sdate":201103,"edate":201112,"reward":6,"vp":{"age":1,"name":1}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":4,"category":0,"img":"cute2.jpg","title":"창 PC 게임에 대한 설문 조사","desc":"","sdate":211023,"edate":211126,"reward":6,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":5,"category":0,"img":"cute.jpg","title":"소비자 의견 조사(PC전용) ","desc":"","sdate":211021,"edate":211126,"reward":11,"vp":{}} ');
-- 6
INSERT INTO T_SURVEY(item) VALUES('{"id":6,"category":0,"img":"cute2.jpg","title":"소비자 의견 조사(PC전용) ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":7,"category":0,"img":"cute.jpg","title":"국민 의견 조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":8,"category":0,"img":"cute2.jpg","title":"소비자의견조사  ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":9,"category":0,"img":"cute.jpg","title":"소비자 의견 조사(PC전용)  ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":10,"category":0,"img":"cute2.jpg","title":"소비자 의견 조사  ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
-- 11
INSERT INTO T_SURVEY(item) VALUES('{"id":11,"category":0,"img":"cute.jpg","title":"일반인 인식 조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}}');
INSERT INTO T_SURVEY(item) VALUES('{"id":12,"category":0,"img":"cute2.jpg","title":"국민 인식 조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":13,"category":0,"img":"cute.jpg","title":"TV방송 시청자 조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":14,"category":0,"img":"cute2.jpg","title":"소비자 의견 조사(PC전용) ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":15,"category":0,"img":"cute.jpg","title":"신항만 개발 관련 국민 인식조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
-- 16
INSERT INTO T_SURVEY(item) VALUES('{"id":16,"category":0,"img":"cute2.jpg","title":"소비자 의견 조사(PC전용) ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":17,"category":0,"img":"cute.jpg","title":"인지 관련 설문 조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":18,"category":0,"img":"cute2.jpg","title":"인지 관련 설문 조사 대상자 모집안내 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":19,"category":0,"img":"cute.jpg","title":"이동식 주택/주택리모델링 관련 조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
INSERT INTO T_SURVEY(item) VALUES('{"id":20,"category":0,"img":"cute2.jpg","title":"인테리어 관련 조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}} ');
-- 21
INSERT INTO T_SURVEY(item) VALUES('{"id":21,"category":0,"img":"cute.jpg","title":"생수 구입자 대상 시장 조사 ","desc":"","sdate":211023,"edate":211126,"reward":11,"vp":{}}');


-- 데이터 조회
SELECT * FROM T_SURVEY;
SELECT * FROM T_USER;