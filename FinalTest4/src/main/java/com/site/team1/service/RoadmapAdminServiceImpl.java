package com.site.team1.service;

import java.util.List;

import javax.security.auth.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.RoadmapAdminMapper;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.CategorySubAdminVo;
import com.site.team1.vo.RoadmapAdminChartVo1;
import com.site.team1.vo.RoadmapAdminChartVo2;
import com.site.team1.vo.RoadmapDetailAdminVo;
import com.site.team1.vo.SubjectAdminVo;
import com.site.team1.vo.TextbookAdminVo;

@Service
public class RoadmapAdminServiceImpl implements RoadmapAdminService {

	@Autowired 
	private RoadmapAdminMapper roadmapAdminMapper;
	
	@Override
	public int selectRoadmapCount(BoardNumberVo nDto) {
		int count=roadmapAdminMapper.selectRoadmapCount(nDto);
		return count;
	}

	@Override
	public List<RoadmapDetailAdminVo> selectRoadmap(BoardNumberVo nDto) {
		List<RoadmapDetailAdminVo> list=roadmapAdminMapper.selectRoadmap(nDto);
		return list ;
	}

	@Override
	public List<TextbookAdminVo> selectTextbook() {
		List<TextbookAdminVo> list=roadmapAdminMapper.selectTextbook();
		return list;
	}

	@Override
	public List<SubjectAdminVo> selectSubject() {
		List<SubjectAdminVo> list=roadmapAdminMapper.selectSubject();
		return list;
	}

	@Override
	public List<CategorySubAdminVo> selectCateSub() {
		List<CategorySubAdminVo> list=roadmapAdminMapper.selectCateSub();
		return list;
	}

	@Override
	public List<RoadmapAdminChartVo1> selectChart1(BoardNumberVo nDto) {
		List<RoadmapAdminChartVo1> list=roadmapAdminMapper.selectChart1(nDto);
		
		return list;		
		
	}

	@Override
	public List<RoadmapAdminChartVo2> selectChart2(BoardNumberVo nDto) {
		List<RoadmapAdminChartVo2> list=roadmapAdminMapper.selectChart2(nDto);
		return list;
	}

	@Override
	public List<RoadmapDetailAdminVo> selectChart3(BoardNumberVo nDto) {
		List<RoadmapDetailAdminVo> list=roadmapAdminMapper.selectChart3(nDto);
		return list;
	}

	@Override
	public List<RoadmapDetailAdminVo> selectChart4(BoardNumberVo nDto) {
		List<RoadmapDetailAdminVo> list=roadmapAdminMapper.selectChart4(nDto);
		return list;
	}

}
