<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="../css/crew_view.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/roadmap_common.css">

    <!-- 구글 아이콘 링크 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 헤더 검색바 CSS링크 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    

</head>

<body>
    <header><%@include file="../header_footer/header.jsp" %></header>



<script type="text/javascript">
	function deleteBtn(c_no){
		if ( confirm("정말 삭제하시겠습니까??")){
			//alert("넘어온 c_no 값 :"+c_no);
			//alert("넘어온 u_no 값 :"+u_no);
			location.href="/crew_delete?c_no="+c_no;
			alert("삭제 되었습니다!!");
			history.back();
		}else{
			return false;
		}
	}
	
	function modifyBtn(c_no){
		/* alert("받아온 c_no : "+c_no); */
		/* alert("수정 테스트"); */
		if ( confirm("크루를 수정 하시겠습니까?")){
			location.href="/crew_modify_view?c_no="+c_no;
		}else{
			return false;
		}
	}
</script>
    <section>
        <div class="wrap">
            <div class="t-left">
		        <h2>${crewVo.c_title}</h2>
		        <a href="javascript:history.back()"><span class="material-icons">article</span>목록</a>
		        <c:if test="${crewVo.u_no == session_u_no}">
			        <a onclick="modifyBtn(${crewVo.c_no })" style="cursor: pointer;"><span class="material-icons">edit_note</span>수정</a>
			        <a onclick="deleteBtn(${crewVo.c_no })" style="cursor: pointer;"><span class="material-icons">delete</span>삭제</a>
		        </c:if>
            </div>
        </div>

        <div class="wrap">

            <form action="">
                <div class="main1">

                    <div class="chart">
                    
                        <table class="tab1">

                            <tr>
                                <td class="info">
                                    <span class="material-icons">outlined_flag</span>
                                    <p>신청시작일</p></td>
                                <td>${crewVo.c_apply_sdate}</td>

                            </tr>
                            <tr>
                                <td class="info">
                                    <span class="material-icons">flag</span>
                                    <p>신청종료일</p></td>
                                <td>${crewVo.c_apply_edate}</td>

                            </tr>
                            <tr>
                                <td class="info">
                                    <span class="material-icons">today</span>
                                    <p>시작일</p></td>
                                <td>${crewVo.c_sdate}</td>

                            </tr>
                            <tr>
                                <td class="info">
                                    <span class="material-icons">event</span>
                                    <p>종료일</p></td>
                                <td>${crewVo.c_edate}</td>

                            </tr>
                            <tr>
                                <td class="info">
                                    <span class="material-icons">signpost</span>
                                    <p>참여방법</p></td>
                                <td>${crewVo.c_how}</td>
                            </tr>
                            <tr>
                                <td class="info">
                                    <span class="material-icons">pin_drop</span>
                                    <p>위치</p>
                                </td>
                                <td>${crewVo.c_addr1}</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="3">${crewVo.c_addr2}</td>
                            </tr>
                            <tr>
                                <td class="info">
                                    <span class="material-icons">savings</span>
                                    <p>비용</p>
                                </td>
                                <td>발생</td>
                                <td>${crewVo.c_cost}원</td>

                            </tr>
                            <tr>
                                <td class="info">
                                    <span class="material-icons">group</span>
                                    <p>최대인원</p>
                                </td>
                                <td>인원제한</td>
                                <td>${crewVo.c_max}명</td>

                            </tr>
                            <c:if test="${crewVo.c_filename != null}">
                            
	                            <tr>
	                                <td class="info">
	                                    <span class="material-icons">file_download</span>
	                                    <p>파일다운로드</p>
	                                </td>
	                                <td><a href="/upload/${crewVo.c_filename}" download>${crewVo.c_filename}</a></td>
	                            </tr>
                            </c:if>
                        </table>

                        <table class="tab2">
                            <tr>
                                <td class="hope">
                                    <span class="material-icons">add_reaction</span>
                                    <p>참여신청인원</p></td>
                                <td id="eCount">${entrylistCount}</td>
                            </tr>
                            <tr>
                                <td class="inter">
                                    <span class="material-icons">bookmark</span>
                                    <p>관심있어요</p>
                                </td>
                                <td id="lCount">${likelistCount}</td>
                            </tr>

                            <tr>
                                <td colspan="2" style="z-index: 0; position: relative;">
                                <input type="hidden" id="kakao" value="${crewVo.c_addr1}">
                                    <a href="/map?address1234=${crewVo.c_addr1}&address5678=${crewVo.c_addr2}" target="_blank">
                                        <div id="map" style="width:100%;height:300px;">지도영역</div>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <p class="mod_bt_2">
                            <span class="material-icons">notes</span> 상세 내용
                        </p>
                        <div style="margin-bottom: 300px;">
                            ${crewVo.c_content}
                        </div>

                    </div>

                </div>
            </form>


            <div class="main2">

                <div class="profile">
                	<div class="profile_img_wrap">
                    	<img src="/upload/${userInfoVo.u_profile }" alt="">
					</div>
					<div>
                    <p class="mod_profile_head">
                        <span class="material-icons">alternate_email</span>
                        E-MAIL |
                    </p>
                    <p class="mod_profile_cont">${userInfoVo.u_email }</p>
                    <p class="mod_profile_head">
                        <span class="material-icons">question_answer</span>
                        카카오톡 |
                    </p>
                    <p class="mod_profile_cont">${userInfoVo.u_tel }</p>
                    </div>
                </div>

               <!--  <input type="text" placeholder="로드맵 파일명" spellcheck="false"> 로드맵 파일명 들어오는 박스-->
                
