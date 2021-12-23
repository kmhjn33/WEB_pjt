package com.site.team1.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@AllArgsConstructor
@Data
public class BoardNumberVo {
	
	private int page;		//현재페이지
	private int limit;		//페이지 게시물 나열 수량 / 고정
	private int startRow;	//시작 게시물
	private int endRow; 	//마지막 게시물 
	private int listcount;	//전체 게시물 갯수
	private int numLimit=5;	//하단 Num 표시 갯수 / 고정
	private int startPageNum;	//시작페이지
	private int endPageNum;		//마지막 페이지 넘버 numLimit 기준
	private int maxPageNum; 	//시작 페이지 넘버 numLimit 기준
	private String category="all";	//검색 카테고리
	private String searchWord; 	//검색어
	//게시판 관련
	private int b_no;					//게시판 선택 board Table
	private int b_cate_no;				//게시글 타입 정보
	
	//크루 관련
	private int cate_main_no;	//크루 메인 분류 정보
	private int cate_sub_no;	//크루 중분류 정보
	
	
	private int r_no;			//로드맵 분류 정보
	private int s_no;			//교재(서브젝트 정보)
	private Date r_detail_startdate; 	// 로드맵 시작 일자
	private Date r_detail_enddate;		// 로드맵 종료 일자
	
	
	
	public BoardNumberVo() {
		searchWord="";
		category="all";
		limit=10;
		numLimit=5;
		page=1;
		
		cate_main_no=0;
		cate_sub_no=0;
		r_no=0;
	}
	
	public BoardNumberVo(int listcount, int page, String category, String searchWord) {
		this.listcount=listcount;
		this.page=page;
		this.category=category;
		this.searchWord=searchWord;
		ReCalc();
				
	}

	private void ReCalc() {
		if(listcount>0) {
			
			
			//최대 페이지 걸기
			maxPageNum=(int)(Math.floor(listcount/limit)) + 1;
			
			if (page > maxPageNum) page=maxPageNum;
			
			System.out.println("maxPageNum : " + maxPageNum);
			
			startPageNum=(int) (Math.floor(page / numLimit)) + 1;
			System.out.println("startPageNum : " + startPageNum);
			if((Math.ceil(page/numLimit) + numLimit) > maxPageNum) {
				endPageNum=maxPageNum;
			}else {
				endPageNum=(int) ((Math.floor(page/numLimit)) + numLimit); 
			}
			System.out.println("endPageNum : " + endPageNum);
			
			// list 걸기			
			if (page > 1) {				
				startRow=(limit * (page-1)) + 1;
			}else {
				startRow=1;
			}
			endRow= ( limit * page );
			if (endRow >= listcount) {
				endRow=listcount;
			}				
		}else {
			// 리스트가 0 일 경우는 모든 값 초기화
			maxPageNum=0;
			startPageNum=0;
			endPageNum=0;
			startRow=0;
			endRow=0;
			//category="";
			//searchWord="";
		}
	}
	
	

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		
		this.page = page;
		this.ReCalc();
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getListcount() {
		return listcount;
	}
	public void setListcount(int listcount) {
				
		this.listcount = listcount;
		ReCalc();
	}
	public int getNumLimit() {
		return numLimit;
	}
	public void setNumLimit(int numLimit) {
		this.numLimit = numLimit;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getMaxPageNum() {
		return maxPageNum;
	}
	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
	}


	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}



	
	
	
	
}
