package com.site.team1.service;

import java.util.List;

import com.site.team1.vo.BoardAdminVo;
import com.site.team1.vo.BoardCommentAdminVo;
import com.site.team1.vo.BoardFileAdminVo;
import com.site.team1.vo.BoardPostAdminVo;
import com.site.team1.vo.BoardRecommandVo;
import com.site.team1.vo.BoardReportAdminVo;

public interface BoardAdminService {
	public List<BoardAdminVo> selectBoardList();
	public BoardPostAdminVo selectBoardPostbyNo(int b_post_no);
	//신고글 조회
	public List<BoardReportAdminVo> selectBoardReports(int b_post_no);
	//댓글 조회
	public List<BoardCommentAdminVo> selectBoardComments(int b_post_no);
	//첨부파일 조회
	public List<BoardFileAdminVo> selectBoardFiles(int b_post_no);
	//추천글 조회
	public List<BoardRecommandVo> selectBoardRecommand(int b_comm_no);
	
	//신고글 삭제
	public int deleteBoardReports(int b_report_no);
	//댓글 삭제
	public int deleteBoardComments(int b_comm_no);
	//추천글 삭제
	public int deleteBoardRecommand(int b_comm_like_no);
	
}