<script type="text/javascript">

	    	var u_no = "${session_u_no}";
	    	var c_no = "${param.c_no}";
    	
    	//참여하고 싶어요
       function entryPlus(){
	    	
            //alert("entryBtn 테스트");
            //alert("세션 아이디 : "+u_no);
            //alert("크루 게시글 번호 : "+c_no);
            
          $.ajax({
            	url:"./hope",
            	type:"post",
            	data:{
            		"u_no":u_no,
            		"c_no":c_no
            	},
            	success:function(data){
            		alert("참여신청이 등록 되었습니다");
            		//alert("c_entry_no : "+data.entryVo.c_entry_no);
            		var chtml="";
            		
            		
            		chtml +="<button onclick='entryMinus("+data.entryVo.c_entry_no+")' class='mod_join_btn entryMinus'>";
            		chtml +="<span class='material-icons'>emoji_people</span>참여신청 취소";
            		chtml +="</button>";
            		
            		
            		$("#hopehopehope").html(chtml);
            		$(".entryMinus").css('background-color','orange');
            		$("#eCount").text(data.eCount);
            	},
            	error:function(){
            		alert("참여 등록 에러");
            	}
            });//a.jax
            
        }////참여하고 싶어요
        
    
    
    //참여 취소
    function entryMinus(c_entry_no){
    	if( confirm("참여신청 취소 하시겠습니까?")){
    		//alert("취소 되었습니다");
    		//alert("취소 c_entry_no : "+c_entry_no);
    	
    		$.ajax({
    			url:"./entryCancle",
    			type:"post",
    			data:{
    				"c_entry_no":c_entry_no
    			},
    			success:function(data){
    				alert("취소 되었습니다");
    				var num = $("#eCount").text();
    				$("#eCount").text(num-1);
    				
    				var chtml="";
    				
    				
    				chtml += "<button onclick='entryPlus()' class='mod_join_btn'>";
    				chtml += "<span class='material-icons'>emoji_people</span>참여신청</button>";
    				
    				
    				$("#hopehopehope").html(chtml);
    			},
    			error:function(){
    				alert("취소 에러");
    			}
    		});//a.jax
    		
    	}//if
    }//참여취소
</script>

<script type="text/javascript">
	var u_no = "${session_u_no}";
	var c_no = "${param.c_no}";
	
	//관심있어요
	function likePlus(){
		//alert("넘어온 세션 넘버 u_no : "+u_no);
		//alert("넘어온 게시글 넘버 c_no : "+c_no);
		
		$.ajax({
			
			url:"./interesting",
			type:"post",
			data:{
				
				"u_no":u_no, //세션 회원 번호
				"c_no":c_no //게시물 번호
				
			},
			success:function(data){
				alert("+관심+ 있어요가 등록 되었습니다");
				//alert("c_like_no : "+data.likeVo.c_like_no);
				
				var chtml = "";
				
				chtml += "<button onclick='likeMinus("+data.likeVo.c_like_no+")' class='mod_like_btn likeMinus'>";
        		chtml += "<span class='material-icons'>bookmark_add</span>관심있어요 취소</button>";
        		
        		$("#likelikelike").html(chtml);
        		$(".likeMinus").css('background-color','orange');
        		$("#lCount").text(data.lCount);
        		
			},
			error:function(){
				alert("에러");
			}
			
		}); //ajax
	}//관심있어요
	
	//관심있어요 취소
	function likeMinus(c_like_no){
		if ( confirm("관심 취소 하시겠습니까?")){
			
			$.ajax({
				
				url:"./likeCancle",
				type:"post",
				data:{
					"c_like_no":c_like_no
				},
				success:function(data){
					alert("+관심+ 취소되었습니다");
					var num = $("#lCount").text();
					$("#lCount").text(num-1);
					
					var chtml = "";
    				
    				chtml += "<button onclick='likePlus()' class='mod_like_btn'>";
    				chtml += "<span class='material-icons'>bookmark_add</span>관심있어요</button>";

    				$("#likelikelike").html(chtml);
					
				},
				error:function(){
					alert("에러");
				}
				
			});//ajax
		}//if
	}//관심있어요 취소
	
