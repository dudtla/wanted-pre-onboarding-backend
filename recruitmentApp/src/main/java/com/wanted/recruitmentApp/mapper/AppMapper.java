package com.wanted.recruitmentApp.mapper;


import com.wanted.recruitmentApp.vo.AppVo;
import java.util.List;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestParam;

@Mapper
public interface AppMapper {

    //공고 등록
    @Insert("""
            INSERT INTO RECRUITMENT (
                NOTICE_ID,
                POSITION,
                REWARD,
                SKILL,
                DETAIL,
                COM_ID
            ) VALUES (
                SEQ_NOTICE.NEXTVAL
                ,#{position}    \s
                ,#{reward}      \s
                ,#{skill}       \s
                ,#{detail}      \s
                ,#{comId}       \s
            )
            """)
    int enroll(AppVo vo);

    //공고 수정
    @Update("""
            UPDATE RECRUITMENT
            SET\s
                POSITION = #{position},
                REWARD = #{reward},
                SKILL = #{skill},
                DETAIL = #{detail},
                COM_ID = #{comId}
            WHERE\s
                NOTICE_ID = #{noticeId}
            """)
    int edit(AppVo vo);


    //공고 삭제
    @Delete("""
            DELETE FROM RECRUITMENT
            WHERE NOTICE_ID = #{noticeId}
            """)
    int delete(@Param("noticeId") String no);


    //공고 목록 조회
    @Select("""
            SELECT\s
                R.NOTICE_ID,
                C.NAME,
                C.NATION,
                R.POSITION,
                C.AREA,
                R.REWARD,
                R.SKILL
            FROM\s
                RECRUITMENT R
            JOIN\s
                COMPANY C ON R.COM_ID = C.COM_ID
            """)
    List<AppVo> listAll();


    //기술로 검색하기
    @Select("""
            SELECT\s
                        R.NOTICE_ID,
                        C.NAME AS COMPANY_NAME,
                        C.NATION,
                        C.AREA,
                        R.POSITION,
                        R.REWARD,
                        R.SKILL
                    FROM\s
                        RECRUITMENT R
                    JOIN\s
                        COMPANY C ON R.COM_ID = C.COM_ID
                    WHERE\s
                        LOWER(R.SKILL) LIKE LOWER('%' || #{skill} || '%')
            """)
    List<AppVo> searchBySkill(String skill);

    //회사명으로 검색하기
    @Select("""
            SELECT\s
                R.NOTICE_ID,
                C.NAME,
                C.NATION,
                C.AREA,
                R.POSITION,
                R.REWARD,
                R.SKILL
            FROM\s
                RECRUITMENT R
            JOIN\s
                COMPANY C ON R.COM_ID = C.COM_ID
            WHERE\s
                C.NAME LIKE('%' || #{name} || '%')
            """)
    List<AppVo> searchByName(String name);


    //상세조회
    @Select("""
            SELECT\s
                R.NOTICE_ID,
                C.NAME,
                C.NATION,
                C.AREA,
                R.POSITION,
                R.REWARD,
                R.SKILL,
                R.DETAIL
            FROM\s
                RECRUITMENT R
            JOIN\s
                COMPANY C ON R.COM_ID = C.COM_ID
            WHERE\s
                R.NOTICE_ID = #{noticeId}
            """)
    List<AppVo> detail(String noticeId);


    //채용신청
    @Update("""
            UPDATE USERS
            SET\s
                APPLY_YN = 'Y',
                APPLY_NOTICE_ID = #{applyNoticeId}
            WHERE\s
                NO = #{no}
            """)
    int apply(AppVo vo);

    //채용 중복 검사
    @Select("""
            SELECT APPLY_YN\s
            FROM USERS
            WHERE NO = #{no}
            """)
    String checkApply(AppVo vo);
}
