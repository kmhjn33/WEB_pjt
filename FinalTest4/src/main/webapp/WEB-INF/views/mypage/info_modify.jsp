<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보변경</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/info_modify.css">
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


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    var patternId=/^[a-zA-Z]{1}[a-zA-Z0-9]{3,15}$/;
    var patternPw=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
    var patternPhoneNumber=/^[0]{1}[0-9]{1,2}[0-9]{8}$/;
    var patternEmail =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         $(function(){
        	 $(".boxID").keyup(function(){
           		$("#idS").html("");
           		 if(patternId.test($("#u_id").val())!=true){
                        $("#idS").html("*6~20자 영문자 또는 숫자이어야 합니다.");
                        $("#idS").css("color","red");
                        $("#u_id").focus();
                    }else{
                  	  $("#idS").html("*아이디로 사용가능 합니다.");
                        $("#idS").css("color","green");
                    }
           		 
           	}); 
        	 $(".boxPW").keyup(function(){
            		$("#pWS").html("");
            		 if(patternPw.test($("#u_pw").val())!=true){
                         $("#pWS").html("*최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자");
                         $("#pWS").css("color","red");
                         $("#u_pw").focus();
                     }else{
                   	  $("#pWS").html("*비밀번호로 사용가능 합니다.");
                         $("#pWS").css("color","green");
                     }
            		 
            	}); 
        	 
        	  $("#u_pw").keyup(function(){
        		  $("#pWS2").html('');
        	  });
        	  $("#u_pw2").keyup(function(){
        		  var u_pw1 = $("#u_pw").val();
        		  var u_pw2 = $("#u_pw2").val();
        		  if(u_pw1 != u_pw2){
        			$("#pWS2").html("비밀번호가 일치하지 않음"); 
        			$("#pWS2").css("color","red");
        		  }else{
        			$("#pWS2").html("비밀번호가 일치합니다."); 
          			$("#pWS2").css("color","green");
        		  }
        		  
        	  });
        	  
        	 
        	 
        	 $(".boxEmail").keyup(function(){
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
        	 $(".boxTel").keyup(function(){
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
        	 
        	 
$("#modify_btn").click(function(){
        		 
        		
    		
if(patternId.test($("#u_id").val())!=true){
	      alert("아이디가 잘못입력되었습니다. 다시입력해주세요");
		  $("#u_id").focus();
		  return false;
       }
		 
	

 		
if(patternPw.test($("#u_pw").val())!=true){
          alert("비밀번호가 잘못입력되었습니다. 다시입력해주세요.");
		  $("#u_pw").focus();
		  return false;
      }
 

var u_pw1 = $("#u_pw").val();
var u_pw2 = $("#u_pw2").val();
if(u_pw1 != u_pw2){
          alert("두 비밀번호가 일치하지 않습니다. 다시입력해주세요.");
 		  $("#u_pw2").focus();
 		  return false;
      }


if(patternEmail.test($("#u_email").val())!=true){
		  alert("이메일이 잘못입력되었습니다. 다시입력해주세요.");
		  $("#u_email").focus();
		  return false;
      }
             		 
            
if(patternPhoneNumber.test($("#u_tel").val())!=true){
	       alert("휴대폰번호가 잘못입력되었습니다. 다시입력해주세요.");
	       $("#u_tel").focus();
	       return false;
      }
        		 
       if(confirm("회원정보를 변경 하시겠습니까?")){
       	 $("#modifyInfo").submit();
       }else{
          return false;
       }
     
        		
});
        	 
        	 
            $("#cancel_btn").click(function(){
                location.href="my_info";
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
        		url:"./idChke",
        		type:"post",
        		dataType:"json",
        		data : {"u_id": $("#u_id").val()},
        		success: function(data){
        			if(data==1){
        				alert("중복된 아이디입니다.");
        			}else{
        				alert("사용가능한 아이디입니다.");
        			}
        		}
        	 });
        	
         }
    </script>
</head>
<body>
<%@include file="/WEB-INF/views/header_footer/header.jsp" %>

    <section id="container">
        <div id="mypage_head">
            <div id="mypage_title">
                <h2>마이페이지<small> | 내 정보 수정하기</small></h2>
            </div>
            
        </div>
        
        <form action="./modifyInfo" id="modifyInfo" name="modifyInfo">
        <div class="container">
            <table id="info_tb">
                <tr>
                    <input type="hidden" id="u_no" name="u_no" value="${userInfoVo.getU_no()}">
                    <td><strong>사용자 이름</strong></td>
                    <td class="input">${session_u_name}</td>
                </tr>
                <tr>
                    <input type="hidden" id="u_id" name="u_id" value="${session_u_id}">
					<td><strong>아이디<!-- <button type="button" class="sameBtn" onclick="sameBtn()">중복확인</button><small id="idS"></small> --></strong></td>
					<td class="input">${session_u_id}<!-- <input class="boxID" type="text" name="u_id" id="u_id" size="20"> --></td>
                </tr>
                <tr>
                    <td><strong>비밀번호<small id="pWS"></small></strong></td>
                    <td class="input"><input class="boxPW" name="u_pw" id="u_pw" type="password" size="20"></td>
                </tr>
                <tr>
                    <td><strong>비밀번호 확인<small id="pWS2"></small></strong></td>
                    <td class="input"><input class="boxPW2" name="u_pw2" id="u_pw2" type="password"  size="20"></td>
                </tr>
                <tr>
                    <td><strong>이메일<small id="emailS"></small></strong></td>
                    <td class="input">
                        <input class="boxEmail" type="text" name="u_email" id="u_email" size="20"> 
                    </td>
                </tr>
                <tr>
                    <td><strong>휴대전화<small id="telS"></small></strong></td>
                    <td class="input">
                        <input class="boxTel" type="text" name="u_tel" id="u_tel" size="20">
                    </td>
                </tr>
            </table>
        </div>
        </form>
        <div class="Btn">
            <button type="button" id="modify_btn">수정하기</button>    
            <button type="button" id="cancel_btn">수정 취소</button> 
        </div>   
    </section>
</body>
</html>