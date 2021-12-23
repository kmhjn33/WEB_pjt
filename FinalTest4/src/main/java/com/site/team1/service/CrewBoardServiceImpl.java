package com.site.team1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.CrewBoardMapper;
import com.site.team1.vo.BoardPage;
import com.site.team1.vo.CrewBoardVo;
import com.site.team1.vo.CrewVo;

@Service
public class CrewBoardServiceImpl implements CrewBoardService {
	
	@Autowired
	CrewBoardMapper crewBoardMapper;
	
	Map<String, Object> map = new HashMap<>();

	@Override
	public Map<String, Object> crewBoard(CrewBoardVo crewBoardVo, int page, String searchWord) {
		
		//크루 정보 가져오기
		CrewVo crewVo = crewBoardMapper.selectCrewInfo(crewBoardVo);
		
		//크루 보드 총 게시물 수
		int listCount = crewBoardMapper.selectCrewBoardCount(crewBoardVo);
		
		//페이지 계산		
		BoardPage boardPage = new BoardPage(page, listCount);
		
		//크루 보드 글 가져오기
		List<CrewBoardVo> crewBoardList = crewBoardMapper.selectCrewBoardList(crewBoardVo, boardPage, searchWord);
		
		map.put("crewVo", crewVo);
		map.put("boardPage", boardPage);
		map.put("crewBoardList", crewBoardList);
				
		return map;
	}

}
