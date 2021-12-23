package com.site.team1.service;

import java.util.Map;

import com.site.team1.vo.CrewBoardVo;

public interface CrewBoardService {

	Map<String, Object> crewBoard(CrewBoardVo crewBoardVo, int page, String searchWord);

}
