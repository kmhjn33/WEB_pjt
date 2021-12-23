<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>my_roadmap</title>
    <link rel="stylesheet" href="../css/board_list.css">
    <link rel="stylesheet" href="../css/roadmap_common.css">
    <link rel="stylesheet" href="../css/roadmap.css">
    <link rel="stylesheet" href="../css/add_roadmap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="/css/header.css">
    <!-- 구글 아이콘 링크 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>  
		var u_no = ${session_u_no};

        function new_Roadmap() {
            jQuery(document).ready(function() {
                    $('#myModal').show();
            });
        }
        
        // 로드맵 저장 
        $(function(){
        	$("#save_btn").click(function(){				
				var cate_sub_no = $("#cate_sub_no").val();
		      	
				if($("#r_name").val() == ""){ 
					alert ("제목을 입력하세요!"); 
					return false;
				} else{		
					var r_name = $("#r_name").val();
				} 
				
				$.ajax({
		      		 url:"./roadmapWrite",
		      		 type:"post",
		       		 data:{
		       			"u_no":u_no,
		       			"cate_sub_no":cate_sub_no,
		       			"r_name":r_name 
		       		 },
		       		 success:function(data){
		       		     var chtml="";
		       		     
 		       		     for(var i=0; i < data.length; i++){    	 
	  		       		     chtml += "<a href='roadmap_detail?u_no="+ data[i].roadmapVo.u_no +"&cate_sub_no="+ data[i].categorySubVo.cate_sub_no +"&cate_sub_name="+ data[i].categorySubVo.cate_sub_name +"&r_no=" + data[i].roadmapVo.r_no + "&r_name="+ data[i].roadmapVo.r_name  + "'><div class='roadmap'>";  		       		     	  		       		  
	  		       		     if (data[i].categorySubVo.cate_sub_name == '취미 및 기타'){	  		       		    	 
	  			       		     chtml += "<div class='roadmap_cate' style=width:100px>" + data[i].categorySubVo.cate_sub_name + "</div>";
	  		       		     } else { 
	  		       		  		 chtml += "<div class='roadmap_cate'>" + data[i].categorySubVo.cate_sub_name + "</div>"; 
	  		       		  	 }
			       		     chtml += "<div class='roadmap_name'>"+ data[i].roadmapVo.r_name +"</div>";
			       		 	 chtml += "</div></a>";
		       		     }

		       		     $(".roadmap_list").html(chtml);
		       			 $("#cate_sub_no").val("1");
		       			 $("#r_name").val("");
		       			 $('#myModal').hide(); 		       
		       			 location.href="./my_roadmap";
		       			 
		       		 },
		       		 error:function(){
		       			 alert("에러!");
		       		 }
		      	  });//ajax				
        	});// save_btn
        });// function  
        
        // 모달 Close 
        function close_pop(flag) {
  			 $("#cate_sub_no").val("1");
   			 $("#r_name").val("");
             $('#myModal').hide();
        }       
    </script>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0); 
            background-color: rgba(0,0,0,0.4); 
        }
        
        /* Modal Content/Box */
        .modal_content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 2px solid #888; 
            width: 540px;                   
            border-radius: 10px;
        }
    </style>

<!-- 구글 아이콘 링크 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 헤더 검색바 CSS링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	
	<c:if test="${session_u_no == null}" >
	  <script type="text/javascript">
	     alert("로그인을 하셔야 서비스가 가능합니다.");
	  </script>
	</c:if>

    <%@include file="../header_footer/header.jsp" %>

    <section id="container">
        <div id="mypage_head">
            <div id="mypage_title">
                <h2>나의 로드맵</h2>
            </div>
 <!--            
 			<div id="mypage_img1">
                <a href="#"><img src="../images/mypage.jpg" alt="마이페이지 이미지"></a>
                <div id="sub_hover">
                    <a href="../mypage/my_info.html"><p>내 정보 관리</p></a>
                    <a href=""><p>크루 관리</p></a>
                    <a href="../roadmap/my_roadmap.html"><p>로드맵 관리</p></a>
                    <a href="../myboard/myboard.html"><p>게시물 관리</p></a>
                </div>          
            </div>
            <div id="mypage_img2">
                <a href="../mypage/mypage.html"><img id="img_hover" src="../images/home.png" alt="홈 이미지"></a>
            </div> 
