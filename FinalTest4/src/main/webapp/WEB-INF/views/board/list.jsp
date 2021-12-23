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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <title>list</title>
        
        <link rel="stylesheet" href="/css/header.css">
        <!-- 구글 아이콘 링크 -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    </head>
    <body>

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
						<%-- ############################ //선택된 게시판 구분 ############################# --%>
                    </ul>
                </div> <!-- //board_name_list -->
            
                <div id="board_body_wrap">

                    <div id="board_top">
                        <div id="sort" class="f_left">
                            <span class="p5">게시글</span>
                            <span id="list_count">${ bPage.listCount }</span>
                            <span>|</span>
                            <%-- ############################ 정렬 선택 ############################# --%>
                            <span class="c_pointer ${ (sort == 'date') ? 'sel_sort' : '' }">
                            	<a href="/board/list/${ b_no }?sort=date&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }">
                            		등록일순
                            	</a>
                            </span>
                            <span class="c_pointer ${ (sort == 'view') ? 'sel_sort' : '' }">
	                            <a href="/board/list/${ b_no }?sort=view&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }">
	                            	조회순
	                            </a>
                            </span>
                            <span class="c_pointer ${ (sort == 'like') ? 'sel_sort' : '' }">
	                            <a href="/board/list/${ b_no }?sort=like&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }">
	                            	추천순
	                            </a>
                            </span>
                            <%-- ############################ //정렬 선택 ############################# --%>
                        </div> <!-- //sort -->
                        
                        
                        <%-- ############################ 검색 ############################# --%>
                        <div id="search" class="f_right">
                            <form action="/board/list/${ b_no }" method="post" id="search_form">
                                <select name="searchCate" id="searchCate">
                                    <option value="title" ${ (searchCate == 'title') ? 'selected' : '' }>제목</option>
                                    <option value="content" ${ (searchCate == 'content') ? 'selected' : '' }>내용</option>
                                    <!-- <option value="all">제목+내용</option> -->
                                    <option value="writer" ${ (searchCate == 'writer') ? 'selected' : '' }>작성자</option>
                                </select>
                                <input type="text" name="searchWord" id="searchWord" placeholder="검색어 입력" spellcheck="false" value="${ searchWord }">
                                <button type="submit" class="c_pointer"><i class="fas fa-search fa-lg"></i></button>
                            </form> 
                        </div> <!-- //search -->
                        <%-- ############################ //검색 ############################# --%>
                    </div> <!-- //board_top -->

                    <div id="board_wrap">
                        <ul id="board">
                            <li id="board_head" class="f_left">
                                <div class="no">No.</div>
                                <div class="cate c_pointer">카테고리 <i class="fas fa-angle-down"></i>
                                    <div id="cate_open">
                                        <ul>
                                        	<li class="c_pointer">
	                                            <a href="/board/list/${ b_no }?searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=0">
	                                            	[전체]
	                                            </a>
	                                        </li>
                                        	<%-- ############################ 카테고리 출력 ############################# --%>
                                        	<c:forEach items="${ boardMap.boardListCate }" var="boardListCate">
	                                            <li class="c_pointer">
	                                            	<a href="/board/list/${ b_no }?searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ boardListCate.b_cate_no }">
	                                            		[${ boardListCate.b_cate_name }]
	                                            	</a>
	                                            </li>
                                        	</c:forEach>
                                        	<%-- ############################ //카테고리 출력 ############################# --%>
                                        </ul>
                                    </div> <!-- //cate_open -->
                                </div>
                                <div class="title">제목</div>
                                <div class="writer">작성자</div>
                                <div class="date">등록일</div>
                                <div class="hit">조회수</div>
                                <div class="like">추천수</div>


                            </li> <!-- //board_head -->
                            
                            <!-- 게시글 li 반복 -->
                            <%-- ############################ 게시글 출력 ############################# --%>
                            
                            <%-- 오늘 날짜 (연-월-일) --%>
                            <%-- <c:set var="now" value="<%= new java.util.Date() %>" /> --%>
                            <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd" var="nowDate" />
                             
                            <c:forEach items="${ boardMap.boardListPost }" var="boardListPost">
                            
                            	<%-- 게시글 등록 날짜 --%>
                            	<%-- <c:set var="b_post_date" value="${ boardListPost.b_post_date }" /> --%>
								<fmt:formatDate value="${ boardListPost.b_post_date }" pattern="yyyy-MM-dd" var="postDate" />
                             	
		                        	<li class="board_body f_left">
		                                <div class="no">${ boardListPost.b_post_no }</div>
		                                <div class="cate">[${ boardListPost.b_cate_name }]</div>
		                                <div class="title">
		                                    <a href="/board/view/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }&b_post_no=${ boardListPost.b_post_no }">
		                                    	${ boardListPost.b_post_title }
		                                    </a>
		                                    <c:if test="${ boardListPost.b_comm_count != 0 }">
			                                    <span>[${ boardListPost.b_comm_count }]</span>
		                                    </c:if>
		                                    <%-- 게시 날짜가 오늘일 경우 (new 아이콘 출력) --%>
		                                    <c:if test="${ postDate == nowDate }">
		                                    	<img src="/images/board_new_post.png" alt="새 글">
		                                    </c:if>
		                                </div>
		                                <div class="writer">${ boardListPost.u_nickName }</div>
		                                <%-- 게시 날짜가 오늘보다 전일 경우 (연-월-일 출력) --%>
                             			<c:if test="${ postDate < nowDate }">
		                                	<div class="date">${ postDate }</div>
		                                </c:if>
		                                <%-- 게시 날짜가 오늘일 경우 (시:분, new 아이콘 출력) --%>
		                                <c:if test="${ postDate == nowDate }">
		                                	<div class="date"><fmt:formatDate value="${ boardListPost.b_post_date }" pattern="HH:mm" /></div>
		                                </c:if>
		                                <div class="hit">${ boardListPost.b_post_hit }</div>
		                                <div class="like">${ boardListPost.b_like_count }</div>
		                            </li>
	                                     
                            </c:forEach>
                            <%-- ############################ //게시글 출력 ############################# --%>
						</ul>
                    </div> <!-- //board_wrap --> 

                    <div id="board_bottom">
                        <ul id="pagination">
                        <%-- ################################ 페이지 ############################### --%>
                        <%-- bPage 변수 선언 맨 위에서 확인 --%>
                        
                            <li><a href="/board/list/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=1&b_cate_no=${ b_cate_no }" id="first_page">
                            		<i class="fas fa-angle-double-left"></i>
                            	</a>
                            </li>
                            <li><a href="/board/list/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ (page != 1) ? page-1 : 1 }&b_cate_no=${ b_cate_no }" id="prev_page">
                            		<i class="fas fa-angle-left"></i>
                            	</a>
                            </li>
                            
                            <c:forEach begin="${ bPage.startPage }" end="${ bPage.endPage }" var="pageNum">
	                            <li><a href="/board/list/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ pageNum }&b_cate_no=${ b_cate_no }" 
	                            		class="page_num ${ (page == pageNum) ? 'sel_page' : '' }">
	                            		${ pageNum }
	                            	</a>
	                            </li>
                            </c:forEach>
                            
                            <li>
                            	<a href="/board/list/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ (page != bPage.maxPage ) ? page+1 : bPage.maxPage }&b_cate_no=${ b_cate_no }" id="next_page">
                            		<i class="fas fa-angle-right"></i>
                            	</a>
                            </li>
                            <li>
                            	<a href="/board/list/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ bPage.maxPage }&b_cate_no=${ b_cate_no }" id="last_page">
                            		<i class="fas fa-angle-double-right"></i>
                            	</a>
                            </li>
						<%-- ############################### //페이지 ############################### --%>
                        </ul>
                        
                        <c:if test="${ b_no != 4 && session_u_id != null }">
	                        <div id="board_write" class="f_right">
	                            <button type="button" 
	                            	onclick="javascript:location='/board/write/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }'" 
	                            	class="c_pointer"><i class="fas fa-pencil-alt"></i> 글쓰기</button>                
	                        </div>
                        </c:if>
                        <c:if test="${ b_no == 4 && session_u_id == 'admin' }">
	                        <div id="board_write" class="f_right">
	                            <button type="button" 
	                            	onclick="javascript:location='/board/write/${ b_no }?sort=${ sort }&searchCate=${ searchCate }&searchWord=${ searchWord }&page=${ page }&b_cate_no=${ b_cate_no }'" 
	                            	class="c_pointer"><i class="fas fa-pencil-alt"></i> 글쓰기</button>                
	                        </div>
                        </c:if>
                        
                    </div> <!-- //board_bottom -->


                </div> <!-- //board_body_wrap -->

            </div> <!-- //board_page_wrap -->
        </content>

    </body>
</html>