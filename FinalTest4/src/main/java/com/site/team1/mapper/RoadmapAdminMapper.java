package com.site.team1.mapper;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.Subject;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.CategorySubAdminVo;
import com.site.team1.vo.RoadmapAdminChartVo1;
import com.site.team1.vo.RoadmapAdminChartVo2;
import com.site.team1.vo.RoadmapDetailAdminVo;
import com.site.team1.vo.SubjectAdminVo;
import com.site.team1.vo.TextbookAdminVo;

@Mapper
public interface RoadmapAdminMapper {

	int selectRoadmapCount(BoardNumberVo nDto);
	List<RoadmapDetailAdminVo> selectRoadmap(BoardNumberVo nDto);
	List<TextbookAdminVo> selectTextbook();
	List<SubjectAdminVo> selectSubject();
	List<CategorySubAdminVo> selectCateSub();	
	List<RoadmapAdminChartVo1> selectChart1(BoardNumberVo nDto);
	List<RoadmapAdminChartVo2> selectChart2(BoardNumberVo nDto);
	List<RoadmapDetailAdminVo> selectChart3(BoardNumberVo nDto);
	List<RoadmapDetailAdminVo> selectChart4(BoardNumberVo nDto);
}
