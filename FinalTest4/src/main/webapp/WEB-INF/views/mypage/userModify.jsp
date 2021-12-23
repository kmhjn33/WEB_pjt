<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보변경</title>
	</head>
	<body>
	<%
	   session.invalidate();
	%>
	  <script type="text/javascript">
	    alert("회원정보가 변경되었습니다.");
	    alert("다시 로그인 해주시길 바랍니다.")
	    location.href="/user/login";
	  </script>
	</body>
</html>