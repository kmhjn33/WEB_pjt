<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>CREW 관리자 페이지</title>
  <link rel="stylesheet" href="../css/admin_style_top.css"></link>
  <link rel="stylesheet" href="../css/admin_style.css"></link>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" ></link>
  
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript" src="../api/timeline-2.9.1/timeline.js"></script>
  <link rel="stylesheet" type="text/css" href="../api/timeline-2.9.1/timeline.css"></link>
  
  
  <script type="text/javascript">
  
<%-- 	var u_name=${ session_u_name };
	console.log("user_name" + u_name);
	var u_type=${ session_u_detail_no };
	console.log("user_type" + u_type);
	$("#user_name").val(u_name);
	if(u_type!='0'){
/* 		alert("관리자에게만 접근 권한이 있어요.");
		location.href="/login"; */
	}
	
	function btnLogout(){
		<%
			session.invalidate();
		%>
		location.href="/index";	
	} --%>
  
  
  	function clickCrew(c_no){
  		
  		var url="/admin/crew_detail?c_no=" + c_no;
  		location.href=url;
  	}
  
  	function pageNumClick(page){
  		//alert("요청 페이지 : " + page);
  		var url="/admin/crew_info?page=" + page + "&limit=${nDto.limit}&category=${nDto.category}&searchWord=${nDto.searchWord}&b_no=${nDto.b_no}&cate_main_no=${nDto.cate_main_no}&cate_sub_no=${nDto.cate_sub_no}" ;
  		console.log(url);
  		location.href=url;
  	}
  
  </script>
  
  
  <script type="text/javascript">
  
  	
  
    google.load("visualization", "1");

    // Set callback to run when API is loaded
    google.setOnLoadCallback(drawVisualization);

    //Called when the Visualization API is loaded.
    function drawVisualization() {


    	
      // Create and populate a data table.
      var data = new google.visualization.DataTable();
      data.addColumn('datetime', 'start');
      data.addColumn('datetime', 'end');
      data.addColumn('string', 'content');
	  
      var jdata=('${jlist}');
      jdata=jdata.replaceAll("\'","\"");
      var jobj=JSON.parse(jdata);
      //console.log(jobj);
      
      
      for(var i in jobj){
		      	
		      	//console.log(jobj[i]);  
		      	  
		      	
			var sdate=new Date(jobj[i].c_sdate);
			var ssdate=moment(sdate).format("YYYY/MM/DD HH:MM:SS");
			console.log(sdate);
			var edate=new Date(jobj[i].c_edate);
			var eedate=moment(edate).format("YYYY/MM/DD HH:MM:SS");
			console.log(edate);
		    var title="[" + jobj[i].rnum + "]" + jobj[i].c_title;
			console.log(title);
			var profile='"/upload/' + jobj[i].c_thumbnail + '"';
			console.log(profile); 
			
			var body;
			body='<div class="wrap" style=" width:80px;height:70px;margin:2px auto;padding:2px;border:1px solid #c2c0b8;background-color:#fff;-webkit-box-shadow:0 0 60px 10px rgba(0, 0, 0, .1) inset, 0 5px 0 -4px #fff, 0 5px 0 -3px #c2c0b8, 0 11px 0 -8px #fff, 0 11px 0 -7px #c2c0b8, 0 17px 0 -12px #fff, 0 17px 0 -11px #c2c0b8;-moz-box-shadow:0 0 60px 10px rgba(0, 0, 0, .1) inset, 0 5px 0 -4px #fff, 0 5px 0 -3px #c2c0b8, 0 11px 0 -8px #fff, 0 11px 0 -7px #c2c0b8, 0 17px 0 -12px #fff, 0 17px 0 -11px #c2c0b8;box-shadow:0 0 60px 10px rgba(0, 0, 0, .1) inset, 0 5px 0 -4px #fff, 0 5px 0 -3px #c2c0b8, 0 11px 0 -8px #fff, 0 11px 0 -7px #c2c0b8, 0 17px 0 -12px #fff, 0 17px 0 -11px #c2c0b8;text-align: center;">';
		    body+='<h1 style="font-size: 12px;font-weight: bold;margin-top: 1px;text-shadow: 1px 1px 3px rgba(0,0,0,0.3);">' + title + '</h1>';   
		    body+='<img src=' + profile  + ' onclick="clickCrew(' + jobj[i].c_no + ')" style="width: 55px;height: 55px;margin-top: 0px;">';
		    body+='<a style="text-decoration: none;color: #4A4A4A !important;"></a></div>';
			//data.addRows([[sdate,edate, body ]]);
			data.addRows([[sdate,, body ]]);
	   }
      
      
/*       data.addRows([
        [new Date(2021,11,23), , 'Conversation<br>' +
          '<img src="../img/comments-icon.png" style="width:32px; height:32px;">'],
        [new Date(2021,7,23,23,0,0), , '1차 크루<br>' +
          '<img src="../img/mail-icon.png" style="width:32px; height:32px;">'],
        [new Date(2021,7,24,16,0,0), , '2차 크루'],
        [new Date(2021,7,26), new Date(2010,8,2), '3차 크루'],
        [new Date(2021,7,28), , 'Memo<br>' +
          '<img src="../img/notes-edit-icon.png" style="width:48px; height:48px;">'],
        [new Date(2021,7,29), , '최준현 단독 콘서트<br>' +
          '<img src="../img/Hardware-Mobile-Phone-icon.png" style="width:32px; height:32px;">'],
        [new Date(2021,7,31), new Date(2010,8,3), '팀프로젝트'],
        [new Date(2021,8,4,12,0,0), , '종료<br>' +
          '<img src="../img/attachment-icon.png" style="width:32px; height:32px;">']
      ]); */

      // specify options
      var options = {
        "width":  "100%",
        "height": "120%",
        "style": "box" // optional
      };

      // Instantiate our timeline object.
      var timeline = new links.Timeline(document.getElementById('mytimeline'));

      // Draw our timeline with the created data and options
      timeline.draw(data, options);
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


  <div >
    
    <div style="margin-top:10px;">


		<form action="./crew_info" name="crew" id="crew" method="post">
		
	        <div class="bbsList">
	          <div class="bbsList" style="text-align: left; margin-bottom: 5px;">
	            <span class="txt_small">대분류</span>&nbsp
	            <select class="select_list" id="cate_main_no" name="cate_main_no">
				  <option value="0">전체</option>
	            <c:forEach items="${mlist}" var="mainlist">
	              <option value="${mainlist.cate_main_no}" ${(nDto.cate_main_no==mainlist.cate_main_no)?"selected":""}>${mainlist.cate_main_name}</option>
	            </c:forEach>
	
	            </select>&nbsp
	            <span class="txt_small">소분류</span>&nbsp
	            <select class="select_list" id="cate_sub_no" name="cate_sub_no">
	              <option value="0">전체</option>
	            <c:forEach items="${slist}" var="sublist">
	              <option value="${sublist.cate_sub_no }" ${(nDto.cate_sub_no==sublist.cate_sub_no)?"selected":"" }>${sublist.cate_sub_name }</option>    
	            </c:forEach>
	            </select>&nbsp
	            <span class="txt_small">검색조건</span>&nbsp
	            <select class="select_list" id="category" name="category">
	              <option value="all" ${nDto.category=="all"?"selected":"" }>전체</option>    
	              <option value="c_title"  ${nDto.category=="c_title"?"selected":"" }>제목</option>
	              <option value="c_detail_content"  ${nDto.category=="c_detail_content"?"selected":"" }>내용</option>        
	              <option value="c_addr1"  ${nDto.category=="c_addr1"?"selected":"" }>지역</option>
	            </select>&nbsp
	            <input class="" type="text" id="searchWord" name="searchWord" placeholder="검색어 입력"><img src="/images/search_ico.png" style="margin-left: -20px;height: 10px ; width: 10px;">&nbsp
	            <button type="submit" class=".btn" id="searchBtn" name="searchBtn">조회</button>
	          </div>
	          <div class="bbsList" style="text-align: right; margin-bottom: 5px;margin-top: -25px;">
	            <select class="select_list" name="limit" id="limit" >	            	
		            <option value="10" ${(nDto.limit==10)?"selected":"" }>10개씩 보기</option>    
	                <option value="20" ${(nDto.limit==20)?"selected":"" }>20개씩 보기</option>
	                <option value="30" ${(nDto.limit==30)?"selected":"" }>30개씩 보기</option>
	                <option value="40" ${(nDto.limit==40)?"selected":"" }>40개씩 보기</option>
	            </select>
	          </div>
	        </div>
		<div class="mytimeline" id="mytimeline"  style="margin-bottom: 64px"></div>
		</form>
        <table class="bbsList" summary="리스트"">
              <caption>회원정보</caption>
              
              <colgroup>
              	<col width="10px">
              	<col width="5%">
              	<col width="31%">
              	<col width="10%">
              	<col width="15%">
              	<col width="10%">
              	<col width="12%">
              	<col width="12%">
              </colgroup>
                         
              <thead class="head">
                  <tr>
                      <th><a class="" href="" style="font-size: small;" >진행여부</a></th> 
                      <th>번호</th>
                      <th>제목</th>
                      <th>리더</th>
                      <th>기간</th>
                      <th>최대인원</th>
                      <th>진행</th>
                      <th>참여자</th>
                  </tr>    
              </thead>
              <tbody class="body">
              
              	<c:forEach items="${crewlist}" var="crew">              	
                  <tr id="${crew.c_no}" onclick="clickCrew(${crew.c_no})">
                      <td class=""><a class="checkbox_checked" href="javascript:;" >${crew.c_expose}</a></td>
                      <td class="">${crew.rnum}</td>
                      <td class="" style="text-align: left">${crew.c_title}</td>
                      <td class="">${crew.u_name }</td>
                      <td class="">${crew.c_sdate}</td>
                      <td class="">${crew.c_max}명</td>
                      <td class="">${crew.c_edate}</td>
                      <td class="">${crew.c_count}명</td>
                  </tr>
                  
              	</c:forEach>
              </tbody>
              <tfoot class="foot">
                  <tr>
                      <td colspan="9">
                      	<c:if test="${nDto.page==1 }">
                          <span class="arrow radius-right">≪</span>
                          <span class="arrow radius-left">＜</span>
                      	</c:if>
                      	<c:if test="${nDto.page!=1 }">
                      	  <span class="arrow radius-right" onclick="pageNumClick(${nDto.startPageNum})">≪</span>
                          <span class="arrow radius-left" onclick="pageNumClick(${nDto.page-1})">＜</span>
                      	</c:if>
    
						<c:forEach begin="${nDto.startPageNum}" end="${nDto.endPageNum}" var="pagenum">	
						
							<c:if test="${nDto.page==pagenum}">
                          		<a href="javascript:;" class="num_box">${pagenum}</a>
							</c:if>
							<c:if test="${nDto.page!=pagenum}">
                          		<a href="javascript:;" class="num_box txt_point" onclick="pageNumClick(${pagenum})">${pagenum}</a>
							</c:if>
												
						</c:forEach>
    
    					<c:if test="${nDto.page==nDto.maxPageNum}">
                          <span class="arrow radius-right">＞</span>
                          <span class="arrow radius-left">≫</span>
    					</c:if>
    					
    					<c:if test="${nDto.page!=nDto.maxPageNum }">
    					  <span class="arrow radius-right" onclick="pageNumClick(${nDto.page+1})">＞</span>
                          <span class="arrow radius-left" onclick="pageNumClick(${nDto.endPageNum})">≫</span>
    					</c:if>
    					
                          
                          
                      </td>
                  </tr>    
              </tfoot>
          </table>
        
    </div>
</body>
</html>