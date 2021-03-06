CREATE SEQUENCE FLEX_CATEGORY_ID_SEQ START WITH 1234;
CREATE SEQUENCE FLEX_COMMUNITY_ID_SEQ START WITH 1234;
CREATE SEQUENCE FLEX_POST_ID_SEQ START WITH 1234;
CREATE SEQUENCE FLEX_USER_ID_SEQ START WITH 1234;
CREATE SEQUENCE FLEX_INDUSTRY_ID_SEQ START WITH 1234;
CREATE SEQUENCE FLEX_COMPANY_ID_SEQ START WITH 1234;
CREATE SEQUENCE FLEX_PRODUCT_SEQ START WITH 1234;
CREATE SEQUENCE FLEX_CONTACT_ID_SEQ START WITH 1234; 

CREATE TABLE FLEX_BOARD(
	POST_ID VARCHAR(16) NOT NULL,
	TITLE VARCHAR(50) NOT NULL,
	CONTENTS VARCHAR(255) NULL,
	REG_ID VARCHAR(20) NULL,
	REG_DATE VARCHAR(10) NULL,
	COMMUNITY_ID VARCHAR(16) NOT NULL,
	CONSTRAINT PK_FLEX_BOARD PRIMARY KEY(POST_ID));

CREATE TABLE FLEX_CATEGORY(
	CATEGORY_ID VARCHAR(16) NOT NULL,
	CATEGORY_NAME VARCHAR(50) NOT NULL,
	CATEGORY_DESC VARCHAR(100) NULL,
	REG_DATE VARCHAR(10) NULL,
	CONSTRAINT PK_FLEX_CATEGORY PRIMARY KEY(CATEGORY_ID));

CREATE TABLE FLEX_COMMUNITY(
	COMMUNITY_ID VARCHAR(16) NOT NULL,
	COMMUNITY_NAME VARCHAR(50) NOT NULL,
	COMMUNITY_DESC VARCHAR(100) NULL,
	CATEGORY_ID VARCHAR(16) NULL,
	REG_ID VARCHAR(20) NULL,
	REG_DATE VARCHAR(10) NULL,
	CONSTRAINT PK_FLEX_COMMUNITY PRIMARY KEY(COMMUNITY_ID),
	CONSTRAINT FK_FLEX_CATEGORY FOREIGN KEY(CATEGORY_ID) REFERENCES FLEX_CATEGORY(CATEGORY_ID));

CREATE TABLE FLEX_DEPT(
	DEPT_ID VARCHAR(16) NOT NULL,
	DEPT_NAME VARCHAR(20) NOT NULL,
	DEPT_LEVEL VARCHAR(1) NULL,
	DEPT_DESC VARCHAR(100) NULL,
	PARENT_DEPT VARCHAR(16) NULL,
	CONSTRAINT PK_FLEX_DEPT PRIMARY KEY(DEPT_ID));

CREATE TABLE FLEX_USER(
	USER_NAME VARCHAR(20) NOT NULL,
	EN_NAME VARCHAR(20) NULL,
	COMP_PHONE VARCHAR(20) NULL,
	PHONE VARCHAR(20) NULL,
	CELL_PHONE VARCHAR(20) NULL,
	COMPANY VARCHAR(20) NULL,
	JOB_POSITION VARCHAR(20) NULL,
	ASSIGNMENT VARCHAR(20) NULL,
	OFFICER_YN VARCHAR(1) NULL,
	FAX VARCHAR(20) NULL,
	ZIP_CODE VARCHAR(10) NULL,
	ADDRESS VARCHAR(100) NULL,
	COMP_ZIP_CODE VARCHAR(10) NULL,
	COMP_ADDRESS VARCHAR(100) NULL,
	EMAIL VARCHAR(30) NULL,
	USER_ID VARCHAR(16) NOT NULL,
	DEPT_ID VARCHAR(16) NOT NULL,
	PASSWORD VARCHAR(16) NOT NULL,
	AUTHORITY VARCHAR(20) NULL,
	CONSTRAINT PK_FLEX_USER PRIMARY KEY(USER_ID),
	CONSTRAINT FK_FLEX_DEPT FOREIGN KEY(DEPT_ID) REFERENCES FLEX_DEPT(DEPT_ID));
	
