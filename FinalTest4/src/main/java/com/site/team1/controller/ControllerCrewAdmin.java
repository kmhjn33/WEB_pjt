package com.site.team1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.batch.BatchProperties.Job;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.team1.service.CrewAdminService;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.CategoryMainAdminVo;
import com.site.team1.vo.CategorySubAdminVo;
import com.site.team1.vo.CrewAdminVo;

//import net.sf.json.JSONArray;

@Controller public class ControllerCrewAdmin {

	@Autowired CrewAdminService crewAdminservice;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/admin/crew_info")	
	public String crewInfo(HttpServletRequest request,BoardNumberVo nDto,Model model) {
		
		HttpSession session=request.getSession();
		session.setAttribute("session_u_name", session.getAttribute("session_u_name"));
		session.setAttribute("session_u_detail_no", session.getAttribute("session_u_detail_no"));
		
		System.out.println("요청 URl : " + request.getRequestURI());
		if (nDto.equals(null)){
			System.out.println("Dto에 널값이 존재합니다.");
		}
		try {
			
			
			//크루 대분류 정보
			List<CategoryMainAdminVo> mlist = crewAdminservice.selectCategoryMain();
			System.out.println("대분류 정보 건수 :" + mlist.size());
			//크루 소분류 정보
			List<CategorySubAdminVo> slist= crewAdminservice.selectCategorySub(nDto.getCate_sub_no());
			System.out.println("소분류 정보 건수 :" + slist.size());
			//크루 row count	
			int count = crewAdminservice.selectCrewCount(nDto);
			nDto.setListcount(count);
			System.out.println("크루 정보 건수 :" + count);
			//크루 정보
			List<CrewAdminVo> crewlist=crewAdminservice.selectCrewList(nDto);		
			
			JSONArray jArr=new JSONArray();
			for(CrewAdminVo c : crewlist ) {
				JSONObject jObj = new JSONObject();
				jObj.put("rnum",c.getRnum());
				jObj.put("c_no",c.getC_no());
				jObj.put("c_title",c.getC_title());
				jObj.put("u_name",c.getU_name());
				jObj.put("u_profile",c.getU_profile());
				jObj.put("c_sdate","" + c.getC_sdate());
				jObj.put("c_edate","" + c.getC_edate());
				jObj.put("c_thumbnail","" + c.getC_thumbnail());
				
				jArr.add(jObj);
			}
			
			//JSONArray jsonArray=new JSONArray();
			
			model.addAttribute("nDto",nDto);
			model.addAttribute("mlist",mlist);
			model.addAttribute("slist",slist);
			model.addAttribute("crewlist",crewlist);
			model.addAttribute("jlist",jArr.toJSONString());
			//model.addAttribute("jlist",jsonArray.fromObject(crewlist));

			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
			
		return "admin/crew_info";
	}
	
	@RequestMapping("/admin/crew_detail")
	public String crew_detail(HttpServletRequest request,@RequestParam int c_no,Model model) {
		
		CrewAdminVo cDto=crewAdminservice.selectCrewInfo(c_no);
		model.addAttribute("cDto",cDto);
		
		return "admin/crew_detail";
	}
}


