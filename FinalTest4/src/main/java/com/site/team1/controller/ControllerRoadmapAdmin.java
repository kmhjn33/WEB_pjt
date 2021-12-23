package com.site.team1.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.site.team1.service.RoadmapAdminService;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.CategorySubAdminVo;
import com.site.team1.vo.RoadmapAdminChartVo1;
import com.site.team1.vo.RoadmapAdminChartVo2;
import com.site.team1.vo.RoadmapDetailAdminVo;
import com.site.team1.vo.SubjectAdminVo;

@Controller
public class ControllerRoadmapAdmin {

	@Autowired
	RoadmapAdminService roadmapAdminService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/admin/roadmap_info")
	public String roadmap_info( HttpServletRequest request, BoardNumberVo nDto ,Model model ) {
		
		HttpSession session=request.getSession();
		session.setAttribute("session_u_name", session.getAttribute("session_u_name"));
		session.setAttribute("session_u_detail_no", session.getAttribute("session_u_detail_no"));
		
		System.out.println("StartDate : " + nDto.getR_detail_startdate());
		System.out.println("EndDate : " + nDto.getR_detail_enddate());
		
		
		
		// 분류 정보
			List<CategorySubAdminVo> clist= null ; 
		// 과목 정보
			List<SubjectAdminVo> slist=null; 
		// 로드맵 정보
			List<RoadmapDetailAdminVo> rlist=null; 
			
			try {
				clist = roadmapAdminService.selectCateSub();
				System.out.println("CateSubList :" + clist.size() );
				slist = roadmapAdminService.selectSubject();
				System.out.println("sList :" + slist.size() );
				// 로드맵 list count 정보
				int count=roadmapAdminService.selectRoadmapCount(nDto);
				nDto.setListcount(count);
				rlist = roadmapAdminService.selectRoadmap(nDto);
				System.out.println("rList :" + rlist.size() );
			} catch (Exception e) {
				System.out.println((e.getMessage()));
			}
			
		// model
			model.addAttribute("clist",clist);
		    model.addAttribute("slist",slist);
		    model.addAttribute("rlist",rlist);
		    model.addAttribute("nDto",nDto);
			
		return "admin/roadmap_info";
		
	}
	
	@ResponseBody
	@RequestMapping("/admin/roadmap_info/chart1")
	public String roadmap_info_chart1(HttpServletRequest request, BoardNumberVo nDto, Model model) {
		
		List<RoadmapAdminChartVo1> list = roadmapAdminService.selectChart1(nDto);
		JSONArray jArray= new JSONArray();
		JSONObject jResult = new JSONObject();

		String result=null;
		
		try {
			if(list.size()> 0) {
				for(RoadmapAdminChartVo1 ch : list) {
					jResult= new JSONObject();
					System.out.println("ch.getR_grade :" + ch.getR_grade() + "-" + "ch.getR_grade_ct : " + ch.getR_grade_ct());
					jResult.put("name", ch.getR_grade());
					jResult.put("value", ch.getR_grade_ct());
					jArray.add(jResult);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		result=jArray.toJSONString();
		
		System.out.println("chart1_data : " + result);
		return result ;
	}//챠트정보1 
		
	@ResponseBody
	@RequestMapping("/admin/roadmap_info/chart2")
	public String roadmap_info_chart2(HttpServletRequest request,BoardNumberVo nDto,Model model) {
		
		System.out.println(request.getRequestURI());
		
		List<RoadmapAdminChartVo2> list=roadmapAdminService.selectChart2(nDto);
		String result=null;
		JSONArray jArray= new JSONArray();
		JSONObject jData = new JSONObject();
		
		int cdata[];
		int i=1;
		String gName="";	//비교할 값
		
		try {
			if(list.size() > 0) {
				//레이블 data
				for(RoadmapAdminChartVo2 ch:list) {
					jData = new JSONObject();
					jData.put("name",ch.getTextbook_content() );
					jData.put("value",ch.getBook_ct())	;
					jArray.add(jData);
				}		
			}			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		System.out.println(jArray.toJSONString());
		result=jArray.toJSONString();
//		i=1;
//		gName="";	
//		if(list.size() > 0 ) {
//			// data
//			gName=list.get(0).getGi_nm();
//			for(RoadmapAdminChartVo2 ch:list) {
//				if (gName!=list.get(i).getGi_nm()) {
//					jArray.add(i, gName);
//				}
//				i++;
//			}
//			result=jArray.toJSONString();
//		}
		return result;
	}
	@RequestMapping("/admin/roadmap_info/detail")
	public String roadmap_detail(HttpServletRequest request,Model model) {
		
		System.out.println(request.getRequestURI());
		
		return "admin/roadmap_detail";
	}
}
