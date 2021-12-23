<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원 통계 관리자 페이지</title>
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
  myChart1();	
  function myChart1(){

	$.ajax({
		url:"./user_info/chart1"
		,type:"post"
		//,data:{"nDto":"${nDto}"}
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
			myChartDisp(label,cdata,'myChart1','서비스 이용현황','polarArea');
		}
		,error:function(errmsg){
			alert(errmsg);	
		}
	});
  }

  function myChart2(){

	  $.ajax({
			url:"./user_info/chart2"
			,type:"post"
			//,data:{"nDto":"${nDto}"}
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
				myChartDisp(label,cdata,'myChart2','크루 이용현황','line');
			}
			,error:function(errmsg){
				alert(errmsg);	
			}
		});
  }
  function myChart3(){
	  //alert("myChart2");
	  $.ajax({
			url:"./user_info/chart3"
			,type:"post"
			//,data:{"nDto":"${nDto}"}
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
				myChartDisp(label,cdata,'myChart3','로드맵 이용현황','line');
			}
			,error:function(errmsg){
				alert(errmsg);	
			}
		});
  }
  function myChartDisp(label,cdata,cname,title,linetype){
	//alert("ChartDisp : " + linetype ); 
 	const ctx2 = document.getElementById(cname).getContext('2d');
    const myChart2 = new Chart(ctx2, {
        type: linetype,
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
        <li><a href="/admin/member_stats"><span style="font-weight: 800; color: blue;">회원통계</span></a></li>
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

  
  <div >
    
    <div style="margin-top:10px;">

        <div class="bbsList" style="width: 1080px; height: 50%;">
          <ul id="tabs">
            <li onclick="myChart1()"><a href="#" name="tab1">서비스 이용 현황</a></li>
            <li onclick="myChart2()"><a href="#" name="tab2">크루 이용 현황</a></li>
            <li onclick="myChart3()"><a href="#" name="tab3">로드맵 이용 현황</a></li>   
          </ul>
        
        <div id="content">
            <!-- 로드맵 -->
            <div id="tab1">
              <canvas id="myChart1">
              </canvas>
            </div>
            <!-- 과목별 선택형황 -->
            <div id="tab2">
              <canvas id="myChart2">
              </canvas>
            </div>
            <!-- 과목별 교제 선택현황 -->
            <div id="tab3">
              <canvas id="myChart3">
              </canvas>
            </div>
        </div>


        </div>
        
    </div>
    
  </div>


  </div>
</body>
</html>