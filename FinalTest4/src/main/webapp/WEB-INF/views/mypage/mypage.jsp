<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/mypage.css">
    <link rel="stylesheet" href="/css/mypagecolor.css">

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
           $("img_hover").hover(
            )
        });

        function infoBtn() {
            location.href="./my_info"
        }

        function roadmapBtn() {
            location.href="/roadmap/my_roadmap";
        }

        function boardBtn() {
            location.href="/myboard";
        }

        function crewBtn(){
            location.href="/mypage_crew_list?u_no=${session_u_no}";
        }
    </script>
</head>
<body>

    <%@include file="/WEB-INF/views/header_footer/header.jsp" %>

    <section id="container">
        <div id="mypage_head">
            <div id="mypage_title">
                <h2>마이페이지<small> | 홈</small></h2>
            </div>

        </div>

       
        <div id="my_page">
          
            <div id="inner-left">
           
                <div class="inner">
                    <div id="my_info">
                        <div>
                            <ul>
                               <li><span class="span">${session_u_nickName}</span>님,</li>
                               <li><span>환영합니다.</span></li> 
                            </ul>
                        </div>
                        <div>
                            <button id="info_btn" onclick="infoBtn()">내 정보 관리</button>
                        </div>
                    </div>
                </div>
                
                <div class="inner">
                    <div id="my_crew">
                        <div>
                            <ul>
                                <li><span>크루를 통해</span></li>
                                
                             </ul>
                        </div>
                        <div id="crew_title">
                            <ul>
                                <li><span class="span">구성원의 일부가 되어보세요.</span></li>
                             </ul>
                        </div>
                        <div>
                            <button id="crew_btn" onclick="crewBtn()">크루 관리</button>
                        </div>
                    </div>
                </div>
                
                <div class="inner">
                    <div id="my_roadmap">
                        <div>
                            <ul>
                                <li><span>로드맵 관리</span></li>
                             </ul>
                        </div>
                        <div>
                            <button id="roadmap_btn" onclick="roadmapBtn()">로드맵 관리</button>
                        </div>
                    </div>
                </div>
                
                <div class="inner">
                    <div id="my_board">
                        <div>
                            <ul>
                                <li><span>이야기를 나누세요</span></li>
                             </ul>
                        </div>
                        <div id="board_content">
                            <ul>
                                <li><span>50만명의 커뮤니티</span></li>
                             </ul>
                        </div>
                        <div>
                            <button id="board_btn" onclick="boardBtn()">게시물 관리</button>
                        </div>
                    </div>
                </div>
            </div> 

            <div class="inner-right">
                <div id="my_profile">        
                    <div id="profile_img">
                        <img src="../upload/${session_u_profile}">
                    </div>
                    <div id="profile_info">
                        <div class="profile">
                           <strong>내 프로필</strong><br>
                        </div>
                        <ul class="user_con">
                           <li><span class="span_left">회원명</span></li>
                           <li><span class="span_right">${session_u_name}</span></li>
                           <br>
                           <li><span class="span_left">닉네임</span></li>
                           <li><span class="span_right">${session_u_nickName}</span></li>
                           <br>
                           <li><span class="span_left">이메일</span></li>
                           <li></li> <span class="span_right">${session_u_email}</span></li>   
                        </ul>   
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>