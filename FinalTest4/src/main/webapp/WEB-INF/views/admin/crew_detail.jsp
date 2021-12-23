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

    <link rel="stylesheet" href="../css/admin_crew_view.css">
  	<link rel="stylesheet" href="../css/admin_style_top.css"></link>
    <!-- 구글 아이콘 링크 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 헤더 검색바 CSS링크 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript">
<%-- 		var u_name='<%=(String)session.getAttribute("session_u_name")%>';
		console.log("user_name" + u_name);
		var u_type='<%=(String)session.getAttribute("session_u_detail_no")%>';
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
        <li><a href="/admin/board_info">게시판</a></li>
        <li><a>|</a></li>
        <li><a href="/admin/member_stats">회원통계</a></li>
        <li><a>|</a></li>
        <li><a href="/admin/crew_info"><span style="font-weight: 800; color: blue;">CREW 현황</span></a></li>
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


  <div class="wrap">

      <form action="">
          <div class="main1">
     <div class="wrap">
     	
         <div class="t-left">
   			<h2>${cDto.c_title}</h2>
         </div>
         <div style="float: right;margin-right:40px; ">
   			<a href="javascript:history.back()"><span class="material-icons">article</span>목록</a>			            
         </div>
     </div>
     <div class="chart">
     
         <table class="tab1">

             <tr>
                 <td class="info">
                     <span class="material-icons">outlined_flag</span>
                     <p>신청시작일</p></td>
                 <td>${cDto.c_apply_sdate}</td>

             </tr>
             <tr>
                 <td class="info">
                     <span class="material-icons">flag</span>
                     <p>신청종료일</p></td>
                 <td>${cDto.c_apply_edate}</td>

             </tr>
             <tr>
                 <td class="info">
                     <span class="material-icons">today</span>
                     <p>시작일</p></td>
                 <td>${cDto.c_sdate}</td>

             </tr>
             <tr>
                 <td class="info">
                     <span class="material-icons">event</span>
                     <p>종료일</p></td>
                 <td>${cDto.c_edate}</td>

             </tr>
             <tr>
                 <td class="info">
                     <span class="material-icons">signpost</span>
                     <p>참여방법</p></td>
                 <td>${cDto.c_how}</td>
             </tr>
             <tr>
                 <td class="info">
                     <span class="material-icons">pin_drop</span>
                     <p>위치</p>
                 </td>
                 <td>${cDto.c_addr1}</td>
             </tr>
             <tr>
                 <td></td>
                 <td colspan="3">${cDto.c_addr2}</td>
             </tr>
             <tr>
                 <td class="info">
                     <span class="material-icons">savings</span>
                     <p>비용</p>
                 </td>
                 <td>발생</td>
                 <td>${cDto.c_cost}원</td>

             </tr>
             <tr>
                 <td class="info">
                     <span class="material-icons">group</span>
                     <p>최대인원</p>
                 </td>
                 <td>인원제한</td>
                 <td>${cDto.c_max}명</td>

             </tr>
             <c:if test="${cDto.c_filename != null}">
             
              <tr>
                  <td class="info">
                      <span class="material-icons">file_download</span>
                      <p>다운로드</p>
                  </td>
                  <td><a href="/upload/${cDto.c_filename}" download>${cDto.c_filename}</a></td>
                  
              </tr>
              <tr>
              	<td>
              		<span class="material-icons">image</span>
              		<span>미리보기</span>
              	</td>
              	<td><img alt="" src="/upload/${cDto.c_filename}" style="width: 300px; height: 250px"></td>
              </tr>
              
             </c:if>
         </table>

         <table class="tab2">
             <tr>
                 <td colspan="2">
                 <input type="hidden" id="kakao" value="${cDto.c_addr1}">
                     <a href="/map?address1234=${cDto.c_addr1}&address5678=${cDto.c_addr2}" target="_blank">
                         <div id="map" style="width:100%;height:300px;">지도영역</div>
                     </a>
                 </td>

             </tr>
         </table>
         <p class="mod_bt_2">
             <span class="material-icons">notes</span> 상세 내용
         </p>
         <div style="margin-bottom: 300px;">
             ${cDto.c_content}
         </div>

     </div>

          </div>
      </form>
              
      </div>
	<!-- 지도 API / 스프링 서버 돌려야 나타남 / 미리보기 페이지라 지도 이동 및 축소 확대 안되게 해 놓음 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	0836b3621524a62fd763c179a187beba&libraries=services"></script>
	<script>
	
		var address1234 = $("#kakao").val();
		console.log($("#kakao").val());
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(	33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer,mapOption);
		// 마우스 드래그로 지도 이동 가능여부를 설정합니다
		map.setDraggable(false);
		// 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
		map.setZoomable(false);
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address1234,
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
								infowindow.open(map,marker);
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
	<!-- 지도 API-------------------------------------------------------------------------------------------- -->

</body>

</html>