CREATE TABLE FLEX_GENRE(GENRE_ID VARCHAR(5) NOT NULL,NAME VARCHAR(50) NOT NULL,CONSTRAINT PK_FLEX_GENRE PRIMARY KEY(GENRE_ID));
CREATE TABLE FLEX_MOVIE(MOVIE_ID VARCHAR(50) NOT NULL,GENRE_ID VARCHAR(5) NOT NULL,TITLE VARCHAR(50) NOT NULL,DIRECTOR VARCHAR(50) NOT NULL,ACTORS VARCHAR(100) NOT NULL,RUNTIME NUMERIC(3),RELEASE_DATE DATE,TICKET_PRICE NUMERIC(6,2),POSTER_FILE VARCHAR(1000),NOW_PLAYING CHARACTER(1),FILE_REF_ID VARCHAR(50),CONSTRAINT PK_FLEX_MOVIE PRIMARY KEY(MOVIE_ID),CONSTRAINT FK_FLEX_MOVIE FOREIGN KEY(GENRE_ID) REFERENCES FLEX_GENRE(GENRE_ID));
CREATE TABLE FLEX_ATTACHED(ID VARCHAR(50) NOT NULL,NAME VARCHAR(255),FILE_SIZE NUMERIC(15),REF_ID VARCHAR(50) NOT NULL,CONSTRAINT PK_FLEX_ATTACHED PRIMARY KEY(ID));
CREATE TABLE FLEX_INDUSTRY(ID VARCHAR(16) NOT NULL PRIMARY KEY,NAME VARCHAR(50));
CREATE TABLE FLEX_COMPANY(ID VARCHAR(16) NOT NULL PRIMARY KEY,NAME VARCHAR(50),ADDRESS VARCHAR(50),CITY VARCHAR(50),STATE VARCHAR(20),ZIP VARCHAR(20),PHONE VARCHAR(50),INDUSTRY_ID INTEGER);
CREATE TABLE FLEX_PRODUCT(PRODUCT_ID VARCHAR(16) NOT NULL PRIMARY KEY,NAME VARCHAR(40),CATEGORY VARCHAR(40),IMAGE VARCHAR(40),PRICE NUMERIC,DESCRIPTION VARCHAR(255),QTY_IN_STOCK INTEGER);
CREATE TABLE FLEX_CONTACT(CONTACT_ID VARCHAR(16) NOT NULL PRIMARY KEY,FIRST_NAME VARCHAR(40),LAST_NAME VARCHAR(40),ADDRESS VARCHAR(40),CITY VARCHAR(40),STATE CHARACTER(5),ZIP VARCHAR(10),PHONE VARCHAR(40),EMAIL VARCHAR(40));

