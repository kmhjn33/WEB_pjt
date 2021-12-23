<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정 완료</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/info_modifyCom.css">
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
            $("#myPageBtn").click(function(){
                location.href="./userModify";
            });
        });
    </script>
</head>
<body>
<%@include file="/WEB-INF/views/header_footer/header.jsp" %>

    <section id="container">
        <div id="mypage_head">
            <div id="mypage_title">
                <h2>마이페이지<small> | 내 정보 수정완료</small></h2>
            </div>
            
        </div>
        

         <div class="container">
            <h1>회원님의 정보가 변경되었습니다.</h1>
            <table id="info_tb">
                <tr>
                    <td><strong>사용자 이름</strong></td>
                    <td class="input">${session_u_name}</td>
                </tr>
                <tr>
                    <td><strong>새 아이디</strong></td>
                    <td class="input">${userInfoVo.getU_id()}</td>
                </tr>
                <tr>
                    <td><strong>새 비밀번호</strong></td>
                    <td class="input">${userInfoVo.getU_pw()}</td>
                </tr>
                <tr>
                    <td><strong>새 이메일</strong></td>
                    <td class="input">
                         ${userInfoVo.getU_email()}
                    </td>
                </tr>
                <tr>
                    <td><strong>새 휴대전화 번호</strong></td>
                    <td class="input">  
                         ${userInfoVo.getU_tel()}
                    </td>
                </tr>
            </table>
        </div>
        <div class="Btn">
            <button id="myPageBtn">변경완료</button>    
        </div>   
    </section>
</body>
</html>