<%@page import="javax.servlet.jsp.tagext.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>보드 관리자 페이지</title>
<link rel="stylesheet" href="../css/admin_style_top.css"/>
<link rel="stylesheet" href="../css/admin_style.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript">
	
/* 		var u_name= ${ session_u_name };
		console.log("user_name" + u_name);
		var u_type= ${ session_u_detail_no };
		console.log("user_type" + u_type);
		$("#user_name").val(u_name);
		if(u_type!='0'){
 			alert("관리자에게만 접근 권한이 있어요.");
			location.href="/login"; 
		} */
		
<%-- 		function btnLogout(){
			<%
				session.invalidate();
			%>
			location.href="/index";	
		} --%>
		
		function pageNumClick(page){
			//alert("이동페이지 :" + page);
			if(page!=null){
				var url="/admin/board_info?page=" + page + "&limit=${nDto.limit}&category=${nDto.category}&searchWord=${nDto.searchWord}&b_no=${nDto.b_no}&b_cate_no=${nDto.b_cate_no}" ;
				console.log("url : " + url);
				location.href=url;
			}else{
				return false;
			}
		}
		
		function pageInfoClick(b_post_no){
			if(b_post_no!=null){
				var url="/admin/board_detail?b_post_no=" + b_post_no + "&page=${nDto.page}&limit=${nDto.limit}&category=${nDto.category}&searchWord=${nDto.searchWord}&b_no=${nDto.b_no}&b_cate_no=${nDto.b_cate_no}" ;
				console.log("url : " + url);
				location.href=url;
			}else{
				return false;
			}
		}
		
		
	</script>

</head>

