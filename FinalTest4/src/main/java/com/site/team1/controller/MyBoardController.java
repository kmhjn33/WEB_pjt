package com.site.team1.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.team1.service.MyBoardService;

@Controller
public class MyBoardController {
	
	@Autowired
	MyBoardService myBoardService;
	
	@Autowired
	HttpSession session;
	
	Map<String, Object> myBoardMap;

	//게시글 관리 목록
	@GetMapping(value = {"/myboard/{type}", "/myboard"})
	public String myBoardList(@PathVariable(required = false) String type, 
								@RequestParam(required = false, defaultValue = "1") int page, 
								Model model) {
		
		if(type == null) type = "post";
		
		Integer uNo = (Integer)session.getAttribute("session_u_no");

		//작성글 or 작성 댓글 or 추천한 글 리스트, 페이지 계산
		myBoardMap = myBoardService.myBoardList(type, page, uNo);
		model.addAttribute("myBoardMap", myBoardMap);
		
		return "/board/myboard";
	}
	
	
}
