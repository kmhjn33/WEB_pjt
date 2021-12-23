package com.site.team1.service;

import java.util.List;
import java.util.Map;

import com.site.team1.vo.CategorySubVo;
import com.site.team1.vo.CrewEntryVo;
import com.site.team1.vo.CrewLikeVo;
import com.site.team1.vo.CrewVo;
import com.site.team1.vo.UserInfoVo;

public interface CrewService {

	//해당 카테고리 리스트 가져오기
	List<CrewVo> crewStudy(int cate_sub_no);

	//카테고리 이름 가져오기
	CategorySubVo cataName(int cate_sub_no);

	//크루 상세보기 게시글 1개 가져오기
	CrewVo selectCrewOne(int c_no);

	//참여하고 싶어요 갯수 가져오기
	List<CrewEntryVo> entryCount(int c_no);
	//관심있어요 갯수 가져오기
	List<CrewLikeVo> likeCount(int c_no);

	
	//참여하고 싶어요
	Map<String, Object> hope(CrewEntryVo crewEntryVo);

	//참여하고 싶어요 취소취소
	int entryCancle(int c_entry_no);

	//참여 하고 싶어요 눌렀는지 안눌렀는지 확인하고 조건 주기
	CrewEntryVo checkEnrty(int c_no, int u_no);

	//관심있어요
	Map<String, Object> interesting(CrewLikeVo crewLikeVo);

	//관심있어요 취소
	int likeCancle(int c_like_no);

	//관심 있어요 눌렀는지 안눌렀는지 확인하고 조건 주기
	CrewLikeVo checkLike(int c_no, int u_no);

	//프로필 가져오기
	UserInfoVo selectProfile(int c_no);

	//크루 생성 시 내 프로필 가져오기
	UserInfoVo selectProfile2(int u_no);

	//참여 희망 인원 리스트에 담아 모달에 뿌리기
	List<UserInfoVo> entryUser(int c_no);








}
