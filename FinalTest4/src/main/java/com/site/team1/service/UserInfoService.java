package com.site.team1.service;

import java.util.List;
import java.util.Map;

import com.site.team1.vo.UserInfoVo;

public interface UserInfoService {

	//회원로그인
	UserInfoVo userLogin(UserInfoVo userInfoVo);

	//회원가입
	int userWrite(UserInfoVo userInfoVo);

	//이메일 인증
	String sendEmail(String u_email)throws Exception;

	//이메일 완료 불러오기
	UserInfoVo userInfoList(UserInfoVo userInfoVo);

	//아이디 찾기
	UserInfoVo selectId(UserInfoVo userInfoVo);

	//비밀번호를 찾기 
	UserInfoVo pwFindCom(String u_id);

	//비밀번호 변경
	int pwCompl(UserInfoVo userInfoVo);

	//아이디 중복 체크
	int idChk(UserInfoVo userInfoVo);

	//마이페이지 회원정보
	UserInfoVo mypage(String u_id);

	//회원삭제
	int userDelete(UserInfoVo userInfoVo);

	//회원 수정인증절차
	UserInfoVo UserModify(String u_pw);

	//회원 수정
	int userModifyCom(UserInfoVo userInfoVo);

	//프로필변경하러 가기
	UserInfoVo profileCheck(String u_id);

	//프로필 변경 완료
	int profileModify(UserInfoVo userInfoVo);

	//회원탈퇴인증
	UserInfoVo memberQuit(String u_id, String u_pw);

	//닉네임 중복 체크
	int nickChk(UserInfoVo userInfoVo);

	//최종접속일
	int finalDate(UserInfoVo userInfoVo);
	

	

	


	

	

	

	

}
