<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>myboard</title>
	    <link rel="stylesheet" href="/css/roadmap_common.css">
	    <link rel="stylesheet" href="/css/myboard.css">
	    <link rel="stylesheet" href="/css/board_list.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
		
		<link rel="stylesheet" href="/css/header.css">
        <!-- 구글 아이콘 링크 -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	</head>
	<body>
	    <%@include file="/WEB-INF/views/header_footer/header.jsp" %>
	
	    <section id="container">
	        <div id="mypage_head">
	            <div id="mypage_title">
	                <h2>내 게시글 관리</h2>
	            </div>
	        </div>
	        <hr>
	        <div id="board_tab">
	            <ul>
	                <li><a class="${ myBoardMap.type == 'post' ? 'active' : ''}" href="/myboard/post?page=1">작성글</a></li>
	                <li><a class="${ myBoardMap.type == 'comment' ? 'active' : ''}" href="/myboard/comment?page=1">작성 댓글</a></li>        
	                <li><a class="${ myBoardMap.type == 'like' ? 'active' : ''}" href="/myboard/like?page=1">추천한 글</a></li>
	            </ul>
	        </div>
	
	        <div id="board_list">
	            <table>
	                <colgroup>
	                    <col width="10%">
	                    <col width="75%">
	                    <col width="15%">
	                  </colgroup>
	                <tr>
	                    <th>No</th>
	                    <c:if test="${ myBoardMap.type != 'comment' }">
		                    <th>글 제목</th>
	                    </c:if>      
	                    <c:if test="${ myBoardMap.type == 'comment' }">
		                    <th>댓글 내용</th>
	                    </c:if>      
	                    <th>작성일</th>
	                </tr>        
	                <tbody>
	                	<c:if test="${ myBoardMap.type != 'comment' }">
		                	<c:forEach items="${ myBoardMap.myBoardList }" var="list">
			                	<c:if test="${ list.b_cate_no == 1 || list.b_cate_no == 2 || list.b_cate_no == 3 || list.b_cate_no == 4 }">
			                		<c:set var="boardNo" value="1" />
			                	</c:if>
			                	<c:if test="${ list.b_cate_no == 6 || list.b_cate_no == 9 || list.b_cate_no == 10 }">
			                		<c:set var="boardNo" value="2" />
			                	</c:if>
			                	<c:if test="${ list.b_cate_no == 7 || list.b_cate_no == 11 }">
			                		<c:set var="boardNo" value="3" />
			                	</c:if>
			                	<c:if test="${ list.b_cate_no == 8 || list.b_cate_no == 12 }">
			                		<c:set var="boardNo" value="4" />
			                	</c:if>
		                    <tr>
		                        <td class="hit notHitThisIsNo" id="">${ list.b_post_no }</td>
		                        <td><a href="/board/view/${ boardNo }?b_post_no=${ list.b_post_no }">${ list.b_post_title }</a></td>
		                        <td class="date" id=""><fmt:formatDate value="${ list.b_post_date }" pattern="yyyy-MM-dd" /></td>
		                    </tr>
		                	</c:forEach>
	                	</c:if>
	                	
	                	<c:if test="${ myBoardMap.type == 'comment' }">
		                	<c:forEach items="${ myBoardMap.myBoardList }" var="list">
		                    <tr>
		                        <td class="hit notHitThisIsNo" id="">${ list.b_comm_no }</td>
		                        <td><a href="/board/view?b_post_no=${ list.b_post_no }">${ list.b_comm_content }</a></td>
		                        <td class="date" id=""><fmt:formatDate value="${ list.b_comm_date }" pattern="yyyy-MM-dd" /></td>
		                    </tr>
		                	</c:forEach>
	                	</c:if>
	                	
	                </tbody>   
	            </table>
	        </div>

	        <div id="board_bottom">
                <ul id="pagination">
                    <li><a href="/myboard/${ myBoardMap.type }?page=1" id="first_page"><i class="fas fa-angle-double-left"></i></a></li>
                    <li><a href="/myboard/${ myBoardMap.type }?page=${ (1 != myBoardMap.page) ? (myBoardMap.page - 1) : 1 }" id="prev_page"><i class="fas fa-angle-left"></i></a></li>
                    
                    <c:forEach begin="${ myBoardMap.boardPage.startPage }" end="${ myBoardMap.boardPage.endPage }" var="pageNum">
                    <li><a href="/myboard/${ myBoardMap.type }?page=${ pageNum }" class="page_num  ${ (myBoardMap.page == pageNum) ? 'sel_page' : '' }">${ pageNum }</a></li>
                    </c:forEach>
                    
                    <li><a href="/myboard/${ myBoardMap.type }?page=${ (myBoardMap.boardPage.maxPage != myBoardMap.page) ? (myBoardMap.page + 1) : myBoardMap.boardPage.maxPage }" id="next_page"><i class="fas fa-angle-right"></i></a></li>
                    <li><a href="/myboard/${ myBoardMap.type }?page=${ myBoardMap.boardPage.maxPage }" id="last_page"><i class="fas fa-angle-double-right"></i></a></li>
                </ul>
           </div> <!-- //board_bottom -->
	    </section>
	</body>
</html>