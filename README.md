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
test.sql
~~~  

  **▶ 엑셀의 구조와 흡사함**  
   
![image](https://user-images.githubusercontent.com/76051264/112565979-81579e00-8e21-11eb-88f2-a391c5bc3d4a.png)  
------------------------------------------------------------------------
* **0326 : [03] Oracle 기본 데이터 타입, DDL(Data Definition Language), 일련번호 자동 생성(Sequence)**  
[01] Oracle 기본 데이터 타입
1. 데이터 구조
   - 규모: Column -> Record -> Table -> Tablespace -> Database
   - Column : 어떤 특징을 갖는 하나의 값  예) java, jsp, dbms 성적
   - field: 컬럼의 값
   - domain: field 값의 범위
   - Record: Column의 집합, 행을 나타냄, row
   - Table(Entity): Record의 집합, 테이블(엔티티), RDBMS는 2차원 배열의 형태를 가지고 있음, 엑셀 sheet와 비슷
   - Tablespace: Table의 집합, 테이블 데이터의 성질에따라 최적화(정수, 문자열, 실수형등의 최적화)  
   - Database: 계정과 Tablespace의 집합(MySQL: Database는 계정과 Table의 집합임)
   
2. char(n): 4000 Byte, 고정길이 문자 데이터 처리
   - name char(10) NOT NULL
   - 1바이트의 문자열이 할당 되더라도 10바이트를 전부 사용
   - 처리속도가 가장 빠른 문자 타입니다. 하지만 메모리 낭비가 가장 심함
     따라서 쓰이는 곳은 코드표라든지 길이가 일정한 컬럼에만 사용 
   - 용량이 남는 경우 공백으로 채워짐
   - 변경되지않는 고정길이 코드 저장등에 사용

     선언: CODE  CHAR(4)   NOT NULL,  <- 고정 길이 데이터 권장 
            TITLE   짐HAR(50) NOT NULL   <- 메모리 낭비 발생 가능성 높음  
 
![image](https://user-images.githubusercontent.com/76051264/112568241-7d2d7f80-8e25-11eb-8071-9afceac954dc.png)  

3. varchar, varchar2: 4000 Byte, 가변길이 문자 데이터 처리
   - name varchar(10) NOT NULL
     1바이트를 사용하면 나머지 9바이트는 재사용함.
   - 용량을 매우 많이 절약할 수 있음, 하지만 사용된 사이즈를 계산해야 함으로 속도가 느린 문자 타입임
   - 주로 길이가 심하게 변하는 게시판의 제목등에 많이 사용됨
   - 한글을 1300자 정도 저장 가능
   - 메모리 절약으로 많이 사용됨
 
4. number(n), number(p,s)
   - 정수, 실수를 출력함.
   - p는 전체 자리수, s는 소수점 이하의 자리 수
     . kuk number(5) NOT NULL: -99999 ~ +99999 숫자 5자리 저장
     . avg number(5, 2) NOT NULL: -999.99 ~ 999.99, 정수 3자리, 소수 2자리 
     . varchar와 같은 가변길이 타입을 지원
   - int: 정수 4바이트 지원
                     
5. 대용량 데이터 타입
   - CLOB(많이 사용★): 문자 데이터 4GB까지 지원: 대용량 문자 처리
   - BLOB: 바이너리 데이터 4GB까지 지원
  
[02] DDL(Data Definition Language): 테이블 구조의 생성, 수정, 삭제 
1. 테이블 구조
2. 테이블 구조의 변경
- 정보 시스템을 구축하는 과정에서 업무에 최적화된 설계를위해 테이블의 구조는 변경 될 수 밖에 없음.
 
 ~~~
ddl.sql + 생성 실습
~~~  

[03] 일련번호 자동 생성(Sequence)
1. SEQUENCE
- 레코드는 고유하게 구분되어야함으로 고유한 값이 필요함으로
  데이터를 구분값으로 사용하는 경우가 있고 Sequence즉 일련번호처럼
  오라클에서 생성되는 값을 사용하는 경우도 있음.  
![image](https://user-images.githubusercontent.com/76051264/112589034-c260aa00-8e43-11eb-86be-8c113470a8f5.png)  
 
 - START WITH 1: 일련번호 1부터 시작   
 - INCREMENT BY 1: 일련번호를 1 씩 증가   
 -  CACHE 2: 시퀀스를 테이블에 저장함으로 자주 Update가 발생함으로 이것을 줄이기위해 메모리에서 일련번호를 증가시키며 CACHE 명령을 이용해 증가 단위를 정의할 수 있음, 메모리에서 일련번호 증가, 처리 속도 향상, 기본값은 20임, INSERT가 많이 발생하면 기본값을 길게 해줌   
 - AXVALUE 9999999: 최대값을 9999999으로 지정  
 - NOCYCLE: 다시 1부터 생성되는 것을 방지    
 - Sequence는 시스템 테이블에 저장됨.  
 - MySQL은 'auto_increment'를 지정  
  memono INT NOT NULL AUTO_INCREMENT PRIMARY KEY  

3. Sequence 사용하지 않는 기타 방법
  1) 자체 제작된 Sequence 테이블의 사용(테이블명, 일련번호...).
  2) Sub Query를 이용한 일련번호의 생성 
 ~~~
