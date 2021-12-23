package com.site.team1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.BoardPostVo;
import com.site.team1.vo.CrewVo;

@Mapper
public interface MainMapper {

	List<BoardPostVo> selectBoardMain(int b_no);

	List<CrewVo> selectCrewMain();

}
