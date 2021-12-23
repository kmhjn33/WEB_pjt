<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 내정보</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/info.css">

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

    <script>
        $(function(){
            $("#info_btn").click(function(){
                location.href="./modify_check";
            });
        });

        $(function(){
            $("#quit_btn").click(function(){
                location.href="./member_quit";
            });
        });
        
        function profileCh(){
        	location.href="./modify_profile";
        }
        
    </script>
</head>
<body>
    <%@include file="/WEB-INF/views/header_footer/header.jsp" %>

    <section id="container">
        <div id="mypage_head">
            <div id="mypage_title">
                <h2>마이페이지<small> | 내 정보</small></h2>
            </div>
           
        </div>
      

        <div class="container">
            <!-- TOP -->
            <div class="top">
                <div class="top_text">
                   <h1>${session_u_name}<small> 님의 페이지</small></h1>
               </div>
            </div>
          
            <!-- MIDDLE -->
            <div class="middle">
          
              <div class="middle-left"> 
                     <div class="profile">
                            <img src="../upload/${session_u_profile}">
                     </div>
                     <div class="profile2">
                        
                     </div>
                     <div class="profile3">
                        <div class="nickName">
                                <h3>${session_u_nickName}</h3>
                        </div>
                        <div class="Btn">
                                <button type="button" onclick="profileCh()">프로필변경</button>
                        </div>
                    </div>
              </div>
          
              <div class="middle-right">
          
                <div class="middle-right-1">
                    <ul>
                        <li><span class="title">회원명</span><span class="content">${session_u_name}</span></li>
                        <li><span class="title">아이디</span><span class="content">${session_u_id}</span></li>
                        <li><span class="title">휴대폰</span><span class="content">${session_u_tel}</span></li>
                        <li><span class="title">이메일</span><span class="content">${session_u_email}</span></li>
                    </ul>  
                </div>
                <div class="middle-right-2">
                    <div class="date">
                         <img src="../images/1rd.png">
                         <h3>${session_u_name}<small>님의 회원 가입일</small></h3>
                         <p><fmt:formatDate value="${session_u_signDate}" pattern="yyyy-MM-dd HH:mm"/></p>
                         <p class="hi">우리가 만남 첫 기념일</p>
                    </div>
                    <div class="date2">
                         <img src="../images/2rd.png">
                         <h3>${session_u_name}<small>님의 최종 접속일</small></h3>  
                         <p><fmt:formatDate value="${session_u_finalDate}" pattern="yyyy-MM-dd HH:mm"/></p>
                         <p class="hi">반가워 오늘도 파이팅!!</p>
                    </div>
                    <div class="date3">
                         <img src="../images/3rd.png">
                         <h3>${session_u_name}<small>님의 회원 수정일</small></h3>  
                         <p><fmt:formatDate value="${session_u_modDate}" pattern="yyyy-MM-dd HH:mm"/></p>
                         <p class="hi">너 변했어..그래도 너가 좋아</p>
                    </div>
                   
                   
                </div>
                <div class="middle-right-3">
                    <div class="title">
                     <h3>소개글</h3>
                    </div>
                     <div class="content">
                        <p>${session_u_intro}</p>
                     </div>
                </div>
          
              </div>
          
            </div>
          
            <div class="bottom">
                <span class="user_up">
                     <button type="button" id="info_btn">회원정보수정</button>
                </span> 
                <span class="user_del">
                     <button type="button" id="quit_btn">회원영구탈퇴</button>
                </span> 
            </div>
          
          </div>
     </div>
        
    </section>
</body>
</html>