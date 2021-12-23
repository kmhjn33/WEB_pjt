package com.site.team1.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.RoadmapListMapper;
import com.site.team1.vo.RoadmapCateSubVo;
import com.site.team1.vo.RoadmapNumberVo;
import com.site.team1.vo.RoadmapVo;

@Service
public class RoadmapListServiceImpl implements RoadmapListService {

	@Autowired
	RoadmapListMapper roadmapListMapper;
	
	@Autowired
	HttpSession session;

	// 로드맵 리스트
	@Override	
	public List<RoadmapCateSubVo> roadmapList(RoadmapVo roadmapVo) {
		roadmapVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		// 로드맵 리스트
		List<RoadmapCateSubVo> list = roadmapListMapper.selectRoadmapList(roadmapVo);
		
		// 넘버링 메소드 호출
		
		return list;
	}

	// 로드맵 생성하기
	@Override	
	public int roadmapWrite(RoadmapVo roadmapVo) {
		roadmapVo.setU_no((Integer)session.getAttribute("session_u_no"));
		int result = roadmapListMapper.insertRoadmap(roadmapVo);
		return result;
	}
	
	// 넘버링 데이터 넣기
	public RoadmapNumberVo numberling(RoadmapNumberVo roadmapNumberVo) {

		int page=0;
		if(roadmapNumberVo.getPage()==0) page=1;
		else page = roadmapNumberVo.getPage();
		
		int cate_sub_no = roadmapNumberVo.getCate_sub_no();
		
		int limit=10; // 1페이지에 나오는 게시글 수
		int numLimit=10; // 하단 넘버링 개수
		//총게시글 수
		int listCount = roadmapListMapper.selectListCount(cate_sub_no);
		// 최대페이지
		int maxPage = (int)Math.ceil((double)listCount/limit);
		//하단넘버링 처음수
		int startPage = (((int)(Math.ceil((double)page/numLimit)-1)))*numLimit+1;
		//하단넘버링 마지막수
		int endPage = startPage+numLimit-1;
		//최대페이지가 마지막페이지보다 작으면 최대페이지까지만 출력 
		if(endPage>maxPage) endPage=maxPage;
		//가져올 첫번째 수
		int startrow = (page-1)*limit+1;
		//가져올 마지막 수
		int endrow = startrow+limit-1;
		RoadmapNumberVo rNumVo=new RoadmapNumberVo(page,limit,numLimit,listCount,maxPage,startPage,endPage,startrow,endrow,cate_sub_no);
		return rNumVo;
	}
}
