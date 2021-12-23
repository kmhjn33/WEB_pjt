<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 확인</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/modify_check.css">
     <style type="text/css">
     button{
     cursor: pointer;
     }
    </style>
<link rel="stylesheet" href="/css/header.css">
        <!-- 구글 아이콘 링크 -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
         $(function(){
            $("#check_btn").click(function(){
            
/*            	if(($("#u_id").val())==''){
            		  alert("아이디를 입력하십시오.");
            		  $("#u_id").focus();
            		  return false;
            	      } */
            	
            	
            	 if(($("#u_pw").val())==''){
              		  alert("비밀번호를 입력하십시오.");
              		  $("#u_pw").focus();
              		  return false;
              	      }
            	
            	
                $("#Memberquit").submit();
            });
        });
    </script>
</head>
<body>
<%@include file="/WEB-INF/views/header_footer/header.jsp" %>

    <section id="container">
        <div id="mypage_head">
            <div id="mypage_title">
                <h2>마이페이지<small class="session"> | 내 정보 확인</small></h2>
            </div>
            
        </div>
        
        <form action="Memberquit" id="Memberquit" name="Memberquit" method="post">
        <div>
            <table id="check_tb">
                <tr class="id">
                    <td><strong>아이디</strong></td>
					<td>${session_u_id}<input class="input" id="u_id" name="u_id" type="hidden" value="${session_u_id}" placeholder="  아이디를 입력해주세요."></td>
                </tr>
                <tr class="pw">
                    <td><strong>비밀번호</strong></td>
                    <td><input class="input" id="u_pw" name="u_pw" type="password" placeholder="  비밀번호를 입력해주세요."></td>
                </tr>
            </table>
        </div>
        </form>
        <div class="Btn">
            <button id="check_btn">회원 탈퇴</button>
        </div>
    </section>
</body>
</html>