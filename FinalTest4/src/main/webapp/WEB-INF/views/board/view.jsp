<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/board_common.css" />
        <link rel="stylesheet" href="/css/board_list.css" />
        <link rel="stylesheet" href="/css/board_view.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="/js/board_view.js"></script>
        <title>view</title>
        
        <link rel="stylesheet" href="/css/header.css">
        <!-- 구글 아이콘 링크 -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<script type="text/javascript">
		
		//*************************************************************************************************
		
			var b_post_no = ${boardMap.boardPostThis.b_post_no};
		
		//*************************************************************************************************
			//댓글창 교체
			function commentReroad(data) {
				
				var tHtml = "";
				
				for (var i = 0; i < data.length; i++) {

					var b_comm_date = new Date(data[i].b_comm_date);
					b_comm_date = b_comm_date.toLocaleString();
					b_comm_date = b_comm_date.replace(/. /gi, "-");
					b_comm_date = b_comm_date.replace("-오-", " ");
					
					if (data[i].b_comm_reply == 0) {
						//댓글인 경우								
						tHtml += '<div class="comment" id="' + data[i].b_comm_no + '">';
						tHtml += '<div class="comment_content">';
						tHtml += '<div>' + data[i].b_comm_content +'</div>';
						tHtml += '</div>';
						tHtml += '<div class="comment_info">';
						tHtml += '<div class="comm_info_left">';
						tHtml += '<span id="comm_u_nickname">' + data[i].u_nickname + '</span>';
						tHtml += '<span>|</span>';
						tHtml += '<span id="comm_date">' + b_comm_date + '</span>';
						if ( '${session_u_no}' == data[i].u_no ) {
							tHtml += '<span>|</span>';
							tHtml += '<span class="c_pointer h_bold" onclick="commentModiOpen(' + data[i].b_comm_no + ')">수정</span>';
							tHtml += '<span>|</span>';
							tHtml += '<span class="c_pointer h_bold" onclick="commentDel(' + data[i].b_comm_no + ')">삭제</span>';
						}
						tHtml += '</div>';
						tHtml += '<div class="comm_info_right">';
						tHtml += '<span class="c_pointer h_bold" onclick="reCommentWriteOpen(' + data[i].b_comm_no + ',\'' + data[i].u_nickname + '\')">답글</span>';
						tHtml += '<span>|</span>';
						tHtml += '<div class="comm_like c_pointer h_bold" onclick="commentLike(' + data[i].b_comm_no + ')">';
						tHtml += '<span>추천</span>';
						tHtml += '<span class="comm_like_count">' + data[i].b_comm_like_count + '</span>';
						tHtml += '</div>';
						tHtml += '</div>';
						tHtml += '</div>';
						tHtml += '</div>';
						
					} else {
						//답댓글인 경우
	                    tHtml += '<div class="comment" id="' + data[i].b_comm_no + '">';
	                    tHtml += '<div class="comment_content comm_re_wrap">';
	                    tHtml += '<div>';
	                    tHtml += '<span class="re_user_in">@' + data[i].b_comm_reply_nickname + '</span>';
	                    tHtml += '<span class="re_comment_content">' + data[i].b_comm_content + '</span>';
	                    tHtml += '</div>';
	                    tHtml += '</div>';
	                    tHtml += '<div class="comment_info comm_re_wrap">';
	                    tHtml += '<div class="comm_info_left">';
	                    tHtml += '<span id="comm_u_nickname">' + data[i].u_nickname + '</span>';
	                    tHtml += '<span>|</span>';
	                    tHtml += '<span id="comm_date">' + b_comm_date + '</span>';
	                    if ( '${session_u_no}' == data[i].u_no ) {
	                    	tHtml += '<span>|</span>';
	                    	tHtml += '<span class="c_pointer h_bold" onclick="reCommentModiOpen(' + data[i].b_comm_no + ')">수정</span>';
	                    	tHtml += '<span>|</span>';
	                    	tHtml += '<span class="c_pointer h_bold" onclick="commentDel(' + data[i].b_comm_no + ')">삭제</span>';
	                    }
	                    tHtml += '</div>';
	                    tHtml += '<div class="comm_info_right">';
	                    tHtml += '<span class="c_pointer h_bold" onclick="reCommentWriteOpen(' + data[i].b_comm_no + ',\'' + data[i].u_nickname + '\')">답글</span>';
	                    tHtml += '<span>|</span>';
	                    tHtml += '<div class="comm_like c_pointer h_bold comm_like_on" onclick="commentLike(' + data[i].b_comm_no + ')">';
	                    tHtml += '<span>추천</span>';
	                    tHtml += '<span class="comm_like_count">' + data[i].b_comm_like_count + '</span>';
	                    tHtml += '</div>';
	                    tHtml += '</div>';
	                   	tHtml += '</div>';
	                    tHtml += '</div>';
						
					}//if-end
					
				}//for-end
				
				$("#comment_view_wrap").html(tHtml);
				$("#view_comment_count").text(data.length);
				
			}//commentReroad-end
		
		//*************************************************************************************************
			
			//댓글 작성
			function commentWrite() {
				
				var b_comm_content = $("#comm_write").val();
				
				if(b_comm_content == '') return false;
				
				$.ajax({
					url : "/board/commentWrite",
					type : "post",
					data : {
						"b_post_no" : b_post_no,
						"b_comm_content" : b_comm_content
					},
					success : function(data) {
						
						commentReroad(data);
						
						$("#comm_write").val("");
						
					},//success-end
					error : function(data) {
						alert("오류가 발생했습니다. 다시 시도해주세요.");
					}
				});//ajax-end		
				
			}//commentWrite-end
			
		//*************************************************************************************************
			
			//답댓글 폼 오픈 여부
			var isReCommentWriteOpen = false;
			
			//답댓글 작성 폼 열기
			function reCommentWriteOpen(b_comm_no, u_nickname) {
				
				if(${session_u_id == null}) {
					alert("로그인 후 이용해주세요.");
					return false;
				}
				
				//열려있는 폼이 있으면 닫음
				if(isReCommentWriteOpen) $("#reCommentWriteForm").remove();
					
					tHtml = '';
					
					tHtml += '<div class="comment" id="reCommentWriteForm">';
					tHtml += '<div class="comment_content comm_re_wrap">';
					tHtml += '<div class="re_user">@' + u_nickname + '</div>';
					tHtml += '<div class="comm_modi_text">';
					tHtml += '<textarea name="b_comm_content" id="comm_reply" maxlength="500" placeholder="댓글을 입력하세요. (최대 500글자)"></textarea>';
					tHtml += '</div>';
					tHtml += '</div>';
	
					tHtml += '<div class="comment_info">';
					tHtml += '<div class="comm_info_right">';
					tHtml += '<span class="c_pointer comm_re_ok h_bold" onclick="reCommentWrite(' + b_comm_no + ')">완료</span>';
					tHtml += '<span>|</span>';
					tHtml += '<span class="c_pointer comm_re_cancle h_bold" onclick="reCommentWriteClose()">취소</span>';
					tHtml += '</div>';
					tHtml += '</div>';
					tHtml += '</div>';
					
					$("#" + b_comm_no).after(tHtml);
					
					isReCommentWriteOpen = true;
				
			}//reCommentWriteOpen-end
			
			//답댓글 작성 폼 닫기
			function reCommentWriteClose() {
				$("#reCommentWriteForm").remove();
				isReCommentWriteOpen = false;
			}//reCommentWriteClose-end
		
			//답댓글 작성
			 function reCommentWrite(b_comm_no) {
				
				var b_comm_content = $("#comm_reply").val();
				
				if(b_comm_content == '') return false;
				
				$.ajax({
					url : "/board/commentWrite",
					type : "post",
					data : {
						"b_post_no" : b_post_no,
						"b_comm_content" : b_comm_content,
						"b_comm_reply" : 1,
						"b_comm_group" : b_comm_no
					},
					success : function(data) {
						
						commentReroad(data);
						
						$("#comm_write").val("");
						
					},//success-end
					error : function(data) {
						alert("오류가 발생했습니다. 다시 시도해주세요.");
					}
				});//ajax-end	
				
			}//reCommentWrite-end
			
		//*************************************************************************************************
		
			//댓글 수정 폼 오픈 여부, 오픈 전 데이터
			var isCommentModiOpen = false;
			var beforeModiCon = '';
			var beforeModiNickname = '';
			var beforeModiDate = '';
			var beforeModiLike = '';
			var reUserNickname = '';
			
			//댓글 수정 폼 열기
			function commentModiOpen(b_comm_no) {

				if(isCommentModiOpen) {
					alert("수정을 완료 또는 취소해주세요.");
					return false;
				}  
				
				beforeModiCon = $("#" + b_comm_no + " .comment_content  div").text();
				beforeModiNickname = $("#" + b_comm_no + " #comm_u_nickname").text();
				beforeModiDate= $("#" + b_comm_no + " #comm_date").text();
				beforeModiLike = $("#" + b_comm_no + " .comment_like_count").text();
				if (beforeModiLike == '') beforeModiLike = 0;
				
				var tHtml = '';
				
				tHtml += '<div class="comment" id="' + b_comm_no + '">';
				tHtml += '<div class="comment_content">';
				tHtml += '<div class="comm_modi_text">';
				tHtml += '<textarea name="b_comm_content" id="comm_modify" maxlength="500" placeholder="댓글을 입력하세요. (최대 500글자)">' + beforeModiCon + '</textarea>';
				tHtml += '</div>';
				tHtml += '</div>';
				tHtml += '<div class="comment_info">';
				tHtml += '<div class="comm_info_left">';
				tHtml += '<span>' + beforeModiNickname + '</span>';
				tHtml += '<span>|</span>';
				tHtml += '<span>' + beforeModiDate + '</span>';
				tHtml += '</div>';
				tHtml += '<div class="comm_info_right">';
				tHtml += '<span class="c_pointer comm_mod_ok h_bold" onclick="commentModi(' + b_comm_no + ')">완료</span>';
				tHtml += '<span>|</span>';
				tHtml += '<span class="c_pointer comm_mod_cancle h_bold" onclick="commentModiClose(' + b_comm_no + ')">취소</span>';
				tHtml += '</div>';
				tHtml += '</div>';
				tHtml += '</div>';
				
				$("#" + b_comm_no).html(tHtml);
				
				isCommentModiOpen = true;
				
			}//commentModiOpen-end
			
			//댓글 수정 폼 닫기
			function commentModiClose(b_comm_no) {
				
				var tHtml = '';
				
				tHtml += '<div class="comment" id="' + b_comm_no + '">';
				tHtml += '<div class="comment_content">';
				tHtml += '<div>' + beforeModiCon +'</div>';
				tHtml += '</div>';
				tHtml += '<div class="comment_info">';
				tHtml += '<div class="comm_info_left">';
				tHtml += '<span id="comm_u_nickname">' + beforeModiNickname + '</span>';
				tHtml += '<span>|</span>';
				tHtml += '<span id="comm_date">' + beforeModiDate + '</span>';
				tHtml += '<span>|</span>';
				tHtml += '<span class="c_pointer h_bold" onclick="commentModiOpen(' + b_comm_no + ')">수정</span>';
				tHtml += '<span>|</span>';
				tHtml += '<span class="c_pointer h_bold" onclick="commentDel(' + b_comm_no + ')">삭제</span>';
				tHtml += '</div>';
				tHtml += '<div class="comm_info_right">';
				tHtml += '<span class="c_pointer h_bold" onclick="reCommentWriteOpen(' + b_comm_no + ',\'' + beforeModiNickname + '\')">답글</span>';
				tHtml += '<span>|</span>';
				tHtml += '<div class="comm_like c_pointer h_bold" onclick="commentLike(' + b_comm_no + ')">';
				tHtml += '<span>추천</span>';
				tHtml += '<span class="comm_like_count">' + beforeModiLike + '</span>';
				tHtml += '</div>';
				tHtml += '</div>';
				tHtml += '</div>';
				tHtml += '</div>';
				
				$("#" + b_comm_no).html(tHtml);
				
				isCommentModiOpen = false;
				
			}//commentModiClose
			
			//댓글 수정
			function commentModi(b_comm_no) {
				
				var b_comm_content = $("#comm_modify").val();
				
				//수정 전과 같은 내용이면 폼 닫기 메서드 호출
				if(b_comm_content == beforeModiCon) commentModiClose(b_comm_no);
				
				$.ajax({
					url : "/board/commentModify",
					type : "post",
					data : {
						"b_comm_no" : b_comm_no,
						"b_comm_content" : b_comm_content,
						"b_post_no" : b_post_no
					},
					success : function(data) {
						
						commentReroad(data);
						
					},//success-end
					error : function(data) {
						alert("오류가 발생했습니다. 다시 시도해주세요.");
					}
				});//ajax-end
				
				isCommentModiOpen = false;
				
			}//commentModi-end

			
			//답댓글 수정 폼 열기
			function reCommentModiOpen(b_comm_no) {

				if(isCommentModiOpen) {
					alert("수정을 완료 또는 취소해주세요.");
					return false;
				}  
				
 				beforeModiCon = $("#" + b_comm_no + " .comm_re_wrap .re_comment_content").text();
				beforeModiNickname = $("#" + b_comm_no + " #comm_u_nickname").text();
				beforeModiDate= $("#" + b_comm_no + " #comm_date").text();
				beforeModiLike = $("#" + b_comm_no + " .comment_like_count").text();
				if (beforeModiLike == '') beforeModiLike = 0;
				
				reUserNickname = $("#" + b_comm_no + " .re_user_in").text();
				
 				var tHtml = '';
				
				tHtml += '<div class="comment" id="' + b_comm_no + '">';
				tHtml += '<div class="comment_content comm_re_wrap">';
				tHtml += '<div class="re_user">' + reUserNickname + '</div>';
				tHtml += '<div class="comm_modi_text">';
				tHtml += '<textarea name="b_comm_content" id="comm_reply" maxlength="500" placeholder="댓글을 입력하세요. (최대 500글자)">' + beforeModiCon + '</textarea>';
				tHtml += '</div>';
				tHtml += '</div>';
				tHtml += '<div class="comment_info">';
				tHtml += '<div class="comm_info_right">';
				tHtml += '<span class="c_pointer comm_re_ok h_bold" onclick="reCommentModi(' + b_comm_no + ')">완료</span>';
				tHtml += '<span>|</span>';
				tHtml += '<span class="c_pointer comm_re_cancle h_bold" onclick="reCommentModiClose(' + b_comm_no + ')">취소</span>';
				tHtml += '</div>';
				tHtml += '</div>';
				tHtml += '</div>';
				
				
				$("#" + b_comm_no).html(tHtml);
				
				isCommentModiOpen = true; 
			}//reCommentModiOpen-end
			
			
			//답댓글 수정
			function reCommentModi(b_comm_no) {
				
				var b_comm_content = $("#comm_reply").val();
				
				//수정 전과 같은 내용이면 폼 닫기 메서드 호출
				if(b_comm_content == beforeModiCon) reCommentModiClose(b_comm_no);
				
				$.ajax({
					url : "/board/commentModify",
					type : "post",
					data : {
						"b_comm_no" : b_comm_no,
						"b_comm_content" : b_comm_content,
						"b_post_no" : b_post_no
					},
					success : function(data) {
						
						commentReroad(data);
						
					},//success-end
					error : function(data) {
						alert("오류가 발생했습니다. 다시 시도해주세요.");
					}
				});//ajax-end
				
				isCommentModiOpen = false;
				
			}//reCommentModi-end
			
			//답댓글 수정 폼 닫기
			function reCommentModiClose(b_comm_no) {
				
				var tHtml = '';

                tHtml += '<div class="comment" id="' + b_comm_no + '">';
                tHtml += '<div class="comment_content comm_re_wrap">';
                tHtml += '<div>';
                tHtml += '<span class="re_user_in">' + reUserNickname + '</span>';
                tHtml += '<span class="re_comment_content">' + beforeModiCon + '</span>';
                tHtml += '</div>';
                tHtml += '</div>';
                tHtml += '<div class="comment_info comm_re_wrap">';
                tHtml += '<div class="comm_info_left">';
                tHtml += '<span id="comm_u_nickname">' + beforeModiNickname + '</span>';
                tHtml += '<span>|</span>';
                tHtml += '<span id="comm_date">' + beforeModiDate + '</span>';
               	tHtml += '<span>|</span>';
               	tHtml += '<span class="c_pointer h_bold" onclick="reCommentModiOpen(' + b_comm_no + ')">수정</span>';
               	tHtml += '<span>|</span>';
               	tHtml += '<span class="c_pointer h_bold" onclick="commentDel(' + b_comm_no + ')">삭제</span>';
                tHtml += '</div>';
                tHtml += '<div class="comm_info_right">';
                tHtml += '<span class="c_pointer h_bold" onclick="reCommentWriteOpen(' + b_comm_no + ',\'' + beforeModiNickname + '\')">답글</span>';
                tHtml += '<span>|</span>';
                tHtml += '<div class="comm_like c_pointer h_bold comm_like_on" onclick="commentLike(' + b_comm_no + ')">';
                tHtml += '<span>추천</span>';
                tHtml += '<span class="comm_like_count">' + beforeModiLike + '</span>';
                tHtml += '</div>';
                tHtml += '</div>';
               	tHtml += '</div>';
                tHtml += '</div>';
				
				$("#" + b_comm_no).html(tHtml);
				
				isCommentModiOpen = false;
				
			}//reCommentModiClose-end
		

		//*************************************************************************************************
			
			//댓글 삭제
			function commentDel(b_comm_no) {
				
				if(confirm("댓글을 삭제하시겠습니까?")) {
				
					$.ajax({
						url : "/board/commentDelete",
						type : "post",
						data : {
							"b_comm_no" : b_comm_no,
							"b_post_no" : b_post_no
						},
						success : function(data) {
							
							commentReroad(data);
							
						},//success-end
						error : function(data) {
							alert("오류가 발생했습니다. 다시 시도해주세요.");
						}
					});//ajax-end
					
				}//if-end
				
			}//commentDel-end
			
			
		//*************************************************************************************************		
 	
			//댓글 추천
			function commentLike(b_comm_no) {
				
				if(${session_u_id == null}) {
					alert("로그인 후 이용해주세요.");
					return false;
				}
					
				$.ajax({
					url : "/board/commentLike",
					type : "post",
					data : {
						"b_comm_no" : b_comm_no
					},
					success : function(data) {
						if (data == 1) {
							var likeCount = parseInt($("#" + b_comm_no + " .comm_like_count").text());
							$("#" + b_comm_no + " .comm_like_count").text(likeCount + 1);
						} else {
							alert("이미 추천한 댓글입니다.");
						}
						
					},//success-end
					error : function(data) {
						alert("오류가 발생했습니다. 다시 시도해주세요.");
					}
				});//ajax-end
				
			}//commentLike-end
		
			 
		//*************************************************************************************************
		
			//게시물 삭제
 			function postDel() {
				if(confirm("게시물을 삭제하시겠습니까?")) {
					
					$.ajax({
						url : "/board/delete",
						type : "post",
						data : {
							"b_post_no" : b_post_no
						},
						success : function(data) {
							
							if(data != 0) {
								alert("삭제되었습니다.");
								location.href="/board/list/${ boardMap.boardMaker.b_no }?sort=${ boardMap.boardMaker.sort }"
									+ "&searchCate=${ boardMap.boardMaker.searchCate }&searchWord=${ boardMap.boardMaker.searchWord }&page="
									+ "${ boardMap.boardMaker.page }&b_cate_no=${ boardMap.boardMaker.b_cate_no }";
							} else {
								alert("오류가 발생했습니다. 다시 시도해주세요.");
							}
							
						},
						error : function(data) {
							alert("오류가 발생했습니다. 다시 시도해주세요.");
						}
					});//ajax-end
				}//if-end
			}//postDel-end
			
		//************************************************************************************************* 
		
			//게시물 신고
  			function sendReport() {
				
				if(${session_u_id == null}) {
					alert("로그인 후 이용해주세요.");
					return false;
				}
				
				var b_report_content = $("#b_report_content").val();

				if (b_report_content == "") {
					alert("신고 내용을 입력해주세요.");
					return false;
				}
				
 				$.ajax({
					url : "/board/report",
					type : "post",
					data : {
						"b_post_no" : b_post_no,
						"b_report_content" : b_report_content
					},
					success : function(data) {
						if(data == 1) {
							alert("신고가 정상적으로 접수되었습니다.");
							$(".report_modal_wrap").fadeOut();
						} else {
							alert("오류가 발생했습니다. 다시 시도해주세요.");
						}
					},
					error : function(data) {
						alert("오류가 발생했습니다. 다시 시도해주세요.");
					}
				}); 
				//ajax-end
 			}//sendReport-end
 			
			
 		//*************************************************************************************************		
 	 	
			//게시글 추천
			function postLike() {
 				
				if(${session_u_id == null}) {
					alert("로그인 후 이용해주세요.");
					return false;
				}
					
				$.ajax({
					url : "/board/postLike",
					type : "post",
					data : {
						"b_post_no" : b_post_no
					},
					success : function(data) {
						if (data == 1) {
							var likeCount = parseInt($("#view_like_count").text());
							$("#view_like_count").text(likeCount + 1);
						} else {
							alert("이미 추천한 게시물입니다.");
						}
						
					},//success-end
					error : function(data) {
						alert("오류가 발생했습니다. 다시 시도해주세요.");
					}
				});//ajax-end
				
			}//postLike-end
 			
			 			
		</script>
	
    </head>
    <body>
    
		<c:if test="${ boardMap.boardPostThis.b_post_expose == 'N' }">
			<script type="text/javascript">
				alert("삭제된 게시물입니다.");
				history.back();
			</script>
		</c:if>    

        <%@include file="/WEB-INF/views/header_footer/header.jsp" %>

        <content>
        
        	<c:set var="b_no" value="${ boardMap.boardMaker.b_no }" />
        	<c:set var="b_cate_no" value="${ boardMap.boardMaker.b_cate_no }" />
        	<c:set var="sort" value="${ boardMap.boardMaker.sort }" />
        	<c:set var="searchCate" value="${ boardMap.boardMaker.searchCate }" />
        	<c:set var="searchWord" value="${ boardMap.boardMaker.searchWord }" />
        	<c:set var="page" value="${ boardMap.boardMaker.page }" />
        	<c:set var="bPage" value="${ boardMap.boardMaker.boardPage }" />
        	
        	<c:set var="thisPost" value="${ boardMap.boardPostThis }" />
        	<c:set var="prevPost" value="${ boardMap.boardPostPrev }" />
        	<c:set var="nextPost" value="${ boardMap.boardPostNext }" />
        
            <div id="board_page_wrap">
                <div id="board_name_list">
                    <ul class="f_left board_name">
                   		<%-- ############################ 선택된 게시판 구분 ############################# --%>
                        <li><a href="/board/list/1" class="${ (b_no == 1) ? 'sel_board' : '' }">자유 게시판</a></li>                           	
                        <li><a href="/board/list/2" class="${ (b_no == 2) ? 'sel_board' : '' }">질문 게시판</a></li>            
                        <li><a href="/board/list/3" class="${ (b_no == 3) ? 'sel_board' : '' }">정보 게시판</a></li>            
                        <li><a href="/board/list/4" class="${ (b_no == 4) ? 'sel_board' : '' }">공지사항</a></li>            
						<%-- ############################ //선택된 게시판 구분 ############################# --%>      
                    </ul>
                </div> <!-- //board_name_list -->
            
                <!-- //view 시작 -->
                <div id="board_body_wrap">
					<%-- ############################ 게시글 출력 ############################# --%>
                    <article id="view_article">
                        <div id="article_head">
                            <div id="title_cate">
                                <span class="cate">[${ thisPost.b_cate_name }]</span>
                                <strong class="title">${ thisPost.b_post_title }</strong>
                            </div> <!-- //title_cate -->
                            <div id="info">
                                <div class="info_left">
                                    <span><i class="far fa-user"></i> ${ thisPost.u_nickName }</span>
                                    <span>|</span>
                                    <span><i class="far fa-clock"></i> <fmt:formatDate value="${ thisPost.b_post_date }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                                </div>
                                <div class="info_right">
                                    <span>조회수</span>
                                    <span id="view_hit_count">${ thisPost.b_post_hit }</span>
                                </div>
                            </div> <!-- //info -->
                        </div> <!-- //article_head -->

                        <div id="article_content">
                            ${ thisPost.b_post_content }
                        </div> <!-- //content -->
                    </article>

                    <div id="view_bottom">
                        <div class="bottom_left">
                            <span><i class="far fa-comment-alt"></i> 댓글</span>
                            <span id="view_comment_count">${ thisPost.b_comm_count }</span>
                            <div class="c_pointer board_like" onclick="postLike()">
                                <span>
                                    <i class="far fa-thumbs-up like_off"></i> 
                                    <i class="fas fa-thumbs-up like_on"></i>
                                    추천
                                </span>
                                <span id="view_like_count">${ thisPost.b_like_count }</span>
                           	
                            </div>
                        </div>
                        <div class="bottom_right">
                        	<!-- 작성자일 경우에는 안나타남 -->
                    		<c:if test="${ session_u_no != thisPost.u_no }">
                            <span class="c_pointer" id="report">신고</span>
                            </c:if>
                        </div>
                        
                    </div>
                    <!-- 작성자일 경우에만 나타남 -->
                    <c:if test="${ session_u_no == thisPost.u_no }">
	                    <div id="only_writer">
	                        <span class="c_pointer" onclick="postDel()">
	                            <i class="fas fa-trash-alt"></i> 삭제
	                        </span>
	                        <span>|</span>
	                        <span class="c_pointer" 
	                        	onclick="location.href='/board/modify/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }&b_post_no=${ thisPost.b_post_no }'">
	                            <i class="fas fa-eraser"></i> 수정
	                        </span>
	                    </div>
                    </c:if>
                    <!-- //작성자일 경우에만 나타남 -->
				<%-- ############################ //게시글 출력 ############################# --%>
                </div> <!-- //board_body_wrap -->
                <!-- //view 끝 -->

                <div id="comment_wrap">
					<div id="comment_view_wrap">
					<%-- ############################ 댓글/답댓글 출력 ############################# --%>                    
                    <!-- 댓글 부분 -->
                    
                    <c:forEach items="${ boardMap.boardComment }" var="boardComment">
                    
	                    <c:if test="${ boardComment.b_comm_reply == 0 }">
		                    <div class="comment" id="${ boardComment.b_comm_no }">
		                        <div class="comment_content">
		                            <div>${ boardComment.b_comm_content }</div>
		                        </div> <!-- //comment_content -->
		
		                        <div class="comment_info">
		                            <div class="comm_info_left">
		                                <span id="comm_u_nickname">${ boardComment.u_nickname }</span>
		                                <span>|</span>
		                                <span id="comm_date"><fmt:formatDate value="${ boardComment.b_comm_date }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
		                                <!-- 댓글 작성자만 -->
		                                <c:if test="${ session_u_no == boardComment.u_no }">
			                                <span>|</span>
			                                <span class="c_pointer h_bold" onclick="commentModiOpen(${ boardComment.b_comm_no })">수정</span>
			                                <span>|</span>
			                                <span class="c_pointer h_bold" onclick="commentDel(${ boardComment.b_comm_no })">삭제</span>
		                                </c:if>
		                                <!-- //댓글 작성자만 -->
		                            </div>
		                            <div class="comm_info_right">
		                                <span class="c_pointer h_bold" onclick="reCommentWriteOpen(${ boardComment.b_comm_no }, '${ boardComment.u_nickname }')">답글</span>
		                                <span>|</span>
		                                <div class="comm_like c_pointer h_bold" onclick="commentLike(${ boardComment.b_comm_no })">
		                                    <span>추천</span>
		                                    <span class="comm_like_count">${ boardComment.b_comm_like_count }</span>
		                                </div>
		                            </div>
		                        </div> <!-- //comment_info -->
		                    </div> <!-- //comment -->
	                    </c:if>
	                    <!-- //댓글 부분 --> 

                    <!-- 답글 부분 -->
	                    <c:if test="${ boardComment.b_comm_reply == 1 }">    
		                    <div class="comment" id="${ boardComment.b_comm_no }">
		                        <div class="comment_content comm_re_wrap">
		                            <div>
		                                <span class="re_user_in">@${ boardComment.b_comm_reply_nickname }</span>
		                                <span class="re_comment_content">${ boardComment.b_comm_content }</span>
		                            </div>
		                        </div> <!-- //comment_content -->
		
		                        <div class="comment_info comm_re_wrap">
		                            <div class="comm_info_left">
		                                <span id="comm_u_nickname">${ boardComment.u_nickname }</span>
		                                <span>|</span>
		                                <span id="comm_date"><fmt:formatDate value="${ boardComment.b_comm_date }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
		                                <!-- 댓글 작성자만 -->
		                                <c:if test="${ session_u_no == boardComment.u_no }">
			                                <span>|</span>
			                                <span class="c_pointer h_bold" onclick="reCommentModiOpen(${ boardComment.b_comm_no })">수정</span>
			                                <span>|</span>
			                                <span class="c_pointer h_bold" onclick="commentDel(${ boardComment.b_comm_no })">삭제</span>
										</c:if>
		                                <!-- //댓글 작성자만 -->
		                            </div>
		                            <div class="comm_info_right">
		                                <span class="c_pointer h_bold" onclick="reCommentWriteOpen(${ boardComment.b_comm_no }, '${ boardComment.u_nickname }')">답글</span>
		                                <span>|</span>
		                                <div class="comm_like c_pointer h_bold comm_like_on" onclick="commentLike(${ boardComment.b_comm_no })">
		                                    <span>추천</span>
		                                    <span class="comm_like_count">${ boardComment.b_comm_like_count }</span>
		                                </div>
		                            </div>
		                        </div> <!-- //comment_info -->
		                    </div> <!-- //comment -->
	                    </c:if>
                    </c:forEach>
                    
                    <!-- //답글 부분 -->                
					<%-- ############################ 댓글/답댓글 출력 ############################# --%>  


                    <!-- 댓글 수정 폼 -->    
                    <!-- 
                    <div class="comment">
                        <div class="comment_content">
                            <div class="comm_modi_text">
                                <textarea name="b_comm_content" id="comm_modify" maxlength="500" placeholder="댓글을 입력하세요. (최대 500글자)"></textarea>
                            </div>
                        </div>

                        <div class="comment_info">
                            <div class="comm_info_left">
                                <span>댓글작성자</span>
                                <span>|</span>
                                <span>2021-11-15 12:56:21</span>
                            </div>
                            <div class="comm_info_right">
                                <span class="c_pointer comm_mod_ok h_bold" onclick="">완료</span>
                                <span>|</span>
                                <span class="c_pointer comm_mod_cancle h_bold" onclick="">취소</span>
                            </div>
                        </div>
                    </div>
                     -->
                    <!-- //댓글 수정 폼 --> 
                    
                    <!-- 답댓글 작성/수정 폼 (해당 댓글 바로 하단에 append)-->
                    <!--     
                    <div class="comment">
                        <div class="comment_content comm_re_wrap">
                            <div class="re_user">@댓글작성자</div>
                            <div class="comm_modi_text">
                                <textarea name="b_comm_content" id="comm_reply" maxlength="500" placeholder="댓글을 입력하세요. (최대 500글자)"></textarea>
                            </div>
                        </div>

                        <div class="comment_info">
                            <div class="comm_info_right">
                                <span class="c_pointer comm_re_ok h_bold" onclick="">완료</span>
                                <span>|</span>
                                <span class="c_pointer comm_re_cancle h_bold" onclick="">취소</span>
                            </div>
                        </div>
                    </div>
                     -->
                    <!-- //답글 작성/수정시 --> 
					</div>

                    <!-- 댓글 작성 -->
                    <c:if test="${ session_u_id != null }">
                    <div>
                        <div id="comm_write_wrap">
                            <textarea name="b_comm_content" id="comm_write" maxlength="500" placeholder="댓글을 입력하세요. (최대 500글자)" spellcheck="false"></textarea>
                            <button type="button" onclick="commentWrite()" class="c_pointer comm_write_btn">등록</button>
                        </div>
                    </div>
                    </c:if>

                </div> <!-- //comment_wrap -->

                <div id="comment_bottom">
                    <!-- 목록 버튼 -->
                    <div id="go_list_wrap">
                        <strong class="c_pointer go_list">
                        	<a href="/board/list/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }">
                        		목록
                        	</a>
                        </strong>
                    </div>
                    <!-- 이전글, 다음글 -->
                    <div class="prev_next_wrap">
                        <ul class="prev_next">
                        	<%-- 이전글 --%>
                        	<c:if test="${ prevPost != null }">
                            <li class="prev">
                                <strong class="r_p_10">이전글</strong>
                                <span class="r_p_10">|</span>
                                <div><a href="/board/view/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }&b_post_no=${ prevPost.b_post_no }">
                                	${ prevPost.b_post_title }
                                	</a></div>
                                <c:if test="${ prevPost.b_comm_count != 0 }">
                                <span class="c_pc">[${ prevPost.b_comm_count }]</span>
                                </c:if>
                            </li>
                            </c:if>
                            <%-- 다음글 --%>
                            <c:if test="${ nextPost != null }">
                            <li class="next">
                                <strong class="r_p_10">다음글</strong>
                                <span class="r_p_10">|</span>
                                <div><a href="/board/view/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }&b_post_no=${ nextPost.b_post_no }">
                                	${ nextPost.b_post_title }
                                	</a></div>
                                <c:if test="${ nextPost.b_comm_count != 0 }">
                                <span class="c_pc">[${ nextPost.b_comm_count }]</span>
                                </c:if>
                            </li>
                            </c:if>
                            
                        </ul>
                    </div>
                    <!-- 인기글 -->
                    <!-- <div class="prev_next_wrap">
                        <h3 class="now_hit_list"><i class="far fa-grin-stars"></i> 현재 인기글</h3>
                        <ul class="prev_next">
                            <li class="prev hl_p">
                                <span class="r_p_20">[진로]</span>
                                <div><a href="#">글제목</a></div>
                                <span class="c_pc">[1]</span>
                                <span class="r_p_10 pr_fr">122</span>
                            </li>
                            <li class="next hl_p">
                                <span class="r_p_20">[고민]</span>
                                <div><a href="#">글제목</a></div>
                                <span class="c_pc">[1]</span>
                                <span class="r_p_10 pr_fr">98</span>
                            </li>
                            <li class="next hl_p">
                                <span class="r_p_20">[고민]</span>
                                <div><a href="#">글제목</a></div>
                                <span class="c_pc">[1]</span>
                                <span class="r_p_10 pr_fr">98</span>
                            </li>
                            <li class="next hl_p">
                                <span class="r_p_20">[고민]</span>
                                <div><a href="#">글제목</a></div>
                                <span class="c_pc">[1]</span>
                                <span class="r_p_10 pr_fr">98</span>
                            </li>
                            <li class="next hl_p">
                                <span class="r_p_20">[고민]</span>
                                <div><a href="#">글제목</a></div>
                                <span class="c_pc">[1]</span>
                                <span class="r_p_10 pr_fr">98</span>
                            </li>
                        </ul>
                    </div> -->
                </div>

            </div> <!-- //board_page_wrap -->

        </content>

        <!-- 신고하기 모달 -->

        <div class="report_modal_wrap">
            <div class="report_modal_content">

                <h2>게시물 신고하기</h2>
                <div>
                    게시판 운영원칙에 위반된 것으로 확인되면 게시물 작성자는 최소 3일에서 최대 영구정지의 처벌을 받을 수 있습니다.
                </div>
                <div>
                    <a href="#" class="report_link">게시판 운영원칙 확인하기</a>
                </div>
                <textarea name="b_report_content" id="b_report_content" maxlength="300" placeholder="신고 내용을 입력해주세요. (300자까지 입력 가능)" spellcheck="false"></textarea>
                <button type="button" class="c_pointer" id="report_cancle_btn">용서해주기</button>
                <button type="button" class="c_pointer" id="report_send_btn" onclick="sendReport()">신고하기</button>

            </div>
        </div>

        <!-- //신고하기 모달 -->

    </body>
</html>