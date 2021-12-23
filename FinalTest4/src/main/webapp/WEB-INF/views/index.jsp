<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	console.log("${session_id}")
</script>

</head>
<body>


	

	<h2> 메인 화면 </h2>
	<ul>
<c:if test="${session_id!=null}">
		<li><span>${session_name} 님 반갑습니다.</span></li>
</c:if>	
		<li><a href="admin/member_info"><span>회원정보</span></a></li>
		<li><a href="admin/board_info">게시물정보</a></li>
		<li><a href="admin/crew_info">크루정보</a></li>
		<li><a href="admin/roadmap_info"><span>로드맵 정보</span></a></li>		
	</ul>
	
	
</body>
</html>