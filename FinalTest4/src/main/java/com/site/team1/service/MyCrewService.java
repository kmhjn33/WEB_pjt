package com.site.team1.service;

import java.util.List;
import java.util.Map;

import com.site.team1.vo.CrewEntryVo;
import com.site.team1.vo.CrewLikeVo;
import com.site.team1.vo.CrewVo;

public interface MyCrewService {

	//내 크루 전체 가져오기
	List<CrewVo> getMyCrew(int u_no);

	//관심 크루 가져오기
	List<CrewVo> getCrewLike(int u_no);

	//참여하고 싶어요 크루 가져오기
	List<CrewVo> getCrewEntry(int u_no);

	//진행중 크루 가져오기
	List<CrewVo> getIngList(int u_no);

	//완료된 크루 가져오기
	List<CrewVo> getEndList(int u_no);

	//임시저장 크루 가져오기
	List<CrewVo> getNlist(int u_no);

	//모집중 크루 가져오기
	List<CrewVo> getRecruitList(int u_no);

	//시작대기 크루 가져오기
	List<CrewVo> getReadyList(int u_no);

	// 숫자 버튼 클릭 시 해당 리스트로 변경
	List<CrewVo> getChangeList(int u_no, int num);

	// 해당 크루 삭제
	int crewDelete(int c_no);



	
	

}
