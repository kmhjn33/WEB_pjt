package com.site.team1.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.RoadmapDetailMapper;
import com.site.team1.vo.RoadmapCateSubVo;
import com.site.team1.vo.RoadmapDetailOutVo;
import com.site.team1.vo.RoadmapDetailVo;
import com.site.team1.vo.RoadmapVo;
import com.site.team1.vo.SubjectVo;
import com.site.team1.vo.TextbookVo;

@Service
public class RoadmapDetailServiceImpl implements RoadmapDetailService {

	@Autowired
	RoadmapDetailMapper roadmapDetailMapper;

	@Autowired
	HttpSession session;
	
	// 로드맵 제목 변경
	@Override
	public int modiTitle(RoadmapVo roadmapVo) {
		roadmapVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int result = roadmapDetailMapper.updateTitle(roadmapVo);
		return result;
	}

	// 수정된 로드맵 리스트
	@Override
	public RoadmapVo modiRoadmapList(RoadmapVo roadmapVo) {
		roadmapVo.setU_no((Integer)session.getAttribute("session_u_no"));
		RoadmapVo modiRoadmap = roadmapDetailMapper.modiRoadmapList(roadmapVo);
		return modiRoadmap;
	}
	
	// 사이드바 로드맵 리스트
	@Override
	public List<RoadmapVo> roadmapList(RoadmapVo roadmapVo) {
		roadmapVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		List<RoadmapVo> list = roadmapDetailMapper.roadmapList(roadmapVo);
		return list;
	}
	
	// 세부 로드맵 리스트
	@Override
	public List<RoadmapDetailVo> roadmapDetail(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		List<RoadmapDetailVo> rdList = roadmapDetailMapper.selectRoadmapDetail(roadmapDetailVo);
		return rdList;
	}

	// 교재 저장
	@Override
	public int subjectWrite(TextbookVo textbookVo) {
		textbookVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int result = roadmapDetailMapper.insertSubject(textbookVo);
		return result;
	}

	// 교재 리스트
	@Override
	public List<TextbookVo> selectTextbook(RoadmapVo roadmapVo) {
		roadmapVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		List<TextbookVo> tList = roadmapDetailMapper.selectTextbook(roadmapVo);
		return tList;
	}

	// 과목 리스트
	@Override
	public List<SubjectVo> selectSubject() {
		
		List<SubjectVo> sList = roadmapDetailMapper.selectSubject();
		return sList;
	}
	
	// 세부 로드맵 저장
	@Override
	public int detailRoadmapWrite(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int result = roadmapDetailMapper.insertDetailRoadmap(roadmapDetailVo);
		return result;
	}

	// 세부 로드맵 삭제
	@Override
	public int detailroadmapDel(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int result = roadmapDetailMapper.detailroadmapDelete(roadmapDetailVo);
		return result;
	}

	// 상태별 카운트
	@Override
	public int startCount(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int sCount = roadmapDetailMapper.startCount(roadmapDetailVo);
		return sCount;
	}

	// 진행중 카운트
	@Override
	public int ingCount(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int iCount = roadmapDetailMapper.ingCount(roadmapDetailVo);
		return iCount;
	}

	// 완료 카운트
	@Override
	public int endCount(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int eCount = roadmapDetailMapper.endCount(roadmapDetailVo);
		return eCount;
	}

	// 상태없음 카운트
	@Override
	public int noneCount(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int nCount = roadmapDetailMapper.noneCount(roadmapDetailVo);
		return nCount;
	}

	// 수정 모달창에 값 가져오기
	@Override
	public RoadmapDetailVo inModi(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		// 세부 축약 로드맵 리스트
		RoadmapDetailVo inList = roadmapDetailMapper.inModi(roadmapDetailVo);	
		return inList;
	}

	// 세부 로드맵 수정
	@Override
	public int detailModi(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int result = roadmapDetailMapper.detailModi(roadmapDetailVo);
		return result;
	}

	// 로드맵 삭제
	@Override
	public int roadmapDel(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		int result = roadmapDetailMapper.roadmapDel(roadmapDetailVo);	
		return result;
	}

	// 삭제시 이전 로드맵 가져오기
	@Override
	public RoadmapVo preRoadmapList(RoadmapVo roadmapVo) {
		roadmapVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		RoadmapVo preRoadmap = roadmapDetailMapper.preRoadmapList(roadmapVo);
		return preRoadmap;
	}

	
	//로드맵 드래그 앤 드롭
	@Override
	public int detailroadmapDrag(RoadmapDetailVo roadmapDetailVo) {
		roadmapDetailVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		//로드맵 세부 상태 변경
		int result = roadmapDetailMapper.updateRoadmapDetailState(roadmapDetailVo);		
		return result;
	}

}
