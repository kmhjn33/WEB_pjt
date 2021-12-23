<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="../css/crew_list.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/roadmap_common.css">

    <!-- 구글 아이콘 링크 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 헤더 검색바 CSS링크 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
   <%@include file="../header_footer/header.jsp" %>

    <section>
        <div class="wrap">
        	<h2 id="indentindent">${categorySubVo.cate_sub_name}</h2>

	        <div class="middle">
	            <div class="left">
	                <div class="topText">
	                    <p>
	                        스터디 그룹을 <br> 결성해 보세요<br>
	                    </p>
	                </div>
	                <div class="bottomText">
	                    <p>
	                        좀 더 효율적인 학습 커리큘럼을 구현 할 수 있습니다<br>
	                        공통의 주제로 모두가 참여하여 성과를 낼 수 있습니다.<br>
	                        더욱 다양한 크루를 즐겨 보세요.
	                    </p>
	                </div>
	                <div class="button">
	                    <ul>
	                        <li><a href="/crew_write?u_no=${session_u_no}">CREATE CREW + </a></li>
	                    </ul>
	                </div>
	            </div>
	            <div class="right"><img src="../images/study.jpg" alt="study.jpg"></div>
	        </div>
        </div>
        
    </section>

    <section>
        <div class="bottom">
            <div class="major"><h2>모집중인 ${categorySubVo.cate_sub_name} List</h2></div>
            <div class="feature">


<!-- 리스트 시작 -->
					<c:forEach var="crewList" items="${list }">
					
		                <div class="list">
		                    <div class="left">
		                        <span><img src="/upload/${crewList.c_thumbnail }" alt=""></span>
		                        <%-- <span><img src="../upload/${crewList.c_thumbnail }" alt=""></span> --%>
		                    </div>
		                    <div class="right">
		                        <div class="topText">
		                            <p>
		                                <strong>${crewList.c_title }</strong>
		                            </p>
		                        </div>
		                        <div class="when">
		                            <span class="material-icons">date_range</span>
		                            <span>${crewList.c_apply_sdate } ~ ${crewList.c_apply_edate }</span>
		                        </div>
		                        <%-- <div class="bottomText">${crewList.c_content }</div> --%>
		                        <div class="button">
		                            <input type="hidden" value="${crewList.c_no }" name="c_no">
		                            <ul>
		                                <li><a class="ho1" href="/crew_view?c_no=${crewList.c_no }&u_no=${session_u_no}">more + </a></li>
		                            </ul>
		                        </div>
		                    </div>
		                </div>
					</c:forEach>
<!-- 리스트 끝 -->

</script>

            </div>
        </div>
    </section>


    <div>

    </div>    
</body>
</html>