</script>

	                <div class="main2-btn">
		                    <%-- 
		                    <<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							--%>
							<%-- 오늘 날짜 : <c:out value="${today}"/> 오늘 날짜 테스트 --%>
		                	
		                	<!-- <button id="modal" class="mod_rmap_btn">로드맵 보기</button> 로드맵 버튼-->
		                
		                <%-- <c:if test="${crewVo.c_sdate >= today}">  시작일이 지나면 관심, 참여 버튼 안보이게--%>
		                  <c:if test="${crewVo.u_no != session_u_no}">
			                <div id="hopehopehope">
								<c:if test="${crewEntryVo == null}">
									
				                    <button onclick='entryPlus()' class="mod_join_btn">
				                        <span class="material-icons">emoji_people</span>참여신청
				                    </button>
								</c:if>
				                    
								<c:if test="${crewEntryVo != null}">
				                    <button onclick='entryMinus(${crewEntryVo.c_entry_no})' class="mod_join_btn" style="background-color: orange">
				                        <span class="material-icons">emoji_people</span>참여신청 취소
				                    </button>
								</c:if>
			                </div>
			                
			                <div id="likelikelike">
			                	<c:if test="${crewLikeVo == null}">
				                    <button onclick='likePlus()' class="mod_like_btn">
				                        <span class="material-icons">bookmark_add</span>관심있어요
				                    </button>
			                	</c:if>
			                	
			                	<c:if test="${crewLikeVo != null}">
			                		<button onclick='likeMinus(${crewLikeVo.c_like_no})' class='mod_like_btn' style="background-color: orange">
				                        <span class='material-icons'>bookmark_add</span>관심있어요 취소
				                    </button>
			                	</c:if>
			                </div>
		               		</c:if>
		                <%-- </c:if> --%>
		                
		                <c:if test="${crewVo.u_no == session_u_no}">
		                	<button id='modalOpen' class="mod_like_btn" style="background-color: #80f380">
		                        <span class="material-icons">people_alt</span>참여신청인원보기
		                    </button>
		                </c:if>
		                
	                </div>
	                

            </div>
<script type="text/javascript">
	$(function(){
		$("#modalOpen").click(function(){
			$("#entryModal").show();
		});
		
		$("#modalClose").click(function(){
			$("#entryModal").hide();
		});
	});
</script>
            <div id="entryModal" style="display: none;">
            	<div id="entryModal_content">
            		<div id="modal-top">
            			<p>참여 신청 인원 보기</p>
            		</div>
            		<table id="t1t1t1">
            			<tr>
            				<th>참여 신청 인원</th>
            				<td>총 ${entrylistCount} 명</td>
            			</tr>
            		</table>
            		<table id="t2t2t2">
            			<tr>
            				<th style="width: 50px;">아이디</th>
            				<th style="width: 80px;">닉네임</th>
            				<th style="width: 150px;">이메일</th>
            				<th style="width: 150px;">전화번호</th>
            			</tr>
            			<c:forEach items="${modalList }" var="userList">
	            			<tr>
	            				<td>${userList.u_id }</td>
	            				<td>${userList.u_nickName }</td>
	            				<td>${userList.u_email }</td>
	            				<td>${userList.u_tel }</td>
	            			</tr>
            			</c:forEach>
            			
            		</table>
            		<button id='modalClose' class="okokokBtn">확인</button>
            		
            	</div>
            </div>
            
            
        </div>

    </section>
    
        <!-- 지도 API / 스프링 서버 돌려야 나타남 / 미리보기 페이지라 지도 이동 및 축소 확대 안되게 해 놓음 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	0836b3621524a62fd763c179a187beba&libraries=services"></script>
<script>
	var address1234 = $("#kakao").val();

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다   
	var map = new kakao.maps.Map(mapContainer,
			mapOption);

	// 마우스 드래그로 지도 이동 가능여부를 설정합니다
	map.setDraggable(false);
	// 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
	map.setZoomable(false);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					address1234,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(
									result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker(
									{
										map : map,
										position : coords
									});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">크루</div>'
									});
							infowindow
									.open(map,
											marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map
									.setCenter(coords);
						}
					});
</script>
<!-- 지도 API-------------------------------------------------------------------------------------------- -->
    
</body>

</html>