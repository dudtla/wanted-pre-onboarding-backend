----------------------DDL
--���̺� ����
DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE COMPANY CASCADE CONSTRAINTS;
DROP TABLE RECRUITMENT CASCADE CONSTRAINTS;

--������ ����
DROP SEQUENCE SEQ_USERS;
DROP SEQUENCE SEQ_COMPANY;
DROP SEQUENCE SEQ_NOTICE;

--������ ����
CREATE SEQUENCE SEQ_USERS NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_COMPANY NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_NOTICE NOCACHE NOCYCLE;


--ȸ��
CREATE TABLE COMPANY (
	COM_ID	    NUMBER	PRIMARY KEY
	,NAME	    VARCHAR(255)	NOT NULL UNIQUE
    ,NATION	    VARCHAR(255)	NOT NULL
	,AREA	    VARCHAR(255)	NOT NULL
);


--����
CREATE TABLE RECRUITMENT (
    NOTICE_ID   NUMBER          PRIMARY KEY 
    ,COM_ID	    NUMBER      	NOT NULL
	,POSITION	VARCHAR(255)	NOT NULL
	,REWARD	    VARCHAR(255)	NOT NULL
	,SKILL	    VARCHAR(255)	NOT NULL
	,DEL_YN	    CHAR(1)	        DEFAULT 'N' CHECK(DEL_YN IN ('Y', 'N'))
	,DETAIL	    VARCHAR(2000)	NULL
);

--�����
CREATE TABLE USERS (
	NO	                NUMBER	            PRIMARY KEY
	,USER_ID	        VARCHAR(255)        NOT NULL UNIQUE	
	,APPLY_YN	        CHAR(1)	            DEFAULT 'N' CHECK(APPLY_YN IN ('Y', 'N')) 
	,APPLY_NOTICE_ID	NUMBER	            NULL
);

--�ܷ�Ű
ALTER TABLE RECRUITMENT
ADD CONSTRAINT FK_COM_ID
FOREIGN KEY (COM_ID)
REFERENCES COMPANY(COM_ID);

ALTER TABLE USERS
ADD CONSTRAINT FK_NOTICE_ID
FOREIGN KEY (APPLY_NOTICE_ID)
REFERENCES RECRUITMENT(NOTICE_ID);

---------------------����
--�����
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user01');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user02');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user03');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user04');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user05');


--ȸ��
INSERT INTO COMPANY (COM_ID, NAME, NATION, AREA) VALUES (SEQ_COMPANY.NEXTVAL, '���̹�', '�ѱ�', '�Ǳ�');
INSERT INTO COMPANY (COM_ID, NAME, NATION, AREA) VALUES (SEQ_COMPANY.NEXTVAL, 'īī��', '�ѱ�', '���ֵ�');
INSERT INTO COMPANY (COM_ID, NAME, NATION, AREA) VALUES (SEQ_COMPANY.NEXTVAL, '����ǹ���', '�ѱ�', '���');
INSERT INTO COMPANY (COM_ID, NAME, NATION, AREA) VALUES (SEQ_COMPANY.NEXTVAL, '�佺' , '�ѱ�', '����');
INSERT INTO COMPANY (COM_ID, NAME, NATION, AREA) VALUES (SEQ_COMPANY.NEXTVAL, '���', '�ѱ�', '����');

--����
--���̹�
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'AI �˻� �𵨸� �����'     
    ,'1500000'    
    ,'Python'                            
    ,'�˻� �𵨸� �о߿��� 5�� �̻��� ����� �����Ͻ� ��.'                  
    ,1                       
);
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'������ �� �淮ȭ ����'     
    ,'2000000'    
    ,'Python'                            
    ,'���� �о� ��/�ڻ� ���� ���п��� �Ǵ� ����/���� ������ �ִ� ��.'                   
    ,1                       
);

--īī��
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'MySQL Platform Engineer'     
    ,'1500000'    
    ,'Java'                            
    ,'������ �Ǵ� ���� ������Ʈ�� RDBMS, OS, ���� �ý��ۿ� ���� ����/�м��غ� ������ ������ ��'                  
    ,2                       
);

--����ǹ���
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'��ΰ��뼭�񽺰����� ���� ������'     
    ,'1700000'    
    ,'Kotlin'                            
    ,'�� ���ø����̼� ���� �� � �����ڷμ� �ǹ� 5�� �̻� �Ǵ� �׿� ���ϴ� ������ ������ ��'                 
    ,3                       
);

INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'�������񽺽� ��������� ������Ʈ���� ������'     
    ,'1500000'    
    ,'React'                            
    ,'������ ������, �� ���ټ�, �� ǥ���� ����� ���� ������ ������ �����ϴ�.'                 
    ,3                       
);

--�佺
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'Data Analyst'     
    ,'1500000'    
    ,'ORACLE'                            
    ,'�پ��� �����͸� �ֵ������� Ž���ϰ� ���� �����͸� �����Ͽ� ���� �ؼ��� �Ͻ� �� �ִ� ���� �ʿ��ؿ�.'                   
    ,4                       
);

--���
INSERT INTO RECRUITMENT (
    NOTICE_ID,
    POSITION,
    REWARD,
    SKILL,
    DETAIL,
    COM_ID
) VALUES (
    SEQ_NOTICE.NEXTVAL
    ,'���� ���� ����'     
    ,'1500000'    
    ,'Kotlin'                            
    ,'���뼭�񽺰������� ����� �����ϴ� ���񽺵��� �������� Ȱ���ϴ� �鿣�� ���ø����̼��� �����ؿ�.'                 
    ,5                       
);
commit;
