package com.site.team1.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.team1.service.CrewBoardService;
import com.site.team1.vo.CrewBoardVo;

@Controller
public class CrewBoardController {
	
	@Autowired
	CrewBoardService crewBoardService;
	
	@Autowired
	HttpSession session;
	
	Map<String, Object> map;
	
	@RequestMapping("/crew_board")
	public String crewBoard(CrewBoardVo crewBoardVo, 
							@RequestParam(required = false, defaultValue = "1") int page,
							@RequestParam(required = false) String searchWord,
							Model model) {

		//크루 정보, 크루 보드 글 가져오기
		map = crewBoardService.crewBoard(crewBoardVo, page, searchWord);
		
		model.addAttribute("map", map);
		
		return "/crew/crew_board";
	}
	
}
