package com.site.team1.controller;

import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.team1.service.UserInfoService;
import com.site.team1.vo.UserInfoVo;

@Controller
@RequestMapping("/mypage")
public class myPageController {
	
	@Autowired
	UserInfoService userInfoService;
	
	
	//마이페이지 홈
	@GetMapping("/mypage")
	public String mypage(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfoVo userInfoVo = new UserInfoVo();
		userInfoVo.setU_id((String)session.getAttribute("session_u_id"));
		userInfoVo.setU_profile((String)session.getAttribute("session_u_profile"));
		userInfoVo.setU_name((String)session.getAttribute("session_u_name"));
		userInfoVo.setU_nickName((String)session.getAttribute("session_u_nickName"));
		userInfoVo.setU_email((String)session.getAttribute("session_u_email"));
		userInfoVo.setU_tel((String)session.getAttribute("session_u_tel"));
		userInfoVo.setU_signDate((Timestamp)session.getAttribute("session_u_signDate"));
		userInfoVo.setU_modDate((Timestamp)session.getAttribute("session_u_modDate"));
		userInfoVo.setU_finalDate((Timestamp)session.getAttribute("session_u_finalDate"));
		userInfoVo.setU_intro((String)session.getAttribute("session_u_intro"));
		System.out.println("userInfoVo id값:"+userInfoVo.getU_id());
		return "mypage/mypage";
	}
	//마이페이지
	@RequestMapping("/my_info")
	public String my_info(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfoVo userInfoVo = new UserInfoVo();
		userInfoVo.setU_id((String)session.getAttribute("session_u_id"));
		userInfoVo.setU_profile((String)session.getAttribute("session_u_profile"));
		userInfoVo.setU_name((String)session.getAttribute("session_u_name"));
		userInfoVo.setU_nickName((String)session.getAttribute("session_u_nickName"));
		userInfoVo.setU_email((String)session.getAttribute("session_u_email"));
		userInfoVo.setU_tel((String)session.getAttribute("session_u_tel"));
		userInfoVo.setU_signDate((Timestamp)session.getAttribute("session_u_signDate"));
		userInfoVo.setU_modDate((Timestamp)session.getAttribute("session_u_modDate"));
		userInfoVo.setU_finalDate((Timestamp)session.getAttribute("session_u_finalDate"));
		userInfoVo.setU_intro((String)session.getAttribute("session_u_intro"));
		return "mypage/my_info";
		
	}
	
	//회원탈퇴인증 폼
	@RequestMapping("/delete_check")
	public String delete_check() {
		return "mypage/delete_check";
	}
	
	//회원탈퇴인증
	@RequestMapping("/delete")
	public String member_quit(@RequestParam String u_id, @RequestParam String u_pw,Model model) {
		UserInfoVo userInfoVo = userInfoService.memberQuit(u_id,u_pw);
		model.addAttribute("userInfoVo",userInfoVo);
		
		return "mypage/member_quit";
	}
	
	
	//회원탈퇴
	@RequestMapping("/Memberquit")
	public String member_quit(UserInfoVo userInfoVo) {
		int result = userInfoService.userDelete(userInfoVo);
		System.out.println("회원탈퇴결과"+result);
		return "mypage/quit";
		
	}
	
	
	//회원 수정인증폼
	@RequestMapping("/modify_check")
	public String modify_check(HttpServletRequest request) {
		UserInfoVo userInfoVo = new UserInfoVo();
		HttpSession session = request.getSession();
		userInfoVo.setU_id((String)session.getAttribute("session_u_id"));
		
		return "mypage/modify_check";
	}
	
	  //아이디 중복 체크
	  @ResponseBody
	  @RequestMapping("/idChke")
	  public int idChk(UserInfoVo userInfoVo) {
		  int result = userInfoService.idChk(userInfoVo);
		  System.out.println("아이디 중복확인"+result);
		  return result;
	  }
	
	
	//회원 수정인증절차
	@RequestMapping("/modify")
	public String info_modify(@RequestParam String u_pw,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfoVo userInfoVo = userInfoService.UserModify(u_pw);
		model.addAttribute("userInfoVo",userInfoVo);
		userInfoVo.setU_name((String)session.getAttribute("session_u_name"));
		System.out.println(userInfoVo.getU_no());
		return "mypage/info_modify";
		
	}
	//회원 수정
	@RequestMapping("/modifyInfo")
	public String info_modiyCom(UserInfoVo userInfoVo,Model model,HttpServletRequest request) {
		System.out.println(userInfoVo.getU_no());
		HttpSession session = request.getSession();
		int result = userInfoService.userModifyCom(userInfoVo);
		model.addAttribute("userInfoVo",userInfoVo);
		userInfoVo.setU_name((String)session.getAttribute("session_u_name"));
		
		return "mypage/info_modifyCom";
		
	}
	
	//프로필변경 폼
		@RequestMapping("/modify_profile")
		public String modify_profile(HttpServletRequest request) {
			UserInfoVo userInfoVo = new UserInfoVo(); 
			HttpSession session = request.getSession();
			userInfoVo.setU_id((String)session.getAttribute("session_u_id"));
			return "mypage/modify_profile";
			
		}
	
	//프로필 변경 완료
	@RequestMapping("/modiProfile")
	public String modify_profile(UserInfoVo userInfoVo,@RequestPart MultipartFile file,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String newFileName="";
		if( file.getSize()!=0) {
			String orginFileName =  file.getOriginalFilename();
			long time = System.currentTimeMillis();
			newFileName = String.format("%d_%s", time,orginFileName);
			String fileSaveUrl="C:/team1FileSave/";
			File f = new File(fileSaveUrl+newFileName);
			//파일 업로드
		    try {
		    	 file.transferTo(f);
			} catch (Exception e) {	
				e.printStackTrace();	 
			}
		}
		//파일이름
		userInfoVo.setU_profile(newFileName);
		int result = userInfoService.profileModify(userInfoVo);
		session.setAttribute("session_u_nickName", userInfoVo.getU_nickName());
		session.setAttribute("session_u_profile", userInfoVo.getU_profile());
		session.setAttribute("session_u_intro", userInfoVo.getU_intro());
		userInfoVo.setU_id((String)session.getAttribute("session_u_id"));
		userInfoVo.setU_email((String)session.getAttribute("session_u_email"));
		userInfoVo.setU_tel((String)session.getAttribute("session_u_tel"));
		userInfoVo.setU_name((String)session.getAttribute("session_u_name"));
		userInfoVo.setU_signDate((Timestamp)session.getAttribute("session_u_signDate"));
		userInfoVo.setU_modDate((Timestamp)session.getAttribute("session_u_modDate"));
		userInfoVo.setU_finalDate((Timestamp)session.getAttribute("session_u_finalDate"));
		System.out.println("controller:"+result);
		return "redirect:./my_info";
		
	}
	//변경완료
	@RequestMapping("/userModify")
	public String userModify() {
		return "mypage/userModify";
		
	}
	
	//탈퇴 안내 페이지 이동
	@RequestMapping("/member_quit")
	public String member_quit() {
		return "mypage/member_quit";
	}
	


}
