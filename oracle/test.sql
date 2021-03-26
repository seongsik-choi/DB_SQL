DROP TABLE test;

--Oracle: 한글= 3바이트, 영문자/숫자/특수 문자= 1바이트 사용
--MySQL: varchar(10)이면 모든 문자를 10자 저장 가능 
CREATE TABLE test(                      -- TABLE 명이자 excel 기준 Sheet name
    testno    NUMBER(5)   NOT NULL,    -- -99999 ~ +99999 
    mname  VARCHAR(20) NOT NULL,     -- 한글 3 byte, 그외 문자 1 byte 
    funct     VARCHAR(50) NOT NULL,    -- 주요 기술 분야  
    PRIMARY KEY (testno)                    -- 중복 안됨, 고유한 값만 가능  
); 
-- Table TEST이(가) 생성되었습니다.

INSERT INTO test(testno, mname, funct) -- test TABLE에 Values(값 추가)
VALUES(1, '왕눈이', 'JAVA/JSP/Spring'); 

INSERT INTO test(testno, mname, funct) 
VALUES(2, '아로미', 'JAVA/JSP/Spring/JQuery'); 

INSERT INTO test(testno, mname, funct) 
VALUES(3, '투투', 'JAVA/JSP/Spring/JQuery/HTML5'); 
-- 1 행 이(가) 삽입되었습니다.

SELECT testno, mname, funct FROM test ORDER BY testno ASC; 
-- SELECT(선택) 변수들 FROM 테이블명 ORDER BY(정렬) 변수명 오름차순;

-- TESTNO MNAME FUNCT
-- ------ ----- ----------------------------
--      1 왕눈이   JAVA/JSP/Spring
--      2 아로미   JAVA/JSP/Spring/JQuery
--      3 투투    JAVA/JSP/Spring/JQuery/HTML5

-- VARCHAR 타입의 저장 가능 글자수 확인      
INSERT INTO test(testno, mname, funct) 
VALUES(4, '오늘은 금요일', 'JAVA/JSP/Spring/JQuery/HTML5');

-- 한글: 3 byte, 그외의 문자는 1 byte (MySQL: 모든 문자 2 byte 처리)
-- mname  VARCHAR(20) : mname 변수는 한글로 최대 6자
INSERT INTO test(testno, mname, funct) 
VALUES(4, '오늘은 금요일 FRIDAY', 'JAVA/JSP/Spring/JQuery/HTML5');
--ORA-12899: value too large for column "AI4"."TEST"."MNAME" (actual: 26, maximum: 20)

INSERT INTO test(testno, mname, funct) 
VALUES(4, '오늘은 금요일 FRIDAY 2020', 'JAVA/JSP/Spring/JQuery/HTML5');
--ORA-12899: value too large for column "AI4"."TEST"."MNAME" (actual: 31, maximum: 20)

-- 엔터로 행 변경 가능
SELECT testno, mname, funct 
FROM test 
ORDER BY testno ASC; 

DELETE FROM test WHERE testno=4; -- 행지우기 : test 테이블에서 testno가 = 4인 행을 지워라