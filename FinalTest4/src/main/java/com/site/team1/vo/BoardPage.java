package com.site.team1.vo;

import lombok.Data;

@Data
public class BoardPage {

	private int limit = 10; 	// 한 페이지에 나타낼 최대 게시글 수
	private int numLimit = 5; 	// 하단 넘버링 개수
	private int listCount = 0;  // 게시물 갯수
	
	private int maxPage = 0; 	// 게시판 최대 페이지 수

	private int startPage = 0; 	// 넘버링 시작 페이지
	private int endPage = 0; 	// 넘버링 끝 페이지

	private int startRow = 0; 	// 데이터 시작 번호
	private int endRow = 0; 	// 데이터 끝 번호
	
	public BoardPage(int page, int listCount) {
		this.listCount = listCount;		
		maxPage = (int)Math.ceil( (double)listCount / limit );
		startPage = ((int)(Math.ceil( (double)page / numLimit) -1)) * numLimit + 1;
		endPage = startPage + numLimit - 1;
		if(endPage > maxPage) endPage = maxPage;
		
		startRow = (page - 1) * limit + 1;
		endRow = startRow + limit - 1;
	}
	
	
}

