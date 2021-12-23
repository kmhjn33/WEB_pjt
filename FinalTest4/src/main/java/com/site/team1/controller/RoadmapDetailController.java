package com.site.team1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.team1.service.RoadmapDetailService;
import com.site.team1.vo.RoadmapCateSubVo;
import com.site.team1.vo.RoadmapDetailOutVo;
import com.site.team1.vo.RoadmapDetailVo;
import com.site.team1.vo.RoadmapVo;
import com.site.team1.vo.SubjectVo;
import com.site.team1.vo.TextbookVo;

@Controller
@RequestMapping("/roadmap")
public class RoadmapDetailController {

	@Autowired
	RoadmapDetailService roadmapDetailService;

	@Autowired
	HttpSession session;
	
	// 로드맵 제목 변경
	@ResponseBody
	@RequestMapping("/modiTitle")
	public RoadmapVo modiTitle(RoadmapVo roadmapVo) {
		int result = roadmapDetailService.modiTitle(roadmapVo);
		
		// 수정된 로드맵 리스트
		RoadmapVo modiRoadmap = roadmapDetailService.modiRoadmapList(roadmapVo);
		return modiRoadmap;
	}

	// 세부 로드맵 리스트
	@RequestMapping("/roadmap_detail")
	public Map<String, Object> roadmapDetail(RoadmapVo roadmapVo, RoadmapDetailVo roadmapDetailVo, RoadmapDetailOutVo roadmapDetailOutVo){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 사이드바 로드맵 리스트
		List<RoadmapVo> list = roadmapDetailService.roadmapList(roadmapVo);
		
		// 세부 로드맵 리스트
		List<RoadmapDetailVo> rdList = roadmapDetailService.roadmapDetail(roadmapDetailVo);
		
		// 과목 리스트
		List<SubjectVo> sList = roadmapDetailService.selectSubject();
		
		// 교재 리스트
		List<TextbookVo> tList = roadmapDetailService.selectTextbook(roadmapVo);
		
		// 시작전 카운트
		int sCount = roadmapDetailService.startCount(roadmapDetailVo);
		
		// 진행중 카운트
		int iCount = roadmapDetailService.ingCount(roadmapDetailVo);
		
		// 완료 카운트
		int eCount = roadmapDetailService.endCount(roadmapDetailVo);
		
		// 상태없음 카운트
		int nCount = roadmapDetailService.noneCount(roadmapDetailVo);
		
		map.put("list", list);
		map.put("rdList", rdList);
		map.put("sList", sList);
		map.put("tList", tList);
		map.put("sCount", sCount);
		map.put("iCount", iCount);
		map.put("eCount", eCount);
		map.put("nCount", nCount);
		
		return map;
	}
	
	// 교재 저장
	@ResponseBody
	@RequestMapping("/subjectWrite")
	public List<TextbookVo> subjectWrite(TextbookVo textbookVo, RoadmapVo roadmapVo) {
		
		int result = roadmapDetailService.subjectWrite(textbookVo);
		
		// 교재 리스트
		List<TextbookVo> tList = roadmapDetailService.selectTextbook(roadmapVo);
		return tList;
	}
	
	// 세부 로드맵 저장
	@ResponseBody
	@RequestMapping("/detailWrite")
	public List<RoadmapDetailVo> detailRoadmapWrite(RoadmapDetailVo roadmapDetailVo){
		
		int result = roadmapDetailService.detailRoadmapWrite(roadmapDetailVo);	
		
		// 세부 축약 로드맵 리스트
		List<RoadmapDetailVo> rdList = roadmapDetailService.roadmapDetail(roadmapDetailVo);	
		//System.out.println("rdList : " + rdList);
		return rdList;		
	}
	
	// 세부 로드맵 삭제
	@ResponseBody
	@RequestMapping("/detailroadmapDel")
	public int detailroadmapDel(RoadmapDetailVo roadmapDetailVo) {
		
		int result = roadmapDetailService.detailroadmapDel(roadmapDetailVo);	
		return result;
	}
	
	// 수정 모달창에 값 가져오기
	@ResponseBody
	@RequestMapping("/inModi")
	public RoadmapDetailVo inModi(RoadmapDetailVo roadmapDetailVo) {
		
		// 세부 모달 리스트
		RoadmapDetailVo inList = roadmapDetailService.inModi(roadmapDetailVo);
		//System.out.println("inList : " + inList);
		return inList;
	}
	
	// 세부 로드맵 수정
	@ResponseBody
	@RequestMapping("/detailModi")
	public RoadmapDetailVo detailModi(RoadmapDetailVo roadmapDetailVo) {
		
		int result = roadmapDetailService.detailModi(roadmapDetailVo);
		
		// 세부 모달 리스트 
		RoadmapDetailVo inList = roadmapDetailService.inModi(roadmapDetailVo); 
		return inList;
	}
	
	@ResponseBody
	@RequestMapping("/count_state")
	public Map<String, Object> count_state(RoadmapDetailVo roadmapDetailVo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 시작전 카운트
		int sCount = roadmapDetailService.startCount(roadmapDetailVo);
		
		// 진행중 카운트
		int iCount = roadmapDetailService.ingCount(roadmapDetailVo);
		
		// 완료 카운트
		int eCount = roadmapDetailService.endCount(roadmapDetailVo);
		
		// 상태없음 카운트
		int nCount = roadmapDetailService.noneCount(roadmapDetailVo);
		
		map.put("sCount", sCount); 
		map.put("iCount", iCount); 
		map.put("eCount", eCount); 
		map.put("nCount", nCount); 
		
		return map;
	}
	
	// 로드맵 삭제
	@ResponseBody
	@RequestMapping("/roadmapDel")
	public RoadmapVo roadmapDel(RoadmapVo roadmapVo, RoadmapDetailVo roadmapDetailVo) {
		// 삭제시 이전 로드맵 가져오기
		RoadmapVo preRoadmap = roadmapDetailService.preRoadmapList(roadmapVo);

		int result = roadmapDetailService.roadmapDel(roadmapDetailVo);			
		return preRoadmap;
	}
	
	//로드맵 드래그 앤 드롭
	@ResponseBody
	@RequestMapping("/detailroadmapDrag")
	public int detailroadmapDrag(RoadmapDetailVo roadmapDetailVo) {
		//로드맵 세부 상태 변경
		int result = roadmapDetailService.detailroadmapDrag(roadmapDetailVo);			
		return result;
	}
	
}
