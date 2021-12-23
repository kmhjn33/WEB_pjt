<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>주소로 지도 보기</title>

</head>

<body>

    <div id="map" style="width:100%;height:700px;"></div>
    <br><br>
    <label>해당주소 : </label><br>
    <input type="text" id="addr1" style="width: 250px" readonly="readonly" value="${address1234 }"><br>
    <label>상세주소 : </label><br>
    <input type="text" id="addr2" style="width: 300px" readonly="readonly" value="${address5678 }"><br><br>
    <!-- <button onclick="javascript:history.back()">페이지로 돌아가기</button> -->

    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	0836b3621524a62fd763c179a187beba&libraries=services"></script>
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>

		var address1234 = $("#addr1").val();
    
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(address1234, function (result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">크루</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });
    </script>
</body>

</html>