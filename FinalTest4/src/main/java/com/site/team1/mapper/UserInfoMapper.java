package com.site.team1.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.UserInfoVo;

@Mapper
public interface UserInfoMapper {

	//회원 로그인
	UserInfoVo userLogin(UserInfoVo userInfoVo);

	//회원가입
	int userWirte(UserInfoVo userInfoVo);

	//회원가입완료
	UserInfoVo selectUser(UserInfoVo userInfoVo);

	//아이디 찾기
	UserInfoVo selectUserId(UserInfoVo userInfoVo);

	//비밀번호 찾기
	UserInfoVo pwFindCom(String u_id);

	//비밀번호 변경
	int pwCompl(UserInfoVo userInfoVo);

	//아이디 중복 체크
	int idChk(UserInfoVo userInfoVo);

	//마이페이지 이동
	UserInfoVo mypage(String u_id);

	//회원삭제
	int userDelete(UserInfoVo userInfoVo);

	//회원 수정인증절차
	UserInfoVo userModify(String u_pw);

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
