<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/board_common.css" />
        <link rel="stylesheet" href="/css/board_list.css" />
        <link rel="stylesheet" href="/css/board_view.css" />
        <link rel="stylesheet" href="/css/board_write.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="/js/board_view.js"></script>
        
        <link rel="stylesheet" href="/css/header.css">
        <!-- 구글 아이콘 링크 -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<!-- summernote -->
        <link rel="stylesheet" href="/css/board_summernote/summernote-lite.css">
        <script src="/js/board_summernote/summernote-lite.js"></script> 
        <script src="/js/board_summernote/lang/summernote-ko-KR.js"></script>
        <script src="/js/board_write_summernote.js"></script>
        <!-- //summernote --> 

        <title>write</title>

		<script type="text/javascript">
			function writeBtn() {
				
				if($("#b_post_title").val() == "") {
					
					alert("제목을 입력해주세요.");
					return false;
					
				} else if ($("#summernote").val() == "") {
					
					alert("내용을 입력해주세요.");
					return false;
				}
				
				$("#b_post_form").submit();
				
			}
		</script>

    </head>
    <body>
    
    	<c:if test="${ boardMap.boardMaker.b_no == 4 && session_u_id != 'admin' }">
			<script type="text/javascript">
				alert("잘못된 접근입니다.");
				history.back();
			</script>
		</c:if>
    	<c:if test="${ session_u_no == null }">
			<script type="text/javascript">
				alert("로그인 후 이용해주세요.");
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
        
            <div id="board_page_wrap">
                <div id="board_name_list">
                    <ul class="f_left board_name">
                   		<%-- ############################ 선택된 게시판 구분 ############################# --%>
                        <li><a href="/board/list/1" class="${ (b_no == 1) ? 'sel_board' : '' }">자유 게시판</a></li>                           	
                        <li><a href="/board/list/2" class="${ (b_no == 2) ? 'sel_board' : '' }">질문 게시판</a></li>            
                        <li><a href="/board/list/3" class="${ (b_no == 3) ? 'sel_board' : '' }">정보 게시판</a></li>            
                        <li><a href="/board/list/4" class="${ (b_no == 4) ? 'sel_board' : '' }">공지사항</a></li>       
						<%-- ############################ 선택된 게시판 구분 ############################# --%>          
                    </ul>
                </div> <!-- //board_name_list -->

                <!-- 글 작성 -->
                <div class="wirte_wrap">
                    <form action="/board/write" method="post" enctype="multipart/form-data" id="b_post_form">
                        <div class="write_top">
                            <div class="write_top_cate">
                                <i class="fas fa-angle-down write_cate_open_icon"></i>
                                <select name="b_cate_no" id="b_cate_name">
                                	<%-- ############################ 카테고리 ############################# --%>
                                	<c:forEach items="${ boardMap.boardCate }" var="boardCate">
	                                    <option value="${ boardCate.b_cate_no }">[${ boardCate.b_cate_name }]</option>
                                	</c:forEach>  
                                	<%-- ############################ 카테고리 ############################# --%>  
                                </select>
                            </div>
                            <div class="write_top_title">
                                <input type="text" name="b_post_title" id="b_post_title" placeholder="제목을 입력하세요. (최대 37글자)" maxlength="37">
                            </div>
                        </div>
                        <div class="write_content">
                            <textarea id="summernote" name="b_post_content" spellcheck="false"></textarea>
                        </div>
						<input type="hidden" name="b_no" value="${ b_no }">
                        <!-- 버튼 -->
                        <div class="write_btn_wrap">
                            <button type="button" class="c_pointer write_submit_btn" onclick="writeBtn()">작성 완료</button>
                            <button type="button" class="c_pointer write_cancle_btn" 
                            	onclick="javascript:location.href='/board/list/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }'">취소</button>
                        </div>
                        <!-- //버튼 -->
                    </form>
                </div>
                <!-- //글 작성 -->


            </div> <!-- //board_page_wrap -->

        </content>

    </body>
</html>