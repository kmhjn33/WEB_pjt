<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로드맵 관리자 페이지</title>
<link rel="stylesheet" href="../css/admin_style_top.css"/>
<link rel="stylesheet" href="../css/admin_style_tab.css"/>
<link rel="stylesheet" href="../css/admin_style.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<!-- 챠트 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/package.json"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script>
 
  $(document).ready(function() {
	  
      $("#content").find("[id^='tab']").hide(); // Hide all content
      $("#tabs li:first").attr("id","current"); // Activate the first tab
      $("#content #tab1").fadeIn(); // Show first tab's content
      
      $('#tabs a').click(function(e) {
          e.preventDefault();
          if ($(this).closest("li").attr("id") == "current"){ //detection for current tab
          return;       
          }
          else{             
            $("#content").find("[id^='tab']").hide(); // Hide all content
            $("#tabs li").attr("id",""); //Reset id's
            $(this).parent().attr("id","current"); // Activate this
            $('#' + $(this).attr('name')).fadeIn(); // Show content for the current tab
          }
      });
  });
  
</script>

<script type="text/javascript">
	
<%-- 	var u_name='<%=(String)session.getAttribute("session_u_name")%>';
	console.log("user_name" + u_name);
	var u_type='<%=(String)session.getAttribute("session_u_detail_no")%>';
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
	
	function pageNumClick(page){
		
		//alert( page + " 번 페이지 요청입니다.");
	}

