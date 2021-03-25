# 3) DB/SQL
## 데이터베이스/SQL 응용(Oracle/MariaDB/MySQL) 
___ 
* **0325 : [01] 데이터베이스시스템 개론(DBMS), Oracle XE 18C 개발자 버전 설치, 최소 설치 사양, 계정의 생성 및 권한 부여, Oracle 18C 계정 생성       
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
   
   no name   wdate       subject      passwd  <- 컬럼, 열
   -----------------------------------------------------------------
   1  가길동 2005-01-01  안녕하세요.  123    <- 레코드, 행
   2  나길순 2005-01-02  반갑습니다.  123$
   3  다길순 2005-01-01  안녕하세요.  123
   4  라길동 2005-01-02  반갑습니다.  123$
   5  마길동 2005-01-01  안녕하세요.  123
   6  바길순 2005-12-02  반갑습니다.  123$
                                       ↖
                                        Sheet  -> 엑셀 파일
                                        테이블 -> 데이터베이스 -> 빅데이터 -> 예측 시스템 -> 인공지능
                                        사원(회원)     (기업)          (정형/비정형)  (통계/머신러닝)   (신경망)
                                        게시판 
                                        자료실
                                        갤러리
                                        MP4 플레이어
                                        설문조사 
                                        급여관리
                                        자재관리
                                        입고관리
                                        출고관리
                                        매출관리
                                        리조트 관리
                                        예약(기차, 버스, 영화, 캠핑장, 펜션...)
                                        상품, 판매, 주문, 결제...
------------------------------------------------------------------------------------------
[02] Oracle XE 18C 개발자 버전 설치, 최소 설치 사양, 계정의 생성 및 권한 부여, Oracle 18C 계정 생성       
[01] Oracle 18C 설치
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

5.  설치 후 [제어판 > 관리 도구 > 서비스] 'OracleServiceXE', 'OracleXETNSListener' 서비스가
    작동되어야  - 상태가 시작됨이라고 되어 있어야

[02] 계정의 생성 및 권한 부여

1. 윈도우 --> 시작 메뉴 --> Oracle Database 11g Expression Edition --> Run SQL Command Line 실행
    - exit: 종료
    

2. ai7 계정 생성, 1234는 패스워드입니다.
SQL> connect system
Enter password:
Connected. 

SQL> CREATE USER ai7 IDENTIFIED BY 1234;
User created.
 

3. 권한 부여
 1) 접속, 테이블 관련 권한
 SQL> GRANT CONNECT, RESOURCE to ai7;
 Grant succeeded.

 2) View, Stored Procedure 관련 권한
 SQL> GRANT CREATE VIEW TO ai7;
 Grant succeeded. 

4. 생성된 계정으로 접속
SQL> connect ai7
Enter password:
Connected.
 

5. 사용자 삭제 
SQL> DROP USER ai7 CASCADE; 


6. 패스워드 변경
SQL> ALTER USER ai7 IDENTIFIED BY 1234;



* 'Run SQL Command Line' 명령 콘솔 실행
   - 'Run SQL Command Line'이 없는 경우 
     'C:/oraclexe/app/oracle/product/11.2.0/server/bin/sqlplus.exe /nolog' 파일을 실행합니다.
     





[참고] Oracle 18C 계정 생성(Oracle 12C부터 계정 생성 규칙이 변경됨)

1. ai7 계정 생성, 1234는 패스워드입니다.
- 생성되는 계정에 "C##"을 붙여야함.
SQL> connect system
Enter password:
Connected. 

SQL> show user
USER은 "SYSTEM"입니다
 
2. 계정 생성
SQL> ALTER SESSION SET "_ORACLE_SCRIPT"=true;
세션이 변경되었습니다.

SQL> CREATE USER ai7 IDENTIFIED BY 1234;
User created.
 
3. 권한 부여
1) 접속, 테이블 관련 권한
SQL> GRANT CONNECT, RESOURCE, DBA to ai7;
Grant succeeded.

2) View, Stored Procedure 관련 권한
SQL> GRANT CREATE VIEW TO ai7;
Grant succeeded. 

4. 생성된 계정으로 접속
SQL> connect ai7
Enter password: 1234
Connected.

5. 사용자 삭제 
SQL> DROP USER ai7 CASCADE; 

6. 패스워드 변경
SQL> ALTER USER ai7 IDENTIFIED BY 1234;