----------------------DDL
--테이블 삭제
DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE COMPANY CASCADE CONSTRAINTS;
DROP TABLE RECRUITMENT CASCADE CONSTRAINTS;

--시퀀스 삭제
DROP SEQUENCE SEQ_USER;
DROP SEQUENCE SEQ_COMPANY;
DROP SEQUENCE SEQ_NOTICE;

--시퀀스 생성
CREATE SEQUENCE SEQ_USER NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_COMPANY NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_NOTICE NOCACHE NOCYCLE;


--사용자
CREATE TABLE USERS (
	NO	            NUMBER	            PRIMARY KEY
	,USER_ID	    VARCHAR(255)        NOT NULL UNIQUE	
	,APPLY_YN	    CHAR(1)	            DEFAULT 'N' CHECK(APPLY_YN IN ('Y', 'N')) 
	,APPLY_COMPANY_NAME	VARCHAR(255)	NULL
);


--회사
CREATE TABLE COMPANY (
	COM_ID	NUMBER	PRIMARY KEY
	,NAME	VARCHAR(255)	NOT NULL UNIQUE
);


--공고
CREATE TABLE RECRUITMENT (
    NOTICE_ID   NUMBER          PRIMARY KEY 
    ,COM_ID	    NUMBER      	NOT NULL
	,POSITION	VARCHAR(255)	NOT NULL
	,REWARD	    VARCHAR(255)	NOT NULL
	,SKILL	    VARCHAR(255)	NOT NULL
	,DEL_YN	    CHAR(1)	        DEFAULT 'N' CHECK(DEL_YN IN ('Y', 'N'))
	,DETAIL	    VARCHAR(2000)	NULL
	,NATION	    VARCHAR(255)	NOT NULL
	,AREA	    VARCHAR(255)	NOT NULL
);

--외래키
ALTER TABLE RECRUITMENT
ADD CONSTRAINT FK_COM_ID
FOREIGN KEY (COM_ID)
REFERENCES COMPANY(COM_ID);

---------------------더미
--사용자
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user01');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user02');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user03');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user04');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user05');


--회사
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '네이버');
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '카카오');
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '배달의민족');
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '토스');
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '당근');

--공고
--네이버
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    NATION,
    AREA,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'AI 검색 모델링 담당자'     
    ,'1500000'    
    ,'Python'                            
    ,'검색 모델링 분야에서 5년 이상의 경력을 보유하신 분.' 
    ,'한국'            
    ,'제주도'                  
    ,1                       
);
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    NATION,
    AREA,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'딥러닝 모델 경량화 연구'     
    ,'2000000'    
    ,'Python'                            
    ,'관련 분야 석/박사 과정 대학원생 또는 연구/개발 경험이 있는 분.' 
    ,'한국'            
    ,'강남'                  
    ,1                       
);

--카카오
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    NATION,
    AREA,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'MySQL Platform Engineer'     
    ,'1500000'    
    ,'Java'                            
    ,'연구생 또는 개인 프로젝트로 RDBMS, OS, 파일 시스템에 대한 연구/분석해본 경험이 있으신 분' 
    ,'한국'            
    ,'제주도'                  
    ,2                       
);

--배달의민족
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    NATION,
    AREA,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'배민공통서비스개발팀 서버 개발자'     
    ,'1700000'    
    ,'Kotlin'                            
    ,'웹 애플리케이션 개발 및 운영 경험자로서 실무 5년 이상 또는 그에 준하는 역량을 보유한 분' 
    ,'한국'            
    ,'잠실'                  
    ,3                       
);

INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    NATION,
    AREA,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'셀러서비스실 세일즈서비스팀 웹프론트엔드 개발자'     
    ,'1500000'    
    ,'React'                            
    ,'반응형 디자인, 웹 접근성, 웹 표준을 고려한 개발 경험이 있으면 좋습니다.' 
    ,'한국'            
    ,'잠실'                  
    ,3                       
);

--토스
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    NATION,
    AREA,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'Data Analyst'     
    ,'1500000'    
    ,'ORACLE'                            
    ,'다양한 데이터를 주도적으로 탐색하고 여러 데이터를 종합하여 논리적 해석을 하실 수 있는 분이 필요해요.' 
    ,'한국'            
    ,'역삼'                  
    ,4                       
);

--당근
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    NATION,
    AREA,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'공통 서비스 개발'     
    ,'1500000'    
    ,'Kotlin'                            
    ,'공통서비스개발팀은 당근을 구성하는 서비스들이 공통으로 활용하는 백엔드 애플리케이션을 개발해요.' 
    ,'한국'            
    ,'구로'                  
    ,5                       
);
commit;