sequence.sql
~~~ 

* **0326 : [04] Oracle 기본 SQL 사용, DML(Data Manipulation Language), INSERT, SELECT, UPDATE, DELETE, ORDER BY, LIKE**  
[01] DML(Data Manipulation Language)
  - 데이터를 등록, 목록, 수정, 삭제하는 SQL
1. DML 실습 
   - 데이터 조작어(Data Manipulation Language) : 데이터 조회 및 변형을 위한 명령어
   - SELECT : 데이터 조회/ INSERT : 데이터 입력/ UPDATE : 데이터 수정/ DELETE : 데이터 삭제

 1) 검색(%: 없거나 하나 이상의 모든 문자)
  - WHERE word LIKE '스위스' → word = '스위스'
  - WHERE word LIKE '%스위스' → word = '잊지 못할 스위스'
  - WHERE word LIKE '스위스%' → word = '스위스에서~'
  - WHERE word LIKE '%스위스%' → word = '유럽 여행은 스위스 꼭 방문해야~'
~~~
dml.sql
~~~

2. CRUD 패턴(매트릭스) : CREATE, READ, UPDATE, DELETE
  - DB 개발시 공통적으로 발생하는 SQL, 모든 프로그램은 CRUD 패턴을 반복.
  - '사원' 데이터 존재 시 
  1) 사원 등록 : INSERT INTO ~ VALUES
  2) 사원 목록 : SELECT ~ FORM ~ 
  3) 사원 조회 : SELECT ~ FORM ~ WHERE ~ 
  4) 사원 정보 수정 : UPDATE ~ SET ~ WHERE ~
  5) 사원 정보 삭제 : DELET FORM ~ WHERE ~

  - '게시판' 데이터 존재 시 
  1) 게시판 등록 : INSERT INTO ~ VALUES
  2) 게시판 목록 : SELECT ~ FORM ~ 
  3) 게시판 조회 : SELECT ~ FORM ~ WHERE ~ 
  4) 게시판 정보 수정 : UPDATE ~ SET ~ WHERE ~
  5) 게시판 정보 삭제 : DELET FORM ~ WHERE ~

  ------------------------------------------------------------------------
* **0331 : [MariaDB 01] MariaDB 10.3.27 다운로드 및 설정, 계정 생성, resort DB 생성** 
~~~
[01] MariaDB 10.3.21 다운로드 및 설정
- Oracle의 MySQL 상업화 정책에 반대하여 MySQL 개발자가 MySQL과 동일한 소스로 제작된 DBMS

