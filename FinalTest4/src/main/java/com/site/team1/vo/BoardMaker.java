package com.site.team1.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardMaker {

	//게시판
	private int b_no = 1;
	
	//검색
	private String searchCate = "";
	private String searchWord = "";
	
	//카테고리 분류
	private int b_cate_no = 0;

	//정렬
	private String sort = "date"; //date, view, like
	
	//페이징
	private int page = 1;
	private BoardPage boardPage;
		
}
