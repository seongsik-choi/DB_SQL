-- 2) 데이터 조작어(Data Manipulation Language) : 데이터 조회 및 변형을 위한 명령어
-- SELECT : 데이터 조회/ INSERT : 데이터 입력/ UPDATE : 데이터 수정/ DELETE : 데이터 삭제

CREATE TABLE sales(
  salesno  NUMBER(8)      NOT NULL,  -- 판매 번호
  product  VARCHAR(30)   NOT NULL,  -- 상품명
  price     NUMBER(8)      NOT NULL,    -- 가격
  cnt       NUMBER(5)       NOT NULL,   -- 주문 수량
  dc        NUMBER(5, 2)    NOT NULL,   -- 할인율(2번째 자리에서 반올림)
  rdate    DATE                NOT NULL,    -- 주문 날짜
  etc       VARCHAR(30)          NULL,  -- 기타 주문 사항
  PRIMARY KEY(salesno)
);

DROP TABLE sales;

CREATE SEQUENCE sales_seq  -- SEQUENCE로 레코드의 고유값(일련번호) 지정해 구분
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 99999999 -- 최대값: 99999999 --> NUMBER(8) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                -- 다시 1부터 생성되는 것을 방지
  
DROP SEQUENCE sales_seq;

-- NULL 허용하는 etc 컬럼 생략
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '국내여행', 500000, 1, 10.0, sysdate);

INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '해외여행', 1200000, 1, 5.0, sysdate);

SELECT salesno, product, price, cnt, dc, rdate, etc FROM sales ORDER BY salesno;

  SALESNO PRODUCT                       PRICE        CNT         DC       RDATE               ETC                           
---------- ------------------------------ ---------- ---------- ---------- ------------------- ------------------------------
         1 국내여행                           500000          1         10     2021-03-26 03:53:36       (NUll)                        
         2 해외여행                          1200000          1          5       2021-03-26 03:53:36      (null)                   

-- NOT NULL 속성은 INSERT시에 반드시 값이 있어야함 : product 컬럼(NOT NULL 속성)이 빠짐.
-- ERROR. ORA-01400: cannot insert NULL into ("AI7"."SALES"."PRODUCT")         
INSERT INTO sales(salesno, price, cnt, dc, rdate) VALUES(sales_seq.nextval, 2000000, 1, 5.0, sysdate);

-- ERROR. 큰 정수인 경우
-- dc        NUMBER(5, 2)    NOT NULL, -- 할인율
-- ORA-01438: 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '국내여행', 300000, 1, 1000.01, sysdate);

-- ERROR. 소수 자리수가 큰 경우 
-- dc        NUMBER(5, 2)    NOT NULL, -- 할인율
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '국내여행', 450000, 1, 10.001, sysdate);

SELECT salesno, product, price, cnt, dc, rdate, etc FROM sales ORDER BY salesno;

   SALESNO PRODUCT                          PRICE        CNT       DC   RDATE               ETC                           
---------- ------------------------------ ---------- ---------- ---------- ------------------- ------------------------------
         1      국내여행                           500000          1       10   2021-03-26 03:53:36                               
         2      해외여행                          1200000          1        5   2021-03-26 03:53:36                               
         6      국내여행                           450000          1       10   2021-03-26 04:00:02                               

INSERT INTO sales(salesno, product, price, cnt, dc, rdate)  
VALUES(sales_seq.nextval, '국내여행', 550555, 1, 10.005, sysdate); -- 10.005 반올림하여 -> 10.01
                                                                                    -- dc        NUMBER(5, 2) 
SELECT salesno, product, price, cnt, dc, rdate, etc FROM sales ORDER BY salesno;

   SALESNO PRODUCT                             PRICE        CNT         DC         RDATE               ETC                           
---------- ------------------------------ ---------- ---------- ---------- ------------------- ------------------------------                            
         7 국내여행                                    550555          1      10.01    2021-03-26 04:01:21
         
 -- dc        NUMBER(5, 2) 의 최대값 지정  
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)  
VALUES(sales_seq.nextval, '국내여행', 650000, 1, 999.99, sysdate);-- DC : 999.99                                                                                  
SELECT salesno, product, price, cnt, dc, rdate, etc FROM sales ORDER BY salesno;         

-- 테이블 제거       
DELETE FROM sales WHERE salesno= 5 OR salesno=6;
SELECT salesno, product, price, cnt, dc, rdate, etc FROM sales ORDER BY salesno;        

 -- dc        NUMBER(5, 2) 의 최소값 지정  
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)  
VALUES(sales_seq.nextval, '대룡시장', 150000, 1, -999.99, sysdate); -- DC : -999.99
SELECT salesno, product, price, cnt, dc, rdate, etc FROM sales ORDER BY salesno;  

-- ORDER BY : 정렬(default : ASC)
SELECT salesno, product, price, cnt, dc, rdate 
FROM sales 
ORDER BY product ASC;  

-- 2차 정렬 : 먼저 지정된 정렬이 우선순위
SELECT salesno, product, price, cnt, dc, rdate 
FROM sales
ORDER BY product ASC, price DESC;  

-- '여행'이란 단어가 들어간 레코드(행) 검색
SELECT salesno, product, price, cnt, dc
FROM sales
WHERE product LIKE '여행'  -- 선택된 행 없음
ORDER BY salesno;

SELECT salesno, product, price, cnt, dc
FROM sales
WHERE product LIKE '%여행%'  -- % 기호 사용 모든 조건
ORDER BY salesno;

-- UPDATE : 데이터(레코드) 수정
-- sales 테이블, 상품='', dc=5.5로, salesno가 2인 레코드를
UPDATE sales SET product='여행은 에너지 충전', dc=5.5 WHERE salesno =2;
SELECT salesno, product, price, cnt, dc, rdate, etc FROM sales ORDER BY salesno;

-- 여행으로 시작하는 레코드 출력
-- 여행으로 끝나는 레코드 출력
SELECT * FROM sales WHERE product LIKE '여행%';
SELECT * FROM sales WHERE product LIKE '%여행';

-- '시장'이란 단어와(AND) 금액이 20만원 이하인 레코드
SELECT * FROM sales 
WHERE product LIKE '%시장%' AND price <=200000;

-- 여행상품 중에 금액이 50만원~100만원
SELECT * FROM sales 
WHERE product LIKE '%여행%' AND price > 500000 AND price <=1000000;

-- UPDATE
-- WHERE 조건이 없는 수정은 모든 레코드가 변경됨(권장아님). 
UPDATE sales SET etc='여행사 안내';  -- ETC의 모든 레코드(데이터)가 전부 '여행사 안내'로 바뀜
SELECT * FROM sales ORDER BY salesno;

-- 특정 레코드만지정 하여 ex) 컬럼의 값을 지정해 WHERE 조건 
UPDATE sales SET etc='마니산 등산 추천' WHERE salesno=8;
SELECT * FROM sales WHERE salesno = 8;

-- DELETE
-- DELETE FROM sales; -- 모든 레코드 삭제
DELETE FROM sales WHERE salesno=1;
SELECT * FROM sales ORDER BY salesno;

-- 범위를 지정한 삭제
DELETE FROM sales WHERE salesno >= 2 AND salesno <= 5;
SELECT * FROM sales ORDER BY salesno;