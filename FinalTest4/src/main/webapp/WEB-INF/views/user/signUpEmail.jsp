<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 이메일 인증</title>
    <link rel="stylesheet" href="/css/signUp2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    function sendEmail(){
    	 alert("이메일 인증코드를 송신했습니다.");
    	 $.ajax({
			     url:"sendEmail",
		 		 type:"post",
		 		 data:{
		 			 "u_email":$("#u_email").val()
		 		 },
		 		 success:function(data){   
		 		    alert("이메일 인증코드 송신이 완료되었습니다.");
		 		    
		 		 },
		 		 error:function(data){
		 			 alert("이메일 인증코드 송신에 실패했습니다. 다시 입력하십시오.");
		 			 $("#u_email").focus();
		 		 }
		   });
    }
    
    function sendCheck(){
    	if($("#u_email2").val()==''){
    		 alert("인증코드를 입력해주실 바랍니다.");
    		 $("#u_email2").focus();
    	}else{
    	     alert("인증코드가 일치합니다.");
    	}
    	
    	
    }
    
    function signCom(){
    	if(($("#u_email2").val())==''){
    		alert("인증코드를 입력하지 않았습니다.");
    		$("#u_email2").focus();
    		return false
    	}else{
    		alert("인증이 완료되었습니다.");
    		location.href="./signUp";
    	}
    	
    }
    
    </script>

</head>

<body>
    <div class="login-wrap">
        <div class="login-html">
            <h1>회원가입</h1>
       
            <div class="login-form">
                <div class="sign-up-htm">

                    <div class="group">
                        <div class="emails">
                            <div class="left">
                                <div class="left_top">
                                    <label class="label">이메일 인증</label>  
                                    <input type="text" class="input" id="u_email" name="u_email" placeholder="이메일">
                                </div>
                                <div class="right">
                                    <button type="button" class="button" onclick="sendEmail()">인증코드 송신</button>
                                </div>
                                <div class="left_under">
                                    <label class="label">인증 코드</label>  
                                    <input type="text" class="input" id="u_email2" name="u_email2" placeholder="인증코드">
                                </div>
                            </div>
                            <div class="right">
                                <button type="button" class="button" onclick="sendCheck()">인증완료</button>
                            </div>
                        </div>
                    </div>

                    <div class="group">
                        <div class="Btns">

                            <div class="leftBtn">
                                <button type="button" class="button" onclick="javascript:history.back()">취소</button>
                            </div>

                            <div class="rightBtn">
                                <button type="button" class="button" onclick="signCom()">다음단계</button>
                            </div>
                        </div>
                    </div>


                    
                </div>
               
            </div>
            
        </div>
        
    </div>


</body>

</html>