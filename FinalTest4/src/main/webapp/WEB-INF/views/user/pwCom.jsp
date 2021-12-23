<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>비밀번호찾기</title>
    <link rel="stylesheet" href="/css/pwCom.css" />
    <style type="text/css">
     .button {
     cursor: pointer;
     }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    
    var patternPw=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
      
      $(function(){
    	  $(".input").keyup(function(){
      		$("#pwS").html("");
      		 if(patternPw.test($("#u_pw").val())!=true){
                   $("#pwS").html("*최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자");
                   $("#pwS").css("color","red");
                   $("#u_pw").focus();
               }else{
             	  $("#pwS").html("*비밀번호로 사용가능 합니다.");
                   $("#pwS").css("color","green");
               }
      		 
      	}); 
      });
      
      
      $(function(){
    	  $(".input").keyup(function(){
    		  $("#inputPw").html('');
    	  });
    	  $(".input1").keyup(function(){
    		  var u_pw1 = $(".input").val();
    		  var u_pw2 = $(".input1").val();
    		  if(u_pw1 != u_pw2){
    			$("#inputPw").html("비밀번호가 일치하지 않음"); 
    			$("#inputPw").css("color","red");
    		  }else{
    			$("#inputPw").html("비밀번호가 일치합니다."); 
      			$("#inputPw").css("color","green");
    		  }
    		  
    	  });
    	  
      });
      
      function pwComBtn(){
    	  if(($("#u_pw").val())==''){
       		  alert("변경할 비밀번호를 입력하십시오.");
       		  $("#u_pw").focus();
       		  return false;
       	      }
    	  
	  var u_pw1 = $(".input").val();
	  var u_pw2 = $(".input1").val();
	  if(u_pw1 != u_pw2){
		  alert("두 비밀번호가 일치하지 않습니다. 다시입력해주세요.");
             $(".input1").focus();
             return false;
	  }
    		  
    	 
    	  
    	  
    	  $("#pwCompl").submit();
    	  
       }
      
    
    
    </script>
    
</head>

<body>
    <div class="login-wrap">
        <div class="login-html">
            <h1>비밀번호 재설정</h1>
            <form action="pwCompl" id="pwCompl" name="pwCompl" method="post">
            <div class="login-form">
                <div class="sign-up-htm">
                    <div class="group">
                        <div class="user_id">
                          <span>회원 아이디:</span>
                          <span class="session">${userInfoVo.getU_id()}</span>
                        </div>
                    </div>
                    <input type="hidden" id="u_id" name="u_id" value="${userInfoVo.getU_id()}">
                    <div class="group">
                        <label class="label">새 비밀번호<small id="pwS"></small></label>
                        <input type="password" id="u_pw" name="u_pw" class="input" placeholder="새 비밀번호">
                    </div>
                    <div class="group">
                        <label class="label">
                        새 비밀번호 확인 <small class="inputPw" id="inputPw"></small>
                        </label>
                        <input type="password" id="u_pw" name="u_pw2" class="input1" placeholder="새 비밀번호 확인">
                        <p>*영문, 숫자, 특수문자를 함께 사용하면(8자 이상 16자 이하) 보다 안전합니다.</p>
                    </div>
                    <div class="group">
                        <div class="buttonD">
                         <button type="button" class="button" onclick="pwComBtn()">다음</button>
                        </div>
                    </div>
                </div>
               
            </div>
            </form>
        </div>
        
    </div>


</body>

</html>