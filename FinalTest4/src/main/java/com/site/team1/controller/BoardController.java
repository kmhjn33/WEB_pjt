package com.site.team1.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.team1.service.BoardService;
import com.site.team1.vo.BoardCommentVo;
import com.site.team1.vo.BoardMaker;
import com.site.team1.vo.BoardPostVo;
import com.site.team1.vo.BoardReportVo;
import com.site.team1.vo.BoardViewComment;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	Map<String, Object> boardMap;
	
	
	//게시판 목록(게시판 번호)
	@RequestMapping(value = {"/list/{b_no}", "/list"} )
	public String boardList(BoardMaker boardMaker, Model model) {
		
		//게시판 카테고리, 글, 갯수, 페이지 가져오기
		boardMap = boardService.BoardList(boardMaker);
		
		model.addAttribute("boardMap", boardMap);
		
		return "/board/list";
	}

	//글 작성 페이지로 이동
	@GetMapping("/write/{b_no}")
	public String boardWrite(BoardMaker boardMaker, Model model) {
		
		//게시판에 맞는 카테고리 가져옴
		boardMap = boardService.boardWriteCate(boardMaker);
		
		model.addAttribute("boardMap", boardMap);
		
		return "/board/write";
	}
	
	//글 작성 완료
	@PostMapping("/write")
	public String boardWrite(BoardMaker boardMaker, BoardPostVo boardPostVo) {
		
		//세션 유저 번호 세팅
		boardPostVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		//글 작성
		int result = boardService.boardWrite(boardPostVo);
		
		return "redirect:/board/view/" + boardMaker.getB_no() + "?b_post_no=" + boardPostVo.getB_post_no();
	}
	
	//글 보기
	@RequestMapping(value = {"/view/{b_no}", "/view"})
	public String boardView(BoardMaker boardMaker, BoardPostVo boardPostVo, 
							@CookieValue(name = "visitList", required = false) Cookie cookie, 
							Model model, HttpServletResponse response) {
		
		String postNo = String.valueOf(boardPostVo.getB_post_no());
		
		//게시글 조회 목록 쿠키가 없을 경우
		if(cookie == null) {
			//쿠키 생성 후 조회 게시글 번호 추가
			cookie = new Cookie("visitList", postNo);
			//게시글 조회수 증가
			int result = boardService.boardViewCountUp(boardPostVo);
			
		} else {
			//게시글 조회 목록 쿠키가 있을 경우
			String[] vList = cookie.getValue().split("/");
			Boolean isVisit = false;
			
			//게시글 조회 목록과 현재 게시글 번호 대조
			for(String visitPost : vList) {
				if (visitPost.equals(postNo)) {
					isVisit = true;
					break;
				}//if-end
			}//for-end
			
			//게시글 첫 조회일 경우 조회 목록에 게시글 번호 추가, 게시글 조회수 증가
			if(!isVisit) {
				String newVisitList = cookie.getValue() + "/" + postNo;
				cookie.setValue(newVisitList);
				
				int result = boardService.boardViewCountUp(boardPostVo);
			}//if-end
		}//if-else-end
		
		//해당 글, 이전글, 다음글, 인기글, 댓글, 추천 정보 가져옴
		boardMap = boardService.boardView(boardMaker, boardPostVo);
		
		model.addAttribute("boardMap", boardMap);
		response.addCookie(cookie);
		
		return "/board/view";
	}
	
	//글 수정 페이지로 이동
	@GetMapping("/modify/{b_no}")
	public String boardModify(BoardMaker boardMaker, BoardPostVo boardPostVo, Model model) {
		
		boardMap = boardService.boardModifyPost(boardMaker, boardPostVo);
		
		model.addAttribute("boardMap", boardMap);
		
		return "/board/modify";
	}
	
	//글 수정
	@PostMapping("/modify")
	public String boardModify(BoardMaker boardMaker, BoardPostVo boardPostVo) {
		//글 수정
		int result = boardService.boardModify(boardPostVo);
		//###########################파일 저장 부분 해야됨
		
		return "redirect:/board/view/" + boardMaker.getB_no() + "?b_post_no=" + boardPostVo.getB_post_no();
	}
	
	//글 삭제
	@RequestMapping("/delete")
	@ResponseBody
	public int boardDelete(BoardPostVo boardPostVo) {
		//글 삭제
		int result = boardService.boardDeletePost(boardPostVo);
		
		return result;
	}
	
	//글 신고
	@RequestMapping("/report")
	@ResponseBody
	public int boardReport(BoardReportVo boardReportVo) {
		//세션 유저 번호 세팅
		boardReportVo.setU_no((Integer)session.getAttribute("session_u_no"));
		//글 신고
		int result = boardService.boardReport(boardReportVo);
		
		return result;
	}
	
	
	//댓글, 답댓글 작성
	@RequestMapping("/commentWrite")
	@ResponseBody
	public List<BoardViewComment> commentWrite(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo) {
		//세션 유저 번호 세팅
		boardCommentVo.setU_no((Integer)session.getAttribute("session_u_no"));
		
		List<BoardViewComment> boardComment = boardService.commentWrite(boardPostVo, boardCommentVo);
		
		return boardComment;
	}
	
	//댓글, 답댓글 수정
	@RequestMapping("/commentModify")
	@ResponseBody
	public List<BoardViewComment> commentModify(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo) {
		
		List<BoardViewComment> boardComment = boardService.commentModify(boardPostVo, boardCommentVo);
		
		return boardComment;
	}
	
	
	//댓글 삭제
	@RequestMapping("/commentDelete")
	@ResponseBody
	public List<BoardViewComment> commentDelete(BoardPostVo boardPostVo, BoardCommentVo boardCommentVo) {
		
		List<BoardViewComment> boardComment = boardService.commentDelete(boardPostVo, boardCommentVo);
		
		return boardComment;
	}
	
	//댓글 추천
	@RequestMapping("/commentLike")
	@ResponseBody
	public int commentLike(BoardCommentVo boardCommentVo) {
		
		//세션 유저 번호 세팅
		boardCommentVo.setU_no((Integer)session.getAttribute("session_u_no"));
		int result = boardService.commentLike(boardCommentVo);
		
		return result;
	}
	
	//게시글 추천
	@RequestMapping("/postLike")
	@ResponseBody
	public int postLike(BoardPostVo boardPostVo) {
		
		//세션 유저 번호 세팅
		boardPostVo.setU_no((Integer)session.getAttribute("session_u_no"));
		int result = boardService.postLike(boardPostVo);
		
		return result;
	}

	//summernote 파일 업로드
	@ResponseBody
	@RequestMapping("/summerUpload")
	public String summerUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String str_filename = "";
		
		// 업로드할 폴더 경로
		String realFolder = "C:/team1FileSave/";//저장될 외부 파일 경로

		// 업로드할 파일 이름
		String originFileName = file.getOriginalFilename();
		long time = System.currentTimeMillis();
		
		// 1개의 파일이름을 변형해서 다시 저장
		str_filename = String.format("%d_%s", time, originFileName);

		String filepath = realFolder + "/" + str_filename;

		File f = new File(filepath);
		file.transferTo(f);

		return "/upload/"+str_filename;

	}
	
}
