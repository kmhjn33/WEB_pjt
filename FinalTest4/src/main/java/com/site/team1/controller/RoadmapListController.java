package com.site.team1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.team1.service.RoadmapListService;
import com.site.team1.vo.RoadmapCateSubVo;
import com.site.team1.vo.RoadmapVo;

@Controller
@RequestMapping("/roadmap")
public class RoadmapListController {

	@Autowired
	RoadmapListService roadmapListService;
	
	@Autowired
	HttpSession session;

	// 로드맵 리스트
	@RequestMapping("/my_roadmap")	
	public String my_roadmap(RoadmapVo roadmapVo, Model model) {
		roadmapVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		List<RoadmapCateSubVo> list = roadmapListService.roadmapList(roadmapVo);
		model.addAttribute("list", list);
		model.addAttribute("cate", roadmapVo.getCate_sub_no());
		return "roadmap/my_roadmap";
	}
	
	// 로드맵 생성하기
	@ResponseBody
	@RequestMapping("/roadmapWrite")	
	public Map<String, Object> roadmapWrite(RoadmapVo roadmapVo) {
		
		int result = roadmapListService.roadmapWrite(roadmapVo);
		//System.out.println("result : " + result);
		//roadmapVo.setCate_sub_no(0);
		List<RoadmapCateSubVo> list = roadmapListService.roadmapList(roadmapVo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("roadmapVo", roadmapVo);
		
		return map;
	}

}
