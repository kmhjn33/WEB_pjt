package com.site.team1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.BoardMapper;
import com.site.team1.vo.BoardCateVo;
import com.site.team1.vo.BoardCommentVo;
import com.site.team1.vo.BoardLikeVo;
import com.site.team1.vo.BoardListPost;
import com.site.team1.vo.BoardMaker;
import com.site.team1.vo.BoardPage;
import com.site.team1.vo.BoardPostVo;
import com.site.team1.vo.BoardReportVo;
import com.site.team1.vo.BoardViewComment;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	Map<String, Object> boardMap = new HashMap<>();
	
	//게시판 목록
	@Override
	public Map<String, Object> BoardList(BoardMaker boardMaker) {
		
		//게시판의 카테고리 가져오기
		List<BoardCateVo> boardListCate = boardMapper.selectBoardCateList(boardMaker);
		//글 개수 가져오기
		int boardPostCount = boardMapper.selectBoardListCount(boardMaker);		
		//페이지 계산
		BoardPage boardPage = new BoardPage(boardMaker.getPage(), boardPostCount);
		boardMaker.setBoardPage(boardPage);	
		//게시판,정렬,분류,검색 내용,페이지에 부합하는 게시글 가져오기
		List<BoardListPost> boardListPost = boardMapper.selectBoardList(boardMaker);		
		
		boardMap.put("boardListCate", boardListCate);
		boardMap.put("boardListPost", boardListPost);
		boardMap.put("boardMaker", boardMaker);
		
		return boardMap;
	}

	//글 작성 페이지로 이동 (게시판별 카테고리 가져옴)
	@Override
	public Map<String, Object> boardWriteCate(BoardMaker boardMaker) {
		
		//게시판의 카테고리 가져오기
		List<BoardCateVo> boardCate = boardMapper.selectBoardCateList(boardMaker);
		
		boardMap.put("boardCate", boardCate);
		boardMap.put("boardMaker", boardMaker);
		
		return boardMap;
	}

	//글 작성(저장)
	@Override
	public int boardWrite(BoardPostVo boardPostVo) {
		
		int result = boardMapper.insertBoardWrite(boardPostVo);
		
		return result;
	}

	//글 보기
	@Override
	public Map<String, Object> boardView(BoardMaker boardMaker, BoardPostVo boardPostVo) {
		
		//선택한 글 가져오기
		BoardListPost boardPostThis = boardMapper.selectBoardPostThis(boardPostVo);
		//이전글 가져옴
		BoardListPost boardPostPrev = boardMapper.selectBoardPostPrev(boardMaker, boardPostVo);		
		//다음글 가져옴
		BoardListPost boardPostNext = boardMapper.selectBoardPostNext(boardMaker, boardPostVo);		
		//댓글 가져옴
		List<BoardViewComment> boardComment = boardMapper.selectBoardComment(boardPostVo);

		boardMap.put("boardMaker", boardMaker);
		boardMap.put("boardPostThis", boardPostThis);
		boardMap.put("boardPostPrev", boardPostPrev);
		boardMap.put("boardPostNext", boardPostNext);
		boardMap.put("boardComment", boardComment);
		
		return boardMap;
	}
	
	//글 수정 페이지로 이동 (해당 글, 카테고리 가져옴)
	@Override
	public Map<String, Object> boardModifyPost(BoardMaker boardMaker, BoardPostVo boardPostVo) {
		
		//선택한 글 가져오기
		BoardListPost boardPostThis = boardMapper.selectBoardPostThis(boardPostVo);
		
		//게시판의 카테고리 가져오기
		List<BoardCateVo> boardCate = boardMapper.selectBoardCateList(boardMaker);
		
		boardMap.put("boardMaker", boardMaker);
		boardMap.put("boardPostThis", boardPostThis);
		boardMap.put("boardCate", boardCate);
		
		return boardMap;
	}

	//글 수정
	@Override
	public int boardModify(BoardPostVo boardPostVo) {
		
		int result = boardMapper.updateBoardModify(boardPostVo);
		
		return result;
	}

	//글 삭제
	@Override
	public int boardDeletePost(BoardPostVo boardPostVo) {
		
		int result = boardMapper.updateBoardDel(boardPostVo);
		
		return result;
	}

	//글 신고
	@Override
	public int boardReport(BoardReportVo boardReportVo) {

		int result = boardMapper.insertBoardReport(boardReportVo);
		
		return result;
	}

	//댓글 작성
	@Override
	public List<BoardViewComment> commentWrite(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo) {
		//댓글 저장
		int result = boardMapper.insertCommentWrite(boardCommentVo);
		//댓글 가져옴
		List<BoardViewComment> boardComment = boardMapper.selectBoardComment(boardPostVo);
		
		return boardComment;
	}

	//댓글 수정
	@Override
	public List<BoardViewComment> commentModify(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo) {
		//댓글 수정
		int result = boardMapper.updateCommentModify(boardCommentVo);
		//댓글 가져옴
		List<BoardViewComment> boardComment = boardMapper.selectBoardComment(boardPostVo);
		
		return boardComment;
	}
	
	//댓글 삭제
	@Override
	public List<BoardViewComment> commentDelete(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo) {
		//댓글 삭제
		int result = boardMapper.updateCommentDel(boardCommentVo);
		//댓글 가져옴
		List<BoardViewComment> boardComment = boardMapper.selectBoardComment(boardPostVo);
		
		return boardComment;
	}

	//게시글 조회수 증가
	@Override
	public int boardViewCountUp(BoardPostVo boardPostVo) {
		int result = boardMapper.updateBoardViewCount(boardPostVo);
		return result;
	}

	//댓글 추천
	@Override
	public int commentLike(BoardCommentVo boardCommentVo) {
		int result = boardMapper.insertCommentLike(boardCommentVo);
		return result;
	}

	//게시글 추천
	@Override
	public int postLike(BoardPostVo boardPostVo) {
		int result = boardMapper.insertPostLike(boardPostVo);
		return result;
	}

}
