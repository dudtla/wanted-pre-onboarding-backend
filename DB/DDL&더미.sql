----------------------DDL
--���̺� ����
DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE COMPANY CASCADE CONSTRAINTS;
DROP TABLE RECRUITMENT CASCADE CONSTRAINTS;

--������ ����
DROP SEQUENCE SEQ_USER;
DROP SEQUENCE SEQ_COMPANY;
DROP SEQUENCE SEQ_NOTICE;

--������ ����
CREATE SEQUENCE SEQ_USER NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_COMPANY NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_NOTICE NOCACHE NOCYCLE;


--�����
CREATE TABLE USERS (
	NO	            NUMBER	            PRIMARY KEY
	,USER_ID	    VARCHAR(255)        NOT NULL UNIQUE	
	,APPLY_YN	    CHAR(1)	            DEFAULT 'N' CHECK(APPLY_YN IN ('Y', 'N')) 
	,APPLY_COMPANY_NAME	VARCHAR(255)	NULL
);


--ȸ��
CREATE TABLE COMPANY (
	COM_ID	NUMBER	PRIMARY KEY
	,NAME	VARCHAR(255)	NOT NULL UNIQUE
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
	,NATION	    VARCHAR(255)	NOT NULL
	,AREA	    VARCHAR(255)	NOT NULL
);

--�ܷ�Ű
ALTER TABLE RECRUITMENT
ADD CONSTRAINT FK_COM_ID
FOREIGN KEY (COM_ID)
REFERENCES COMPANY(COM_ID);

---------------------����
--�����
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user01');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user02');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user03');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user04');
INSERT INTO USERS (NO, USER_ID) VALUES (SEQ_USER.NEXTVAL, 'user05');


--ȸ��
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '���̹�');
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, 'īī��');
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '����ǹ���');
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '�佺');
INSERT INTO COMPANY (COM_ID, NAME) VALUES (SEQ_COMPANY.NEXTVAL, '���');

--����
--���̹�
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
    ,'AI �˻� �𵨸� �����'     
    ,'1500000'    
    ,'Python'                            
    ,'�˻� �𵨸� �о߿��� 5�� �̻��� ����� �����Ͻ� ��.' 
    ,'�ѱ�'            
    ,'���ֵ�'                  
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
    ,'������ �� �淮ȭ ����'     
    ,'2000000'    
    ,'Python'                            
    ,'���� �о� ��/�ڻ� ���� ���п��� �Ǵ� ����/���� ������ �ִ� ��.' 
    ,'�ѱ�'            
    ,'����'                  
    ,1                       
);

--īī��
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
    ,'������ �Ǵ� ���� ������Ʈ�� RDBMS, OS, ���� �ý��ۿ� ���� ����/�м��غ� ������ ������ ��' 
    ,'�ѱ�'            
    ,'���ֵ�'                  
    ,2                       
);

--����ǹ���
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
    ,'��ΰ��뼭�񽺰����� ���� ������'     
    ,'1700000'    
    ,'Kotlin'                            
    ,'�� ���ø����̼� ���� �� � �����ڷμ� �ǹ� 5�� �̻� �Ǵ� �׿� ���ϴ� ������ ������ ��' 
    ,'�ѱ�'            
    ,'���'                  
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
    ,'�������񽺽� ��������� ������Ʈ���� ������'     
    ,'1500000'    
    ,'React'                            
    ,'������ ������, �� ���ټ�, �� ǥ���� ����� ���� ������ ������ �����ϴ�.' 
    ,'�ѱ�'            
    ,'���'                  
    ,3                       
);

--�佺
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
    ,'�پ��� �����͸� �ֵ������� Ž���ϰ� ���� �����͸� �����Ͽ� ���� �ؼ��� �Ͻ� �� �ִ� ���� �ʿ��ؿ�.' 
    ,'�ѱ�'            
    ,'����'                  
    ,4                       
);

--���
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
    ,'���� ���� ����'     
    ,'1500000'    
    ,'Kotlin'                            
    ,'���뼭�񽺰������� ����� �����ϴ� ���񽺵��� �������� Ȱ���ϴ� �鿣�� ���ø����̼��� �����ؿ�.' 
    ,'�ѱ�'            
    ,'����'                  
    ,5                       
);
commit;
