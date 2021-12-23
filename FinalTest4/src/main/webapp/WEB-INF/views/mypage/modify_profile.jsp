<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 변경</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/modify_profile.css">
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
    <script>
        $(function(){
        	var patternNickname=/^[a-zA-Z가-힣0-9]{2,10}$/;
        	$(".input").keyup(function(){
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
        	
        
        	
        	
            $("#check_btn").click(function(){
            	
            	if(patternNickname.test($("#u_nickName").val())!=true){
                    alert("닉네임이 잘못입력되었습니다. 다시입력해주세요.");
                    $("#u_nickName").focus();
                    return false;
                }
            	
            	
            	 if(($("#u_profile").val())==''){
           		  alert("프로필을 지정해주십시오.");
           		  $("#u_profile").focus();
           		  return false;
           	     }
           	     
            	 if(($("#u_intro").val())==''){
              		  alert("소개글을 입력해주십시오.");
              		  $("#u_intro").focus();
              		  return false;
              	     }
           	  
            	
                $("#modiProfile").submit();
            });
        });
    </script>
</head>
<body>
<%@include file="/WEB-INF/views/header_footer/header.jsp" %>
    
    <section id="container">
        <div id="mypage_head">
            <div id="mypage_title">
                <h2>마이페이지<small class="session"> | 프로필 변경</small></h2>
            </div>
        </div>
       
    <form action="./modiProfile" id="modiProfile" name="modiProfile" method="post" enctype="multipart/form-data">
        <div>
            <table id="check_tb">
                <td><input type="hidden" id="u_id" name="u_id" value="${session_u_id}"></td>
                <tr class="id">
                    <td><strong>새로운 프로필사진</strong></td>
                    <td><input class="input" type="file" id="file" name="file"></td>
                </tr>
                <tr class="id">
                    <td><strong>새로운 닉네임<br><small id="nickS"></small></strong></td>
                    <td><input class="input" type="text" id="u_nickName" name="u_nickName"></td>
                </tr>
                <tr class="pw">
                    <td><strong>새로운 소개글<br><small id="introS"></small></strong></td>
                    <td><input class="input2" type="text" id="u_intro" name="u_intro"></td>
                </tr>
            </table>
        </div>
      </form>  
        <div class="Btn">
            <button type="button" id="check_btn">변경 완료</button>
        </div>
    </section>
</body>
</html>