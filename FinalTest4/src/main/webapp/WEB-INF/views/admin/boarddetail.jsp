<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="../css/admin_style_top.css"/>
	<link rel="stylesheet" href="../css/admin_style.css"/>
	<link rel="stylesheet" href="../css/admin_style_boarddetail.css"/>
	<link rel="stylesheet" href="../css/admin_style_board_detail.css"/>
	<link rel="stylesheet" href="../css/admin_crew_view.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	    <!-- 구글 아이콘 링크 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    
<%-- 		var u_name=${ session_u_name };
		console.log("user_name" + u_name);
		var u_type=${ session_u_detail_no };
		console.log("user_type" + u_type);
		$("#user_name").val(u_name);
		if(u_type!='0'){
/* 			alert("관리자에게만 접근 권한이 있어요.");
			location.href="/login"; */
		}
		
		function btnLogout(){
			<%
				session.invalidate();
			%>
			location.href="/index";	
		} --%>
	
        function c(name) {
            document.getElementById('wrap').className = 'c';
            document.getElementById('preview').src = '../images/' + name;
        }
        
        function back(){
        	alert("back 클릭");
        	history.back();
        }
        
        function selectRecommand(b_comm_no){
        	$.ajax({
        		url:"./selectRecommandList",
				type:"post",
        		data:{"b_comm_no" : b_comm_no},
        		dataType:"json",
        		//contentType:"application/json; charset=utf-8;",
        		success:function(data){
        		    //jdata=jdata.replaceAll("\'","\"");
        		    //var jobj=JSON.parse(jdata);
        		    //console.log(data);
        		    var chtml=""
        		    $("#listlike").html(chtml)
        		    if(data.length > 0){
        		    	
	           			for(var d in data){
	        				//console.log(data[d].b_comm_like_date);
	        				chtml+="<li  id=\"l" + data[d].b_comm_like_no + "\"><button onclick=\"deleteRecommend(" + data[d].b_comm_like_no + ")\">삭제</button><a href=\"#\">&nbsp&nbsp<span>&nbsp[&nbsp" +   data[d].u_name  + "&nbsp]&nbsp&nbsp" + data[d].b_comm_like_date + " </span></a></li>"
	        			}
	           			$("#listlike").html(chtml)
        		    }
        		},
        		error:function(err){
        			alert("조회 실패 : " + err);
        		}
        	});
        	
        }
        
        
        //댓글 삭제
        function deleteComment(b_comm_no){
        	$.ajax({
        		url:"./deleteComment",
        		data:{"b_comm_no" : b_comm_no},
        		//dataType:"json",
        		success:function(data){
        			alert(data);
        			if(data==1){
        				$("#c" + b_comm_no).remove();
        			}
        		},
        		error:function(err){
        			alert("삭제 실패 : " + err);
        		}
        	});
        }
        //추천 내역 삭제
        function deleteRecommend(b_like_no){
        	$.ajax({
        		url:"./deleteRecommand",
        		data:{"b_like_no" : b_like_no},
        		//dataType:"json",
        		success:function(data){
        			alert(data);
        			if(data==1){
        				$("#l" + b_like_no).remove();
        			}
        		},
        		error:function(err){
        			alert("삭제 실패 : " + err);
        		}
        	});
        }
        
        // 신고내역 삭제
        function deleteReport(b_report_no){
        	$.ajax({
        		url:"./deleteReport",
        		data:{"b_report_no" : b_report_no},
        		//dataType:"json",
        		success:function(data){
        			alert(data);
        			if(data==1){
        				$("#r" + b_report_no).remove();
        			}
        		},
        		error:function(err){
        			alert("삭제 실패 : " + err);
        			
        		}
        	});
        }
        
        
    </script>

