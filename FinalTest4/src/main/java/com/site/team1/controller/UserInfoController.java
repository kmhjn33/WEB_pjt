package com.site.team1.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.team1.service.UserInfoService;
import com.site.team1.vo.UserInfoVo;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserInfoController {

	@Autowired
	UserInfoService userInfoService;

///////////////////////////////////////로그인 폼/////////////////////////////////////////////////////////////////////////////////////////////////////
	// 로그인 폼으로 이동
	@GetMapping("/login")
	public String login() {
		return "user/login";

	}

	

	// 로그인 시키기(ajax)
	@ResponseBody
	@PostMapping("/login")
	public int login(UserInfoVo userInfoVo, Model model, HttpServletRequest request) {
		System.out.println("userInfoVo 아이디:" + userInfoVo.getU_id());
		System.out.println("userInfoVo 비밀번호:" + userInfoVo.getU_pw());
		HttpSession session = request.getSession();
		UserInfoVo userVo = userInfoService.userLogin(userInfoVo);
		int loginCheck = 0;
		if (userVo != null ) {
			loginCheck = 1;
			
			//최종접속일
			int result = userInfoService.finalDate(userInfoVo);
			
			session.setAttribute("session_u_no", userVo.getU_no());
			session.setAttribute("session_u_detail_no", userVo.getU_detail_no());
			session.setAttribute("session_u_id", userVo.getU_id());
			session.setAttribute("session_u_name", userVo.getU_name());
			session.setAttribute("session_u_nickName", userVo.getU_nickName());
			session.setAttribute("session_u_profile", userVo.getU_profile());
			session.setAttribute("session_u_email", userVo.getU_email());
			session.setAttribute("session_u_tel", userVo.getU_tel());
			session.setAttribute("session_u_signDate", userVo.getU_signDate());
			session.setAttribute("session_u_modDate", userVo.getU_modDate());
			session.setAttribute("session_u_finalDate", userVo.getU_finalDate());
			session.setAttribute("session_u_intro", userVo.getU_intro());
			
			
			
			
		}
		return loginCheck;
	}

	// 로그아웃 하기
	@GetMapping("/logout")
	public String logout() {
		return "user/logout";
	}
	
	  
	
	

///////////////////////////////////////찾기 폼/////////////////////////////////////////////////////////////////////////////////////////////////////	
		// 아이디 찾기 폼
		@GetMapping("/idFind")
		public String idFind() {
			return "user/idFind";
		}

	  //아이디 찾기
	  @PostMapping("/idC") 
	  public String idCom(UserInfoVo userInfoVo,Model model) {
		  System.out.println(userInfoVo.getU_email());
		  
		  UserInfoVo userVo = userInfoService.selectId(userInfoVo);
		  model.addAttribute("userVo",userVo);
		 
	      return "user/idCom"; 
	  
	}
	  
	  
	  
	  //아이디 중복 체크
	  @ResponseBody
	  @RequestMapping("/idChk")
	  public int idChk(UserInfoVo userInfoVo) {
		  int result = userInfoService.idChk(userInfoVo);
		  System.out.println("아이디 중복확인"+result);
		  return result;
	  }
	  
	  
	  //닉네임 중복 체크
	  @ResponseBody
	  @RequestMapping("/nickChk")
	  public int nickChk(UserInfoVo userInfoVo) {
		  int result = userInfoService.nickChk(userInfoVo);
		  System.out.println("닉네임 중복확인"+result);
		  return result;
	  }
	  
	  
	  
	  


	//비밀번호찾기폼
	@RequestMapping("/pwFind")
	public String pwFind() {
		return "user/pwFind";
	}

	
	  //비밀번호를 찾기 
	  @PostMapping("/pwC") 
	  public String pwCom(@RequestParam String u_id,Model model) {
		  System.out.println("넘어온 값1 : "+u_id);
		  UserInfoVo userInfoVo= userInfoService.pwFindCom(u_id);
		  System.out.println(userInfoVo.getU_id());
		  model.addAttribute("userInfoVo",userInfoVo);
		  
	      return "user/pwCom";   
	}
	  //비밀번호변경
	  @RequestMapping("/pwCompl")
	  public String pwCom(UserInfoVo userInfoVo,Model model) {
		  int result = userInfoService.pwCompl(userInfoVo);
		  model.addAttribute("userInfoVo",userInfoVo);
		  return "user/pwCompl";
	  }
	
	
	
	

///////////////////////////////////////회원가입 폼/////////////////////////////////////////////////////////////////////////////////////////////////////		
	//회원가입 (이메일)폼
	@RequestMapping("/signUpEmail")
	public String signUpEmail() {
		return "user/signUpEmail";
	}
	//회원가입폼
	@RequestMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	

	//회원가입
	@RequestMapping("/sign")
	public String signUp(UserInfoVo userInfoVo,
			@RequestPart MultipartFile file,
			Model model) {
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
		int result = userInfoService.userWrite(userInfoVo);
		model.addAttribute("userInfoVo",userInfoVo);
		System.out.println("result:" + result);
		return "user/signUpCompl";
	}
	


	// 이메일인증
	@RequestMapping("/sendEmail")
	@ResponseBody
	public String sendEmail(@RequestParam String u_email) throws Exception {
		System.out.println("u_email: " + u_email);
		String emailPw = userInfoService.sendEmail(u_email);
		System.out.println(emailPw);
        
		return emailPw;
	}
	
	

}