1. 다운로드
   - 공식 홈페이지: https://mariadb.org
   - mariadb-10.3.28-winx64.zip ZIP file Windows x86_64     62.9 MB
2. [mariadb-10.3.28-winx64.zip 선택 --> 여기에 풀기] 실행
3. 'mariadb-10.3.28-winx64' 폴더를 'C:/ai7' 폴더로 복사후 'C:/ai8/mariadb-10.3' 폴더로 폴더 이름 변경 
4. 한글 설정
- Editplus에서 my.ini 생성해서 편집
 
▷ C:/ai8/mariadb-10.3/data/my.ini 로 저장 ★★★★★
[mysqld]
datadir=C:/ai8/mariadb-10.3/data
port=3306
init_connect="SET collation_connection = utf8_general_ci"  
init_connect="SET NAMES utf8"  
character-set-server = utf8
collation-server = utf8_general_ci
 
[client]
port=3306
plugin-dir=C:/ai8/mariadb-10.3/lib/plugin
default-character-set = utf8
 
[mysqldump]
default-character-set = utf8
 
[mysql]
default-character-set = utf8

5. 서버 실행 : .bat 파일 만들기 -> 작업관리자에 mysqld.exe 실행중이면 Ok.
▷ C:/HOME/mariadb_server.bat
C: 
CD/ 
CD ai8/mariadb-10.3/bin 
mysqld.exe
 
6. root 접속
▷ C:/HOME/mariadb_root.bat
C: 
CD/ 
CD ai8/mariadb-10.3/bin 
start mysql.exe -u root
  
7. root 계정의 패스워드 변경
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.3.27-MariaDB mariadb.org binary distribution
Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
MariaDB [(none)]> show databases;   <-- 실행 1
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
4 rows in set (0.002 sec)

MariaDB [(none)]> use mysql;   <-- 실행 2
Database changed

MariaDB [mysql]> SELECT host, user, password FROM user;   <-- 실행 3
+-----------+------+----------+
| host      | user | password |
+-----------+------+----------+
| localhost | root |          |
| 127.0.0.1 | root |          |
| ::1       | root |          |
+-----------+------+----------+
3 rows in set (0.001 sec)

MariaDB [mysql]> UPDATE user SET password=PASSWORD('1234') WHERE user='root';   <-- 실행 4
Query OK, 3 rows affected (0.002 sec)
Rows matched: 3  Changed: 3  Warnings: 0

MariaDB [mysql]> SELECT host, user, password FROM user;   <-- 실행 5
+-----------+------+-------------------------------------------+
| host      | user | password                                  |
+-----------+------+-------------------------------------------+
| localhost | root | *A4B6157319038724E3560894F7F932C8886EBFCF |
| 127.0.0.1 | root | *A4B6157319038724E3560894F7F932C8886EBFCF |
| ::1       | root | *A4B6157319038724E3560894F7F932C8886EBFCF |
+-----------+------+-------------------------------------------+
3 rows in set (0.001 sec)

MariaDB [mysql]> FLUSH PRIVILEGES;   <-- 실행 6
Query OK, 0 rows affected (0.001 sec)
MariaDB [mysql]> exit   <-- 실행 7

8. root 접속 Password 등록 -> 변경
▷ C:/HOME/mariadb_root.bat
C: 
CD/ 
CD ai8/mariadb-10.3/bin 
start mysql.exe -u root -p1234
  
9. 데이터베이스 생성(resort 지정 X) : 자신의 프로젝트 주제에 따라서 지정
- C:/HOME/mariadb_root.bat 실행
MariaDB [(none)]> CREATE DATABASE resort;  <- 실행7
Query OK, 1 row affected (0.004 sec)

MariaDB [(none)]> show databases;  <- show databases로 db확인.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| study              |			<- 내가 만든 데이터베이스 확인
| test               |
+--------------------+
5 rows in set (0.001 sec)
~~~

* **0401 : [MariaDB 02] ** 
~~~

~~~