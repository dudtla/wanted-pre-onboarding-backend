-------------------�����-------------------
--���� ��� ��������
SELECT 
    R.NOTICE_ID AS "ä�����_ID",
    C.NAME AS "ȸ���",
    C.NATION AS "����",
    C.AREA AS "����",
    R.POSITION AS "ä��������",
    R.REWARD AS "ä�뺸���",
    R.SKILL AS "�����"
FROM 
    RECRUITMENT R
JOIN 
    COMPANY C ON R.COM_ID = C.COM_ID;
    
--�˻�
--���: LOWER �Լ� ����Ͽ� ��ҹ��� ���о��� �˻� ����
SELECT 
    R.NOTICE_ID,
    C.NAME AS COMPANY_NAME,
    C.NATION,
    C.AREA,
    R.POSITION,
    R.REWARD,
    R.SKILL
FROM 
    RECRUITMENT R
JOIN 
    COMPANY C ON R.COM_ID = C.COM_ID
WHERE 
    LOWER(R.SKILL) LIKE LOWER('%PYthon%');

--ȸ��
SELECT 
    R.NOTICE_ID,
    C.NAME,
    C.NATION,
    C.AREA,
    R.POSITION,
    R.REWARD,
    R.SKILL
FROM 
    RECRUITMENT R
JOIN 
    COMPANY C ON R.COM_ID = C.COM_ID
WHERE 
    C.NAME LIKE '%���%';

--����ȸ
SELECT 
    R.NOTICE_ID,
    C.NAME,
    C.NATION,
    C.AREA,
    R.POSITION,
    R.REWARD,
    R.SKILL,
    R.DETAIL
FROM 
    RECRUITMENT R
JOIN 
    COMPANY C ON R.COM_ID = C.COM_ID
WHERE 
    R.NOTICE_ID = 1;

--��������
UPDATE USERS
SET 
    APPLY_YN = 'Y',
    APPLY_NOTICE_ID = 3  --�����ȣ
WHERE 
    NO = 1;  --������ȣ

--�ߺ� üũ ����
SELECT APPLY_YN 
FROM USERS
WHERE NO = 1; 



-------------------ȸ��-------------------
--������
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
    ,'test'     
    ,'test'    
    ,'test'                            
    ,'test' 
    ,'test'            
    ,'test'                  
    ,1                       
);

--�������
UPDATE RECRUITMENT
SET 
    POSITION = 'test11',
    REWARD = 'test11',
    SKILL = 'test11',
    DETAIL = 'test11',
    NATION = 'test11',
    AREA = 'test11',
    COM_ID = 1
WHERE 
    NOTICE_ID = 8;  -- ������Ʈ�� �����ȣ

--�������
DELETE FROM RECRUITMENT
WHERE NOTICE_ID = 8;
    

