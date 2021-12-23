<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>비밀번호찾기</title>
    <link rel="stylesheet" href="/css/pwFind.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
     
     function pwFind(){
    	 
    	 if(($("#u_id").val())==''){
   		  alert("아이디를 입력하십시오.");
   		  $("#u_id").focus();
   		  return false;
   	      }
    	
    	 
    	 
    	 $("#pwC").submit();
     }       
     </script>
</head>

<body>
    <div class="login-wrap">
        <div class="login-html">
           <h1>개인회원 비밀번호 찾기</h1>
           <form action="./pwC" id="pwC" name="pwC" method="post">
            <div class="login-form">
                <div class="sign-up-htm">
                    <div class="group">
                        <label class="label">아이디</label>
                        <input type="text" class="input" id="u_id" name="u_id" placeholder="비밀번호를 찾고자 하는 아이디를 입력해 주세요.">
                    </div>          
                    <div class="buttonEx">
                        <div class="group">
                            <input type="button" class="button" onclick="pwFind()" value="비밀번호변경">
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
        
    </div>


</body>

</html>