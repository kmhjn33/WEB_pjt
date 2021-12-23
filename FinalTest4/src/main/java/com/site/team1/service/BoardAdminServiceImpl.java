package com.site.team1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.BoardAdminMapper;
import com.site.team1.vo.BoardAdminVo;
import com.site.team1.vo.BoardCommentAdminVo;
import com.site.team1.vo.BoardFileAdminVo;
import com.site.team1.vo.BoardPostAdminVo;
import com.site.team1.vo.BoardRecommandVo;
import com.site.team1.vo.BoardReportAdminVo;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {

	@Autowired
	BoardAdminMapper boardAdminMapper;
	
	@Override
	public List<BoardAdminVo> selectBoardList() {
		List<BoardAdminVo> list = boardAdminMapper.selectBoard();
		return list;
	}//게시글 리스트

	@Override
	public List<BoardReportAdminVo> selectBoardReports(int b_post_no) {
		List<BoardReportAdminVo> rlist=boardAdminMapper.selectBoardReports(b_post_no);
		return rlist;
	}//신고글 조회

	@Override
	public List<BoardCommentAdminVo> selectBoardComments(int b_post_no) {
		List<BoardCommentAdminVo> clist=boardAdminMapper.selectBoardComments(b_post_no);
		return clist;
	}// 댓글 조회

	@Override
	public List<BoardFileAdminVo> selectBoardFiles(int b_post_no) {
		List<BoardFileAdminVo> flist=boardAdminMapper.selectBoardFiles(b_post_no);
		return flist;
	}// 첨부파일 조회

	@Override
	public BoardPostAdminVo selectBoardPostbyNo(int b_post_no) {
		BoardPostAdminVo bDto=boardAdminMapper.selectBoardPostbyNo(b_post_no);
		return bDto;
	}//게시글 조회

	@Override
	public List<BoardRecommandVo> selectBoardRecommand(int b_comm_no) {
		
		List<BoardRecommandVo> list=boardAdminMapper.selectBoardRecommand(b_comm_no);
		
		return list;
	}//추천인 조회

	@Override
	public int deleteBoardReports(int b_report_no) {
		int ret=boardAdminMapper.deleteBoardReports(b_report_no);
		return ret;
	}

	@Override
	public int deleteBoardComments(int b_comm_no) {
		int ret=boardAdminMapper.deleteBoardComments(b_comm_no);
		return ret;
	}

	@Override
	public int deleteBoardRecommand(int b_comm_like_no) {
		int ret=boardAdminMapper.deleteBoardRecommand(b_comm_like_no);
		return ret;
	}

}
