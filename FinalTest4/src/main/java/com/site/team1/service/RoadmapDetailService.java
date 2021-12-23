package com.site.team1.service;

import java.util.List;

import com.site.team1.vo.RoadmapCateSubVo;
import com.site.team1.vo.RoadmapDetailOutVo;
import com.site.team1.vo.RoadmapDetailVo;
import com.site.team1.vo.RoadmapVo;
import com.site.team1.vo.SubjectVo;
import com.site.team1.vo.TextbookVo;

public interface RoadmapDetailService {
	
	// 로드맵 제목 변경
	int modiTitle(RoadmapVo roadmapVo);

	// 수정된 로드맵 리스트
	RoadmapVo modiRoadmapList(RoadmapVo roadmapVo);
	
	// 사이드바 로드맵 리스트
	List<RoadmapVo> roadmapList(RoadmapVo roadmapVo);

	// 세부 로드맵 리스트
	List<RoadmapDetailVo> roadmapDetail(RoadmapDetailVo roadmapDetailVo);

	// 교재 저장
	int subjectWrite(TextbookVo textbookVo);

	// 교재 리스트
	List<TextbookVo> selectTextbook(RoadmapVo roadmapVo);

	// 과목 리스트 
	List<SubjectVo> selectSubject();

	// 세부 로드맵 저장
	int detailRoadmapWrite(RoadmapDetailVo roadmapDetailVo);

	// 세부 로드맵 삭제
	int detailroadmapDel(RoadmapDetailVo roadmapDetailVo);

	// 시작전 카운트
	int startCount(RoadmapDetailVo roadmapDetailVo);
	
	// 진행중 카운트
	int ingCount(RoadmapDetailVo roadmapDetailVo);
	
	// 완료 카운트
	int endCount(RoadmapDetailVo roadmapDetailVo);

	// 상태없음 카운트
	int noneCount(RoadmapDetailVo roadmapDetailVo);

	// 수정 모달창에 값 가져오기
	RoadmapDetailVo inModi(RoadmapDetailVo roadmapDetailVo);

	// 세부 로드맵 수정
	int detailModi(RoadmapDetailVo roadmapDetailVo);

	// 로드맵 삭제
	int roadmapDel(RoadmapDetailVo roadmapDetailVo);

	// 삭제시 이전 로드맵 가져오기
	RoadmapVo preRoadmapList(RoadmapVo roadmapVo);

	// 로드맵 드래그 앤 드롭
	int detailroadmapDrag(RoadmapDetailVo roadmapDetailVo);

}
