<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/member_quit.css">


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
            $("#cancel_btn").click(function(){
                location.href="my_info";
            });
            
            $("#member_quit").click(function(){
            	if(confirm("정말로 회원 탈퇴를 하시겠습니까?")){
           		    //$("#Memberquit").submit();
            		location.href="./delete_check";
           	    }else{
           		    return false;
           	   }
            });
            
            
        });
         
        
    </script>
</head>
<body>

<%@include file="/WEB-INF/views/header_footer/header.jsp" %>
    <section id="container">
        <div id="mypage_head">
            <div id="mypage_title">
                <h2>마이페이지<small> | 회원 탈퇴</small></h2>
            </div>

        </div>
        
      <form action="Memberquit" id="Memberquit" name="Memberquit" method="post">
        <input type="hidden" id="u_id" name="u_id" value="${userInfoVo.getU_id()}">
        <div id="quit_info">
            <strong id="title">회원 탈퇴</strong><br>
            <br>
            <br>
            <strong class="red">1.회원탈퇴 시 가입한 크루에서 자동 탈퇴되며 개인정보 및 모든 데이터를 삭제됩니다.</strong><br>
            <p>- 단, 탈퇴 신청 후 일정기간(14일)동안은 데이터를 보관 할 수 있고 ,14일이 경과되면 자동 삭제됩니다.</p><br>
            <br>
            <strong class="red">2.탈퇴 신청한 아이디로 즉시 재가입이 불가능합니다.</strong><br>
            <p>- 단, 탈퇴 신청 후 일정기간(3일)이 경과되면 가입 하실 수 있습니다.</p><br>
            <br>
            <strong class="red">3.탈퇴 후 공개 게시글은 삭제되지 않습니다.</strong><br>
            <p>- 업로드 된 게시물과 영상 및 파일들은 탈퇴 후에도 유지 됩니다.</p>
            <p>- 해당 게시물에 대한 삭제를 원하는 경우, 반드시 탈퇴 전에 삭제해 주세요.</p><br>
        </div>
        </form> 
        <div class="Btn">
            <div id="quit_btn">
                <button type="button" id="member_quit">회원탈퇴</button>
            </div>
            <div id="cancel">
                <button type="button" id="cancel_btn">취소</button>
            </div>
        </div>
       
    </section>
    
    
        
   
</body>
</html>