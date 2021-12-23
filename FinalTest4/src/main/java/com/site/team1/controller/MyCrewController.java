package com.site.team1.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.team1.service.MyCrewService;
import com.site.team1.vo.CrewEntryVo;
import com.site.team1.vo.CrewLikeVo;
import com.site.team1.vo.CrewVo;

@Controller
public class MyCrewController {

	@Autowired
	MyCrewService myCrewService;
	
	
	@RequestMapping("/mypage_crew_list")
	public String mypage_crew_list(@RequestParam int u_no, Model model) {
		
		//내 크루 전체 갯수, 리스트 가져오기
		List<CrewVo> list = myCrewService.getMyCrew(u_no);
		model.addAttribute("list", list);
		model.addAttribute("listCount", list.size());
		
		//관심 크루 갯수 가져오기
		List<CrewVo> likeList = myCrewService.getCrewLike(u_no);
		model.addAttribute("likeListCount", likeList.size());
		
		//참여하고 싶어요 크루 갯수 가져오기
		List<CrewVo> entryList = myCrewService.getCrewEntry(u_no);
		model.addAttribute("entryListCount", entryList.size());
		
		//진행중 크루 갯수 가져오기
		List<CrewVo> ingList = myCrewService.getIngList(u_no);
		model.addAttribute("ingListCount", ingList.size());
		
		//완료된 크루 갯수 가져오기
		List<CrewVo> endList = myCrewService.getEndList(u_no);
		model.addAttribute("endListCount", endList.size());
		
		//임시저장 크루 갯수 가져오기
		List<CrewVo> Nlist = myCrewService.getNlist(u_no);
		model.addAttribute("NlistCount", Nlist.size());
		
		//모집중 크루 갯수 가져오기
		List<CrewVo> recruitList = myCrewService.getRecruitList(u_no);
		model.addAttribute("recruitList", recruitList.size());
		
		//시작대기 크루 갯수 가져오기
		List<CrewVo> readyList = myCrewService.getReadyList(u_no);
		model.addAttribute("readyList", readyList.size());
		
		return "crew/mypage_crew_list";
	}
	
	// 숫자 버튼 클릭 시 해당 리스트로 변경
	@ResponseBody
	@RequestMapping("/changeCrewList")
	public List<CrewVo> changeCrewList(@RequestParam int u_no, @RequestParam int num,
			Model model) {
		
		List<CrewVo> changeList = myCrewService.getChangeList(u_no, num);
		//System.out.println(changeList);
		model.addAttribute("changeList", changeList);
		
		
		return changeList;
	}
	
	// 해당 크루 삭제 후 있던 페이지로 이동
	@RequestMapping("/crew_delete")
	public int crew_delete(@RequestParam int c_no) {
		
		int result = myCrewService.crewDelete(c_no);
		
		return result;
	}

}
