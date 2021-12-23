package com.site.team1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.BoardPage;
import com.site.team1.vo.CrewBoardVo;
import com.site.team1.vo.CrewVo;

@Mapper
public interface CrewBoardMapper {

	CrewVo selectCrewInfo(CrewBoardVo crewBoardVo);

	int selectCrewBoardCount(CrewBoardVo crewBoardVo);

	List<CrewBoardVo> selectCrewBoardList(CrewBoardVo crewBoardVo, BoardPage boardPage, String searchWord);

}
