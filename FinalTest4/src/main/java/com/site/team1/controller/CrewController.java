package com.site.team1.controller;

import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.team1.service.CrewService;
import com.site.team1.vo.CategorySubVo;
import com.site.team1.vo.CrewEntryVo;
import com.site.team1.vo.CrewLikeVo;
import com.site.team1.vo.CrewVo;
import com.site.team1.vo.UserInfoVo;

@Controller

public class CrewController {
	
	@Autowired
	CrewService crewService;
	
//---------------------------------------------------------	
	//크루 인덱스페이지
	@RequestMapping("/crew_index")
	public String crew_index() {
		return"crew/crew_index";
	}
	
//--------------------------------------------------------
	//해당 카테고리 리스트 가져오기
	@RequestMapping("/crew_list")
	public String crew_list_study(@RequestParam int cate_sub_no, Model model) {
		//해당 카테고리 리스트 가져오기
		List<CrewVo> list= crewService.crewStudy(cate_sub_no);
		model.addAttribute("list", list);
		
		//카테고리 이름 가져오기
		CategorySubVo categorySubVo = crewService.cataName(cate_sub_no);
		model.addAttribute("categorySubVo", categorySubVo);

		return "crew/crew_list";
	}//학습크루 리스트 불러오기

//--------------------------------------------------------------
	
	//크루 생성하기 페이지
	@RequestMapping("/crew_write")
		public String crew_write(@RequestParam int u_no, Model model) {
		
		//크루 생성 시 내 프로필 가져오기
		 UserInfoVo userInfoVo = crewService.selectProfile2(u_no);
		 model.addAttribute("userInfoVo", userInfoVo);
		
		return "crew/crew_write";
	}
	
//---------------------------------------------------------------
	//크루 상세보기 게시글 1개 가져오기
	@RequestMapping("/crew_view")
	public String crew_view(@RequestParam int c_no, @RequestParam int u_no, Model model) {
		//System.out.println("넘어온 c_no : "+c_no);
		//System.out.println("넘어온 u_no : "+u_no);
		
		//게시글 1개 가져오기
		 CrewVo crewVo = crewService.selectCrewOne(c_no);
		 model.addAttribute("crewVo", crewVo);
		 
		 //참여하고싶어요 갯수 가져오기
		 List<CrewEntryVo> entrylist= crewService.entryCount(c_no);
		 model.addAttribute("entrylistCount", entrylist.size());
		 //관심있어요 갯수 가져오기
		 List<CrewLikeVo> likelist = crewService.likeCount(c_no);
		 model.addAttribute("likelistCount", likelist.size());
		 
		 //참여 하고 싶어요 눌렀는지 안눌렀는지 확인하고 조건 주기
		 CrewEntryVo crewEntryVo = crewService.checkEnrty(c_no,u_no);
		 model.addAttribute("crewEntryVo", crewEntryVo);
		 //관심 있어요 눌렀는지 안눌렀는지 확인하고 조건 주기
		 CrewLikeVo crewLikeVo = crewService.checkLike(c_no,u_no);
		 model.addAttribute("crewLikeVo", crewLikeVo);
		 
		 //프로필 가져오기
		 UserInfoVo userInfoVo = crewService.selectProfile(c_no);
		 model.addAttribute("userInfoVo", userInfoVo);
		 
		 //참여 희망 인원 리스트에 담아 모달에 뿌리기
		 List<UserInfoVo> modalList= crewService.entryUser(c_no);
		 model.addAttribute("modalList", modalList);
		 
		return "crew/crew_view";
	}//크루 상세보기 게시글 1개 가져오기
	
	
	
	//참여하고 싶어요
	@ResponseBody
	@RequestMapping("/hope")
	public Map<String, Object> hope(CrewEntryVo crewEntryVo) {
		
		Map<String, Object> map = crewService.hope(crewEntryVo);
		return map;
	}
	//관심있어요
	@ResponseBody
	@RequestMapping("/interesting")
	public Map<String, Object> interesting(CrewLikeVo crewLikeVo) {
		Map<String, Object> map = crewService.interesting(crewLikeVo);
		return map;
	}
	
	//참여하고 싶어요 취소
	@ResponseBody
	@RequestMapping("/entryCancle")
	public int entryCancle(@RequestParam int c_entry_no) {
		
		int result = crewService.entryCancle(c_entry_no);
		
		return result;
	}
	
	//관심있어요 취소
	@ResponseBody
	@RequestMapping("/likeCancle")
	public int likeCancle(@RequestParam int c_like_no) {
		int result = crewService.likeCancle(c_like_no);
		return result;
	}
	
	
	
	
	
	
	
	
//----------------------------------------------------------------
	//지도 상세 보기
	@RequestMapping("/map")
	public String map(@RequestParam String address1234, @RequestParam String address5678,
			Model model) {
		//System.out.println(address1234);
		model.addAttribute("address1234", address1234);
		model.addAttribute("address5678", address5678);
		//System.out.println("보내는 값 :"+address1234);
		return "crew/map";
	}//지도보기
	
	
	
	
	
	
	
	
	
	
	
	
}
