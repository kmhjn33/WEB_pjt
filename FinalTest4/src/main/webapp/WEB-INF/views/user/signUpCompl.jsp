<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>회원가입완료</title>
    <link rel="stylesheet" href="/css/signUpCompl.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
     function loginBtn(){
    	 location.href="./login";
     }
     
     function indexBtn(){
    	 location.href="../main";
     }
    
    </script>

</head>

<body>
    <div class="login-wrap">
        <div class="login-html">
            <h1>회원가입</h1>
            
            <div class="login-form">
                <div class="header">
                    <p>회원가입이 완료되었습니다.</p>
                </div>
                <div class="middle">
               
                    <p>${userInfoVo.getU_name()}님, 회원가입을 진심으로 축하합니다.</p>
                </div>
                <div class="sign-up-htm">

                    <div class="container">
                         <div class="hign_box">
                              <span class="hign_img"><img src="../images/school.png"></span><span class="hign_p">저희 홈페이지를 이용해 주셔서 감사합니다.</span>
                         </div>
                         <div class="middel_box">
                             <div class="leftbox">  
                                     <img src="../upload/${userInfoVo.getU_profile()}"> 
                             </div>
                             <div class="rightbox">
                                 <span class="spanleft">>아이디</span><span class="spanright">${userInfoVo.getU_id()}</span><br>
                                 <span class="spanleft">>이메일</span><span class="spanright">${userInfoVo.getU_email()}</span><br>
                                 <span class="spanleft">>닉네임</span><span class="spanright">${userInfoVo.getU_nickName()}</span><br>
                             </div>
                         </div>
                    </div>
                    
                    <div class="group">
                        <div class="Btns">
                                <div class="topBtn">
                                    <button type="button" class="button" onclick="loginBtn()">로그인</button>
                                </div>
                                <div class="underBtn">
                                    <button type="button" class="button" onclick="indexBtn()">메인으로 이동</button>
                                </div>
                        </div>
                    </div>
                   
                </div>
              
            </div>
        </div>
        
    </div>


</body>

</html>