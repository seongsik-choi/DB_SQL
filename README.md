# 3) DB/SQL
## 데이터베이스/SQL 응용(Oracle/MariaDB/MySQL) 
___ 
* **0325 : [01] 데이터베이스시스템 개론(DBMS), Oracle XE 18C 개발자 버전 설치, 최소 설치 사양, 계정의 생성 및 권한 부여, Oracle 18C 계정 생성**
[01] 데이터베이스시스템 개론(DBMS)
     - 우리가 일상 업무나 생활에서 발생하는 데이터를 컴퓨터 기반의 데이터 
       저장소를 만들고 저장, 조회, 수정, 삭제, 통계를 제공하는 컴퓨터 시스템(SW).
          
1. 데이터를 저장하기위한 테이블(엔티티)의 구조
   - 데이터베이스의 구성요소이며 하나 이상의 테이블이 존재 O
   - 2차원 배열의 표 형태를 가지고 있음
   - Record(행, 관측치)는 Column(열, 변수)의 집합
   - Table(entity)은 Record(행)의 집합
   - 계정과 테이블이 모이면 Database가 됨
   - 엑셀과 비슷한 구조임으로 엑셀을 사용하는 기업은 수월하게 DBMS 기반 정보화를 추진할 수 있음
   - 하나의 Excel 파일은 하나의 Database 파일과 대응함. 엑셀파일안의 sheet는 하나의 table과 대응
   
  ![image](https://user-images.githubusercontent.com/76051264/112401178-4b48ea00-8d4d-11eb-9817-d8e29b8b7cda.png)  
------------------------------------------------------------------------------------------
EX) Gallery를 설계할 경우
▶ 클라우드에 IMG 등 Resource에 돼있을때, 클라이언트가 이미지 요청 시원본을 전송하면 안됨.
 -> 원본.jpg(img01.jpg)와 Thumb.jpg(img01_m.jpg)

[02] Oracle XE 18C 개발자 버전 설치, 최소 설치 사양, 계정의 생성 및 권한 부여, Oracle 18C 계정 생성       
[02] Oracle 18C 설치
      - http://www.oracle.com
 
1. 시스템 사양
1) Database Oracle 18C XE Edition: 개인 개발자용   -> 이거 설치
    - 최저 사양: Intel i3 2.3 GHz, Ram 8GB 이상

2) Database Oracle 18C Enterprise/Standard Editions 
   - CPU quard core, Intel i5 이상, Ram 8GB 이상, 오라클 서버의 모든 기능을 제공 

2. http://www.oracle.com에서 회원 가입후 다운

3. 오라클 다운로드 접속
- https://www.oracle.com/database/technologies/xe-downloads.html

4. 로그인하여 'Oracle Database 11gR2 Expression Edition Windows x64' 선택하고 다운

★ 오라클 설치시 컴퓨터의 이름은 반드시 영문이어야 합니다. 
    한글이면 설치중 알수 없는 에러가 발생합니다. 노트북 주의
    한글이면 컴퓨터 등록정보에서 이름을 변경

4. OracleXE112_Win64.zip 파일을 압축풀어 설치, 설치는 기본 폴더
- 설치 시작 화면
- 설치 환영 메시지 화면
- 저작권 동의 화면
- 설치 용량 안내
- 설치시 관리자 계정인 'sys', 'system'은 패스워드를 수업의 편의를 위해 '1234'로 지정
  Enter Password: 1234
  Confirm Password: 1234  
  
  ![image](https://user-images.githubusercontent.com/76051264/112410716-00d06900-8d5f-11eb-9f9c-4bd7c10d2cd7.png)    
  ![image](https://user-images.githubusercontent.com/76051264/112411550-71c45080-8d60-11eb-98a5-76ed7d86e542.png)  
------------------------------------------------------------------------------------------
5.  설치 후 [제어판 > 관리 도구 > 서비스] 'OracleServiceXE', 'OracleXETNSListener' 서비스가
    작동되어야  - 상태가 시작됨이라고 되어 있어야

[03] 관리자 로그인 확인
1. 윈도우 --> 시작 메뉴 --> Oracle Database 11g Expression Edition --> Run SQL Command Line 실행
    - exit: 종료
       
[04] Oracle 18C 계정 생성(Oracle 12C부터 계정 생성 규칙이 변경됨)
-> 로그인 : connect ai8
-> 팀 프로젝트 시 새로운 계정 생성해주면 가능

1. ai8 계정 생성, 1234는 패스워드입니다.
- 생성되는 계정에 "C##"을 붙여야함.
사용자명 입력: system
비밀번호 입력:

다음에 접속됨:
Oracle Database 18c Express Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> show user
USER은 "SYSTEM"입니다
 
2. 계정 생성
SQL> ALTER SESSION SET "_ORACLE_SCRIPT"=true;
세션이 변경되었습니다.

SQL> CREATE USER ai8 IDENTIFIED BY 1234;
User created.
 
3. 권한 부여
1) 접속, 테이블 관련 권한
SQL> GRANT CONNECT, RESOURCE, DBA to ai8;
Grant succeeded.

2) View, Stored Procedure 관련 권한
SQL> GRANT CREATE VIEW TO ai8;
Grant succeeded. 

4. 생성된 계정으로 접속(로그인)
SQL> connect ai8
Enter password: 1234
Connected.

5. 사용자 삭제 
SQL> DROP USER ai8 CASCADE; 

6. 패스워드 변경
SQL> ALTER USER ai8 IDENTIFIED BY 1234;