</head>
<body>
		<c:if test="${ session_u_id != 'admin' || session_u_id == null }">
			<script>
				alert("잘못된 접근입니다.");
				location.href = "/main";
			</script>
		</c:if>

	 <nav>
	    <div class="navbar">
	      <div class=""><a href="/main">CREW WITH TO US</a></div>
	      <ul class="nav-links">
	        <li class="appearance icons"><a href="/admin/member_info">회원정보</a></li>
	        <li><a>|</a></li>
	        <li><a href="/admin/board_info"><span  style="font-weight: 800; color: blue;">게시판</span></a></li>
	        <li><a>|</a></li>
	        <li><a href="/admin/member_stats">회원통계</a></li>
	        <li><a>|</a></li>
	        <li><a href="/admin/crew_info">CREW 현황</a></li>
	        <li><a>|</a></li>
	        <li><a href="/admin/roadmap_info">로드맵 현황</a></li>
	        <li><a>|</a></li>
		        <li>
		        	<%-- <label style="color:white;">사용자 :</label>&nbsp<label>${session_u_name}</label>&nbsp --%>
			        <button type="button" class=".btn" style="margin-top:-3px;" id="searchBtn" name="searchBtn" onclick="btnLogout()">로그 아웃</button>
		       	</li>
	      </ul>
	    </div>
	  </nav>
	  
    <!--ui object -->
    

    <div id="xe" class="fixed wrapper wrapper_main">
        <div id="wrap" class="c">
            <hr class="hr">
            <div id="container">
                <div id="content" style="margin-top: 30px;">
	         	    <div style="float: right;margin-right:20px; ">
						<a href="javascript:history.back()"><span class="material-icons">article</span>목록</a>			            
		    		</div>
                    <h2>게시글 상세 정보</h2>
                    <div class="section">
                        <h3>${bDto.b_post_title}</h3>
                        <p>
                            <img id="preview" class="preview" alt="dynamic layout preview" src="../images/profile.jpg" width="200px "
                                height="150"><textarea class="item_textarea">${bDto.b_post_content}</textarea>
                        </p>
                        
                    </div>
                    <div class="section">
                    	<span>첨부파일</span>
                        <ul class="preview_list">
                        <c:forEach items="${flist}" var="file" >
                            <li>
                                <button id="${file.b_file_no}" onfocus=img_c() onmouseover=img_c() onclick="fixed(${file.b_file_path})" type="button">{file.b_file_name}</button>
                            </li>
                        </c:forEach>
                        </ul>
                        
                    </div>
                </div>
                <hr class="hr">

                <div class="extension e1">
                    <div class="section">
                        <h2>댓글</h2>
                        <ul class="">
                            <c:forEach items="${clist}" var="comment">
            						<li id="c${comment.b_comm_no}"><button onclick="deleteComment(${comment.b_comm_no})">삭제</button>&nbsp&nbsp<a href="#"><span onclick=selectRecommand(${comment.b_comm_no})>${comment.b_comm_content}</span></a></li>
         					</c:forEach>
                        </ul>
                    </div>
                    <div class="section">
                        <h2>추천인 정보</h2>
                        <ul class="" id="listlike" name="listlike">
                            <%-- <c:forEach items="${llist}" var="like" >
                  				<li  id="l${like.b_like_no}"><button onclick="deleteRecommend(${like.b_like_no})">삭제</button><a href="#">&nbsp&nbsp<span>&nbsp[&nbsp${like.u_name}&nbsp]&nbsp&nbsp${like.b_report_date } </span></a></li>
              				</c:forEach> --%>
                        </ul>
                    </div>
                    <div class="section">
                        <h2>게시글 신고 정보</h2>
                        <ul class="">
                            <c:forEach items="${rlist}" var="report" >
                  				<li id="r${report.b_report_no}"><button  onclick="deleteReport(${report.b_report_no})">삭제</button><a href="#">&nbsp&nbsp<span>&nbsp[&nbsp${report.u_name}&nbsp]&nbsp${report.b_report_content}&nbsp&nbsp${report.b_report_date } </span></a></li>
              				</c:forEach>
                        </ul>
                    </div>
                </div>
                
            <hr class="hr">
        </div>
    </div>
</body>
</html>