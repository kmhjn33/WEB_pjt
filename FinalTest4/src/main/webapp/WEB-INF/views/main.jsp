<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
      <title>메인페이지</title>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <link rel="stylesheet" href="/css/main.css">
	  <link rel="stylesheet" href="/css/header.css">
	    <!-- 구글 아이콘 링크 -->
	    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	    <!-- 헤더 검색바 CSS링크 -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <!-- 제이쿼리 -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	    <script>
		     function mypageBtn(){
		    	 location.href="mypage/mypage";
		     }
		     
		     function loginBtn(){
		    	 location.href="user/login";
		     }
	
    </script>
</head>
<body>
<header><%@include file="header_footer/header.jsp" %></header>
<div class="container">
  <!-- TOP -->
  <div class="bottom">
    <div class="bottom-top2">
               <div class="bottomroad-right-left">
                   <h1>All our dreams can come true<br>우리의 모든 꿈은 이루어질 것이다.</h1>
               </div>
               <div class="bottomroad-right-right">
                   <p>-Walt Disney 월트 디즈니-</p>
               </div>
    </div>  
    <div class="bottom-under2">
      
    </div> 
</div>

  <!-- MIDDLE -->
  <div class="middle">

    <div class="middle-bottomroad">
        <div class="bottomroad-left">
          <div class="bottomroad-left-top">
             <div class="bottomroad-left-left">
                 <h1>자유 게시판</h1>
	         </div>
	         <div class="bottomroad-left-right">
	             <a href="/board/list/1">더보기 + </a>
	         </div>
          </div>
        
        <c:forEach items="${ map.freeBoard }" var="board">
        	<c:choose>
        	<c:when test="${ board.b_cate_no == 1 }"><c:set var="cate" value="일상" /></c:when>
        	<c:when test="${ board.b_cate_no == 2 }"><c:set var="cate" value="고민" /></c:when>
        	<c:when test="${ board.b_cate_no == 3 }"><c:set var="cate" value="입시" /></c:when>
        	<c:when test="${ board.b_cate_no == 4 }"><c:set var="cate" value="진로" /></c:when>
        	</c:choose>
          <div class="left-under">
           <span class="title">[${ cate }]<strong class="content"><a href="/board/view/1?b_post_no=${ board.b_post_no }">${ board.b_post_title }</a></strong></span>
          </div>
        </c:forEach>

        </div>
        <div class="bottomroad-right">
        
           <div class="bottomroad-right-top">
	           <div class="bottomroad-right-left">
	                 <h1>정보 게시판</h1>
		         </div>
		         <div class="bottomroad-right-right">
		             <a href="/board/list/3">더보기 + </a>
		         </div>
		         
           </div>
			<c:forEach items="${ map.infoBoard }" var="board">
			<c:choose>
        	<c:when test="${ board.b_cate_no == 7 }"><c:set var="cate" value="대외활동" /></c:when>
        	<c:when test="${ board.b_cate_no == 11 }"><c:set var="cate" value="공부법" /></c:when>
        	</c:choose>
	          <div class="left-under">
	           <span class="title">[${ cate }]<strong class="content"><a href="/board/view/1?b_post_no=${ board.b_post_no }">${ board.b_post_title }</a></strong></span>
	          </div>
	        </c:forEach>
	            
        
        </div>
    </div>
    
  </div>
  <div class="middle-bottom">
      <div class="bottom-top">
      <div class="bottom-left">
	             <h1>크루</h1>
	         </div>
	         <div class="bottom-right">
	             <a href="/crew_index">더보기 + </a>
	         </div>
      
      <c:set var="crew" value="${ map.crewList }" />
      
      </div>
        <div class="bottom-box">
        	<a href="/crew_view?c_no=${ crew[0].c_no }&u_no=${ session_u_no }">
            <div class="box-img">
               <img src="/upload/${ crew[0].c_thumbnail }">
            </div>
            <div class="box-content">
                <h2>${ crew[0].c_title }</h2>
                <p>${ crew[0].c_sdate } ~ ${ crew[0].c_edate }</p> 
            </div>
            </a>
        </div>
        <div class="bottom-box">
        <a href="/crew_view?c_no=${ crew[1].c_no }&u_no=${ session_u_no }">
             <div class="box-img">
               <img src="/upload/${ crew[1].c_thumbnail }">
            </div>
            <div class="box-content">
                  <h2>${ crew[1].c_title }</h2>
                <p>${ crew[1].c_sdate } ~ ${ crew[1].c_edate }</p>
            </div>
        </a>
        </div>
        <div class="bottom-box">
        <a href="/crew_view?c_no=${ crew[2].c_no }&u_no=${ session_u_no }">
            <div class="box-img">
               <img src="/upload/${ crew[2].c_thumbnail }">
            </div>
            <div class="box-content">
                <h2>${ crew[2].c_title }</h2>
                <p>${ crew[2].c_sdate } ~ ${ crew[2].c_edate }</p>
            </div>
        </a>
        </div>
        <div class="bottom-box">
        <a href="/crew_view?c_no=${ crew[3].c_no }&u_no=${ session_u_no }">
             <div class="box-img">
               <img src="/upload/${ crew[3].c_thumbnail }">
            </div>
            <div class="box-content">
                <h2>${ crew[3].c_title }</h2>
                <p>${ crew[3].c_sdate } ~ ${ crew[3].c_edate }</p> 
            </div>
        </a>
        </div>
    </div>
    <div class="middle-bottomroad">
  <div class="middle-bottom">
      
        <div class="bottom-box">
        	<a href="/crew_view?c_no=${ crew[4].c_no }&u_no=${ session_u_no }">
            <div class="box-img">
               <img src="/upload/${ crew[4].c_thumbnail }">
            </div>
            <div class="box-content">
                <h2>${ crew[4].c_title }</h2>
                <p>${ crew[4].c_sdate } ~ ${ crew[4].c_edate }</p> 
            </div>
            </a>
        </div>
        <div class="bottom-box">
        	<a href="/crew_view?c_no=${ crew[5].c_no }&u_no=${ session_u_no }">
             <div class="box-img">
               <img src="/upload/${ crew[5].c_thumbnail }">
            </div>
            <div class="box-content">
                <h2>${ crew[5].c_title }</h2>
                <p>${ crew[5].c_sdate } ~ ${ crew[5].c_edate }</p> 
            </div>
            </a>
        </div>
        <div class="bottom-box">
        <a href="/crew_view?c_no=${ crew[6].c_no }&u_no=${ session_u_no }">
            <div class="box-img">
               <img src="/upload/${ crew[6].c_thumbnail }">
            </div>
            <div class="box-content">
                <h2>${ crew[6].c_title }</h2>
                <p>${ crew[6].c_sdate } ~ ${ crew[6].c_edate }</p> 
            </div>
            </a>
        </div>
        <div class="bottom-box">
        <a href="/crew_view?c_no=${ crew[7].c_no }&u_no=${ session_u_no }">
             <div class="box-img">
               <img src="/upload/${ crew[7].c_thumbnail }">
            </div>
            <div class="box-content">
                <h2>${ crew[7].c_title }</h2>
                <p>${ crew[7].c_sdate } ~ ${ crew[7].c_edate }</p> 
            </div>
        </a>
        </div>
    </div>

    
    <div class="middle-bottomroad">
        <div class="bottomroad-left">
          <div class="bottomroad-left-top">
             <div class="bottomroad-left-left">
                 <h1>질문 게시판</h1>
	         </div>
	         <div class="bottomroad-left-right">
	             <a href="/board/list/2">더보기 + </a>
	         </div>
          </div>
        
			<c:forEach items="${ map.qnaBoard }" var="board">
			<c:choose>
        	<c:when test="${ board.b_cate_no == 6 }"><c:set var="cate" value="대학" /></c:when>
        	<c:when test="${ board.b_cate_no == 9 }"><c:set var="cate" value="문제" /></c:when>
        	<c:when test="${ board.b_cate_no == 10 }"><c:set var="cate" value="상담" /></c:when>
        	</c:choose>
	          <div class="left-under">
	           <span class="title">[${ cate }]<strong class="content"><a href="/board/view/1?b_post_no=${ board.b_post_no }">${ board.b_post_title }</a></strong></span>
	          </div>
	        </c:forEach>

          
        </div>
        <div class="bottomroad-right">
        
           <div class="bottomroad-right-top">
	           <div class="bottomroad-right-left">
	                 <h1>공지사항</h1>
		         </div>
		         <div class="bottomroad-right-right">
		             <a href="/board/list/4">더보기 + </a>
		         </div>
		         
           </div>
			<c:forEach items="${ map.noticeBoard }" var="board">
			<c:choose>
        	<c:when test="${ board.b_cate_no == 8 }"><c:set var="cate" value="공지" /></c:when>
        	<c:when test="${ board.b_cate_no == 12 }"><c:set var="cate" value="알림" /></c:when>
        	</c:choose>
	          <div class="left-under">
	           <span class="title">[${ cate }]<strong class="content"><a href="/board/view/1?b_post_no=${ board.b_post_no }">${ board.b_post_title }</a></strong></span>
	          </div>
	        </c:forEach>

          
           
	            
        
        </div>
    </div>
    
    <div class="main_bottom_space"></div>


</div>

</body>
</html>