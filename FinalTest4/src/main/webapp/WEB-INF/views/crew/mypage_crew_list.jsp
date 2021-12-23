<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<link rel="stylesheet" href="../css/mypage_crew_list.css">
    <link rel="stylesheet" href="../css/roadmap_common.css">
    <link rel="stylesheet" href="../css/header.css">

    <!-- 구글 아이콘 링크 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 헤더 검색바 CSS링크 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script type="text/javascript">

    function getCount(no){
        //alert("테스트");
        //alert("회원 넘버 : "+${session_u_no});
        var u_no = "${session_u_no}";
        var num = no;
        //alert("버튼의 값 : "+num);

        $.ajax({
           url:"./changeCrewList",
           type:"post",
           dataType:"json",
           data:{
              "u_no":u_no,
              "num":num
           },
           success:function(data){
              //alert("성공");
              //for (var i = 0 in data)
              //alert("changeList : "+JSON.stringify(data[i].c_no));
              
              var chtml = "";
              for (var i = 0 in data){
                 if (data[i].c_expose == 'N'){
                    
                    chtml+= " <div class='listbox' style='background-color: orange'>";
                    chtml+= " <input type='hidden' value='"+data[i].u_no+"'>";
                    chtml+= "<div class='box3'><span class='material-icons'>date_range</span>"+data[i].c_sdate+" ~ "+data[i].c_edate+"</div>";
                    chtml+= "<div class='box4'>"+data[i].c_title+"</div>";
                    chtml+= "<div class='box7'><a href='./crew_view?c_no="+data[i].c_no+"&u_no=${session_u_no}'><input type='button' class='button' value='크루보기'></a></div>";
                    chtml+= "</div>";
                 }else{
                    chtml+= " <div class='listbox'>";
                    chtml+= " <input type='hidden' value='"+data[i].u_no+"'>";
                    chtml+= "<div class='box3'><span class='material-icons'>date_range</span>"+data[i].c_sdate+" ~ "+data[i].c_edate+"</div>";
                    chtml+= "<div class='box4'>"+data[i].c_title+"</div>";
                    chtml+= "<div class='box7'><a href='./crew_board?c_no="+data[i].c_no+"'><input type='button' class='button' value='크루보기'></a></div>";
                    chtml+= "</div>";
                 }
              }
              $("#down").html(chtml);
              //alert(data.length);
              
              if (num ==1){$("#lineboxup").text("관심있어요");}
               else if (num ==2){$("#lineboxup").text("참여희망 크루");}
               else if (num ==3){$("#lineboxup").text("진행중");}
               else if (num ==4){$("#lineboxup").text("완료");}
               else if (num ==5){$("#lineboxup").text("임시 저장");}
               else if (num ==6){$("#lineboxup").text("모집중");}
               else if (num ==7){$("#lineboxup").text("시작 대기");}
               else if (num ==8){$("#lineboxup").text("내가 만든 크루");}
              
              $("#lineboxdown").text("총 "+data.length+" 개");
              
           },
           error:function(){
              alrt("에러");
           }
        });
     }
    </script>

</head>

<body>
    <header><%@include file="../header_footer/header.jsp" %></header>

    <section>
        <div class="wrap">
        <h2>내 크루관리</h2>
            <div class="up">
                <div class="u-left">
                    <div class="countbox">
                        <div class="box1"><a href="javascript:getCount(1)">${likeListCount}</a></div>
                        <div class="box2"><p>관심있어요</p></div>
                    </div>
                    <div class="countbox">
                        <div class="box1"><a href="javascript:getCount(2)">${entryListCount}</a></div>
                        <div class="box2"><p>참여희망</p></div>
                    </div>
                    <div class="countbox">
                        <div class="box1"><a href="javascript:getCount(3)">${ingListCount}</a></div>
                        <div class="box2"><p>진행중</p></div>
                    </div>
                    <div class="countbox">
                        <div class="box1"><a href="javascript:getCount(4)">${endListCount}</a></div>
                        <div class="box2"><p>완료</p></div>
                    </div>
                </div>
                <div class="u-right">
                    <div class="countbox" id="imsi">
                        <div class="box1"><a href="javascript:getCount(5)">${NlistCount}</a></div>
                        <div class="box2"><p>임시저장</p></div>
                    </div>
                    <div class="countbox">
                        <div class="box1"><a href="javascript:getCount(6)">${recruitList}</a></div>
                        <div class="box2"><p>모집중</p></div>
                    </div>
                    <div class="countbox">
                        <div class="box1"><a href="javascript:getCount(7)">${readyList}</a></div>
                        <div class="box2"><p>시작대기</p></div>
                    </div>
                    <div class="countbox">
                        <div class="box1"><a href="javascript:getCount(8)">${listCount}</a></div>
                        <div class="box2"><p>내가만든크루</p></div>
                    </div>
                </div>
            </div>
            
            <hr>
            <div id="">
	            <div class="linebox">
	            	<div id="lineboxup">
	            		내가 만든 크루
	            	</div>
	            	<div id="lineboxdown">
		            	총 ${listCount} 개
	            	</div>
	            </div>
<!-- <script type="text/javascript">
	function deleteBtn(c_no,u_no){
		if ( confirm("정말 삭제하시겠습니까??")){
			//alert("넘어온 c_no 값 :"+c_no);
			//alert("넘어온 u_no 값 :"+u_no);
			alert("삭제 되었습니다");
			location.href="/crew_delete?c_no="+c_no+"&u_no="+u_no;
		}else{
			return false;
		}
	}
</script> -->
	           <div class="down" id="down">
                  <c:forEach var="myCrew" items="${list }">
                     <c:if test="${myCrew.c_expose == 'N' }">
                        <div class="listbox" style="background-color: orange">
                             <div class="box3"><span class="material-icons">date_range</span>${myCrew.c_sdate } ~ ${myCrew.c_edate }</div>
                             <div class="box4">${myCrew.c_title }</div>
                             <!-- <div class="box5">그래프</div>
                             <div class="box6">진행률</div> -->
                             <div class="box7"><a href="./crew_view?c_no=${myCrew.c_no }&u_no=${session_u_no}"><input type="button" class="button" value="크루보기"></a></div>
                            <%-- <c:if test="${myCrew.u_no == session_u_no }">
                                <div class="box7"><a href="./crew_view?c_no=${myCrew.c_no }&u_no=${session_u_no}" ><input type="button" class="button" value="수정"></a></div>
                                <div class="box7"><a onclick="deleteBtn(${myCrew.c_no },${session_u_no})"><input type="button" class="button" value="삭제"></a></div>
                            </c:if> --%>
                         </div>
                     </c:if>
                      <div class="listbox">
                          <div class="box3"><span class="material-icons">date_range</span>${myCrew.c_sdate } ~ ${myCrew.c_edate }</div>
                          <div class="box4">${myCrew.c_title }</div>
                          <!-- <div class="box5">그래프</div>
                          <div class="box6">진행률</div> -->
                          <div class="box7"><a href="./crew_board?c_no=${myCrew.c_no }"><input type="button" class="button" value="크루보기"></a></div>
                         <%-- <c:if test="${myCrew.u_no == session_u_no }">
                             <div class="box7"><a href="./crew_view?c_no=${myCrew.c_no }&u_no=${session_u_no}" ><input type="button" class="button" value="수정"></a></div>
                             <div class="box7"><a onclick="deleteBtn(${myCrew.c_no },${session_u_no})"><input type="button" class="button" value="삭제"></a></div>
                         </c:if> --%>
                      </div>
                  </c:forEach>
               </div>
            
            </div>
        
        
        
        </div>
    </section>



</body>

</html>