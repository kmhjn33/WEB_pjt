package com.site.team1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.team1.service.MemberAdminService;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.ChartVo;
import com.site.team1.vo.MemberAdminVo;
import com.site.team1.vo.RoadmapAdminChartVo2;

@Controller
public class ControllerAdmin {
	
	@Autowired 
	MemberAdminService memberAdminSerivce;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/index")
	public String index() {
		return "main";
	}
			
	@RequestMapping("/admin/member_info")
	public String userinfoSelect(HttpServletRequest request, BoardNumberVo nDto
								,Model model) {
		System.out.println(request.getRequestURI());
		
		
		HttpSession session=request.getSession();
		System.out.println("session_u_name : " + session.getAttribute("session_u_name"));
		System.out.println("session_u_detail_no : " +session.getAttribute("session_u_detail_no"));
		
		try {
			
			System.out.println("검색어 : " + nDto.getSearchWord());
			System.out.println("검색카테고리: " + nDto.getCategory());
			int listcount = memberAdminSerivce.selectMemberListCount(nDto);
			System.out.println("검색된 데이타 count: " + listcount);
			nDto.setListcount(listcount);
			List<MemberAdminVo> list= memberAdminSerivce.selectMemberList(nDto);
			System.out.println("검색된 데이타 : " + list.size());
			
			model.addAttribute("list",list);
			model.addAttribute("nDto",nDto);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "admin/member_info";
	}
	
	
	@ResponseBody
	@RequestMapping("/admin/user_info/out")
	public String Member_out(HttpServletRequest request,@RequestParam int u_no) {
		
		String resultString="";
		int result=0;
		result=memberAdminSerivce.user_out(u_no);
		System.out.println("result : " + result);
		if (result==1) {
			resultString="y";
		}else {
			resultString="n";
		}
		return resultString; 
	} // 회원 탈퇴
	
	
	@RequestMapping("/admin/member_stats")
	public String member_stats() {
		
		return "admin/member_stats";
	}
	
	
	@ResponseBody
	@RequestMapping("/admin/user_info")
	public String userinfoSelectbyId(HttpServletRequest request
								,@RequestParam int rnum
								,@RequestParam int u_no
										) {
		JSONArray jArray = new JSONArray();
		JSONObject jObject = new JSONObject();
		System.out.println("test rnum:"+rnum);
		//System.out.println("test rnum:"+rnum+"test uid:"+u_id);
		System.out.println(request.getRequestURI());
		String result = "ok";
		
		try {
			MemberAdminVo mDto = memberAdminSerivce.selectUserInfobyID(u_no);
			if(mDto != null) {
				mDto.setRnum(rnum);
				jObject.put("u_detail_no", mDto.getU_detail_no());
				jObject.put("rnum", mDto.getRnum());
				jObject.put("u_no", mDto.getU_no());
				jObject.put("reported", mDto.getReported());
				jObject.put("board", mDto.getBoard());
				jObject.put("crew", mDto.getCrew());
				jObject.put("roadmap", mDto.getRoadmap());
				jArray.add(jObject);
			}	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		result=jObject.toJSONString();
		System.out.println(result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/admin/user_info/chart1")
	public String user_chart1() {
		
		String result=null;
		List<ChartVo> list=memberAdminSerivce.selectChart01();
		JSONArray jArray= new JSONArray();
		JSONObject jData = new JSONObject();
		
		int cdata[];
		int i=1;
		try {
			if(list.size() > 0) {
				//레이블 data
				for(ChartVo ch:list) {
					jData = new JSONObject();
					jData.put("name",ch.getItem_name() );
					jData.put("value",ch.getItem_count());
					jArray.add(jData);
				}		
			}			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		System.out.println(jArray.toJSONString());
		result=jArray.toJSONString();
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("/admin/user_info/chart2")
	public String user_chart2() {
		
		String result=null;
		List<ChartVo> list=memberAdminSerivce.selectChart02();
		JSONArray jArray= new JSONArray();
		JSONObject jData = new JSONObject();
		
		int cdata[];
		int i=1;
		String gName="";	//비교할 값
		
		try {
			if(list.size() > 0) {
				//레이블 data
				for(ChartVo ch:list) {
					jData = new JSONObject();
					jData.put("name",ch.getItem_name() );
					jData.put("value",ch.getItem_count())	;
					jArray.add(jData);
				}		
			}			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		System.out.println(jArray.toJSONString());
		result=jArray.toJSONString();

		return result;
	}
	
	@ResponseBody
	@RequestMapping("/admin/user_info/chart3")
	public String user_chart3() {
		
		String result=null;
		List<ChartVo> list=memberAdminSerivce.selectChart03();
		JSONArray jArray= new JSONArray();
		JSONObject jData = new JSONObject();
		
		int cdata[];
		int i=1;
		String gName="";	//비교할 값
		
		try {
			if(list.size() > 0) {
				//레이블 data
				for(ChartVo ch:list) {
					jData = new JSONObject();
					jData.put("name",ch.getItem_name() );
					jData.put("value",ch.getItem_count())	;
					jArray.add(jData);
				}		
			}			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		System.out.println(jArray.toJSONString());
		result=jArray.toJSONString();

		return result;
	}
}
