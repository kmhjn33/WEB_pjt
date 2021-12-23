<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>비밀번호찾기</title>
    <link rel="stylesheet" href="/css/pwCompl.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
     function loginBtn(){
    	 location.href="./login";
     }
    
    
    </script>

</head>

<body>
    <div class="login-wrap">
        <div class="login-html">
            <h1>비밀번호 재설정 완료</h1>
            <div class="login-form">
                <div class="sign-up-htm">
                    <div class="group">
                        <div class="header">
                           <p>귀하의 정보가 변경되었습니다.</p>   
                        </div>
                    </div>
                    <div class="footer">
                        <div class="group">
                            <div class="middle">
                            <span>새 아이디:</span>
                            <span class="session">${userInfoVo.getU_id()}</span>    
                            </div>
                        </div>
                        <div class="group">
                            <div class="bottom">
                                <span>새 비밀번호:</span>
                                <span class="session">${userInfoVo.getU_pw()}</span>     
                            </div> 
                        </div>
                    </div>
                    <div class="group">
                        <div class="Btn">
                         <button type="button" class="button" onclick="loginBtn()">로그인 하러 가기</button>
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
        
    </div>


</body>

</html>