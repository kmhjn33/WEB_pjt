package com.site.team1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.BoardAdminVo;
import com.site.team1.vo.BoardCateAdminVo;
import com.site.team1.vo.BoardCommentAdminVo;
import com.site.team1.vo.BoardFileAdminVo;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.BoardPostAdminVo;
import com.site.team1.vo.BoardRecommandVo;
import com.site.team1.vo.BoardReportAdminVo;
import com.site.team1.vo.ChartVo;

@Mapper
public interface BoardAdminMapper {

	// 게시판 분류 정보
	public List<BoardAdminVo> selectBoard();

	// 게시글 분류 정보 (cate)
	public List<BoardCateAdminVo> selectBoardCate(int b_no);
	
	// 게시글 리스트
	public List<BoardPostAdminVo> selectBoardPost(BoardNumberVo nDto);
	
	// 게시글 1건
	public BoardPostAdminVo selectBoardPostbyNo(int b_post_no);
	
	
	// 게시글 정보 count
	public int selectBoardPostCount(BoardNumberVo nDto);
	
	//신고글 정보
	public List<BoardReportAdminVo> selectBoardReports(int b_post_no);
	
	//댓글 정보
	public List<BoardCommentAdminVo> selectBoardComments(int b_post_no);
	
	//첨부파일 정보
	public List<BoardFileAdminVo> selectBoardFiles(int b_post_no);
	
	//추천인 정보
	public List<BoardRecommandVo> selectBoardRecommand(int b_comm_no);
	
	//댓글 정보 삭제
	public int deleteBoardComments(int b_comm_no);
	
	//신고글 정보 삭제
	public int deleteBoardReports(int b_report_no);
	
	//추천정보 삭제
	public int deleteBoardRecommand(int b_comm_like_no);
	
	
	
	
	
}