INSERT INTO FLEX_GENRE VALUES('GR-01','Action');
INSERT INTO FLEX_GENRE VALUES('GR-02','Adventure');
INSERT INTO FLEX_GENRE VALUES('GR-03','Animation');
INSERT INTO FLEX_GENRE VALUES('GR-04','Comedy');
INSERT INTO FLEX_GENRE VALUES('GR-05','Crime');
INSERT INTO FLEX_GENRE VALUES('GR-06','Drama');
INSERT INTO FLEX_GENRE VALUES('GR-07','Fantasy');
INSERT INTO FLEX_GENRE VALUES('GR-08','Romance');
INSERT INTO FLEX_GENRE VALUES('GR-09','Sci-Fi');
INSERT INTO FLEX_GENRE VALUES('GR-10','Thriller');
INSERT INTO FLEX_MOVIE VALUES('MV-00001','GR-02','Alice in Wonderland','Tim Burton','Johnny Depp',130,'2010-03-04',677.00,'sample/images/posters/aliceinwonderland.jpg','Y','');
INSERT INTO FLEX_MOVIE VALUES('MV-00002','GR-09','Avatar','James Cameron','Sigourney Weaver',100,'2010-02-16',7000.00,'sample/images/posters/avatar.jpg','Y','');
INSERT INTO FLEX_MOVIE VALUES('MV-00003','GR-01','Green Zone','Paul Greengrass','Yigal Naor',90,'2010-03-25',7000.00,'sample/images/posters/greenzone.jpg','Y','');
INSERT INTO FLEX_MOVIE VALUES('MV-00004','GR-04','Remember Me','Allen Coulter','Caitlyn Rund',115,'2010-03-12',8000.00,'sample/images/posters/rememberme.jpg','Y','');
INSERT INTO FLEX_MOVIE VALUES('MV-00005','GR-04','She is Out of My League','Jim Field Smith','Jay Baruchel',130,'2010-03-12',12.00,'sample/images/posters/shesoutof.jpg','N','');
INSERT INTO FLEX_BOARD VALUES('POST-00001','프로젝트 회식','프로젝트 회식있습니다.날짜와 시간은 이영미씨가 공지예정.','hong80','2009/12/25','COMMUNITY-0005');
INSERT INTO FLEX_BOARD VALUES('POST-00002','FLEX 사용해보신분','FLEX 기본적인 사용방법 좀 알려주세요.','dongnam','2009/12/25','COMMUNITY-0004');
INSERT INTO FLEX_BOARD VALUES('POST-00004','JavaScript와 DHTML','JavaScript와 DHTML의 세계에 오신것을 환영합니다.','chulsoo','2009/12/25','COMMUNITY-0035');
INSERT INTO FLEX_BOARD VALUES('POST-00005','SQL인스트럭션','모든 SQL인스트럭션의 용어를 열거합니다.','sooni','2009/12/25','COMMUNITY-0002');
INSERT INTO FLEX_BOARD VALUES('POST-00006','DB 테이블에 관한 질문입니다.','제가 한 테이블에 모든게시판의 리스트를 넣어놨습니다..','hong80','2009/12/25','COMMUNITY-0002');
INSERT INTO FLEX_BOARD VALUES('POST-00007','SEAM이 표준?','SEAM과 JSR-299와는 어떤 관계가 있을까요?.','hong80','2009/12/25','COMMUNITY-0005');
INSERT INTO FLEX_BOARD VALUES('POST-00009','동기모임에 데이터 추가','추가한 데이터가 정산적으로 DB에 저장되는지 확인 합니다.','hong80','2009/12/25','COMMUNITY-0018');
INSERT INTO FLEX_BOARD VALUES('POST-00011','언제 정모하나요?','언제 정모?','test','2009/12/25','COMMUNITY-0015');
INSERT INTO FLEX_BOARD VALUES('POST-00012','동기모임','동기야 반갑다','hong80','2009/12/25','COMMUNITY-0018');
INSERT INTO FLEX_BOARD VALUES('POST-00013','SNSD','소시 팬카페','hong80','2009/12/25','COMMUNITY-0002');
INSERT INTO FLEX_BOARD VALUES('POST-00017','구성주유소','젤 쌉니다.','hong80','2009/12/25','COMMUNITY-0010');
INSERT INTO FLEX_BOARD VALUES('POST-00018','프리미어 리그 따라하기','따라할 수 있을까?','test','2009/12/25','COMMUNITY-0017');
INSERT INTO FLEX_BOARD VALUES('POST-00019','수정 후 재 조회','수정 후 재 조회를 하는것이 맞는 것인가?','hong80','2009/12/25','COMMUNITY-0004');
INSERT INTO FLEX_BOARD VALUES('POST-00020','유행','유행','hong80','2009/12/25','COMMUNITY-0018');
INSERT INTO FLEX_BOARD VALUES('POST-00021','크록스','크록스 메리제인','hong80','2009/12/25','COMMUNITY-0017');
INSERT INTO FLEX_BOARD VALUES('POST-00022','애니카와 프로미','애니카와 프로미중 누가 더 좋을까요?','hong80','2009/12/25','COMMUNITY-0008');
INSERT INTO FLEX_BOARD VALUES('POST-00023','트랜스포머','범블비와 옵티머스 조립해요','hong80','2009/12/25','COMMUNITY-0018');
INSERT INTO FLEX_BOARD VALUES('POST-00024','토익공부','토익1등급 받을 수 있어요.','hong80','2009/12/11','COMMUNITY-0018');
INSERT INTO FLEX_BOARD VALUES('POST-00025','컴퓨터 조립 가장 싸게','용산보다 쌉니다.','hong80','2009/12/25','COMMUNITY-0019');
INSERT INTO FLEX_BOARD VALUES('POST-10041','망치질 하기','망치질은 내손으로','test','2010/01/14','COMMUNITY-0020');
INSERT INTO FLEX_BOARD VALUES('POST-10046','2010년 탄천 청소하기','올해에는 매주 토요일에 진행 됩니다.','test','2010/01/14','COMMUNITY-0014');
INSERT INTO FLEX_BOARD VALUES('POST-10047','탄천에 쓰레기 버리시는 분','벌금이 부과될 수 있으니 주의 바랍니다.','test','2010/01/12','COMMUNITY-0014');
INSERT INTO FLEX_BOARD VALUES('POST-10048','탄천 지키기','탄천을 지킵시다','test','2010/01/14','COMMUNITY-0014');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-0001','컴퓨터','컴퓨터에 관련된 커뮤니티들이 모여있습니다.','2009/12/25');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-0002','자동차','자동차에 관련된 커뮤니티들이 모여 있습니다.','2009/12/25');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-0003','스포츠','스포츠에 관련된 커뮤니티들이 모여 있습니다.','2009/12/25');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-0004','친목','친목에 관련된 커뮤니티들이 모여 있습니다.','2009/12/25');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-0005','취미','취미에 관련된 커뮤니티들이 모여 있습니다.','2009/12/25');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-0006','봉사','봉사에 관련된 커뮤니티들이 모여 있습니다.','2009/12/08');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1021','핸드폰','핸드폰에 관련된 커뮤니티들이 모여 있습니다.','2010/01/07');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1022','부동산','부동산에 관련된 커뮤니티들이 모여 있습니다.','2010/01/13');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1023','등산','등산에 관련된 커뮤니티들이 모여 있습니다.','2010/01/13');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1024','레포츠','레포츠에 관련된 커뮤니티들이 모여 있습니다.','2010/01/13');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1025','재테크','재테크에 관련된 커뮤니티들이 모여 있습니다.','2010/01/13');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1026','영화','영화에 관련된 커뮤니티들이 모여 있습니다.','2010/01/13');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1027','꽃','꽃에 관련된 커뮤니티들이 모여 있습니다.','2010/01/12');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1028','로보트','로보트에 관련된 커뮤니티들이 모여 있습니다.','2010/01/13');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1029','맛집','맛집에 관련된 커뮤니티들이 모여 있습니다.','2010/01/07');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1030','애완동물','애완동물에 관련된 커뮤니티들이 모여 있습니다.','2010/01/15');
INSERT INTO FLEX_CATEGORY VALUES('CATEGORY-1031','국내여행','국내여행에 관련된 커뮤니티들이 모여 있습니다.','2010/01/22');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0002','THE PRACTICAL SQL','SQL 학습을 위한 커뮤니티입니다.','CATEGORY-0001','bowman','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0003','HTML CSS 자바스크립트','HTML CSS  자바스크립트 개발을 위한 커뮤니티입니다.','CATEGORY-0001','subman','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0004','FLEX 쉽게 배워보기','FLEX개발과 실무에 대한 의견을 나누는 커뮤니티입니다.','CATEGORY-0001','zoon73','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0005','Spring Framework 사용자 모임','Spring Framework 사용자 모임입니다.','CATEGORY-0001','howrock','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0006','SM3 같이 타요','SM3 차량 정보를 공유하고 친목을 동호하기 위한 커뮤니티입니다.','CATEGORY-0002','minminmin','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0007','중고차 비싸게 팔고 싸게 사기','중고차 매매 정보를 공유하는 커뮤니티입니다.','CATEGORY-0002','urobba','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0008','자동차 보험에 대한 모든 것','자동차 보험에 대한 모든 정보가 있습니다.','CATEGORY-0002','whatsub','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0009','혼자서 자동차 고치지','자동차 정비 관련 정보를 나눠요.','CATEGORY-0002','bigblue','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0010','넌 어느 주유소에서 기름 넣니?','전국 주유소 기름값 정보를 공유 할 수 있습니다.','CATEGORY-0002','babopack','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0011','자가용 함께 타기','고유가 시대에 카플을 원하시는 분들을 위한 모임입니다.','CATEGORY-0002','eugene','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0012','컴퓨터 만들기','컴퓨터 조립해서 써요~','CATEGORY-0001','hong80','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0013','MLB 매니아','MLB 매니아','CATEGORY-0003','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0014','탄천 환경 정화','탄천을 깨끗하게','CATEGORY-0006','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0015','농활','농촌 봉사활동','CATEGORY-0006','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0017','K리그 봐요','K리그에 관심이 있는 분들이면 누구나 환영합니다.','CATEGORY-0003','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0018','동기모임','동기야 반갑다.','CATEGORY-0004','hong80','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0019','컴퓨터 도우미','컴퓨터 공부를 도와드립니다.','CATEGORY-0006','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0020','목공 나들이','책상을 내손으로 만들어 쓸 수 있습니다.','CATEGORY-0005','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0021','아이폰 쉽게 사용하기','아이폰을 처음 사용하시는 분들의 정보를 공유합니다.','CATEGORY-1021','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0022','아이폰 App. 개발자 모임','아이폰 App 개발자 모입니다.','CATEGORY-1021','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0023','안드로이드','구글 안드로이드에 관심 있으신 분 환영합니다.','CATEGORY-1021','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0024','핸드폰 튜닝','핸드폰 튜닝에 관심 있으신 분은 가입해 주세요','CATEGORY-1021','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0025','로보트 프라모델 조립','프라모델 조립에 관심 있으신 분들 정보 공유해요','CATEGORY-1028','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0026','전투로봇 개발','전투 로봇 개발에 참여 하실분 모집합니다.','CATEGORY-1028','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0027','고양이 뽐내기','고양이 미용에 관심 있으신 분 환영','CATEGORY-1030','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0028','아지아지 강아지','강아지를 잘 키우는 정보 공유해요. ','CATEGORY-1030',NULL,NULL);
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0029','우리 고양이 네로','고양이 분양 커뮤니티입니다.','CATEGORY-1030',NULL,NULL);
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0030','원예','원예에 관심 있으신 분 환영해요','CATEGORY-1027','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0031','영화 같이 보기','혼자서 영화 보기 싫으신 분 같이 봐요','CATEGORY-1026','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0032','최신 디비디 정보','최신 디비디 정보 같이 공유해요','CATEGORY-1026','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0033','영화 평점','영화 평점 주기','CATEGORY-1026','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0034','명화 같이 보기','일주일에 한번 명화를 골라 같이 보는 커뮤니티입니다.','CATEGORY-1026','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0035','주식왕 되기','주식왕이 되기 위한 커뮤니티입니다.','CATEGORY-1025','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0036','부동산 투자 나도 할 수 있다.','부동산 투자에 대한 정보 공유해요','CATEGORY-1025','test','2010/01/15');
INSERT INTO FLEX_COMMUNITY VALUES('COMMUNITY-0037','1년에 일억 모으기','일년에 일억 모으는 노하우 전수','CATEGORY-1025','test','2010/01/15');
INSERT INTO FLEX_DEPT VALUES('DEPT-0001','영업그룹','0','부서0001이랍니다.','DEPT-0001');
INSERT INTO FLEX_DEPT VALUES('DEPT-0002','개발그룹','0','부서0002이랍니다.','DEPT-0002');
INSERT INTO FLEX_DEPT VALUES('DEPT-0003','RnD그룹','0','부서0003이랍니다.','DEPT-0003');
INSERT INTO FLEX_DEPT VALUES('DEPT-0004','총무그룹','0','부서0004이랍니다.','DEPT-0004');
INSERT INTO FLEX_DEPT VALUES('DEPT-0005','인사그룹','0','부서0005이랍니다.','DEPT-0005');
INSERT INTO FLEX_DEPT VALUES('DEPT-0006','교육그룹','0','부서0006이랍니다.','DEPT-0006');
INSERT INTO FLEX_DEPT VALUES('DEPT-0007','영업1과','1','부서0007이랍니다.','DEPT-0001');
INSERT INTO FLEX_DEPT VALUES('DEPT-0008','영업2과','1','부서0008이랍니다.','DEPT-0001');
INSERT INTO FLEX_DEPT VALUES('DEPT-0009','영업3과','1','부서0009이랍니다.','DEPT-0001');
INSERT INTO FLEX_DEPT VALUES('DEPT-0010','디자인개발','1','부서0010이랍니다.','DEPT-0002');
INSERT INTO FLEX_DEPT VALUES('DEPT-0011','제품개발','1','부서0011이랍니다.','DEPT-0002');
INSERT INTO FLEX_DEPT VALUES('DEPT-0012','RnD1','1','부서0012이랍니다.','DEPT-0003');
INSERT INTO FLEX_DEPT VALUES('DEPT-0013','RnD2','1','부서0013이랍니다.','DEPT-0003');
INSERT INTO FLEX_DEPT VALUES('DEPT-0014','RnD3','1','부서0014이랍니다.','DEPT-0003');
INSERT INTO FLEX_DEPT VALUES('DEPT-0015','RnD4','1','부서0015이랍니다.','DEPT-0003');
INSERT INTO FLEX_DEPT VALUES('DEPT-0016','부서0016','1','부서0016이랍니다.','DEPT-0004');
INSERT INTO FLEX_DEPT VALUES('DEPT-0017','부서0017','1','부서0017이랍니다.','DEPT-0004');
INSERT INTO FLEX_DEPT VALUES('DEPT-0018','부서0018','1','부서0018이랍니다.','DEPT-0004');
INSERT INTO FLEX_DEPT VALUES('DEPT-0019','부서0019','1','부서0019이랍니다.','DEPT-0004');
INSERT INTO FLEX_DEPT VALUES('DEPT-0020','부서0020','1','부서0020이랍니다.','DEPT-0004');
INSERT INTO FLEX_DEPT VALUES('DEPT-0021','부서0021','1','부서0021이랍니다.','DEPT-0005');
INSERT INTO FLEX_DEPT VALUES('DEPT-0022','부서0022','1','부서0022이랍니다.','DEPT-0005');
INSERT INTO FLEX_DEPT VALUES('DEPT-0023','부서0023','1','부서0023이랍니다.','DEPT-0006');
INSERT INTO FLEX_DEPT VALUES('DEPT-0024','부서0024','1','부서0024이랍니다.','DEPT-0006');
INSERT INTO FLEX_DEPT VALUES('DEPT-0025','부서0025','1','부서0025이랍니다.','DEPT-0006');
INSERT INTO FLEX_USER VALUES('김철수','Kim Chulsoo','02-242-1231','02-443-1231','010-234-1231','삼성SDS','사원','개발','Y','02-533-5353','223-232','성남시 분당구','432-221','경기도 구리시','chulsoo@samsung.com','chulsoo','DEPT-0008','test123','ROLE_USER');
INSERT INTO FLEX_USER VALUES('윤동남','Yoon Dongnam','02-242-1231','02-443-1231','010-234-1231','삼성SDS','차장','개발','N','02-533-5353','223-232','성남시 분당구','432-221','인천시 부평구','dongnam@samsung.com','dongnam','DEPT-0007','test123','ROLE_USER');
INSERT INTO FLEX_USER VALUES('홍길동','Hong Gildong','02-6456-1223','02-7484-0912','010-9911-0033','삼성SDS','책임','App.개발','N','02-6481-0091','463-180','경기도 성남시 분당구 구미동','463-810','경기도 성남시 분당구','gildong@naver.com','hong80','DEPT-0007','test123','ROLE_USER');
INSERT INTO FLEX_USER VALUES('김광현','hwj','02-123-1234','02-1234-1234','010-1234-1235','삼성SDS','사원','개발',NULL,NULL,'aaa','aaaasdfdsf',NULL,NULL,'kwanghyun@samsung.com','kkw','DEPT-0003','test123','ROLE_ADMIN');
INSERT INTO FLEX_USER VALUES('김순이','Kim Sooni','02-242-2323','02-443-4343','010-234-2323','삼성SDS','부장','인사','Y','02-533-5353','424-432','서울시 역삼동','432-222','강원도 삼척시','sooni@samsung.com','sooni','DEPT-0010','test123','ROLE_USER');
INSERT INTO FLEX_USER VALUES('테스터','test','02-123-1234','02-1234-1235','010-1234-1234','삼성SDS','대리','연구개발',NULL,'031-1234-1234',NULL,NULL,'123-456','경기도 성남시 분당구','test@samsung.com','test','DEPT-0003','test123','ROLE_ADMIN');
INSERT INTO FLEX_USER VALUES('이영미','Lee Youngmi','02-242-2222','02-233-2222','010-1334-2222','삼성SDS','대리','영업','N','02-533-2222','424-432','서울시 역삼동','432-222','충청남도 서산시','yongmi@samsung.com','yongmi','DEPT-0009','test123','ROLE_USER');
INSERT INTO FLEX_USER VALUES('김유나','yoona','123-123-1234','123-123-1234','123-123-1234','삼성SDS','사원',NULL,NULL,NULL,'463-810','test',NULL,NULL,'yoona@samsung.com','yoona','DEPT-0003','test123','ROLE_ADMIN');
INSERT INTO FLEX_INDUSTRY VALUES(1,'Computers');
INSERT INTO FLEX_INDUSTRY VALUES(2,'Health Care');
INSERT INTO FLEX_INDUSTRY VALUES(3,'Financial Services');
INSERT INTO FLEX_INDUSTRY VALUES(4,'Life Sciences');
INSERT INTO FLEX_INDUSTRY VALUES(5,'Manufacturing');
INSERT INTO FLEX_INDUSTRY VALUES(6,'Education');
INSERT INTO FLEX_COMPANY VALUES(1,'Flex Inc','873 Norton Rd','New York','NY','98754','408',1);
INSERT INTO FLEX_COMPANY VALUES(2,'Allaire','345 W 28th St.','Chicago','MI','54878','212',2);
INSERT INTO FLEX_COMPANY VALUES(3,'Macromedia','601 Townsend St','San Francisco','CA','85465','212',1);
INSERT INTO FLEX_COMPANY VALUES(4,'Adobe','453 S 34th St','San Diego','CA','25447','212',1);
INSERT INTO FLEX_COMPANY VALUES(5,'Acme','988 William Rd','Boston','MA','12545','212',2);
INSERT INTO FLEX_COMPANY VALUES(6,'Blue Cross','123 Fake St','Boston','MA','02132','212',2);
INSERT INTO FLEX_PRODUCT VALUES(1,'Nokia 6010','6000','Nokia_6010.gif',99.0E0,'Easy to use without sacrificing style, the Nokia 6010 phone offers functional voice communication supported by text messaging, multimedia messaging, mobile internet, games and more.',21);
INSERT INTO FLEX_PRODUCT VALUES(2,'Nokia 3100 Blue','9000','Nokia_3100_blue.gif',109.0E0,'Light up the night with a glow-in-the-dark cover',99);
INSERT INTO FLEX_PRODUCT VALUES(3,'Nokia 3100 Pink','3000','Nokia_3100_pink.gif',139.0E0,'Light up the night with a glow-in-the-dark cover',30);
INSERT INTO FLEX_PRODUCT VALUES(4,'Nokia 3120','3000','Nokia_3120.gif',159.99E0,'Designed for both business and pleasure, the elegant Nokia 3120 phone offers a pleasing mix of features',10);
INSERT INTO FLEX_PRODUCT VALUES(5,'Nokia 3220','3000','Nokia_3220.gif',199.0E0,'The Nokia 3220 phone is a fresh new cut on some familiar ideas',20);
INSERT INTO FLEX_PRODUCT VALUES(6,'Nokia 3650','3000','Nokia_3650.gif',200.0E0,'Messaging is more personal, versatile and fun with the Nokia 3650 camera phone.',11);
INSERT INTO FLEX_PRODUCT VALUES(7,'Nokia 6820','6000','Nokia_6820.gif',299.99E0,'Messaging just got a whole lot smarter. The Nokia 6820 messaging device puts the tools you need for rich communication',8);
INSERT INTO FLEX_PRODUCT VALUES(8,'Nokia 6670','6000','Nokia_6670.gif',319.99E0,'Classic business tools meet your creative streak in the Nokia 6670 imaging smartphone.',2);
INSERT INTO FLEX_PRODUCT VALUES(9,'Nokia 6620','6000','Nokia_6620.gif',329.99E0,'Shoot a basket. Shoot a movie. Video phones from Nokia... the perfect way to save and share life\u2019s playful moments. Feel connected.',10);
INSERT INTO FLEX_PRODUCT VALUES(10,'Nokia 3230 Silver','3000','Nokia_3230_black.gif',500.0E0,'Get creative with the Nokia 3230 smartphone. Create your own ringing tones, print your mobile images, play multiplayer games over a wireless Bluetooth connection, and browse HTML and xHTML Web pages. ',10);
INSERT INTO FLEX_PRODUCT VALUES(11,'Nokia 6680','6000','Nokia_6680.gif',222.0E0,'The Nokia 6680 is an imaging smartphone that',36);
INSERT INTO FLEX_PRODUCT VALUES(12,'Nokia 6630','6000','Nokia_6630.gif',379.0E0,'The Nokia 6630 imaging smartphone is a 1.3 megapixel digital imaging device (1.3 megapixel camera sensor, effective resolution 1.23 megapixels for image capture, image size 1280 x 960 pixels).',8);
INSERT INTO FLEX_PRODUCT VALUES(13,'Nokia 7610 Black','7000','Nokia_7610_black.gif',450.0E0,'The Nokia 7610 imaging phone with its sleek, compact design stands out in any crowd. Cut a cleaner profile with a megapixel camera and 4x digital zoom. Quality prints are all the proof you need of your cutting edge savvy.',20);
INSERT INTO FLEX_PRODUCT VALUES(14,'Nokia 7610 White','7000','Nokia_7610_white.gif',399.99E0,'The Nokia 7610 imaging phone with its sleek, compact design stands out in any crowd. Cut a cleaner profile with a megapixel camera and 4x digital zoom. Quality prints are all the proof you need of your cutting edge savvy.',7);
INSERT INTO FLEX_PRODUCT VALUES(15,'Nokia 6680','6000','Nokia_6680.gif',219.0E0,'The Nokia 6680 is an imaging smartphone.',15);
INSERT INTO FLEX_PRODUCT VALUES(16,'Nokia 9300','9000','Nokia_9300_close.gif',599.0E0,'The Nokia 9300 combines popular voice communication features with important productivity applications in one well-appointed device.',26);
INSERT INTO FLEX_PRODUCT VALUES(17,'Nokia 9500','9000','Nokia_9500_close.gif',799.99E0,'Fast data connectivity with Wireless LAN. Browse the Internet in full color, on a wide, easy-to-view screen. Work with office documents not just email with attachments and memos, but presentations and databases too.',54);
INSERT INTO FLEX_PRODUCT VALUES(18,'Nokia N90','9000','Nokia_N90.gif',499.0E0,'Twist and shoot. It is a pro-photo taker. A personal video-maker. Complete with Carl Zeiss Optics for crisp, bright images you can view, edit, print and share. Meet the Nokia N90.',12);
INSERT INTO FLEX_CONTACT VALUES(10,'Christophe','Coenraets','275 Grove St','Newton','MA   ','02476','617-219-2000','ccoenrae@adobe.com');
INSERT INTO FLEX_CONTACT VALUES(11,'John','Smith','1 Main st','Boston','MA   ','01744','617-219-2001','jsmith@mail.com');
INSERT INTO FLEX_CONTACT VALUES(12,'Lisa','Taylor','501 Townsend st','San Francisco','CA   ','450-151','415-534-7865','ltaylor@mail.com');
INSERT INTO FLEX_CONTACT VALUES(14,'Bill','Johnson','1345 6th street','Chicago','IL   ','','','bjohnson@mail.com');
INSERT INTO FLEX_CONTACT VALUES(15,'Chloe','Rodriguez','34 Elm street','Dallas','TX   ','','415-534-7865','crodriguez@mail.com');
INSERT INTO FLEX_CONTACT VALUES(16,'Jorge','Espinosa','23 Putnam Avenue','Seattle','WA   ','','','jespinosa@mail.com');
INSERT INTO FLEX_CONTACT VALUES(17,'Amy','King','11 Summer st','Miami','FL   ','','','aking@mail.com');
INSERT INTO FLEX_CONTACT VALUES(18,'Boris','Jefferson','222 Spring st','Denver','CO   ','','415-534-7865','bjefferson@mail.com');
INSERT INTO FLEX_CONTACT VALUES(19,'Linda','Madison','564 Winter st','Washington','DC   ','12344','','lmadison@mail.com');

commit;