<body>
		<c:if test="${ session_u_id != 'admin' || session_u_id == null }">
			<script>
				alert("잘못된 접근입니다.");
				location.href = "/main";
			</script>
		</c:if>

  <nav>
    <div class="navbar">
      <div class=""><a href="/main">CREW WITH TO US</a></div>
      <ul class="nav-links">
        <li class="appearance icons"><a href="/admin/member_info">회원정보</a></li>
        <li><a>|</a></li>
        <li><a href="/admin/board_info"><span  style="font-weight: 800; color: blue;">게시판</span></a></li>
        <li><a>|</a></li>
        <li><a href="/admin/member_stats">회원통계</a></li>
        <li><a>|</a></li>
        <li><a href="/admin/crew_info">CREW 현황</a></li>
        <li><a>|</a></li>
        <li><a href="/admin/roadmap_info">로드맵 현황</a></li>
        <li><a>|</a></li>
		        <li>
		        	<%-- <label style="color:white;">사용자 :</label>&nbsp<label>${session_u_name}</label>&nbsp --%>
			        <button type="button" class=".btn" style="margin-top:-3px;" id="searchBtn" name="searchBtn" onclick="btnLogout()">로그 아웃</button>
		       	</li>
      </ul>
    </div>
  </nav>

  
  <div >
    
    <div style="margin-top:10px;">

		<form action="./board_info" id="bbs" name="bbs" method="post">
		
	        <div class="bbsList">
	          <div class="bbsList" style="text-align: left; margin-bottom: 5px;">
	            <span class="txt_small">게시판 선택</span>&nbsp
	            <select class="select_list" id="b_no" name="b_no">
	              <option value="0">전체</option>    
		            <c:forEach items="${blist}" var="board">
		              <option value="${board.b_no}"  ${(nDto.b_no==board.b_no)?"selected":""} >${board.b_name} </option>
		            </c:forEach>

	            </select>&nbsp
	           	   <span class="txt_small">주제</span>&nbsp
		            <select class="select_list" id="b_cate_no" name="b_cate_no">
		              <option value="0">전체</option>    
		            <c:forEach items="${clist}" var="cate">
		              <option value="${cate.b_cate_no}" ${(nDto.b_cate_no==cate.b_cate_no)?"selected":""}>${cate.b_cate_name}</option>    
		            </c:forEach>
	            </select>&nbsp
	            <span class="txt_small">검색어</span>&nbsp
	            <select class="select_list" id="category" name="category">
	              <option value="all">전체</option>    
	              <option value="b_post_title">제목</option>    
	              <option value="b_post_content">글내용</option>
	            </select>&nbsp
	            <input class="" type="text" id="searchWord" name="searchWord" placeholder="검색어 입력" value="${nDto.searchWord}"><img src="/images/search_ico.png" style="margin-left: -20px;height: 10px ; width: 10px;">&nbsp
	            <button type="submit" class=".btn" id="searchBtn" name="searchBtn">조회</button>
	          </div>
	          <div class="bbsList" style="text-align: right; margin-bottom: 5px;margin-top: -25px;">
	            <select class="select_list" id="limit" name="limit">
	                <option value="10" ${(nDto.limit==10)?"selected":""} >10개씩 보기</option>    
	                <option value="20" ${(nDto.limit==20)?"selected":""} >20개씩 보기</option>
	                <option value="30" ${(nDto.limit==30)?"selected":""} >30개씩 보기</option>
	                <option value="40" ${(nDto.limit==40)?"selected":""} >40개씩 보기</option>
	            </select>
	          </div>
	        </div>
		</form>

        <table class="bbsList" summary="리스트">
              <caption>회원정보</caption>
               <colgroup>
		        <col width="5%"></col>
		        <col width="5%"></col>
		        <col width="20%"></col>
		        <col width="45%"></col>
		        <col width="5%"></col>
		        <col width="20%"></col>
		      </colgroup>           
              <thead class="head">
                  <tr>
                      <th><a class="checkbox" href="" ></a></th> 
                      <th>번호</th>
                      <th>게시판</th>   
                      <th>글제목</th>   
                      <th>조회수</th>
                      <th>작성일</th>
                      <!-- <th>상세</th> -->
                  </tr>    
              </thead>
              <tbody class="body">

				<c:forEach items="${plist}" var="boardlist">
                  <tr id="${boardlist.b_post_no}" onclick='pageInfoClick("${boardlist.b_post_no}")'>
                      <td class=""><a class="checkbox_checked" href="javascript:;" >✓</a></td>
                      <td class="">${boardlist.rnum }</td>
                      <td class="" style="text-align: left;">${boardlist.b_name}&nbsp[ ${boardlist.b_cate_name} ]</td>
                      <td class="" style="text-align: left;">${boardlist.b_post_title }</td>
                      <td class="">${boardlist.b_post_hit }</td>
                      <td class="">${boardlist.b_post_date }</td>
                      <!-- <td class=""><a class="btn" href="javascript:;" >보기</a></td> -->
                  </tr>
				</c:forEach>
              </tbody>
              <tfoot class="foot">
                  <tr>
                      <td colspan="9">
                      	  <c:if test="${nDto.page==1}">
	                          <span class="arrow radius-right">≪</span>
	                          <span class="arrow radius-right">＜</span>
                      	  </c:if>
                      	  <c:if test="${nDto.page!=1}">
	                          <span class="arrow radius-right" onclick="pageNumClick(${nDto.startPageNum}}">≪</span>
	                          <span class="arrow radius-right" onclick="pageNumClick(${nDto.page-1})">＜</span>
                      	  </c:if>
                      	                        	                        	  
                          <c:forEach begin="${nDto.startPageNum}" end="${nDto.endPageNum}" var="pagenum">
                          		<c:if test="${pagenum==nDto.page }">
                          			<a href="javascript:;" class="num_box"><span>${pagenum}</span></a>
                          		</c:if>
                          		<c:if test="${pagenum!=nDto.page }">
		                          	<a href="javascript:;" class="num_box txt_point"><span onclick="pageNumClick(${pagenum})">${pagenum}</span></a>                          		
                          		</c:if>
                          </c:forEach>
    												  
                      	  <c:if test="${nDto.page==nDto.maxPageNum}">
	                          <span class="arrow radius-left">＞</span>                      	  
	                          <span class="arrow radius-left">≫</span>
                      	  </c:if>
				          <c:if test="${nDto.page!=nDto.maxPageNum}">
				          	  <span class="arrow radius-left" onclick="pageNumClick(${nDto.page+1})">＞</span>                      	  
	                          <span class="arrow radius-left" onclick="pageNumClick(${nDto.endPageNum})">≫</span>
                      	  </c:if>
                      </td>
                  </tr>    
              </tfoot>
          </table>
    </div>
    
  </div>


  </div>

</body>
</html>