package com.site.team1.service;

import java.util.List;
import java.util.Map;

import com.site.team1.vo.BoardCommentVo;
import com.site.team1.vo.BoardMaker;
import com.site.team1.vo.BoardPostVo;
import com.site.team1.vo.BoardReportVo;
import com.site.team1.vo.BoardViewComment;
import com.site.team1.vo.UserInfoVo;

public interface BoardService {
	
	//게시판 목록
	Map<String, Object> BoardList(BoardMaker boardMaker);

	//글 작성 페이지로 이동 (게시판별 카테고리 가져옴)
	Map<String, Object> boardWriteCate(BoardMaker boardMaker);

	//글 작성
	int boardWrite(BoardPostVo boardPostVo);

	//글 보기 (해당 글, 이전글, 다음글, 댓글, 추천 정보 가져옴)
	Map<String, Object> boardView(BoardMaker boardMaker, BoardPostVo boardPostVo);

	//글 수정 페이지로 이동 (해당 글, 카테고리 가져옴)
	Map<String, Object> boardModifyPost(BoardMaker boardMaker, BoardPostVo boardPostVo);
	
	//글 수정
	int boardModify(BoardPostVo boardPostVo);

	//글 삭제
	int boardDeletePost(BoardPostVo boardPostVo);

	//글 신고
	int boardReport(BoardReportVo boardReportVo);

	//댓글 작성
	List<BoardViewComment> commentWrite(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo);

	//댓글 수정
	List<BoardViewComment> commentModify(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo);

	//댓글 삭제
	List<BoardViewComment> commentDelete(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo);

	//조회수 증가
	int boardViewCountUp(BoardPostVo boardPostVo);

	//댓글 추천
	int commentLike(BoardCommentVo boardCommentVo);

	//게시글 추천
	int postLike(BoardPostVo boardPostVo);

}