</script>
<script text="text/javascript">

  function myChart(){

	$.ajax({
		url:"./roadmap_info/chart1"
		,type:"post"
		,data:{"nDto":"${nDto}"}
		,dataType:"json"
		,contentType:"application/json;charset=utf-8;"
		,success:function(data){
			//alert(data);
			var label=[];
			var cdata=[]; 
			for(var x in data){
				label.push(data[x].name);
				cdata.push(data[x].value);
			}
			myChartDisp(label,cdata,'myChart','과목별 로드맵')
		}
		,error:function(errmsg){
			alert(errmsg);	
		}
	});
  }
  
  function myChart2(){
	  //alert("myChart2");
	  $.ajax({
			url:"./roadmap_info/chart2"
			,type:"post"
			,data:{"nDto":"${nDto}"}
			,dataType:"json"
			,contentType:"application/json;charset=utf-8;"
			,success:function(data){
				//alert(data);
				var label=[];
				var cdata=[]; 
				for(var x in data){
					label.push(data[x].name);
					cdata.push(data[x].value);
				}
				myChartDisp(label,cdata,'myChart2','교재 사용 현황')
			}
			,error:function(errmsg){
				alert(errmsg);	
			}
		});
  }
  function myChartDisp(label,cdata,name,title){
	  
 	const ctx = document.getElementById(name).getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: label,
            datasets: [{
                label: title,
                data: cdata,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
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
        <li><a href="/admin/board_info">게시판</a></li>
        <li><a>|</a></li>
        <li><a href="/admin/member_stats">회원통계</a></li>
        <li><a>|</a></li>
        <li><a href="/admin/crew_info">CREW 현황</a></li>
        <li><a>|</a></li>
        <li><a href="/admin/roadmap_info"><span style="font-weight: 800; color: blue;">로드맵 현황</span></a></li>
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

        <form action="./roadmap_info"  id="loadmap_info" method="post">

            <div class="bbsList"">
              <div class="bbsList" style="text-align: left; margin-bottom: 5px ;">
                <span class="txt_small">검색조건</span>&nbsp               	 
                <input class=""  type="date" id="r_detail_startdate" name="r_detail_startdate" value="${nDto.r_detail_startdate}" style="width: 120px;" >&nbsp
                <input class=""  type="date" id="r_detail_enddate" name="r_detail_enddate" value="${nDto.r_detail_enddate}"  style="width: 120px;">&nbsp
             	<script type="text/javascript">
					
					if ("${nDto.r_detail_startdate}==null"){		
						$("#r_detail_startdate").val(new Date().toISOString().slice(0, 10));
					}
					if ("${nDto.r_detail_enddate==null}" ){
						$("#r_detail_enddate").val(new Date().toISOString().slice(0, 10));

					}
             	</script>
                <span class="txt_small">분류</span>&nbsp
                <select class="select_list" id="cate_sub_no" name="cate_sub_no">
                  <option value="0">전체</option>
                  <c:forEach items="${clist}" var="cate">
                  	<option value="${cate.cate_sub_no}">${cate.cate_sub_name }</option> 
                  </c:forEach>    
                </select>&nbsp
                <span class="txt_small">과목</span>&nbsp
                <select class="select_list" id="s_no" name="s_no">
                  <option value="0">전체</option>
                  <c:forEach items="${slist }" var="subject">
	                  <option value="${subject.s_no}">${subject.s_name}</option> 
                  </c:forEach>    
                </select>&nbsp
                <span class="txt_small">검색조건</span>&nbsp
                <select class="select_list" id="category" name="category">
                  <option value="all">전체</option>    
                  <option value="u_id">회원명/회원ID</option> 
                </select>&nbsp
                <input class="" type="text" id="searchWord" placeholder="검색어 입력"><img src="/images/search_ico.png" style="margin-left: -20px;height: 10px ; width: 10px;">&nbsp
                <button type="submit" class=".btn" id="searchBtn" name="searchBtn">조회</button>
              </div>
              <div class="bbsList" style="text-align: right; margin-bottom: 5px;margin-top: -25px;">
                <select class="select_list"  id="limit" name="limit">
                    <option value="10" ${(nDto.limit == 10)?"selected":"" }>10개씩 보기</option>    
                    <option value="20" ${(nDto.limit == 20)?"selected":"" }>20개씩 보기</option>
                    <option value="30" ${(nDto.limit == 30)?"selected":"" }>30개씩 보기</option>
                    <option value="40" ${(nDto.limit == 40)?"selected":"" }>40개씩 보기</option>
                </select>
              </div>
            </div>

        </form>



        <div class="bbsList" style="width: 1080px; height: 50%;">
          <ul id="tabs">
            <li><a href="#" name="tab1">로드맵</a></li>
            <li onclick="myChart()"><a href="#" name="tab2">과목별 로드맵</a></li>
            <li onclick="myChart2()"><a href="#" name="tab3">선택 교제 현황</a></li>
<!--             <li><a href="#" name="tab4">로드맵 전체 진행현황</a></li>
            <li><a href="#" name="tab5">회원 참가 현황</a></li>    -->
          </ul>
        
        <div id="content">
            <!-- 로드맵 -->
            <div id="tab1">
              <div class="bbsList"">
                <table class="loadmapList" summary="리스트">
                  
                  <colgroup>
                    <col style="width: 5%; "></col>
                    <col style="width: 10%;"></col>
                    <col style="width: 20%; text-align:left; "></col>
                    <col style="width: 20%;"></col>
                    <col style="width: 10%;"></col>
                    <col style="width: 10%;"></col>
                    <col style="width: 25%;"></col>
                    
                    
                  </colgroup>
                  <thead class="head">
                      <tr>
                          <th>번호</th>
                          <th>분류</th>   
                          <th>로드맵 정보</th>   
                          <th>단계</th>
                          <th>회원명</th>
                          <th>진행 로드맵</th>
                          <th>진행</th>
                      </tr>    
                  </thead>
                  <tbody class="body">
                  	<c:forEach items="${rlist }"  var="detail">
	                      <tr id="${detail.r_detail_no }">
	                          <td class="">${detail.rnum }</td>
	                          <td class="">${detail.cate_sub_name }</td>
	                          <td class="" style="text-align: left;">${detail.r_detail_title }</td>
	                          <td class="" style="text-align: left;">${detail.r_detail_grade}</td>
	                          <td class="">${detail.u_name}</td>
	                          <td class="">${detail.r_count}건</td>
	                          <td class="">${detail.r_detail_startdate} ~ ${detail.r_detail_enddate}</td>
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
            </div>
            <!-- 과목별 선택형황 -->
            <div id="tab2">
              <canvas id="myChart">
              </canvas>
            </div>
            <!-- 과목별 교제 선택현황 -->
            <div id="tab3">
              <canvas id="myChart2">
              </canvas>
            </div>
<%--             <!-- 로드맵 타입별 진행율 -->
            <div id="tab4">
              <canvas id="myChart3">
              </canvas>
            </div>
            <!-- 카테고리별 구성 현황 -->
            <div id="tab5">
              <canvas id="myChart4">
              </canvas>
            </div> --%>
        </div>


        </div>
        
    </div>
    
  </div>


  </div>
</body>
</html>