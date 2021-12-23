<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CREW 관리자 페이지</title>
<link rel="stylesheet" href="../css/admin_style_top.css"/>
<link rel="stylesheet" href="../css/admin_style.css"/>
<link rel="stylesheet" href="../css/admin_style_board_detail.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

	<script type="text/javascript">

/* 			var u_name=${ session_u_name };
			var u_type=${ session_u_detail_no };

			$("#user_name").val(u_name);
			if(u_type!='0'){
 				alert("관리자에게만 접근 권한이 있어요.");
				location.href="/login"; 
			} */
			
<%-- 			function btnLogout(){
				<%
					session.invalidate();
				%>
				location.href="/index";	
			} --%>

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

  
 <div class="wrapper">
    <dvi class="wrapper_main">
      
      <h3 style="margin-top: 50px;">게시글 상세 정보</h3>
      <hr>
      <div class="wrapper_top">
        <textarea class="item_textarea">${bDto.b_post_content}
        </textarea>
      </div>

      <div class="wrapper_middle">

        <div class="wrapper_box" >
          <hr>
          <h3>댓글 정보</h3>
          <hr>
          <ul class="box">
          <c:forEach items="${clist}" var="comment">
            <li id="${comment.b_comm_no}"><a href="#"><span>${comment.b_comm_content}</span></a><button onclick="deleteComment(${comment.b_comm_no})">DEL</button></li>
          </c:forEach>
          </ul>
        </div>


        <div>
          <div class="wrapper_box" >
            <div class="wrap_listBox">
              <hr>
              <h3>첨부 파일</h3>
              <hr>
              <ul class="wrapper_file">
              <c:forEach items="${flist}" var="file" >
                  <li id="${file.b_file_no}"><a href="${file.b_file_path}\${file.b_file_alt}"><span>${file.b_file_name}</span></a><button onclick="deleteFile(${file.b_file_no})">DEL</button></li>
              </c:forEach>
              </ul>
            </div>
            <div class="wrap_list">
              <!-- 추천인 정보 / 신고 내역 -->
              <hr>
              <h3>추천인 정보</h3>
              <hr>
              <ul class="wrapper_file">
              <c:forEach items="${rlist}" var="report" >
                  <li id="${report.b_report_no}"><a href="#"><span>&nbsp[&nbsp${report.u_name}&nbsp]&nbsp${report.b_report_content}&nbsp&nbsp${report.b_report_date } </span></a><button onclick="deleteReport(${report.b_report_no})">삭제</button></li>
              </c:forEach>
              </ul>
            </div> <!--wrap_listBox-->
  
            <div class="wrap_list">
              <hr>
              <h3>게시물 신고 정보</h3>
              <hr>
              <ul class="wrapper_file">
              <c:forEach items="${rlist}" var="report" >
                  <li id="${report.b_report_no}"><a href="#"><span>&nbsp[&nbsp${report.u_name}&nbsp]&nbsp${report.b_report_content}&nbsp&nbsp${report.b_report_date } </span></a><button onclick="deleteReport(${report.b_report_no})">삭제</button></li>
              </c:forEach>
              </ul>
            </div>  <!-- wrap_listBox-->
          </div>    <!-- wrapper_box -->
        </div>
      </div>    <!-- wrapper_middle -->
    </dvi>

  </div>

</body>
</html>