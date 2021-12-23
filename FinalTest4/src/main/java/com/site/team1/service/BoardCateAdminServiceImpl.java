package com.site.team1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.BoardAdminMapper;
import com.site.team1.vo.BoardCateAdminVo;


@Service
public class BoardCateAdminServiceImpl implements BoardCateAdminService {

	@Autowired
	BoardAdminMapper boardAdminMapper;
	
	@Override
	public List<BoardCateAdminVo> selectBoardCate(int b_no) {
		
		List<BoardCateAdminVo> list = boardAdminMapper.selectBoardCate(b_no);
		
		return list;
	}

}
