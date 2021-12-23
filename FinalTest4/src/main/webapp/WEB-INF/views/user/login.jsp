<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인화면</title>
    <link rel="stylesheet" href="/css/login.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){
        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        var userInputId = getCookie("userInputId");
        $("input[id='u_id']").val(userInputId); 
         
        if($("input[id='u_id']").val() != ""){ 
           // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
            $("#saveBtn").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }
         
        $("#saveBtn").change(function(){ // 체크박스에 변화가 있다면,
            if($("#saveBtn").is(":checked")){ // ID 저장하기 체크했을 때,
                var userInputId = $("input[id='u_id']").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }else{ // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
            }
        });
         
        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("input[id='u_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
            if($("#saveBtn").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                var userInputId = $("input[id='u_id']").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }
        });
     
        //쿠키를 위한 함수 
        function setCookie(cookieName, value, exdays){
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null)?"":";expires="+exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }
         
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
         
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1)end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }
        
    });

      $(function(){  
    	  
        $("#loginBtn").click(function(){
        	
        	if(($("#u_id").val())==''){
      		  alert("아이디를 입력해수십시오.");
      		  $("#u_id").focus();
      		  return false;
      	    }
        	
        	
        	if(($("#u_pw").val())==''){
      		  alert("비밀번호를 선택해주십시오.");
      		  $("#u_pw").focus();
      		  return false;
      	   } 
        	
         
        	$.ajax({
        		url:"./login",
        		type:"post",
        		data:{
        			"u_id":$("#u_id").val(),
        			"u_pw":$("#u_pw").val()
        		},
        		success:function(data){
        			console.log(data);
        			if(data==1){
        				alert("로그인이 성공적으로 완료되었습니다.");
        				location.href="../main";
        			}else{
        				alert("ID 또는 PASSWORD가 틀렸습니다. 다시 입력하시길 바랍니다.");
        				location.href="./login";
        			}
        		},
        		error:function(){
        			
        		}
        		
       	   });
          });
       });
      
      function signUp(){
    	 location.href="./signUpEmail";
      } 

    </script>

</head>

<body>
    <div class="login-wrap">
        <div class="login-html">
            <h1>로그인</h1>
            <form id="loginForm" name="loginForm" method="post">
            <a href="/main"><p>당신의 꿈을 이루어주는 사이트!!</p></a>
            <div class="login-form">
                <div class="sign-up-htm">
                    <div class="group">
                        <label for="id" class="label">아이디</label>
                        <input type="text" id="u_id" name="u_id" class="input" placeholder="아이디">
                    </div>
                    <div class="group">
                        <label for="pw" class="label">비밀번호</label>
                        <input type="password" id="u_pw" name="u_pw" class="input" placeholder="비밀번호">
                    </div>
                    <div class="checkID">
                        <input type="checkbox" id="saveBtn" name="idsave" value="saveOk">
                        <label class="label" id="chwck" for="saveBtn">아이디 저장</label>
                    </div>
                    <div class="buttonEx">
                        <div class="group">
                            <input type="button" class="button" id="loginBtn" onclick="sendit()" value="로그인"> 
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            </a><label for="tab-1"> 어이쿠!! 아이디 또는 비밀번호를 잊어버리셨나요?</a>
                        </div>
                        <div class="find">
                            <a href="./idFind" class="left">아이디 찾기</a>
                            <a href="./pwFind">비밀번호 찾기</a>
                        </div>
                    </div>  
                </div>
                <div class="group">
                    <div class="under">
                        <p>설마 아직 회원이 아니신가요?</p>
                        <div>
                        <input type="button" class="button" onclick="signUp()" value="회원가입">
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
        
    </div>


</body>

</html>