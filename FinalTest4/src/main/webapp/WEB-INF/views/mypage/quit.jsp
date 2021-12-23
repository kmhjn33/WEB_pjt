<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
	</head>
	<body>
	<%
	
	 session.invalidate(); 
	
	 %>
	  <script type="text/javascript">
	    alert("회원탈퇴가 성공적으로 이루어졌습니다.");
	    location.href="/main";
	  </script>
	</body>
</html>