------------------------------------------------------------------------
* **0326 : [02] SQL Developer 19.2.1, 생성된 ai8 접속, msvcr100.dll 복사 설정**  
 **▶ Oracle DB : 유료 but, 중견기업이상은 Oracle 사용법 익혀야**
 **▶ Oracle Standard : 많은 리소스 사용**
 **▶ Oracle XE : Standard 개선, 보다 적은 리소스 사용**

[02] SQL Developer 19.2.1, 생성된 ai8 접속, msvcr100.dll 복사 설정       
 [01] SQL Developer 19.2.1
 1. https://www.oracle.com
 - 로그인해야 다운가능함.
 - SQL Developer 다운로드: 
   https://www.oracle.com/tools/downloads/sqldev-downloads.html
 
 2.1. sqldeveloper-20.4.1 "여기에풀기" - > 안에 폴더있음  
 2.2. ai8 dic으로 sqldeveloper dic 이동

 3. sqldeveloper.exe 실행
   
 4. JAVA 연결(19.X 버전은 출력 안되는 경우 많음)
   - JDK 경로 요청시 'C:/jdk1.8.0'으로 지정할것.
   
 5. 접속 설정(http://soldeskit3.cafe24.com/pds/read.jsp?pdsgrpno=390&pdsno=18185&grpno=&col=&word=&currentPage=0&visible=)
 1) '+' 아이콘을 클릭 2) 접속 설정
  ![image](https://user-images.githubusercontent.com/76051264/112427923-c1fddb80-8d7d-11eb-972a-4f3faf1d7d8f.png)  
  -> 저장 -> 접속 -> 왼쪽 생성한 Tree 확인  

 6. Auto commit 해제
   - 개발시에는 'Auto Commit' 체크 권장
   - DBMS Transaction 사용시에는 'Auto Commit' 을 해제  
   도구 -> 환경 설정... -> 데이터베이스 -> 객체 뷰어(ObjectViewer) + 고급  
  **▶ 자동 커밋 설정 해제 : 실수 시 되돌리기 가능**

 7. 글꼴 설정(코드 편집기 -> 
 8. 주석 색깔 지정(코드 편집기 -> PL/SQL 주석) 
 9. 라인 번호 출력코드 편집기 ->
 10. 날짜 출력 형식 지정 - 날짜 형식: YYYY-MM-DD HH:MI:SS  (데이터베이스 -> NLS)  
    
 [02]  기본적인 SQL 작업
1. 새로운 SQL 파일 생성
2. 'SQL 파일' 메뉴 선택
3. SQL 파일 저장 위치 지정
1) ai8 폴더로 이동하여 'oracle' 폴더 생성
2) 생성된 'oracle' 폴더 선택
3) 최종 설정 화면
4. 생성된 SQL  파일
5. 기본 SQL 실습  
![image](https://user-images.githubusercontent.com/76051264/112563652-1d32db00-8e1d-11eb-980e-f9dfc7ebc4a8.png)  
------------------------------------------------------------------------
 ~~~
▷ C:/ai7/oracle/test.sql 
DROP TABLE test;

CREATE TABLE test(
    testno    NUMBER(5)   NOT NULL, -- -99999 ~ +99999 
    mname  VARCHAR(20) NOT NULL, -- 한글 3 byte, 영수자 1 byte 
    funct     VARCHAR(50) NOT NULL, -- 주요 기술 분야  
    PRIMARY KEY (testno)         -- 중복 안됨, 고유한 값만 가능  
); 
INSERT INTO test(testno, mname, funct) 
VALUES(1, '왕눈이', 'JAVA/JSP/Spring'); 

INSERT INTO test(testno, mname, funct) 
VALUES(2, '아로미', 'JAVA/JSP/Spring/JQuery'); 

INSERT INTO test(testno, mname, funct) 
VALUES(3, '투투', 'JAVA/JSP/Spring/JQuery/HTML5'); 

SELECT testno, mname, funct FROM test ORDER BY testno ASC; 

-- TESTNO MNAME FUNCT
-- ------ ----- ----------------------------
--      1 왕눈이   JAVA/JSP/Spring
--      2 아로미   JAVA/JSP/Spring/JQuery
--      3 투투    JAVA/JSP/Spring/JQuery/HTML5

-- VARCHAR 타입의 저장 가능 글자수 확인      
INSERT INTO test(testno, mname, funct) 
VALUES(4, '오늘은 금요일', 'JAVA/JSP/Spring/JQuery/HTML5');

-- 한글: 3 byte, 그외의 문자는 1 byte (MySQL: 모든 문자 2 byte 처리)
INSERT INTO test(testno, mname, funct) 
VALUES(4, '오늘은 금요일 FRIDAY', 'JAVA/JSP/Spring/JQuery/HTML5');
--ORA-12899: value too large for column "AI4"."TEST"."MNAME" (actual: 26, maximum: 20)

INSERT INTO test(testno, mname, funct) 
VALUES(4, '오늘은 금요일 FRIDAY 2020', 'JAVA/JSP/Spring/JQuery/HTML5');
--ORA-12899: value too large for column "AI4"."TEST"."MNAME" (actual: 31, maximum: 20)

SELECT testno, mname, funct 
FROM test 
ORDER BY testno ASC; 

DELETE FROM test 
WHERE testno=4;

--Oracle: 한글 1자는 3바이트, 영문자/숫자/특수 문자는 1바이트 사용
--MySQL: varchar(10)이면 모든 문자를 10자 저장 가능 
~~~
  **▶ 엑셀의 구조와 흡사함**
![image](https://user-images.githubusercontent.com/76051264/112565979-81579e00-8e21-11eb-88f2-a391c5bc3d4a.png)  
