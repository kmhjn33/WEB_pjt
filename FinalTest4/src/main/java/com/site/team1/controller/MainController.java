package com.site.team1.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.team1.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;

	@RequestMapping(value={"/main", "/"})
	public String main(Model model) {
		
		//게시판별 최근 등록된 글 4개, 최근 생성 크루 8개 가져오기
		Map<String, Object> map = mainService.mainList();
		model.addAttribute("map", map);
		
		return "main";
	}
	
}
