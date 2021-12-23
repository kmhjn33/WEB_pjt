package com.site.team1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.BoardCommentVo;
import com.site.team1.vo.BoardPage;
import com.site.team1.vo.BoardPostVo;

@Mapper
public interface MyBoardMapper {

	//총 리스트 수
	int selectMyBoardCount(String type, int uNo);
	//작성글 or 추천한 글 리스트
	List<BoardPostVo> selectMyBoardPost(String type, BoardPage boardPage, int uNo);
	//작성 댓글 리스트
	List<BoardCommentVo> selectMyBoardComment(String type, BoardPage boardPage, int uNo);
	
}
