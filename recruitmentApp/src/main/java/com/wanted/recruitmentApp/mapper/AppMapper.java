package com.wanted.recruitmentApp.mapper;


import com.wanted.recruitmentApp.vo.AppVo;
import java.util.List;
import org.apache.ibatis.annotations.*;

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
}
