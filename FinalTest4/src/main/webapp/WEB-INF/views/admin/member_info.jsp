<%@page import="javax.servlet.jsp.tagext.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>회원 관리자 페이지</title>
		<link rel="stylesheet" href="../css/admin_style_top.css"/>
		<link rel="stylesheet" href="../css/admin_style.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- <%

	session.setAttribute("session_u_name","kslee");
	session.setAttribute("session_u_detail_no","0");

%> --%>
				
		<script type="text/javascript">

<%-- 			var u_name=${ session_u_name };
			console.log("user_name" + u_name);
			var u_type=${ session_u_detail_no };
			console.log("user_type" + u_type);
			$("#user_name").val(u_name);
			if(u_type!='0'){
/* 				alert("관리자에게만 접근 권한이 있어요.");
				location.href="/login"; */
			}
			
			function btnLogout(){
				<%
					session.invalidate();
				%>
				location.href="/index";	
			} --%>
			
			
			var lastpage='';
			function btnSearch(){
				//alert("조회버튼 클릭");
				
				var searchWord = $("#searchWord").val();
				var limit=$("#limit").val();
				var category=$("#category").val();
				console.log("searchWord - " + searchWord);
				console.log("limit - " + limit);
				var url = "./member_info?page=${nDto.maxPageNum}&category=" + category + "&searchWord=" + searchWord + "&limit=" +limit ;
				console.log(url);
				location.href=url;
			}
			
			
			
			function search_user_info(rnum,u_no){
				//alert("user 정보 검색이 요청되었습니다.");
 				//var u_noint = Number(u_no);
				//alert("rnum :" + typeof rnum + " u_id : " + typeof u_no );
				
				
 				$.ajax({
					url:"./user_info",
					data:{
						"rnum":rnum,
						"u_no":u_no
						},
					dataType:"json",
					contentType:"application/json; charset=utf-8;",
					success:function(data){
						//alert("성공");
						//console.log(data);
						//alert(data.rnum);
						selectlist(data);
						
					},
					error:function(err){
						alert("실패" + err);
					}
				});	 	
			}
			
			
			function selectlist(data){
				
				try{
	           		if(lastpage!=""){
	           			//alert("lastpage : " + lastpage);
	           			$("#" + lastpage).fadeOut(3000);
	           			$("#" + lastpage).remove();
	           		}
	           		lastpage=data.rnum.toString() + data.u_no.toString() ;
					var dhtml="";
		            dhtml+="<tr class=\"bbsListSelect\"  id=\"" + data.rnum + data.u_no  +  "\">";
		           	dhtml+="<td colspan=\"2\">상세정보</td>";
		           	dhtml+="<td>신고함 | " + data.reported + " 건</td>";
		           	dhtml+="<td>게시물 | " + data.board + " 건</td>";
		           	dhtml+="<td>참여 CREW | " + data.crew + " 건</td>";
		           	dhtml+="<td>진행 로드맵 | " + data.roadmap + "건</td>";
		           	dhtml+="<td>";
		           		dhtml+="<input class=\"textbox\" type=\"text\" placeholder=\"쪽지보내기\" >&nbsp<img class=\"btn_icon\" src=\"/images/ico01.png\" >";
		           		dhtml+="</td>";
	           			dhtml+="<td><button class=\"btn_small\" onclick=\"member_out(" + data.rnum + ',' + data.u_no  + ")\">회원탈퇴</button>&nbsp<button class=\"btn_small\" onclick=\"close_info(" + lastpage + ")\">CLOSE</button></td>";  
	           		dhtml+="</tr>";
	           		console.log(lastpage);
	           		//console.log(ohtml);
	           		//console.log(dhtml);			           		
	           		$("#"+data.rnum).after(dhtml);
				}catch(error){
					alert(error);
				}
				
			}
			
			function member_out(rnum,u_no){
				
				if(confirm("선택회원을 탈퇴처리 하시겠습니까?")){
					
					$.ajax({
						url:"./user_info/out"
						,type:"post"
						,data:{
							"u_no":u_no	
						}
						,success:function(data){
							if(data="y"){
								$("#" + lastpage).fadeOut(1000);
								$("#" + lastpage).remove();
								$("#" + rnum).fadeOut(1000);
								$("#" + rnum).remove();
							}else{
								alert("탈퇴 처리 중 오류가 발생하였습니다.")
							}	
						}
						,error:function(errmsg){
							alert(errmsg);
						}
					});
					
					
				}
			}
			
			function close_info(id){
				$("#" + id).fadeOut(1000);
				$("#" + id).remove();
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
		        <li class="appearance icons"><a href="/admin/member_info"><span style="font-weight: 800;color: blue;">회원정보</span> </a></li>
		        <li><a>|</a></li>
		        <li><a href="/admin/board_info">게시판</a></li>
		        <li><a>|</a></li>
		        <li><a href="/admin/member_stats">회원통계</a></li>
		        <li><a>|</a></li>
		        <li><a href="/admin/crew_info">CREW 현황</a></li>
		        <li><a>|</a></li>
		        <li><a href="/admin/roadmap_info">로드맵 현황</a></li>
		        <li><a>|</a></li>
		        <li>
		        	<!-- <label style="color:white;">사용자 :</label>&nbsp<label></label>&nbsp -->
			        <button type="button" class=".btn" style="margin-top:-3px;" id="searchBtn" name="searchBtn" onclick="btnLogout()">로그 아웃</button>
		       	</li>
		      </ul>
		    </div>
		  </nav>
		
		  <div >
		    <div style="margin-top:10px;">
				<form action="/admin/member_info" id="member" name="member" method="post">
			        <div class="bbsList ">
			          <div class="bbsList" style="text-align: left; margin-bottom: 5px;">
			            <select class="select_list" id="category" name="category">
			              <option value="all" ${(nDto.category=="all")?"selected":"" }>전체</option>    
			              <option value="u_id" ${(nDto.category=="u_id")?"selected":"" }>회원ID</option>    
			              <option value="u_name" ${(nDto.category=="u_name")?"selected":"" } >회원명</option>
			            </select>&nbsp
			            <input class="" type="text" id="searchWord" name="searchWord" placeholder="검색어 입력"><img src="/images/search_ico.png" style="margin-left: -20px;height: 10px ; width: 10px;">&nbsp
			            <button type="button" class=".btn" id="searchBtn" name="searchBtn" onclick="btnSearch()">조회</button>
			          </div>
			          <div class="bbsList" style="text-align: right; margin-bottom: 5px;margin-top: -25px;">
			            <select class="select_list" name="limit" id="limit">
			                <option value="10" ${(nDto.limit==10)?"selected":"" }>10개씩 보기</option>    
			                <option value="20" ${(nDto.limit==20)?"selected":"" }>20개씩 보기</option>
			                <option value="30" ${(nDto.limit==30)?"selected":"" }>30개씩 보기</option>
			                <option value="40" ${(nDto.limit==40)?"selected":"" }>40개씩 보기</option>
			            </select>
			          </div>
			        </div>
		        </form>
		        
		        <table class="bbsList" summary="리스트">
		              <caption>회원정보</caption>           
		              <thead class="head">
		                  <tr>
		                      <th><a class="checkbox" href="" ></a></th> 
		                      <th>번호</th>
		                      <th>아이디</th>   
		                      <th>회원명</th>
		                      <th>이메일</th>
		                      <th>닉네임</th>
		                      <th>회원가입일</th>
		                      <th>최종접속일</th>
		                  </tr>    
		              </thead>
		              <tbody class="body">
		              <c:forEach items="${list}" var="mDto">
		                  <tr id="${mDto.rnum}" onclick="search_user_info(${mDto.rnum},${mDto.u_no})">
		                  	<c:if test="${mDto.u_detail_no==1}">
		                  		 <td class=""><a class="checkbox_checked" href="javascript:;">✓</a></td>
		                  	</c:if>
		                  	<c:if test="${mDto.u_detail_no!=1}">
		                  		 <td class=""><a class="checkbox_checked" href="javascript:;"></a></td>
		                  	</c:if>
		                      <td class=""><span>${mDto.rnum}</span></td>
		                      <td class=""><span>${mDto.u_id}</span></td>
		                      <td class=""><span>${mDto.u_name}</span></td>
		                      <td class=""><span>${mDto.u_email}</span></td>
		                      <td class=""><span>${mDto.u_nickname}</span></td>
		                      <td class=""><span>${mDto.u_signdate}</span></td>
		                      <td class=""><span>${mDto.u_finaldate}</span></td>
		                  </tr>
		              </c:forEach>
		
<!-- 		                  <tr class="bbsListSelect"  >
		                    <td colspan="2">상세정보</td>
		                    <td>신고함 | 3건</td>
		                    <td>게시물 | 15건</td>
		                    <td>참여 CREW | 3건</td>
		                    <td>참여 로드맵 | 56건</td>
		                    <td>
		                      <input class="textbox" type="text" >&nbsp<img class="btn_icon" src="/images/ico01.png" >
		                    </td>
		                    <td><button class="btn_small">회원탈퇴</button>&nbsp<button class="btn_small">CLOSE</button></td>  
		                  </tr> -->
		                  
		                </tbody>
		               
		               
		              <tfoot class="foot">
		                  <tr>
		                      <td colspan="9">
		                      
		                        <c:if test="${nDto.startPageNum== nDto.page}">
		                        	<a href="./member_info?page=${nDto.startPageNum}&category=${nDto.category}&searchWord=${nDto.searchWord}&limit=${nDto.limit}"><span class="arrow radius-right">≪</span></a>
		                        	<a href=""><span class="arrow radius-left">＜</span></a>
		                        </c:if>
		                        
		                        <c:if test="${nDto.startPageNum != nDto.page}">
		                        	<a href="./member_info?page=${nDto.startPageNum}&category=${nDto.category}&searchWord=${nDto.searchWord}&limit=${nDto.limit}"><span class="arrow radius-right">≪</span></a>
		                        	<a href="./member_info?page=${nDto.page - 1}&category=${nDto.category}&searchWord=${nDto.searchWord}&limit=${nDto.limit}"><span class="arrow radius-left">＜</span></a>
		                        </c:if>
		                          
		                        <c:forEach begin="${nDto.startPageNum }" var="pagenum" end="${nDto.endPageNum}">
		                        	<c:if test="${nDto.page==pagenum}">
			                        	<a class="num_box">${pagenum}</a>
		                        	</c:if> 
		                        	<c:if test="${nDto.page!=pagenum}">
		                        		<a href="./member_info?page=${pagenum}&category=${nDto.category}&searchWord=${nDto.searchWord}&limit=${nDto.limit}" class="num_box txt_point ">${pagenum}</a>
		                        	</c:if>                       
		                        </c:forEach>
		    					<c:if test="${nDto.page==nDto.maxPageNum}">
		                          <span class="arrow radius-right">＞</span>
		                          <a href="./member_info?page=${nDto.maxPageNum}&category=${nDto.category}&searchWord=${nDto.searchWord}&limit=${nDto.limit}"><span class="arrow radius-left">≫</span></a>    					
		    					</c:if>
		    					<c:if test="${nDto.page != nDto.maxPageNum}">
		                          <a href="./member_info?page=${nDto.page + 1}&category=${nDto.category}&searchWord=${nDto.searchWord}&limit=${nDto.limit}"><span class="arrow radius-right">＞</span></a>
		                          <a href="./member_info?page=${nDto.maxPageNum}&category=${nDto.category}&searchWord=${nDto.searchWord}&limit=${nDto.limit}"><span class="arrow radius-left">≫</span></a>    					
		    					</c:if>
		                      </td>
		                  </tr>    
		              </tfoot>
		          </table>
		    </div>
		    
		  </div>
		
		
		  </div>
	</body>
</html>