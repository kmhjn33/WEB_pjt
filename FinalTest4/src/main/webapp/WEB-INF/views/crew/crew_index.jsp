<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

   	<link rel="stylesheet" href="../css/crew_index.css">
    <link rel="stylesheet" href="../css/roadmap_common.css">
    
            <link rel="stylesheet" href="/css/header.css">
        <!-- 구글 아이콘 링크 -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    

    <!-- 구글 아이콘 링크 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
</head>
<body>
    <%@include file="../header_footer/header.jsp" %>


    <section>
    	<div class="wrap">
    	<h2 id="indentindent">크루 카테고리</h2>
	        <div class="middle">
	            <div class="left">
	                <div class="topText">
	                    <p>
	                        <strong>A</strong>nywhere<br>
	                        <strong>E</strong>njoy the<br>
	                        <strong>C</strong>rew !!
	                    </p>
	                </div>
	                <div class="bottomText">
	                    <p>
	                        당신은 언제 어디서나 크루를 형성하여<br>
	                        주변 친구들과 다양한 모임을 할 수 있습니다.<br>
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
            <div class="major"><h2>CREW category</h2></div>
            <div class="feature">
                
                <div class="list">
                    <div class="left">
                        <span class="material-icons" style="font-size: 70px; color: #272343;"> menu_book</span>
                    </div>
                    <div class="right">
                        <div class="topText"><p><strong>학습 CREW</strong></p></div>
                        <div class="bottomText"><p>content<br>content</p></div>
                        <div class="button">
                            <ul>
                                <li><a class="ho1" href="/crew_list?cate_sub_no=2">more + </a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="list">
                    <div class="left">
                        <span class="material-icons" style="font-size: 70px; color: #272343;">verified</span>
                    </div>
                    <div class="right">
                        <div class="topText"><p><strong>자격증 CREW</strong></p></div>
                        <div class="bottomText"><p>content<br>content</p></div>
                        <div class="button">
                            <ul>
                                <li><a class="ho1" href="/crew_list?cate_sub_no=4">more + </a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="list">
                    <div class="left">
                        <span class="material-icons" style="font-size: 70px; color: #272343;">account_balance</span>
                    </div>
                    <div class="right">
                        <div class="topText"><p><strong>공모전 CREW</strong></p></div>
                        <div class="bottomText"><p>content<br>content</p></div>
                        <div class="button">
                            <ul>
                                <li><a class="ho1" href="/crew_list?cate_sub_no=6">more + </a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="list">
                    <div class="left">
                        <span class="material-icons" style="font-size: 70px; color: #272343;">group_add</span>
                    </div>
                    <div class="right">
                        <div class="topText"><p><strong>취미 및 기타 CREW</strong></p></div>
                        <div class="bottomText"><p>content<br>content</p></div>
                        <div class="button">
                            <ul>
                                <li><a class="ho1" href="/crew_list?cate_sub_no=8">more + </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>