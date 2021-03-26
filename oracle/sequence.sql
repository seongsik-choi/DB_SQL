-- [03] 일련번호 자동 생성(Sequence) : 시스템 테이블에 저장
CREATE SEQUENCE memo_seq  -- SEQUENCE로 레코드의 고유값(일련번호) 지정해 구분
  START WITH 1           -- 시작 번호(1부터 시작)
  INCREMENT BY 1       -- 증가값
  MAXVALUE 99999999  -- 최대값: 99999999 --> NUMBER(8) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산(메모리에서 일련번호 증가, 처리 속도 향상)
  NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지
  
DROP SEQUENCE memo_seq;

-- sequence 사용, NEXTVAL 실행 시 시퀀스 증가되어 사용.
SELECT memo_seq.nextval FROM dual; -- 실행시 1씩 증가
   NEXTVAL --> 실행시 Sequence 사용
----------
         1
         
-- dual 테이블: SQL 구조를 지원하는 시스템 테이블(삭제 NO)
SELECT * FROM dual;
----------
DUMMY
---------
    X

SELECT memo_seq.nextval; -- error, FROM이 반드시 선언되어야함.

-- ★ 현재 sequence 확인, currval(current value)는 호출해도 값이 증가하지 않음 ★
SELECT memo_seq.currval FROM dual;

-- 테이블에서의 Sequence 사용
DROP TABLE memo;  --error. memo 테이블 생성하지 않아 오류
CREATE TABLE memo(
  memono NUMBER(7)      NOT NULL,
  title        VARCHAR(100) NOT NULL,
  PRIMARY KEY(memono)
); Desc memo;

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '공지사항 개발'); -- memo 테이블에서 사용하는_시퀀스.currentvalue

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '공지사항 테스트');

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '공지사항 배포');

SELECT memono, title FROM memo ORDER BY memono ASC;
-- SELECT memo_seq.nextval FROM dual; -- 실행시 1씩 증가 했기에 실제 memono= 출력 
-- memo_sqe.nextval을 3까지 증가했었으면, memono 출력은 4부터
    MEMONO TITLE                                                                                               
---------- ----------------------------------------------------------------------------------------------------
         1 공지사항 개발                                                                                       
         2 공지사항 테스트                                                                                     
         3 공지사항 배포     
         
-- 마지막에 등록한 레코드 삭제
DELETE FROM memo WHERE memono = 3;

INSERT INTO memo(memono, title) VALUES(memo_seq.nextval, '공지사항 교육');

-- 한번 삭제된 번호(3번 레코드)는 다시 생성되지 않음.         
SELECT memono, title FROM memo ORDER BY memono ASC;         
    MEMONO TITLE                                                                                               
---------- ----------------------------------------------------------------------------------------------------
         1 공지사항 개발                                                                                       
         2 공지사항 테스트                                                                                     
         4 공지사항 교육       

-- 생성된 Sequence의 확인  : memo_seq 생성 확인      
SELECT * FROM user_sequences;

SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE LAST_NUMBER
------------------------------ ---------- ---------- ------------ - - ---------- -----------
MEMO_SEQ                                1   99999999            1 N N          2           5
SALES_SEQ                               1   99999999            1 N N          2          11