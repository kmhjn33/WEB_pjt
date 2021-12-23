package com.site.team1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.MyBoardMapper;
import com.site.team1.vo.BoardCommentVo;
import com.site.team1.vo.BoardPage;
import com.site.team1.vo.BoardPostVo;

@Service
public class MyBoardServiceImpl implements MyBoardService {

	@Autowired
	MyBoardMapper myBoardMapper;
	
	Map<String, Object> myBoardMap = new HashMap<>();

	//작성글 or 작성 댓글 or 추천한 글 리스트, 페이지 계산
	@Override
	public Map<String, Object> myBoardList(String type, int page, int uNo) {
		
		//총 리스트 수
		int listCount = myBoardMapper.selectMyBoardCount(type, uNo);
		//페이지 계산
		BoardPage boardPage = new BoardPage(page, listCount);
		myBoardMap.put("boardPage", boardPage);
		
		if(type.equals("post") || type.equals("like")) {
			//작성글 or 추천한 글 리스트
			List<BoardPostVo> myBoardPost = myBoardMapper.selectMyBoardPost(type, boardPage, uNo);
			myBoardMap.put("myBoardList", myBoardPost);
			
		} else if(type.equals("comment")) {
			//작성 댓글 리스트
			List<BoardCommentVo> myBoardComment = myBoardMapper.selectMyBoardComment(type, boardPage, uNo);
			myBoardMap.put("myBoardList", myBoardComment);
		}
		
		myBoardMap.put("type", type);
		myBoardMap.put("page", page);
		
		return myBoardMap;
	}
	
	

}
