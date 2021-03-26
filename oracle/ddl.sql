-- 1) DDL(Data Definition Language, 정의): 테이블 구조의 생성, 수정, 삭제 
-- CREATE : 테이블 생성/ DROP : 테이블 삭제 / ALTER : 테이블 수정/ TRUNCATE : 테이블에 있는 모든 데이터 삭제

-- 2) 데이터 조작어(Data Manipulation Language) : 데이터(레코드) 조회 및 변형을 위한 명령어
-- SELECT : 데이터 조회/ INSERT : 데이터 입력/ UPDATE : 데이터 수정/ DELETE : 데이터 삭제

-- 3) 데이터 제어어(Data Control Language) : 사용자에게 권한 생성 혹은 권한 삭제 같은 명령어
-- GRANT : 권한 생성 / REVOKE : 권한 삭제

-- 1. 테이블 구조
-- CREATE <-> DROP
DROP TABLE itpay;
 
CREATE TABLE itpay(
    payno    NUMBER(7)   NOT NULL,   -- -9999999 ~ 9999999, 1부터 사용
    part       VARCHAR(20) NOT NULL,  -- 부서명
    sawon    VARCHAR(20) NOT NULL,  -- 사원명
    age       NUMBER(3)   NOT NULL,   -- 나이, 1 ~ 999
    address  VARCHAR(100) NULL,       -- 주소, NULL 값 허용
    mon    CHAR(6)     NOT NULL,    -- 급여달, 201905
    gdate     DATE        NOT NULL,     -- 수령일
    PRIMARY KEY(payno)  -- 기본키로 지정
); -- Table ITPAY이(가) 생성되었습니다.
  
-- 2. 기초 데이터 추가
-- sysdate는 가감(날짜와 시간을 자동으로 가져옴)이 가능함. 
INSERT INTO itpay(payno, part, sawon, age, address, mon, gdate)
VALUES(1, '개발팀', '가길동', 27, '성남시', '201901', sysdate);
       
INSERT INTO itpay(payno, part, sawon, age, address, mon, gdate)
VALUES(2, '개발팀', '나길동', 30, '인천시', '201901', sysdate-5); -- 오늘 날짜 -5
 
INSERT INTO itpay(payno, part, sawon, age, address, mon, gdate)
VALUES(3, '객체설계팀', '다길동', 34, '성남시', '201901', sysdate-3);
 
INSERT INTO itpay(payno, part, sawon, age, address, mon, gdate)
VALUES(4, '객체설계팀', '라길동', 36, '부천시', '201902', sysdate-1);
 
INSERT INTO itpay(payno, part, sawon, age, address, mon, gdate)
VALUES(5, 'DB설계팀', '마길동', 38, '부천시', '201902', sysdate-0);
-- 1 행 이(가) 삽입되었습니다.
 
SELECT * FROM itpay; -- *은 모든(에스크립트) 컬럼 -> 출력

 PAYNO PART  SAWON AGE ADDRESS mon  GDATE
 ----- ----- ----- --- ------- ------ ---------------------
     1 개발팀   가길동    27 성남시     201901 2019-09-20 13:11:44.0
     2 개발팀   나길동    30 인천시     201901 2019-09-15 13:11:45.0
     3 객체설계팀 다길동    34 성남시     201901 2019-09-17 13:11:46.0
     4 객체설계팀 라길동    36 부천시     201902 2019-09-19 13:11:47.0
     5 DB설계팀 마길동    38 부천시     201902 2019-09-20 13:11:47.0

 -- null 허용 컬럼 생략, address 컬럼(NULL값 허용) 생략
 -- (payno, part, sawon, age, (address), month, gdate)
INSERT INTO itpay(payno, part, sawon, age, mon, gdate)
VALUES(6, '개발팀', '신길동', 33, '201904', sysdate+1);

SELECT * FROM itpay; -- 출력
 
 PAYNO PART  SAWON AGE ADDRESS mon  GDATE
 ----- ----- ----- --- ------- ------ ---------------------
     1 개발팀   가길동    27 성남시     201901 2019-09-20 13:11:44.0
     2 개발팀   나길동    30 인천시     201901 2019-09-15 13:11:45.0
     3 객체설계팀 다길동    34 성남시     201901 2019-09-17 13:11:46.0
     4 객체설계팀 라길동    36 부천시     201902 2019-09-19 13:11:47.0
     5 DB설계팀 마길동    38 부천시     201902 2019-09-20 13:11:47.0
     6 개발팀   신길동    33 NULL    201904 2019-09-21 13:12:39.0
 
-- varchar(20) 저장할 수 있는 글자의 수는? : 한글 3 byte, 그외 문자 1 byte 
-- sawon   VARCHAR(20) NOT NULL,  -- 사원명
INSERT INTO itpay(payno, part, sawon, age, mon, gdate)
VALUES(7, '개발팀', '1234567890', 33, '200804', sysdate); --가능
 
INSERT INTO itpay(payno, part, sawon, age, mon, gdate)
VALUES(8, '개발팀', 'ABCDEFGHIJ', 29, '200804', sysdate); -- 가능
 
INSERT INTO itpay(payno, part, sawon, age, mon, gdate)
VALUES(9, '개발팀', 'ABCDEFGHIJ123', 29, '200804', sysdate); -- 가능

