package com.site.team1.service;

import java.util.Map;

public interface MyBoardService {

	//작성글 or 작성 댓글 or 추천한 글 리스트, 페이지 계산
	Map<String, Object> myBoardList(String type, int page, int uNo);
	
}
