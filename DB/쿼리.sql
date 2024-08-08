-------------------사용자-------------------
--공고 목록 가져오기
SELECT 
    R.NOTICE_ID AS "채용공고_ID",
    C.NAME AS "회사명",
    C.NATION AS "국가",
    C.AREA AS "지역",
    R.POSITION AS "채용포지션",
    R.REWARD AS "채용보상금",
    R.SKILL AS "사용기술"
FROM 
    RECRUITMENT R
JOIN 
    COMPANY C ON R.COM_ID = C.COM_ID;
    
--검색
--기술: LOWER 함수 사용하여 대소문자 구분없이 검색 가능
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

--회사
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
    C.NAME LIKE '%당근%';

--상세조회
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

--공고지원
UPDATE USERS
SET 
    APPLY_YN = 'Y',
    APPLY_NOTICE_ID = 3  --공고번호
WHERE 
    NO = 1;  --유저번호

--중복 체크 여부
SELECT APPLY_YN 
FROM USERS
WHERE NO = 1; 



-------------------회사-------------------
--공고등록
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

--공고수정
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
    NOTICE_ID = 8;  -- 업데이트할 공고번호

--공고삭제
DELETE FROM RECRUITMENT
WHERE NOTICE_ID = 8;
    