INSERT INTO itpay(payno, part, sawon, age, mon, gdate)
VALUES(10, '개발팀', '가나다라마바사', 29, '200804', sysdate);-- ERROR 

-- 2. 테이블 구조의 변경
-- 정보 시스템을 구축하는 과정에서 업무에 최적화된 설계를위해 테이블의 구조는 변경 될 수 밖에 없음.
-- 2. 컬럼 추가 : ALTER(테이블 수정)
-- 1) 기존에 데이터가 추가되어 있는 경우 -> 컬럼 추가시 null이 저장됨.
ALTER TABLE itpay ADD(test1 VARCHAR(9)); -- ADD(추가할 컬럼명 TYPE)
DESCRIBE itpay; -- 테이블 구조 확인

-- 2) 기존에 데이터(레코드)가 추가되어 있는 경우 NOT NULL 제약조건 적용 안됨
-- Error. 테이블은 필수 열을 추가하기 위해 (NOT NULL) 비어 있어야
ALTER TABLE itpay ADD(test2 VARCHAR(9) NOT NULL); 

-- 3) 테이블에 레코드가 없으면 NOT NULL 제약조건 적용 가능 / 2)번 해결
DELETE FROM itpay; --모든 레코드(데이터) 삭제
SELECT * FROM itpay;

ALTER TABLE itpay ADD(test2 VARCHAR(9) NOT NULL);
DESC itpay; 

-- 4) DEFAULT를 이용한 NOT NULL의 적용, 데이터가 등록되어 있어도 가능
INSERT INTO itpay(payno, part, sawon, age, address, mon, gdate, test1, test2)
VALUES(1, '개발팀', '가길동', 27, '성남시', '201901', sysdate, 'ddl', 'dml');

INSERT INTO itpay(payno, part, sawon, age, address, mon, gdate, test1, test2)
VALUES(2, '개발팀', '가길동', 27, '성남시', '201901', sysdate, 'dql', 'dcl');

INSERT INTO itpay(payno, part, sawon, age, address, mon, gdate, test1, test2)
VALUES(3, '개발팀', '가길동', 27, '성남시', '201901', sysdate, 'view', 'procedure');

SELECT * FROM itpay ORDER BY payno ASC; -- 정렬

-- 기본값 정의 : DEFAULT(데이터(레코드) 값)를 지정 -> NOT NULL 제약 조건 적용 가능!
ALTER TABLE itpay ADD(test3 VARCHAR(9) DEFAULT 'function' NOT NULL); 

DESC itpay;
SELECT * FROM itpay ORDER BY payno ASC;

--3. 컬럼 속성 수정 : test3 컬럼의 속성(TYPE을 변경)
ALTER TABLE itpay MODIFY (test3 VARCHAR(30));
DESC itpay;

--4. 컬럼명 수정 : test3 컬럼 name -> etc 컬럼 name
ALTER TABLE itpay RENAME COLUMN test3 to etc;
DESC itpay;

--5. 컬럼 삭제
ALTER TABLE itpay DROP COLUMN test1;
ALTER TABLE itpay DROP COLUMN test2;
DESC itpay;

--6. 테이블 삭제
DROP TABLE itpay;

--7. 테이블 생성 실습
 -- 과제) 자신의 관심있는 분야에서 특정 데이터를 선정하고, 데이터를 저장할 테이블 구조를 작성.
 -- 컬럼은 5개 이상
 -- 작성된 테이블에 3개이상의 레코드를 추가.
 -- 등록된 레코드를 출력하는 SQL을 제작.

 CREATE TABLE dataset( -- 테이블 생성(dataset)
    name VARCHAR(12) NOT NULL, -- 한글은 3byte 허용 -> 이름이 4글자인 경우 까지 허용
    lang1 VARCHAR(20) NOT NULL,
    lang2 VARCHAR(20) NOT NULL,
    lang3 VARCHAR(20) NOT NULL,
    lang4 VARCHAR(20) NOT NULL,
    lang5 VARCHAR(20)  NULL,    -- 생략 가능--
    PRIMARY KEY(name) -- 기본키 지정--
);
INSERT INTO dataset(name, lang1, lang2, lang3, lang4, lang5) -- 레코드 추가
VALUES('최성식', 'JAVA', 'Spring', 'JAVAScript', 'Android', 'Database');    

INSERT INTO dataset(name, lang1, lang2, lang3, lang4, lang5)
VALUES('진달래씨', 'R', 'Python', 'JAVAScript', 'Machine Learning', 'AI');    

INSERT INTO dataset(name, lang1, lang2, lang3, lang4) -- NULL값 허용인 lang5는 생략가능
VALUES('개나리', 'NodeJS', 'AJAX', 'Jquery', 'JSON');    

INSERT INTO dataset(name, lang1, lang2, lang3, lang4) 
VALUES('개나리개나리', 'NodeJS', 'AJAX', 'Jquery', 'JSON');    -- Err. VARCHAR(12) 범위를 넘어섬

INSERT INTO dataset(lang1, lang2, lang3, lang4) 
VALUES('NodeJS', 'AJAX', 'Jquery', 'JSON');  -- 기본키(name)은 반드시 지정 필요 
 
SELECT * FROM dataset; -- 출력 

