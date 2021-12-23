package com.site.team1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.MainMapper;
import com.site.team1.vo.BoardPostVo;
import com.site.team1.vo.CrewVo;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainMapper mainMapper;
	
	@Override
	public Map<String, Object> mainList() {
		
		//각 게시판별 최근글
		List<BoardPostVo> freeBoard = mainMapper.selectBoardMain(1);
		List<BoardPostVo> qnaBoard = mainMapper.selectBoardMain(2);
		List<BoardPostVo> infoBoard = mainMapper.selectBoardMain(3);
		List<BoardPostVo> noticeBoard = mainMapper.selectBoardMain(4);
		
		//최근 생성 크루 8개
		List<CrewVo> crewList = mainMapper.selectCrewMain();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("freeBoard", freeBoard);
		map.put("infoBoard", infoBoard);
		map.put("qnaBoard", qnaBoard);
		map.put("noticeBoard", noticeBoard);
		map.put("crewList", crewList);
		
		return map;
	}

}
