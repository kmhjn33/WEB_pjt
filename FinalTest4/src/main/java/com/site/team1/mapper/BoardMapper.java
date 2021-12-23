package com.site.team1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.BoardCateVo;
import com.site.team1.vo.BoardCommentVo;
import com.site.team1.vo.BoardLikeVo;
import com.site.team1.vo.BoardListPost;
import com.site.team1.vo.BoardMaker;
import com.site.team1.vo.BoardPostVo;
import com.site.team1.vo.BoardReportVo;
import com.site.team1.vo.BoardViewComment;
import com.site.team1.vo.UserInfoVo;

@Mapper
public interface BoardMapper {
	
	//게시판의 카테고리 가져오기
	public List<BoardCateVo> selectBoardCateList(BoardMaker boardMaker);

	//글 갯수 가져오기
	public int selectBoardListCount(BoardMaker boardMaker);
	
	//게시판,정렬,분류,검색 내용,페이지에 부합하는 게시글 가져오기
	public List<BoardListPost> selectBoardList(BoardMaker boardMaker);

	//글 작성(저장)
	public int insertBoardWrite(BoardPostVo boardPostVo);

	//선택한 글 가져오기
	public BoardListPost selectBoardPostThis(BoardPostVo boardPostVo);

	//이전글 가져옴
	public BoardListPost selectBoardPostPrev(BoardMaker boardMaker, BoardPostVo boardPostVo);

	//다음글 가져옴
	public BoardListPost selectBoardPostNext(BoardMaker boardMaker, BoardPostVo boardPostVo);

	//댓글 가져옴
	public List<BoardViewComment> selectBoardComment(BoardPostVo boardPostVo);

	//인기글 가져옴
//	public List<BoardListPost> selectBoardPostPop(BoardPostVo boardPostVo);

	//글 수정(업데이트)
	public int updateBoardModify(BoardPostVo boardPostVo);

	//글 삭제
	public int updateBoardDel(BoardPostVo boardPostVo);

	//글 신고
	public int insertBoardReport(BoardReportVo boardReportVo);

	//댓글 저장
	public int insertCommentWrite(BoardCommentVo boardCommentVo);

	//댓글 수정
	public int updateCommentModify(BoardCommentVo boardCommentVo);

	//댓글 삭제
	public int updateCommentDel(BoardCommentVo boardCommentVo);

	//게시글 조회수 증가
	public int updateBoardViewCount(BoardPostVo boardPostVo);

	//댓글 추천
	public int insertCommentLike(BoardCommentVo boardCommentVo);

	//게시글 추천
	public int insertPostLike(BoardPostVo boardPostVo);
	
}
