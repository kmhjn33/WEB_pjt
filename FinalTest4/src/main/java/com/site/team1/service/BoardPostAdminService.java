package com.site.team1.service;

import java.util.List;

import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.BoardPostAdminVo;

public interface BoardPostAdminService {
	public List<BoardPostAdminVo> selectBoardPost(BoardNumberVo nDto);
	public int selectBoardPostCount(BoardNumberVo nDto);
}
