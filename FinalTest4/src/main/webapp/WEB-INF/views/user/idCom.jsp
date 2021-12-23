<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디찾기완료</title>
    <link rel="stylesheet" href="/css/idCom.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
     function loginBtn(){
    	 location.href="./login";
     }
     
     
     function pwFindBtn(){
    	 location.href="./pwFind";     
     }
     
     
   
     
    </script>
</head>

<body>
    <div class="login-wrap">
        <div class="login-html">
            <h1>아이디 찾기</h1>
            <div class="login-form">
                <div class="sign-up-htm">
                    <div class="group">
	                   <div class="textLine">
	                       <span class="session">${userVo.getU_name()}</span>
	                       <span>회원님의 아이디는</span>
	                       <span class="session">${userVo.getU_id()}</span>
	                       <span> (으)로 등록되어 있습니다.</span><br>
	                       <span>가입일자는 </span>
	                       <span class="session"><fmt:formatDate value="${userVo.getU_signDate()}" pattern="yyyy-MM-dd"/></span>
	                       <span>입니다.</span>
	                   </div>
                        <div class="group">
                            <div class="Btn"> 
                               <input type="button" class="button" onclick="loginBtn()" value="로그인">
                            </div>
                            <div class="Btn2"> 
                               <input type="button" class="button" onclick="pwFindBtn()" value="비밀번호 찾기">
                             </div>
                        </div>
                    </div>

                </div>
               
            </div>
        </div>
        
    </div>


</body>

</html>