package com.wanted.recruitmentApp.service;


import com.wanted.recruitmentApp.dao.AppDao;
import com.wanted.recruitmentApp.vo.AppVo;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AppService {

    private final AppDao dao;

    //공고 등록
    public int enroll(AppVo vo) {
        int result = dao.enroll(vo);
        return result;
    }

    //공고 수정
    public int edit(AppVo vo) {
        int resutl = dao.edit(vo);
        return resutl;
    }

    //공고 삭제
    public int delete(@Param("noticeId") String no) {
        int result = dao.delete(no);
        return result;
    }

    //공고 목록 조회
    public List<AppVo> listAll() {
        return dao.listAll();
    }

    //공고 검색(기술 or 회사명)
    public List<AppVo> search(String skill, String name) {

        //null이 아닐때 $$ skill이 빈 문자열이 아닐때 => 왜 null도 체크해야 하나?빈 문자열만 체크하면 null인경우 예외 발생 할 수 있다.
        //skill 이나 회사명 둘 중 하나로 검색하기
        if(skill != null && !skill.isEmpty()){
            return dao.searchBySkill(skill);
        } else if (name != null && !name.isEmpty()) {
            return dao.searchByName(name);
        }else{
            throw new IllegalArgumentException();
        }

    }


    //상세조회
    public List<AppVo> detail(String noticeId) {
        return dao.detail(noticeId);
    }

    //채용신청
    public int apply(AppVo vo) {

        //채용 신청 중복 검사
        String applyYn = dao.checkApply(vo);
        if("Y".equals((applyYn))){
            return 0;
        }

        return dao.apply(vo);
    }
}

