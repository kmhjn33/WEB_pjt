package com.site.team1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.team1.service.BoardAdminService;
import com.site.team1.service.BoardCateAdminService;
import com.site.team1.service.BoardPostAdminService;
import com.site.team1.vo.BoardAdminVo;
import com.site.team1.vo.BoardCateAdminVo;
import com.site.team1.vo.BoardCommentAdminVo;
import com.site.team1.vo.BoardFileAdminVo;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.BoardPostAdminVo;
import com.site.team1.vo.BoardRecommandVo;
import com.site.team1.vo.BoardReportAdminVo;
import com.site.team1.vo.CrewAdminVo;
import com.site.team1.vo.MemberAdminVo;

@Controller
public class ControllerDashboardAdmin {

	@Autowired
	HttpSession session;
	
	@Autowired BoardAdminService boardAdminService;
	@Autowired BoardCateAdminService boardCateAdminService;
	@Autowired BoardPostAdminService boardPostAdminService;
	
	@RequestMapping("/admin/board_info")
	public String boardinfoSelect(HttpServletRequest request
									, BoardNumberVo nDto
									,Model model,HttpSession session) {
	
		System.out.println("session_u_name : " + session.getAttribute("session_u_name"));
		System.out.println("session_u_detail_no : " +session.getAttribute("session_u_detail_no"));
		
		System.out.println("request URL : " + request.getRequestURI());
		System.out.println("게시판 번호 -" + nDto.getB_no());
		System.out.println("게시물 분류 -" + nDto.getB_cate_no());
		System.out.println("분류 카테고리 -" + nDto.getCategory());
		System.out.println("검색 조건 -" + nDto.getSearchWord());
		
		List<BoardAdminVo> blist = boardAdminService.selectBoardList();
		List<BoardCateAdminVo> clist=boardCateAdminService.selectBoardCate(nDto.getB_no());
		List<BoardPostAdminVo> plist=boardPostAdminService.selectBoardPost(nDto);
		int listcount=boardPostAdminService.selectBoardPostCount(nDto);
		
		nDto.setListcount(listcount);
		
		model.addAttribute("blist",blist);
		model.addAttribute("clist",clist);
		model.addAttribute("plist",plist);
		model.addAttribute("nDto",nDto);
	
		return "admin/board_info";
	}//보드 인포
	
	@RequestMapping("/admin/board_detail")
	public String boardinfoDetail(HttpServletRequest request
									, @RequestParam int b_post_no
									, BoardNumberVo nDto
									, Model model) {
		
		//게시글 정보
		BoardPostAdminVo bDto=boardAdminService.selectBoardPostbyNo(b_post_no);
		//댓글 정보
		List<BoardCommentAdminVo> clist=boardAdminService.selectBoardComments(b_post_no);
		
		//첨부 파일 정보
		List<BoardFileAdminVo> flist=boardAdminService.selectBoardFiles(b_post_no);
		//게시물 신고정보
		List<BoardReportAdminVo> rlist=boardAdminService.selectBoardReports(b_post_no);
		//추천인 정보
		//List<board>
		List<BoardRecommandVo> llist=boardAdminService.selectBoardRecommand(b_post_no);
		
		model.addAttribute("nDto",nDto);
		model.addAttribute("bDto",bDto);
		model.addAttribute("clist",clist);
		model.addAttribute("flist",flist);
		model.addAttribute("rlist",rlist);
		
		return "admin/boarddetail";
	}
	
	@RequestMapping("/admin/board_info_user")
	public String boardinfoSelect_User(HttpServletRequest request
									, BoardNumberVo nDto
									,Model model) {
		System.out.println("request URL : " + request.getRequestURI());
		System.out.println("게시판 번호 -" + nDto.getB_no());
		System.out.println("게시물 분류 -" + nDto.getB_cate_no());
		System.out.println("분류 카테고리 -" + nDto.getCategory());
		System.out.println("검색 조건 -" + nDto.getSearchWord());
		
		List<BoardAdminVo> blist = boardAdminService.selectBoardList();
		List<BoardCateAdminVo> clist=boardCateAdminService.selectBoardCate(nDto.getB_no());
		List<BoardPostAdminVo> plist=boardPostAdminService.selectBoardPost(nDto);
		int listcount=boardPostAdminService.selectBoardPostCount(nDto);
		
		nDto.setListcount(listcount);
		
		model.addAttribute("blist",blist);
		model.addAttribute("clist",clist);
		model.addAttribute("plist",plist);
		model.addAttribute("nDto",nDto);
	
		return "admin/board_info";
	}//보드 인포
	
	@ResponseBody
	@RequestMapping("/admin/selectRecommandList")
	public JSONArray selectRecommandList(@RequestParam int b_comm_no) {
		String result="";
		JSONArray jArray = new JSONArray();
		JSONObject jObj = new JSONObject();	
		try {
			List<BoardRecommandVo> rlist = boardAdminService.selectBoardRecommand(b_comm_no);
			
			for(BoardRecommandVo c : rlist ) {
				jObj = new JSONObject();
				jObj.put("b_comm_like_no",c.getB_comm_like_no());
				jObj.put("b_comm_no",c.getB_comm_no());
				jObj.put("b_comm_like_date",c.getB_comm_like_date());
				jObj.put("u_name",c.getU_name());
				jArray.add(jObj);
			}
			System.out.println("lise_count : " + rlist.size());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		result=jArray.toJSONString();
		System.out.println(result);
		
		return jArray;	
	}
	
	@ResponseBody
	@RequestMapping("/admin/deleteComment")
	public int deleteComment(@RequestParam int b_comm_no) {
	
		int ret=boardAdminService.deleteBoardComments(b_comm_no);
		
		return ret; 
	}
	@ResponseBody
	@RequestMapping("/admin/deleteReport")
	public int deleteReport(@RequestParam int b_report_no){
		int ret=boardAdminService.deleteBoardReports(b_report_no);
		
		return ret;
	}
	@ResponseBody
	@RequestMapping("/admin/deleteRecommand")
	public int deleteRecommand(@RequestParam int b_comm_like_no) {
		
		int ret=boardAdminService.deleteBoardRecommand(b_comm_like_no);
		
		return ret; 
	}
	

}
