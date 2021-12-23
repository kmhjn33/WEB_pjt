package com.site.team1.service;

import java.util.List;
import java.util.Map;

import com.site.team1.vo.RoadmapCateSubVo;
import com.site.team1.vo.RoadmapVo;

public interface RoadmapListService {

	// 로드맵 리스트
	List<RoadmapCateSubVo> roadmapList(RoadmapVo roadmapVo);

	// 로드맵 생성하기
	int roadmapWrite(RoadmapVo roadmapVo);

}
