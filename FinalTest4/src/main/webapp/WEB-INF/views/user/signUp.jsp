<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="/css/signUp.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">  
    var patternName= /^[가-힣]{2,4}$/;
    var patternId=/^[a-zA-Z]{1}[a-zA-Z0-9]{3,15}$/;
    var patternPw=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
    var patternNickname=/^[a-zA-Z가-힣0-9]{2,10}$/;
    var patternPhoneNumber=/^[0]{1}[0-9]{1,2}[0-9]{8}$/;
    var patternEmail =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   
    $(function(){
    	
    	$(".u_name").keyup(function(){
    		$("#nameS").html("");
    		 if(patternName.test($("#u_name").val())!=true){
                 $("#nameS").html("*2~4글자 한글로 기입하셔야 합니다.");
                 $("#nameS").css("color","red");
                 $("#u_name").focus();
             }else{
           	  $("#nameS").html("*이름으로 사용가능합니다.");
                 $("#nameS").css("color","green");
             }
    		 
    	});
    	

    	
    	$(".u_id").keyup(function(){
    		$("#idS").html("");
    		 if(patternId.test($("#u_id").val())!=true){
                 $("#idS").html("*6~20자 영문자 또는 숫자이어야 합니다.");
                 $("#idS").css("color","red");
                 $("#u_id").focus();
             }else{
           	  $("#idS").html("*아이디로 사용가능합니다.");
                 $("#idS").css("color","green");
             }
    		 
    	});
    	

    	
    	$(".u_pw").keyup(function(){
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
    	
    	$(".u_email").keyup(function(){
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
    	
    	
    	$(".u_tel").keyup(function(){
    		$("#telS").html("");
    		 if(patternPhoneNumber.test($("#u_tel").val())!=true){
                 $("#telS").html("*-제외한 숫자만 입력해주시길바랍니다.");
                 $("#telS").css("color","red");
                 $("#u_tel").focus();
             }else{
           	  $("#telS").html("*전화번호로 사용가능 합니다.");
                 $("#telS").css("color","green");
             }
    		 
    		 
    	});
    	
    	$(".u_nickName").keyup(function(){
    		$("#nickS").html("");
        if(patternNickname.test($("#u_nickName").val())!=true){
        	 $("#nickS").html("*닉네임은 2~10이내로 입력부탁드리겠습니다.");
             $("#nickS").css("color","red");
             $("#u_nickName").focus();
        }else{
	            $("#nickS").html("*닉네임으로 사용가능합니다.");
	            $("#nickS").css("color","green");
        }
    	
      });
    	
    	
    	
    	
  });
    
    
    
      function signUpBtn(){
    	  
    	  if(patternName.test($("#u_name").val())!=true){
              alert("사용할 수 없는 이름입니다. 다시입력해주세요.");
              $("#u_name").focus();
              return false;
          }
    	  
    	  
          if(patternId.test($("#u_id").val())!=true){
              alert("사용할 수 없는 아이디입니다. 다시입력해주세요.");
              $("#u_id").focus();
              return false;
          }
          
          if(patternPw.test($("#u_pw").val())!=true){
              alert("사용할 수 없는 비밀번호입니다. 다시입력해주세요.");
              $("#u_pw").focus();
              return false;
          }
          
          
    	  
    		  var u_pw1 = $(".u_pw").val();
    		  var u_pw2 = $(".u_pw2").val();
    		  if(u_pw1 != u_pw2){
    			  alert("두 비밀번호가 일치하지 않습니다. 다시입력해주세요.");
                  $(".u_pw2").focus();
                  return false;
    		  }

          
          if(patternEmail.test($("#u_email").val())!=true){
              alert("사용할 수 없는 이메일입니다. 다시입력해주세요.");
              $("#u_email").focus();
              return false;
          }
          
          if(patternPhoneNumber.test($("#u_tel").val())!=true){
              alert("사용할 수 없는 휴대폰번호입니다. 다시입력해주세요.");
              $("#u_tel").focus();
              return false;
          }
          
          if(patternNickname.test($("#u_nickName").val())!=true){
              alert("사용할 수 없는 닉네임입니다. 다시입력해주세요.");
              $("#u_nickName").focus();
              return false;
          }
          
          if(($("#u_intro").val())==''){
    		  alert("소개글을 입력해주세요.");
    		  $("#u_intro").focus();
    		  return false;
    	  }
          
          if(($("#file").val())==''){
    		  alert("프로필을 선택해주십시오.");
    		  $("#file").focus();
    		  return false;
    	  }
          
          $.ajax({
      		url:"./idChk",
      		type:"post",
      		dataType:"json",
      		data : {
      			"u_id": $("#u_id").val()
      			},
      		success: function(data){
      			if(data==1){
      				alert("중복된 아이디입니다.");
      				return false;
      			}
      				$("#sign").submit();
      			
      		},
      		error:function(){
      			
      		}
      	 });
          
       
          
          
      }//signUpBtn
      
   
    </script>
    <script type="text/javascript">
    $(function(){
    	  $(".u_pw").keyup(function(){
    		  $("#inputPw").html('');
    	  });
    	  $(".u_pw2").keyup(function(){
    		  var u_pw1 = $(".u_pw").val();
    		  var u_pw2 = $(".u_pw2").val();
    		  if(u_pw1 != u_pw2){
    			$("#inputPw").html("비밀번호가 일치하지 않음"); 
    			$("#inputPw").css("color","red");
    		  }else{
    			$("#inputPw").html("비밀번호가 일치합니다."); 
      			$("#inputPw").css("color","green");
    		  }
    		  
    	  });
    	  
    	  
    	  $("#sameNickBtns").click(function(){
       		if(patternNickname.test($("#u_nickName").val())!=true){
                   alert("닉네임 잘못입력되었습니다. 다시입력해주세요.");
                   $("#u_nickName").focus();
                   return false;
               } 
          	 
          	 if(($("#u_nickName").val())==''){
         		  alert("닉네임을 입력해주십시오.");
         		  $("#u_nickName").focus();
         		  return false;
         	     }
          	 
          	 
          	 $.ajax({
           		url:"./nickChk",
           		type:"post",
           		data : {
           			"u_nickName": $("#u_nickName").val()
           			},
           		success: function(data){
           			if(data==1){
           				alert("중복된 닉네임입니다.");
           	
           			}else{
           				alert("사용가능한 닉네임입니다.");
           			    
           			}
           		},
           		error:function(){
           			
           		}
           	 });
       	});
    	  
      });
    
     function sameBtn(){
    	 
    	 if(patternId.test($("#u_id").val())!=true){
             alert("아이디가 잘못입력되었습니다. 다시입력해주세요.");
             $("#u_id").focus();
             return false;
         } 
    	 
    	 if(($("#u_id").val())==''){
   		  alert("아이디를 입력해주십시오.");
   		  $("#u_id").focus();
   		  return false;
   	     }
    	
    	 $.ajax({
    		url:"./idChk",
    		type:"post",
    		dataType:"json",
    		data : {
    			"u_id": $("#u_id").val()
    			},
    		success: function(data){
    			if(data==1){
    				alert("중복된 아이디입니다.");
    			}else{
    				alert("사용가능한 아이디입니다.");
    			}
    		},
    		error:function(){
    			
    		}
    	 });
    	
     }
     
      
     
     
    </script>
</head>

<body>
    
    <div class="login-wrap">
        <div class="login-html">
        <form action="./sign" id="sign" name="sign" method="post" enctype="multipart/form-data">
            <h1>회원가입</h1>
            
            <div class="login-form">
                <div class="header">
                </div>
                <div class="sign-up-htm">
                  <div class="textarea">
                    <div class="group">
                        <label>이름<small id="nameS"></small></label>
                        <div>
                        <input type="text" class="u_name" id="u_name" name="u_name" placeholder="이름">
                        </div>
                    </div>
                    <div class="group">
                        <label>아이디<button type="button" class="sameBtn" onclick="sameBtn()">중복확인</button><small id="idS"></small></label>
                        <div>
                            <input type="text" class="u_id" id="u_id" name="u_id" placeholder="아이디">
                            </div>
                    </div>
                    <div class="group">
                        <label>비밀번호<small id="pwS"></small></label>
                        <div>
                            <input type="password" class="u_pw" id="u_pw" name="u_pw" placeholder="비밀번호">
                            </div>
                    </div>
                    <div class="group">
                        <label>비밀번호확인
	                        <small class="inputPw" id="inputPw"></small>
                        </label>
                        <div>
                            <input type="password" class="u_pw2" id="u_pw2" name="u_pw2" placeholder="비밀번호확인">
                            </div>
                    </div>
                    <div class="group">
                        <label class="email">이메일<small id="emailS"></small></label>
                    <div>
                            <input type="text" id="u_email" name="u_email" class="u_email" placeholder="이메일">
                            </div>
                    </div>
                    <div class="group">
                        <label>휴대폰번호<small id="telS"></small></label>
                        <div>
                            <input type="text" id="u_tel" name="u_tel" class="u_tel" placeholder="휴대폰번호">
                            </div>
                    </div>
                     <div class="group">
                        <label>닉네임<button type="button" id="sameNickBtns">중복확인</button><small id="nickS"></small></label>
                        <div>
                            <input type="text" class="u_nickName" id="u_nickName" name="u_nickName" placeholder="닉네임">
                            </div>
                    </div>
                     <div class="group">
                        <label>프로필</label>
                        <div>
                            <input type="file" id="file" name="file">
                            </div>
                    </div>
                     <div class="group">
                        <label>소개글<small id="introS"></small></label>
                        <div>
                            <input type="text" class="u_intro" id="u_intro" name="u_intro" placeholder="간단한 소개글">
                            </div>
                    </div>
                 </div>
                    <div class="group">
                        <div class="Btns">
                            <div class="leftBtn">
                            <button type="button" class="button" onclick="javascript:location.href='./login'">취소</button>
                            </div>
                            <div class="rightBtn">
                                <button type="button" id="signUp" class="button" onclick="signUpBtn()">회원가입하기</button>
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
            </form>
        </div>
        
    </div>


</body>

</html>