-->
        </div>
        <hr>

        <div id="list_box">
            <div id="category">
                <div id="list_cate">
                    <ul class="noticeTab">
                        <li><a class="${ cate == 0 ? 'active' : '' }" href="./my_roadmap">전체</a></li>
                        <li><a class="${ cate == 1 ? 'active' : '' }" href="./my_roadmap?cate_sub_no=1">학습</a></li>
                        <li><a class="${ cate == 3 ? 'active' : '' }" href="./my_roadmap?cate_sub_no=3">자격증</a></li>
                        <li><a class="${ cate == 5 ? 'active' : '' }" href="./my_roadmap?cate_sub_no=5">공모전</a></li> 
                        <li><a class="${ cate == 21 ? 'active' : '' }" href="./my_roadmap?cate_sub_no=21">취미 및 기타</a></li>       
                    </ul>
                </div>
                <div id="cate_button">
                    <button id="add_roadmap" onclick="new_Roadmap()"><p>로드맵 생성하기</p></button>
                </div>
            </div> 
            
            <div class="roadmap_list">          
  	      	<%-- <c:if test="${session_no == 4}">      --%>
				<c:forEach items="${list}" var="roadmapCateSubVo">
					<a href="roadmap_detail?u_no=${roadmapCateSubVo.roadmapVo.u_no}&cate_sub_no=${roadmapCateSubVo.categorySubVo.cate_sub_no}&r_no=${roadmapCateSubVo.roadmapVo.r_no}&r_name=${roadmapCateSubVo.roadmapVo.r_name}">
						<%--  &cate_sub_name=${roadmapCateSubVo.categorySubVo.cate_sub_name} --%>
						<div class="roadmap">
							<c:if test="${roadmapCateSubVo.categorySubVo.cate_sub_name != '취미 및 기타'}">
								<div class="roadmap_cate">${roadmapCateSubVo.categorySubVo.cate_sub_name}</div>
							</c:if>
							<c:if test="${roadmapCateSubVo.categorySubVo.cate_sub_name == '취미 및 기타'}">
								<div class="roadmap_cate" style="width: 100px">${roadmapCateSubVo.categorySubVo.cate_sub_name}</div>
							</c:if>
							<div class="roadmap_name">${roadmapCateSubVo.roadmapVo.r_name}</div>
						</div>
					</a>
				</c:forEach>
				<%-- 	</c:if>    --%>      
            </div>
        </div>
            
        <!-- The Modal -->
        <div id="myModal" class="modal"> 
            <!-- Modal content -->
            <div class="modal_content">
                  <p class="roadmap_title"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">로드맵 생성</span></b></span></p>
                  <p class="roadmap_content"><br />
                    <table id="modal_tb">
                        <tr>
                            <td>
                                <label for="cate_sub"><strong>유형</strong></label>
                            </td>
                            <td>
                                <select name="cate_sub_no" id="cate_sub_no">
                                	<!-- <option value="0">선택안함</option> -->
                                    <option value="1">학습</option>
                                    <option value="3">자격증</option>
                                    <option value="5">공모전</option>
                                    <option value="21">취미 및 기타</option>                                      
                                </select>
                            </td>
                        </tr>
                        <br>
                        <tr>
                            <td>
                                <label for="r_name"><strong>로드맵 이름</strong></label>
                            </td>
                            <td>
                                <input type="text" id="r_name" name="r_name">
                            </td>    
                        </tr>
                    </table>
                 </p>
                  <p><br /></p>
                <div class="modal_btn">
                    <div id="save_btn"><!-- onclick="save_pop()" -->
                        <span class="pop_bt">
                            저장
                        </span>
                    </div>

                    <div id="cancel_btn" onClick="close_pop()">
                        <span class="pop_bt">
                            취소
                        </span>
                    </div>
                </div>
            </div> <!-- Modal content -->
        </div><!-- The Modal -->
  
        <div id="board_bottom"> <!-- 하단 페이지 -->
<!--              <ul id="pagination">
                 <li><a href="#" id="first_page"><i class="fas fa-angle-double-left"></i></a></li>
                 <li><a href="#" id="prev_page"><i class="fas fa-angle-left"></i></a></li>
                 <li><a href="#" class="page_num sel_page">1</a></li>
                 <li><a href="#" class="page_num">2</a></li>
                 <li><a href="#" class="page_num">3</a></li>
                 <li><a href="#" class="page_num">4</a></li>
                 <li><a href="#" class="page_num">5</a></li>
                 <li><a href="#" id="next_page"><i class="fas fa-angle-right"></i></a></li>
                 <li><a href="#" id="last_page"><i class="fas fa-angle-double-right"></i></a></li>
             </ul> -->
        </div>
    </section>
</body>
</html>