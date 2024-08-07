package com.wanted.recruitmentApp.controller;


import com.wanted.recruitmentApp.service.AppService;
import com.wanted.recruitmentApp.vo.AppVo;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("wanted")
@RequiredArgsConstructor
public class AppController {

    private final AppService service;
    //회사
    //채용공고 등록
    @PostMapping
    public int enroll(AppVo vo){
        //회사번호를 1번으로 임의로 지정
        String comId = "1";
        vo.setComId(comId);

        int result = service.enroll(vo);

        return result;

    }

    //채용공고 수정
    @PutMapping
    public ResponseEntity<String> edit(AppVo vo){
        //회사번호를 1번으로 임의로 지정
        String comId = "1";
        vo.setComId(comId);

        int result = service.edit(vo);

        if(result > 0){
            return ResponseEntity.ok("edit success!");
        }else{
            return ResponseEntity.ok("edit fail...");
        }
    }

    //채용공고 삭제
    @DeleteMapping
    public ResponseEntity<String> delete(@Param("noticeId") String no){
        int result = service.delete(no);

        if(result > 0 ){
            return ResponseEntity.ok("delete success!");
        }else{
            return ResponseEntity.ok("delete fail...");
        }

    }


    //사용자
    //채용공고 목록조회
    @GetMapping("list")
    public List<AppVo> listAll(){
        List<AppVo> voList = service.listAll();
        return voList;
    }

    //채용공고 상세 조회

    //채용공고 검색(기술 or 회사명)
    @GetMapping("search")
    public List<AppVo> search(@RequestParam(value = "skill", required = false) String skill,
                              @RequestParam(value = "name", required = false) String name){
        List<AppVo> voList = service.search(skill, name);
        System.out.println("@@@@@@@@@@@@@@@@@@@@@skill = " + skill + ", name = " + name);
        System.out.println("@@@@@@@@@@22voList = " + voList);
        return voList;
    }

    //채용공고 지원
}
