package com.site.team1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.CategoryMainAdminVo;
import com.site.team1.vo.CategorySubAdminVo;
import com.site.team1.vo.CrewAdminVo;
import com.site.team1.vo.RoadmapAdminVo;

@Mapper
public interface CrewAdminMapper {

	
	//로드맵 카테고리 정보
	public List<RoadmapAdminVo> selectRoadmapMap(int u_no);
	
	//크루 메인 카테고리 정보
	public List<CategoryMainAdminVo> selectCategoryMainMap();
	//크루 서브 카테고리 정보
	public List<CategorySubAdminVo> selectCategorySubMap(int cate_main_no);
	
	//크루 검색 정보 카운트
	public int selectCrewCountMap(BoardNumberVo nDto);
	
	//크루 리스트
	public List<CrewAdminVo> selectCrewListMap(BoardNumberVo nDto);
	
	//크루 정보 가져오기
	public CrewAdminVo selectCrewInfoMap(int c_no);
}
