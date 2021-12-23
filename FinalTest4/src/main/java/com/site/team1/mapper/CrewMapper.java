package com.site.team1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.CategorySubVo;
import com.site.team1.vo.CrewEntryVo;
import com.site.team1.vo.CrewLikeVo;
import com.site.team1.vo.CrewVo;
import com.site.team1.vo.UserInfoVo;
@Mapper
public interface CrewMapper {

	//해당 카테고리 리스트 가져오기
	List<CrewVo> selectStudyList(int cate_sub_no);

	//카테고리 이름 가져오기
	CategorySubVo selectCateSubName(int cate_sub_no);

	//크루 상세보기 게시글 1개 가져오기
	CrewVo selectCrewOne(int c_no);

	//crew_entry에 데이터 저장
	void insertCrewEntry(CrewEntryVo crewEntryVo);

	//참여하고 싶어요 갯수 가져오기
	List<CrewEntryVo> selectEntryCount(int c_no);

	//참여하고 싶어요 갯수 다시 가져오기
	int selectCount(CrewEntryVo crewEntryVo);

	//c_entry_No 객체 받아오기
	CrewEntryVo selectEntryNo(CrewEntryVo crewEntryVo);

	//참여하고 싶어요 취소취소
	int deleteEntry(int c_entry_no);

	//참여 하고 싶어요 눌렀는지 안눌렀는지 확인하고 조건 주기
	CrewEntryVo checkEnrty(int c_no, int u_no);

	//관심있어요
	void insertCrewLike(CrewLikeVo crewLikeVo);

	//관심있어요 갯수 가져오기
	List<CrewLikeVo> selectLikeCount(int c_no);

	//관심있어요 갯수 다시 가져오기
	int selectCount2(CrewLikeVo crewLikeVo);

	//c_like_no 객체 받아오기
	CrewLikeVo selectLikeNo(CrewLikeVo crewLikeVo);

	//관심있어요 취소취소
	int deleteLike(int c_like_no);

	//관심 있어요 눌렀는지 안눌렀는지 확인하고 조건 주기
	CrewLikeVo checkLike(int c_no, int u_no);

	//프로필 가져오기
	UserInfoVo selectProfile(int c_no);

	//크루 생성 시 내 프로필 가져오기
	UserInfoVo selectProfile2(int u_no);

	//참여 희망 인원 리스트에 담아 모달에 뿌리기
	List<UserInfoVo> entryUser(int c_no);


	

}
