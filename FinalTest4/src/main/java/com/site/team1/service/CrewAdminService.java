package com.site.team1.service;

import java.util.List;

import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.CategoryMainAdminVo;
import com.site.team1.vo.CategorySubAdminVo;
import com.site.team1.vo.CrewAdminVo;
import com.site.team1.vo.RoadmapAdminVo;

public interface CrewAdminService {

	//로드맵 카테고리 정보
	public List<RoadmapAdminVo> selectRoadmap(int u_no);
	
	//크루 메인 카테고리 정보
	public List<CategoryMainAdminVo> selectCategoryMain();
	//크루 서브 카테고리 정보
	public List<CategorySubAdminVo> selectCategorySub(int cate_main_no);
	
	//크루 검색 정보 카운트
	public int selectCrewCount(BoardNumberVo nDto);
	
	//크루 리스트
	public List<CrewAdminVo> selectCrewList(BoardNumberVo nDto); 
	
	//크루 정보
	public CrewAdminVo selectCrewInfo(int c_no);
	
}
