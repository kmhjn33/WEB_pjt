<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>아이디찾기</title>
    <link rel="stylesheet" href="/css/idFind.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    var patternPhoneNumber=/^[0]{1}[0-9]{1,2}[0-9]{8}$/;
    var patternEmail =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     $(function(){
    	 $("#u_email").keyup(function(){
     		$("#emailS").html("");
     		 if(patternEmail.test($("#u_email").val())!=true){
                  $("#emailS").html("*이메일이 잘못입력되었습니다. 다시입력해주세요.");
                  $("#emailS").css("color","red");
                  $("#u_email").focus();
              }else{
            	  $("#emailS").html("*이메일로 사용가능 합니다.");
                  $("#emailS").css("color","green");
              }
     		 
     	});
    	 
    	 
    	 
    	 $("#u_tel").keyup(function(){
     		$("#telS").html("");
     		 if(patternPhoneNumber.test($("#u_tel").val())!=true){
                  $("#telS").html("*-제외한 숫자만 입력해주시길바랍니다.");
                  $("#telS").css("color","red");
                  $("#u_tel").focus();
              }else{
            	  $("#telS").html("*휴대폰번호로 사용가능 합니다.");
                  $("#telS").css("color","green");
              }
     		 
     		 
     	});
    	 
     });
     
     
     function FindBtn(){
    	 if(($("#u_name").val())==''){
   		  alert("이름을 입력해주십시오.");
   		  $("#u_name").focus();
   		  return false;
   	  }
    	 
    	 if(($("#u_email").val())==''){
   		  alert("이메일을 입력해주십시오.");
   		  $("#u_email").focus();
   		  return false;
   	  }
    	 
    	 if(($("#u_tel").val())==''){
   		  alert("휴대폰번호를 입력해주십시오.");
   		  $("#u_tel").focus();
   		  return false;
   	  }
    	 
    	 if(patternEmail.test($("#u_email").val())!=true){
    		 alert("이메일을 올바르게 입력해주십시오.");
      		  $("#u_email").focus();
      		  return false;
         }
    	 
    	 
    	 if(patternPhoneNumber.test($("#u_tel").val())!=true){
    		  alert("휴대폰번호를 올바르게 입력해주십시오.");
     		  $("#u_tel").focus();
     		  return false;
         }
    	 
    	
    				
    	$("#idC").submit();
    			
	 
     }
     
     
    </script>

</head>

<body>
    <div class="login-wrap">
        <div class="login-html">
            <h1>개인회원 아이디 찾기</h1>  
            
            <div class="login-form">
            <form action="./idC" id="idC" name="idC" method="post">
                <div class="sign-up-htm">
                    <div class="group">
                        <label class="label">이름</label>
                        <input type="text" id="u_name" name="u_name" class="input" placeholder="아이디">
                    </div>
                    <div class="group">
                        <label class="label">이메일<small id="emailS"></small></label>
                        <input type="text" id="u_email" name="u_email" class="input" placeholder="이메일">
                    </div>
                    <div class="group">
                        <label class="label">휴대폰번호<small id="telS"></small></label>
                        <input type="text" id="u_tel" name="u_tel" class="input" placeholder="휴대폰번호">
                    </div>
                   
                    <div class="buttonEx">
                        <div class="group">
                            <input type="button" class="button" onclick="FindBtn()" value="아이디 찾기">
                        </div>
                

                    </div>

                </div>
                 </form>
            </div>
           
        </div>
        <!-- login-html -->
    </div>
    <!-- login-wrap -->


</body>

</html>