package com.site.team1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.site.team1.mapper.UserInfoMapper;
import com.site.team1.vo.UserInfoVo;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	UserInfoMapper userInfoMapper;
	
	@Autowired
	JavaMailSender javaMailSender;
	
	
	
	

	//최종접속일
	public int finalDate(UserInfoVo userInfoVo) {
		int result = userInfoMapper.finalDate(userInfoVo);
		return result;
	}




	
	

	//닉네임 중복 체크
	public int nickChk(UserInfoVo userInfoVo) {
		int result = userInfoMapper.nickChk(userInfoVo);
		return result;
	}

	
	//회원탈퇴인증
	public UserInfoVo memberQuit(String u_id, String u_pw) {
		UserInfoVo userInfoVo = userInfoMapper.memberQuit(u_id,u_pw);
		return userInfoVo;
	}
	
	
	//회원삭제
	public int userDelete(UserInfoVo userInfoVo) {
		int result = userInfoMapper.userDelete(userInfoVo);
		System.out.println("탈퇴 impl : "+result);
		return result;
	}
	
	
	
	//프로필 변경 완료
	public int profileModify(UserInfoVo userInfoVo) {
		int result = userInfoMapper.profileModify(userInfoVo);
		System.out.println(result);
		return result;
	}

	
	//프로필변경하러 가기
	public UserInfoVo profileCheck(String u_id) {
		UserInfoVo userInfoVo = userInfoMapper.profileCheck(u_id);
		return userInfoVo;
	}
	
	
	//회원 수정
	public int userModifyCom(UserInfoVo userInfoVo) {
		int result = userInfoMapper.userModifyCom(userInfoVo);
		System.out.println("수정 결과값은?:"+result);
		return result;
	}

	
	
	//회원 수정인증절차
	public UserInfoVo UserModify(String u_pw) {
		UserInfoVo userInfoVo = userInfoMapper.userModify(u_pw);
		System.out.println("수정인증절차"+userInfoVo);
		return userInfoVo;
	}

	
	
	
	//마이페이지 회원정보
	public UserInfoVo mypage(String u_id) {
		UserInfoVo userVo = userInfoMapper.mypage(u_id);
		return userVo;
	}
	
	
	
	//아이디 중복 체크
	public int idChk(UserInfoVo userInfoVo) {
		int result = userInfoMapper.idChk(userInfoVo);
		return result;
	}
	
	
	//아이디 찾기
	public UserInfoVo selectId(UserInfoVo userInfoVo) {
		UserInfoVo userVo = userInfoMapper.selectUserId(userInfoVo);
		System.out.println(userVo);
		return userVo;
	}
	
	
	
	//비밀번호를 찾기
	public UserInfoVo pwFindCom(String u_id) {
		System.out.println("넘어온 값2 : "+u_id);
		UserInfoVo userInfoVo = userInfoMapper.pwFindCom(u_id);
		System.out.println("serviceImpl"+userInfoVo);
		
		return userInfoVo;
	}
	
	//비밀번호 변경
	public int pwCompl(UserInfoVo userInfoVo) {
		int result = userInfoMapper.pwCompl(userInfoVo);
		System.out.println(result);
		return result;
	}
	
	
	
	//회원로그인
	public UserInfoVo userLogin(UserInfoVo userInfoVo) {
		UserInfoVo userVo = userInfoMapper.userLogin(userInfoVo);
		return userVo;
	}


	//회원가입
	public int userWrite(UserInfoVo userInfoVo) {
		int result = userInfoMapper.userWirte(userInfoVo);
		return result;
	}
	
	
	//회원가입완료
	public UserInfoVo userInfoList(UserInfoVo userInfoVo) {
		UserInfoVo userVo = userInfoMapper.selectUser(userInfoVo);
		return userVo ;
	}
	
	//이메일 인증
	public String sendEmail(String u_email) throws Exception {
		        //임시비밀번호 생성
				String pwCode="";
				pwCode = getCreateKey();
				System.out.println("pwCode:"+pwCode);
				//이메일전송 관련 2가지 형태 1. text만 가능
				//SimpleMailMessage message2 = new SimpleMailMessage();
				// html코드 전송가능
				MimeMessage mail = javaMailSender.createMimeMessage();
				MimeMessageHelper message = new MimeMessageHelper(mail,true,"utf-8");
				
				//보내는 주소
				message.setTo(u_email);
				//보내는 사람주소
				message.setFrom("sungho969891@gmail.com");
				//메일 제목
				message.setSubject("회원가입 이메일인증 확인번호 안내");
				//메일 전송 내용
				String emailTxt = mailContent(u_email, pwCode);
				message.setText(emailTxt,true);
				System.out.println(message);
				//메일 전송
				javaMailSender.send(mail);
				System.out.println("이메일이 전송되었습니다.");	
		        return pwCode;
	           }


				private String mailContent(String u_email, String pwCode) {
					StringBuffer emailTxt = new StringBuffer();
					System.out.println("emailTxt"+emailTxt);
					emailTxt.append("<!DOCTYPE html>");
			        emailTxt.append("<html>");
			        emailTxt.append("<head>");
			        emailTxt.append("</head>");
			        emailTxt.append("<body>");
			        emailTxt.append(
							"<div style=\"font-family:'Apple SD Gothic Neo', 'sans-serif' !important; width: 500px; height: 600px; border-top: 4px solid #02b875; margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">"+ 
							"<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">"																															+ 
							"<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"></span><br />"																													+ 
							"<span style=\"color: #02b875\">메일인증</span> 안내입니다."																																				+ 
							"</h1>"																																																+ 
							"<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">"																													+ 
							"안녕하세요.<br>"																																													+ 
							"가입해 주셔서 진심으로 감사드립니다.<br>"																																						+ 
							"아래 <b style=\"color: #02b875\">'메일 인증'</b> 번호를 입력해 주세요.<br>"																													+ 
							"감사합니다.</p>"																																																	+ 
							"<div style=\"text-align:center;\">"+
							"<p style=\"width:310px; height:45px; color:#fff; margin:30px 5px 40px; background:#02b875; line-height:45px; vertical-align:middle; font-size:16px;\">" + 
							"메일 인증 비밀번호 : "+pwCode+"</p>"+ 
							"</div>"																																																	+
							"<div style=\"border-top: 4px solid #DDD; padding: 5px;\"></div>"+
							"</div>"
					);
			        emailTxt.append("</body>");
			        emailTxt.append("</html>");
			        
				    return emailTxt.toString();
				}


	//비밀번호 생성
	public String getCreateKey() {
		String pwCode="";
		char[] charSet = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx=0;
		for(int i=0;i<10;i++) {
			idx=(int)(Math.random()*36); //  0-35
			pwCode += charSet[idx];      //  0h14f4rga
		}
		return pwCode;
	}


	



	



	


	


	


	


	


	


	

	


	


	

	

}
