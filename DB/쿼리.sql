-------------------�����-------------------
--���� ��� ��������
SELECT 
    R.NOTICE_ID AS "ä�����_ID",
    C.NAME AS "ȸ���",
    R.NATION AS "����",
    R.AREA AS "����",
    R.POSITION AS "ä��������",
    R.REWARD AS "ä�뺸���",
    R.SKILL AS "�����"
FROM 
    RECRUITMENT R
JOIN 
    COMPANY C ON R.COM_ID = C.COM_ID;
    
--�˻�
SELECT 
    R.NOTICE_ID,
    C.NAME,
    R.NATION,
    R.AREA,
    R.POSITION,
    R.REWARD,
    R.SKILL
FROM 
    RECRUITMENT R
JOIN 
    COMPANY C ON R.COM_ID = C.COM_ID
WHERE 
    R.SKILL LIKE '%Python%'; 

--����ȸ
SELECT 
    R.NOTICE_ID AS "ä�����_ID",
    C.NAME AS "ȸ���",
    R.NATION AS "����",
    R.AREA AS "����",
    R.POSITION AS "ä��������",
    R.REWARD AS "ä�뺸���",
    R.SKILL AS "�����",
    R.DETAIL AS "�󼼳���"
FROM 
    RECRUITMENT R
JOIN 
    COMPANY C ON R.COM_ID = C.COM_ID
WHERE 
    R.NOTICE_ID = 1
    OR R.COM_ID = 1;
    
--��������
UPDATE USERS
SET 
    APPLY_YN = 'N',
    APPLY_NO = 3  --�����ȣ
WHERE 
    NO = 1;  --������ȣ


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
    

