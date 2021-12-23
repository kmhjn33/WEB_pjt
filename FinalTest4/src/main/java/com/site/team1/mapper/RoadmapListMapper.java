package com.site.team1.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.RoadmapCateSubVo;
import com.site.team1.vo.RoadmapDetailVo;
import com.site.team1.vo.RoadmapVo;

@Mapper
public interface RoadmapListMapper {
	
	// 로드맵 리스트
	List<RoadmapCateSubVo> selectRoadmapList(RoadmapVo roadmapVo);

	// 로드맵 생성하기
	int insertRoadmap(RoadmapVo roadmapVo);

	// 넘버링 데이터 넣기
	int selectListCount(int cate_sub_no);

}
