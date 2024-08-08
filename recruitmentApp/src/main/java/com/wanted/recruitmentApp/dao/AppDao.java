package com.wanted.recruitmentApp.dao;


import com.wanted.recruitmentApp.mapper.AppMapper;
import com.wanted.recruitmentApp.vo.AppVo;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class AppDao {

    private final AppMapper mapper;

    //공고 등록
    public int enroll(AppVo vo) {
        int result = mapper.enroll(vo);
        return result;
    }

    //공고 수정
    public int edit(AppVo vo) {
        int result = mapper.edit(vo);
        return result;
    }

    //공고 삭제
    public int delete(@Param("noticeId") String no) {
        int result = mapper.delete(no);
        return result;
    }

    //공고 목록 조회
    public List<AppVo> listAll() {
        return mapper.listAll();

    }


    //기술로 검색
    public List<AppVo> searchBySkill(String skill) {
        return mapper.searchBySkill(skill);
    }

    //회사명으로 검색
    public List<AppVo> searchByName(String name) {
        return mapper.searchByName(name);
    }

    //상세조회
    public List<AppVo> detail(String noticeId) {
        return mapper.detail(noticeId);
    }

    //채용신청
    public int apply(AppVo vo) {
        return mapper.apply(vo);
    }

    //채용 중복 신청 확인
    public String checkApply(AppVo vo) {
        return mapper.checkApply(vo);
    }
}
