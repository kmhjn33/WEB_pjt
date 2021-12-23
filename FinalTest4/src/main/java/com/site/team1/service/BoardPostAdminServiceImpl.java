package com.site.team1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.BoardAdminMapper;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.BoardPostAdminVo;


@Service
public class BoardPostAdminServiceImpl implements BoardPostAdminService {

	@Autowired
	BoardAdminMapper boardAdminMapper;
	
	@Override
	public List<BoardPostAdminVo> selectBoardPost(BoardNumberVo nDto) {
		// TODO Auto-generated method stub
		List<BoardPostAdminVo> list = boardAdminMapper.selectBoardPost(nDto);
		return list;
	}//게시글 정보 가져오기

	@Override
	public int selectBoardPostCount(BoardNumberVo nDto) {
		int count=boardAdminMapper.selectBoardPostCount(nDto);
		return count;
	}//게시글 또는 검색를 row count



}
