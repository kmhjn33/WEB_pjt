package com.site.team1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.CrewAdminMapper;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.CategoryMainAdminVo;
import com.site.team1.vo.CategorySubAdminVo;
import com.site.team1.vo.CrewAdminVo;
import com.site.team1.vo.RoadmapAdminVo;

@Service
public class CrewAdminServiceImpl implements CrewAdminService {
	
	@Autowired
	private CrewAdminMapper crewAdminMapper;
	
	
	@Override
	public List<RoadmapAdminVo> selectRoadmap(int u_no) {
		
		List<RoadmapAdminVo> list=crewAdminMapper.selectRoadmapMap(u_no);
		
		return list;
	}//로드맵 분류정보

	@Override
	public List<CategoryMainAdminVo> selectCategoryMain() {

		List<CategoryMainAdminVo> list=crewAdminMapper.selectCategoryMainMap();
		return list;
	}//메인 카테고리 정보

	@Override
	public List<CategorySubAdminVo> selectCategorySub(int cate_main_no) {
		
		List<CategorySubAdminVo> list=crewAdminMapper.selectCategorySubMap(cate_main_no); 
		return list;
	}//서브 카테고리 정보

	@Override
	public int selectCrewCount(BoardNumberVo nDto) {
		int count=crewAdminMapper.selectCrewCountMap(nDto);
		return count;
	}//크루 전체 리스트 카운트

	@Override
	public List<CrewAdminVo> selectCrewList(BoardNumberVo nDto) {
		List<CrewAdminVo> list=crewAdminMapper.selectCrewListMap(nDto);
		return list;
	}//검색 크루 리스트 정보

	@Override
	public CrewAdminVo selectCrewInfo(int c_no) {
		CrewAdminVo cDto=crewAdminMapper.selectCrewInfoMap(c_no);
		return cDto;
	}

}
