<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>roadmap_detail</title>
<link rel="stylesheet" href="../css/roadmap_common.css">
<link rel="stylesheet" href="../css/roadmap_detail.css">
<link rel="stylesheet" href="../css/add_roadmap_detail_modimodal.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<link rel="stylesheet" href="/css/header.css">
<!-- 구글 아이콘 링크 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
		// 사이드바 active
		$(function () {
			    var url = window.location.href;	
			    $('#roadmap_list li a[href="' + url + '"]').addClass('active');
			    $('#roadmap_list li a').filter(function () {
			        return this.href == url;
			    }).addClass('active');
		});
		var u_no = ${session_u_no};
        
        // 로드맵 생성 창
        function roadmap_add(){ $('#addModal').fadeIn(); }      
        function close_add(){ $("#cate_sub_no").val("1"); $("#r_name").val(""); $('#addModal').hide(); }
       
        // 로드맵 저장
        function save_add(){
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
		       			 var thtml ="";
		       			 
		       			 for(var i=0; i < data.list.length; i++){		       		    	 
	  		       		     chtml += "<li><a class='side_active' class='' href='roadmap_detail?u_no="+ data.list[i].roadmapVo.u_no + "&cate_sub_no="+ data.list[i].roadmapVo.cate_sub_no + "&r_no="+ data.list[i].roadmapVo.r_no + "&r_name=" + data.list[i].roadmapVo.r_name +"'>"+ data.list[i].roadmapVo.r_name +"</a></li>";
		       		     }
		       		     
		       		     if (data.roadmapVo.cate_sub_no == "1") { thtml += "학습"; }
		       		 	 if (data.roadmapVo.cate_sub_no == "3") { thtml +="자격증"; }
		       		 	 if (data.roadmapVo.cate_sub_no == "5") { thtml +="공모전"; }
		       			 if (data.roadmapVo.cate_sub_no == "21") { thtml +="취미 및 기타"; }
		       	
		       		     $("#top_cate_name").html(thtml);
		       		     $("#roadmap_list").html(chtml);
		       			 $("#cate_sub_no").val("1");
		       			 $("#r_name").val("");
		       			 $('#addModal').hide();
		       		     
		       			 location.href = "roadmap_detail?u_no=" + data.roadmapVo.u_no + "&cate_sub_no=" + data.roadmapVo.cate_sub_no + "&r_no= " + data.roadmapVo.r_no + "&r_name=" + data.roadmapVo.r_name;
		       			 //alert("로드맵이 생성되었습니다!");
		       		 },
		       		 error:function(){
		       			 alert("에러!");
		       		 }
		      	  });//ajax			       	
        }

        // 로드맵 제목 변경 창
        function roadmap_modi() { $('#modiModal').fadeIn(); }
        function close_modi(flag) { $("#modi_roadmap_title").val(""); $('#modiModal').fadeOut(); }
        
        // 로드맵 제목 변경 
        $(function(){
        	$("#modi_save").click(function(){
				var r_no = "${param.r_no}";

				if( $("#modi_roadmap_title").val() == ""){ 
					alert ("변경할 제목을 입력하세요!"); 
					return false;
				} else{		
					var r_name = $("#modi_roadmap_title").val();
				} 
				
				$.ajax({
		      		 url:"./modiTitle",
		      		 type:"post",
		       		 data:{
		       			"r_no":r_no,
		       			"r_name":r_name, 
		       			"u_no":u_no
		       			//"cate_sub_no":cate_sub_no
		       		 },
		       		 success:function(data){	       			 
		       			 $("#modi_roadmap_title").val("");
		       			 
		       			 location.href="roadmap_detail?u_no=" + data.u_no + "&cate_sub_no=" + data.cate_sub_no + "&r_no= " + data.r_no + "&r_name=" + data.r_name;
		       		 },
		       		 error:function(){
		       			 alert("에러!");
		       		 }
		      	  });//ajax	
        	});// modi_save
        });// function      
        
        // 로드맵 삭제
        function roadmap_del(r_no) {
            if(confirm("로드맵을 삭제하시겠습니까?")){
    			$.ajax({
   	      		 url:"./roadmapDel",
   	      		 type:"post",
   	       		 data:{
   					"r_no":r_no
   	       		 },
   	       		 success:function(data){
					alert("로드맵이 삭제 되었습니다!");  
					
					if(data.r_name != null) {
						location.href="roadmap_detail?u_no=" + data.u_no + "&cate_sub_no=" + data.cate_sub_no + "&r_no= " + data.r_no + "&r_name=" + data.r_name;
					} else {
						location.href = "/roadmap/my_roadmap";
					}
					
   	       		 },
   	       		 error:function(){
   	       			 alert("에러!");
   	       		 }
   	      	  });// ajax	            	
             } else {
                    return false;
             }
        }// function
        
        // 모달 창 날짜 넣기
        function input_date(){
            var date = new Date();
			var yyyy = date.getFullYear();
			var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
			var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();

			return  input_date = yyyy+"-"+mm+"-"+dd;
        }// function
        
        // 로드맵 세부 생성 창
        function detail_add(){ 	 
            $("#r_detail_startdate").val(input_date());
        	$('#myModal').fadeIn(); 
        }// function
        
        function close_pop(flag) { 
   			 $("#r_detail_title").val("");
   			 $("#r_detail_state").val("상태 없음");
   			 $("#r_detail_grade").val("선택 안함");
   			 $("#s_no").val("0");
   			 $("#r_detail_content").val("");
   			 $("#r_detail_priority").val("선택 안함");
   			 $("#r_detail_startdate").val("");
   			 $("#r_detail_enddate").val("");
   			 $('#myModal').hide(); 
   			 location.reload(true);
   		}// function
        
        // 세부 로드맵 날짜 저장
        function convertDateFormat(cdate){
			   var date = new Date(cdate);
			   var year = date.getFullYear();
			   var month = date.getMonth() + 1;
			   month = month >= 10 ? month : '0' + month;
			   var day = date.getDate();
			   day = day >= 10 ? day : '0' + day;
			   var hour = date.getHours();
			   hour = hour >= 10 ? hour : '0' + hour;
			   var min = date.getMinutes();
			   var sec = date.getSeconds();
			   sec = sec >= 10 ? sec : '0' + sec;	
			   
			   return cdate = year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + sec;
        }
        
        // 세부 로드맵 저장
        $(function(){
        	$(".detail_save").click(function(){
        		var r_no = "${param.r_no}";
        		var r_detail_state = $("#r_detail_state").val();
        		var r_detail_grade = $("#r_detail_grade").val();
        		var s_no = $("#s_no").val();
        		var textbook_no = $("#textbook").val();
        		var r_detail_content = $("#r_detail_content").val();
        		var r_detail_priority = $("#r_detail_priority").val();
			    var r_detail_startdate = convertDateFormat($("#r_detail_startdate").val());
			    var r_detail_enddate = convertDateFormat($("#r_detail_enddate").val());
			    
				if($("#r_detail_title").val() == ""){ 
					alert ("제목을 입력하세요!"); 
					return false;
				} else{		
					var r_detail_title = $("#r_detail_title").val();
				} 

			    if(r_detail_startdate > r_detail_enddate){
			    	alert("시작일보다 종료일이 빠릅니다. 다시 선택하세요!");
			   		$(".date_border").css("outline-color", "red");
			    	$(".date_border").focus();
			    	return false;
			    }
			    
				$.ajax({
		      		 url:"./detailWrite",
		      		 type:"post",
		       		 data:{
		       			"r_no":r_no,
		       			"r_detail_title":r_detail_title,
		       			"r_detail_state":r_detail_state,
		       			"r_detail_grade":r_detail_grade,
		       			"s_no":s_no,
		       			"textbook_no":textbook_no,
		       			"r_detail_content":r_detail_content,
		       			"r_detail_priority":r_detail_priority,
		       			"r_detail_startdate":r_detail_startdate,
		       			"r_detail_enddate":r_detail_enddate
		       		},
		       		 success:function(data){
		     			 var r_detail_startdate = convertDateFormat(data[0].r_detail_startdate).substring(2,10); 
		    			 var r_detail_enddate = convertDateFormat(data[0].r_detail_enddate).substring(2,10); 
		    			 
		       			 var chtml="";
		       			 
		       			chtml += "<div class='roadmap_content_box' id='"+ data[0].r_detail_no +"'>";
		       			chtml += "<div class='roadmap_content on' id='to-do' draggable='true' ondragstart='onDragStart(event)'>";
		       			chtml += "<div>";
		       			chtml += "<div class='pad title'>";
		       			chtml += "<p><i class='far fa-file-alt'></i> "+ data[0].r_detail_title +"</p>";
		       			chtml += "</div>";
		       			chtml += "<i class='fas fa-trash-alt temp_del' onclick='temp_del("+ data[0].r_detail_no +")'></i>";
		       			chtml += "</div>";
		       			chtml += "<div onclick='roadmap_detail("+ data[0].r_detail_no +")'>";
		       			chtml += "<div class='pad'>";
		       			chtml += "<p><i class='far fa-calendar-check'></i> " + r_detail_startdate +  " ~ " + r_detail_enddate + "</p>";
		       			chtml += "</div>";
		       			chtml += "<div class='pad two'>";
		       			chtml += "<div class='subject'>";
		       			chtml += "<p><i class='fab fa-speakap'></i> "+ data[0].s_name +"</p>";
		       			chtml += "</div>";
		       			chtml += "<div class='textbook'>";
		       			chtml += "<p><i class='fas fa-book'></i> "+ data[0].textbook_content +"</p>";
		       			chtml += "</div>";
		       			chtml += "</div>";
		       			chtml += "<div class='pad'>";
		       			chtml += "<p><i class='far fa-star'></i> "+ data[0].r_detail_priority +"</p>";
		       			chtml += "</div>";
		       			chtml += "</div>";
		       			chtml += "</div>";
		       			chtml += "</div>";
		       			
		       			 if(data[0].r_detail_state == '시작 전'){ $("#todopend").prepend(chtml); }
		       			 if(data[0].r_detail_state == '진행 중'){ $("#doingpend").prepend(chtml); }
		       			 if(data[0].r_detail_state == '완료'){ $("#donepend").prepend(chtml); }
		       			 if(data[0].r_detail_state == '상태 없음'){ $("#trashpend").prepend(chtml); }
		       			 		       			 
		       			 $('#myModal').hide();
		       			 location.reload(true);
		       			 
		       			 $("#r_detail_title").val("");
		       			 $("#r_detail_state").val("상태 없음");
		       			 $("#r_detail_grade").val("선택 안함");
		       			 $("#s_no").val("0");
		       			 $("#r_detail_content").val("");
		       			 $("#r_detail_priority").val("선택 안함");
		       			 $("#r_detail_startdate").val("");
		       			 $("#r_detail_enddate").val("");
		       		 },
		       		 error:function(){
		       			 alert("날짜를 입력하세요!");
		       		 }
		      	  });//ajax	     		
        	});// detail_save
        });// function  
        
        // 수정 모달 날짜 넣기
        function m_date(modidate){
            var date = new Date(modidate);
			var yyyy = date.getFullYear();
			var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
			var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();

			return yyyy+"-"+mm+"-"+dd;
        }// function
        
        // 세부로드맵 - 로드맵 수정 창
        function roadmap_detail(modi_no) { 
        	$('#myModiModal').fadeIn();        
 	       	
        	var r_detail_no = modi_no;
        	
        	$.ajax({
        		url:"./inModi",
        		type:"post",
        		data:{
        			"r_detail_no":r_detail_no		
        		},
        		success:function(data){    		        			
					$("#modi_detail_no").val(data.r_detail_no);
					$("#modi_detail_date").val(m_date(data.r_detail_date));
					
					$("#modi_detail_title").val(data.r_detail_title); 
					$("#modi_detail_state").val(data.r_detail_state); 
					$("#modi_detail_grade").val(data.r_detail_grade); 
					$("#modi_s_no").val(data.s_no); 
					$("#modi_textbook").val(data.textbook_no); 
					$("#modi_detail_content").val(data.r_detail_content); 
					$("#modi_detail_priority").val(data.r_detail_priority); 					
					$("#modi_detail_startdate").val(m_date(data.r_detail_startdate)); 
					$("#modi_detail_enddate").val(m_date(data.r_detail_enddate)); 	
        		},
        		error:function(){
        			alert("에러!");
        		}
        	});//ajax
        }// function
        
        function close_detailModi(flag) { 
        	$('#myModiModal').fadeOut();
        	location.reload(true);
        }// function
        
        // 세부 로드맵 수정
        function detailModi_save(){
        	var r_no = "${param.r_no}";
        	var r_detail_no = $("#modi_detail_no").val();
        	var r_detail_date = $("#modi_detail_date").val();

			var r_detail_date = convertDateFormat($("#modi_detail_date").val());
			var r_detail_state = $("#modi_detail_state").val(); 
			var r_detail_grade = $("#modi_detail_grade").val(); 
			var s_no = $("#modi_s_no").val(); 
			var textbook_no = $("#modi_textbook").val(); 
			var r_detail_content = $("#modi_detail_content").val(); 
			var r_detail_priority = $("#modi_detail_priority").val(); 
			
			var r_detail_startdate = convertDateFormat($("#modi_detail_startdate").val()); 
			var r_detail_enddate = convertDateFormat($("#modi_detail_enddate").val()); 	
			
			if($("#modi_detail_title").val() == ""){ 
				alert ("제목을 입력하세요!"); 
				return false;
			} else{		
				var r_detail_title = $("#modi_detail_title").val();
			} 
			
 		    if(r_detail_startdate > r_detail_enddate){
		    	alert("시작일보다 종료일이 빠릅니다. 다시 선택하세요!");
		   		$(".date_border").css("outline-color", "red");
		    	$(".date_border").focus();
		    	return false;
		    }

			$.ajax({
	      		 url:"./detailModi",
	      		 type:"post",
	       		 data:{
	       			"r_no":r_no,
	       			"r_detail_no":r_detail_no, 
		       		"r_detail_date":r_detail_date,
		       		
	       			"r_detail_title":r_detail_title,
		       		"r_detail_state":r_detail_state,
		       		"r_detail_grade":r_detail_grade,
		       		"s_no":s_no,
		       		"textbook_no":textbook_no,
		       		"r_detail_content":r_detail_content,
		       		"r_detail_priority":r_detail_priority,
		       		"r_detail_startdate":r_detail_startdate,
		       		"r_detail_enddate":r_detail_enddate
	       		 },
	       		 success:function(data){
					 alert("수정되었습니다!");
					 
					 $("#myModiModal").hide(); 				 
					 location.reload(true);
	       		 },
	       		 error:function(){
	       			 alert("날짜를 입력하세요!");
	       		 }
	      	 });//ajax		
        }// function

        // 교재 모달 
        function subject_btn(){ $('#subModal').fadeIn(); };
        function close_sub(flag) { $("#subject_in").val(""); $('#subModal').fadeOut(); };
        $(function(){
        	$("#sub_save").click(function(){
        		var subject_in = $("#subject_in").val();

				$.ajax({
		      		 url:"./subjectWrite",
		      		 type:"post",
		       		 data:{
		       			"u_no":u_no,
		       			"textbook_content":subject_in
		       		},
		       		 success:function(data){
						 var chtml = "";
						 
						 chtml += "<option value='선택 안함'>선택 안함</option>";
		       		     for(var i=0; i < data.length; i++){		       		    	 
							 chtml += "<option value=\""+ data[i].textbook_no +"\">" + data[i].textbook_content + "</option>";   
		       		     } 
		       		     
		       			 $("#textbook").html(chtml);	// 세부 로드맵 생성에 추가
		       			 $("#modi_textbook").html(chtml);	// 로드맵 수정에 추가
		       			 
		       			 $("#subject_in").val("");
		       			 $('#subModal').hide();
		       		 },
		       		 error:function(){
		       			 alert("에러!");
		       		 }
		      	  });//ajax	
        	});// sub_save
        });// function  

        // 로드맵 개별 삭제
        function temp_del(r_detail_no) {         	
        	if(confirm("로드맵 세부를 삭제하시겠습니까?")){
      		  $.ajax({
     			 url:"./detailroadmapDel",
     			 type:"post",
     	 		 data:{
     	 			 "r_detail_no":r_detail_no
     	 		 },
     	 		 success:function(data){   
					 $("#"+r_detail_no).remove();
					 location.reload(true);
					 
					 alert("삭제 되었습니다!");
     	 		 },
     	 		 error:function(textStatus){
     	 			 alert("실패");
     	 		 }
     		  });
            } else {
                  return false;
          }
        }// function

        // 드래그 앤 드롭
        // 드래그 시작
        function onDragStart(ev){
           ev.dataTransfer.setData("id",ev.target.id);
        };

        function allowDrop(ev){
		    ev.preventDefault();
	    };
	
        function onDrop(ev){
	    	ev.preventDefault();
		    var r_detail_no = ev.dataTransfer.getData("id");
            const draggableElement = document.getElementById(r_detail_no);
            const dropzone = ev.target;

            var target_id = $(ev.target).attr("class");
            if (target_id == "drop_zone") {
                dropzone.appendChild(draggableElement);
                draggableElement.setAttribute("onclick", "roadmap_detail(r_detail_no)");
                
	            //로드맵 세부 박스 id (r_detail_no) => r_detail_no
	            var detailState = $(ev.target).attr("id");            
	            dragDropInsert(r_detail_no, detailState);
            }
            
	    }; 
	    
	    //로드맵 세부 드롭 후 DB 상태 업데이트
	    function dragDropInsert (r_detail_no, detailState) {    	
	    	var r_detail_state = '';
	    		
	    	switch(detailState) {
	    		case 'todopend' : r_detail_state = '시작 전';
	    			break;
	    		case 'doingpend' : r_detail_state = '진행 중';
	    			break;
	    		case 'donepend' : r_detail_state = '완료';
	    			break;
	    		case 'trashpend' : r_detail_state = '상태 없음';
	    			break;
	    	}
	    	
	    	$.ajax({
    			 url:"./detailroadmapDrag",
    			 type:"post",
    	 		 data:{
    	 			 "r_detail_no":r_detail_no,
    	 			 "r_detail_state": r_detail_state
    	 		 },
    	 		 success:function(data){
    	 			 if(data == 1) {
						//카운트 처리
	    	 			count_state();
    	 			 }
    	 		 },
    	 		 error:function(textStatus){
    	 			 alert("오류가 발생했습니다. 다시 시도해주세요.");
    	 		 }
    		  });//ajax-end
	    }
	    
	    // 상태별 카운트 Count
        function count_state(){
        	var r_no = "${param.r_no}";
        	
			$.ajax({
	      		 url:"./count_state",
	      		 type:"post",
	       		 data:{
					"r_no":r_no
	       		 },
	       		 success:function(data){
	       			 
 	       			$("#sCount").text(data.sCount);
	       			$("#iCount").text(data.iCount);
	       			$("#eCount").text(data.eCount);
	       			$("#nCount").text(data.nCount);	     
	       			
	       		 },
	       		 error:function(){
	       			 alert("에러!");
	       		 }
	      	  });// ajax	
        }// function
	    
    </script>

<style>
/* 로드맵 생성 */
.addmodal {
	display: none;
	position: fixed;
	z-index: 2;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content/Box */
.addmodal_content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 2px solid #888;
	width: 540px;
	border-radius: 10px;
}

/* 로드맵 세부 생성 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal_content {
	background-color: #fefefe;
	margin: 9% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 540px;
	border-radius: 10px;
}

/* 로드맵 세부 수정 */
.modiModal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modiModal_content {
	background-color: #fefefe;
	margin: 9% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 540px;
	border-radius: 10px;
}

/* 교재추가 */
.submodal {
	display: none;
	position: absolute;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	/* overflow: auto;  */
	background-color: rgba(0, 0, 0, 0.4);
}

.submodal_content {
	background-color: #fefefe;
	margin: 0 auto;
	margin-top: 440px;
	padding: 10px;
	border: 1px solid #888;
	border-radius: 10px;
	width: 370px;
	/* position: absolute; */
	/* left: 930px; */
	/* top: 360px; */
	z-index: 2;
}

#sub_save {
	padding: 4px;
	cursor: pointer;
}

#sub_cancel {
	cursor: pointer;
}

#sub_save .pop_bt {
	background-color: #ffd803;
	padding: 6px;
	border-radius: 8px;
}

#sub_cancel .pop_bt {
	border: 2px solid #272343;
	padding: 4px;
	border-radius: 8px;
}

.roadmap_content {
	position: relative;
}

/* 이름변경 */
.modiModal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modimodal_content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 430px;
	border-radius: 10px;
	position: absolute;
	left: 900px;
}

#modi_save {
	padding: 4px;
	cursor: pointer;
}

#modi_cancel {
	cursor: pointer;
}

#modi_save .pop_bt {
	background-color: #ffd803;
	padding: 6px;
	border-radius: 8px;
}

#modi_cancel .pop_bt {
	border: 2px solid #272343;
	padding: 4px;
	border-radius: 8px;
}

/* 개별 삭제 */
.temp_del {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 1;
}
</style>

<link rel="stylesheet" href="../css/header.css">
<!-- 구글 아이콘 링크 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- 헤더 검색바 CSS링크 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<header><%@include file="../header_footer/header.jsp"%></header>

	<section id="container">
		<!-- 		<div id="mypage_head">
			<div id="mypage_title">
				<h2>로드맵</h2>
			</div>
			<div id="mypage_img1">
				<a href="#"><img src="../images/mypage.jpg" alt="마이페이지 이미지"></a>
				<div id="sub_hover">
					<a href="../mypage/my_info.html"><p>내 정보 관리</p></a> <a href=""><p>크루
							관리</p></a> <a href="../roadmap/my_roadmap.html"><p>로드맵 관리</p></a> <a
						href="../myboard/myboard.html"><p>게시물 관리</p></a>
				</div>
			</div>
			<div id="mypage_img2">
				<a href="../mypage/mypage.html"><img id="img_hover"
					src="../images/home.png" alt="홈 이미지"></a>
			</div>
		</div> 
		<hr>
		-->
		
		<!-- 사이드 바 -->
		<div id="content_container">

			<div id="roadmap_side">
				<div id="roadmap_nickname">
					<a href="./my_roadmap"><strong>${ session_u_nickName }</strong> 의 <br>
					<p>로드맵<p></a>
				</div>
				
				<ul id="roadmap_list">
					<c:forEach items="${list}" var="list">	
							<li><a id="side_active" class="" href="roadmap_detail?u_no=${list.u_no}&cate_sub_no=${list.cate_sub_no}&r_no=${list.r_no}&r_name=${list.r_name}">${list.r_name}</a></li>
					</c:forEach>
				</ul>

				<div id="roadmap_add">
					<p onclick="roadmap_add()">
						<i class="fas fa-plus" style="color: #fffffe;"></i> 로드맵 생성
					</p>
				</div>
			</div>
			<!-- roadmap_side -->

			<!-- The Modal -->
			<div id="addModal" class="addmodal">
				<!-- Modal content -->
				<div class="addmodal_content">
					<p class="roadmap_title">
						<span style="font-size: 14pt;"><b><span style="font-size: 24pt;">로드맵 생성</span></b></span>
					</p>
					<table id="modal_tb">
						<tr>
							<td><label for="cate_sub"><strong>유형</strong></label></td>
							<td><select name="cate_sub_no" id="cate_sub_no">
									<!--  <option value="none">선택안함</option> -->
									<option value="1">학습</option>
									<option value="3">자격증</option>
									<option value="5">공모전</option>
									<option value="21">취미 및 기타</option>
							</select></td>
						</tr>
						<br>
						<tr>
							<td><label for="r_name"><strong>로드맵 이름</strong></label></td>
							<td><input type="text" id="r_name" name="r_name"></td>
						</tr>
					</table>
					<p>
						<br />
					</p>
					<div class="modal_btn">
						<div id="save_btn" id="save_add" onclick="save_add()">
							<span class="pop_bt"> 저장 </span>
						</div>

						<div id="cancel_btn" onClick="close_add()">
							<span class="pop_bt"> 취소 </span>
						</div>
					</div>
				</div>
				<!-- Modal content -->
			</div>
			<!-- The Modal -->

			<!-- 로드맵 메인 -->
			<div id="roadmap_main">
				<div id="main_top">
					<h2 id="top_title">${ param.r_name }</h2>
					<c:if test="${param.cate_sub_no==1}">
						<div id="top_cate_name">학습</div>
					</c:if>
					<c:if test="${param.cate_sub_no==3}">
						<div id="top_cate_name">자격증</div>
					</c:if>
					<c:if test="${param.cate_sub_no==5}">
						<div id="top_cate_name">공모전</div>
					</c:if>
					<c:if test="${param.cate_sub_no==21}">
						<div id="top_cate_name" style="width: 100px; ">취미 및 기타</div>
					</c:if>
					<div class="top_btn">
						<p class="roadmap_modi" onclick="roadmap_modi()">제목 변경</p>
						<p class="roadmap_del" onclick="roadmap_del(${param.r_no})">삭제</p>
					</div>
				</div>
				<div class="use">
					<p>
						사이드바 하단의 <strong><i class="fas fa-plus"></i> 로드맵생성</strong> 버튼을
						클릭하여 새 페이지를 추가합니다.
					</p>
					<p>
						<strong><i class="fas fa-plus"></i> 생성</strong> 버튼을 클릭하여 세부 로드맵을
						추가합니다.
					</p>
					<p>세부 로드맵을 누르면 상세 입력페이지가 열립니다.</p>
					<p>세부 로드맵을 클릭한 상태로 다른 곳으로 끌어 놓을 수 있습니다.</p>
				</div>

				<div id="roadmap_container">
					<div class="roadmap_box">
						<div class="roadmap_top">
							<div>
								<p class="left state">시작 전</p>
							</div>
							<div>
								<p class="left count" id="sCount">${sCount}</p>
							</div>
						</div>
						<div class="drop_zone" id="todopend" ondrop="onDrop(event)" ondragover="allowDrop(event)">
						<div>
						<!-- 반복 -->
						<c:forEach items="${rdList}" var="rdList">
						<c:if test="${rdList.r_detail_state == '시작 전'}"> 
							<div class="roadmap_content_box">
								<div class="roadmap_content on" id="${rdList.r_detail_no}" draggable="true" ondragstart="onDragStart(event)"><!-- id="to-do" -->
									<div>
										<div class="pad title">
											<p>
												<i class="far fa-file-alt"></i> ${rdList.r_detail_title}
											</p>
										</div>
										<i class="fas fa-trash-alt temp_del" onclick="temp_del(${rdList.r_detail_no})"></i>
									</div>
									<div onclick="roadmap_detail(${rdList.r_detail_no})">
										<div class="pad">
										<fmt:formatDate value="${rdList.r_detail_startdate}" pattern="yy-MM-dd" var="r_detail_startdate" />
										<fmt:formatDate value="${rdList.r_detail_enddate}" pattern="yy-MM-dd" var="r_detail_enddate" />
											<p>
												<i class="far fa-calendar-check"></i> ${r_detail_startdate} ~ ${r_detail_enddate}
											</p>
										</div>
										<div class="pad two">
											<div class="subject">
												<p><i class="fab fa-speakap"></i> ${rdList.s_name}</p>
											</div>
										</div>
										<div class="pad two">
											<div class="textbook">
												<p><i class="fas fa-book"></i> ${rdList.textbook_content}</p>
											</div>
										</div>
										<div class="pad">
											<c:if test="${rdList.r_detail_priority == '선택 안함'}">
												<p><i class="far fa-star"></i>선택 안함</p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도1'}">
												<p><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도2'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도3'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도4'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도5'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:if> 
						</c:forEach>
						</div>
						<!-- 반복 -->
						</div>
						<div id="detail_add">
							<a><p onclick="detail_add()">
									<i class="fas fa-plus"></i> 생성
								</p></a>
						</div>

					</div>
					<!-- roadmap_box -->

					<div class="roadmap_box">
						<div class="roadmap_top">
							<div>
								<p class="left state">진행 중</p>
							</div>
							<div>
								<p class="left count" id="iCount">${iCount}</p>
							</div>
						</div>
						<div class="drop_zone" id="doingpend" ondrop="onDrop(event)" ondragover="allowDrop(event)">
						<!-- 반복 -->
						<c:forEach items="${rdList}" var="rdList">
						<c:if test="${rdList.r_detail_state == '진행 중'}"> 
							<div class="roadmap_content_box">
								<div class="roadmap_content on" id="${rdList.r_detail_no}" draggable="true"
									ondragstart="onDragStart(event)">
									<div>
										<div class="pad title">
											<p>
												<i class="far fa-file-alt"></i> ${rdList.r_detail_title}
											</p>
										</div>
										<i class="fas fa-trash-alt temp_del" onclick="temp_del(${rdList.r_detail_no})"></i>
									</div>
									<div onclick="roadmap_detail(${rdList.r_detail_no})">
										<div class="pad">
										<fmt:formatDate value="${rdList.r_detail_startdate}" pattern="yy-MM-dd" var="r_detail_startdate" />
										<fmt:formatDate value="${rdList.r_detail_enddate}" pattern="yy-MM-dd" var="r_detail_enddate" />
											<p>
												<i class="far fa-calendar-check"></i> ${r_detail_startdate} ~ ${r_detail_enddate}
											</p>
										</div>
										<div class="pad two">
											<div class="subject">
												<p><i class="fab fa-speakap"></i> ${rdList.s_name}</p>
											</div>
										</div>
										<div class="pad two">
											<div class="textbook">
												<p><i class="fas fa-book"></i> ${rdList.textbook_content}</p>
											</div>
										</div>
										<div class="pad">
											<c:if test="${rdList.r_detail_priority == '선택 안함'}">
												<p><i class="far fa-star"></i>선택 안함</p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도1'}">
												<p><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도2'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도3'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도4'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도5'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:if> 
						</c:forEach>
						<!-- 반복 -->
						</div>
					</div>
					<!-- roadmap_box -->

					<div class="roadmap_box">
						<div class="roadmap_top">
							<div>
								<p class="left state">완료</p>
							</div>
							<div>
								<p class="left count" id="eCount">${eCount}</p>
							</div>
						</div>
						<div class="drop_zone" id="donepend" ondrop="onDrop(event)" ondragover="allowDrop(event)">
						<!-- 반복 -->
						<c:forEach items="${rdList}" var="rdList">
						<c:if test="${rdList.r_detail_state == '완료'}"> 
							<div class="roadmap_content_box">
								<div class="roadmap_content" id="${rdList.r_detail_no}" draggable="true" ondragstart="onDragStart(event)">
									<div>
										<div class="pad title">
											<p>
												<i class="far fa-file-alt"></i> ${rdList.r_detail_title}
											</p>
										</div>
										<i class="fas fa-trash-alt temp_del" onclick="temp_del(${rdList.r_detail_no})"></i>
									</div>
									<div onclick="roadmap_detail(${rdList.r_detail_no})">
										<div class="pad">
										<fmt:formatDate value="${rdList.r_detail_startdate}" pattern="yy-MM-dd" var="r_detail_startdate" />
										<fmt:formatDate value="${rdList.r_detail_enddate}" pattern="yy-MM-dd" var="r_detail_enddate" />
											<p>
												<i class="far fa-calendar-check"></i> ${r_detail_startdate} ~ ${r_detail_enddate}
											</p>
										</div>
										<div class="pad two">
											<div class="subject">
												<p><i class="fab fa-speakap"></i> ${rdList.s_name}</p>
											</div>
										</div>
										<div class="pad two">
											<div class="textbook">
												<p><i class="fas fa-book"></i> ${rdList.textbook_content}</p>
											</div>
										</div>
										<div class="pad">
											<c:if test="${rdList.r_detail_priority == '선택 안함'}">
												<p><i class="far fa-star"></i>선택 안함</p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도1'}">
												<p><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도2'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도3'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도4'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도5'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
										</div>
									</div>
								</div>
							</div>
					</c:if> 
					</c:forEach>
						</div>
					</div>
					<!-- roadmap_box -->

					<div class="roadmap_box">
						<div class="roadmap_top">
							<div>
								<p class="left state">상태 없음</p>
							</div>
							<div>
								<p class="left count" id="nCount">${nCount}</p>
							</div>
						</div>
						<div class="drop_zone" id="trashpend" ondrop="onDrop(event)" ondragover="allowDrop(event)">
						<!-- 반복 -->
						<c:forEach items="${rdList}" var="rdList">
						<c:if test="${rdList.r_detail_state == '상태 없음'}"> 
							<div class="roadmap_content_box">
								<div class="roadmap_content" id="${rdList.r_detail_no}" draggable="true" ondragstart="onDragStart(event)">
									<div>
										<div class="pad title">
											<p>
												<i class="far fa-file-alt"></i> ${rdList.r_detail_title}
											</p>
										</div>
										<i class="fas fa-trash-alt temp_del" onclick="temp_del(${rdList.r_detail_no})"></i>
									</div>
									<div onclick="roadmap_detail(${rdList.r_detail_no})">
										<div class="pad">
										<fmt:formatDate value="${rdList.r_detail_startdate}" pattern="yy-MM-dd" var="r_detail_startdate" />
										<fmt:formatDate value="${rdList.r_detail_enddate}" pattern="yy-MM-dd" var="r_detail_enddate" />
											<p>
												<i class="far fa-calendar-check"></i> ${r_detail_startdate} ~ ${r_detail_enddate}
											</p>
										</div>
										<div class="pad two">
											<div class="subject">
												<p><i class="fab fa-speakap"></i> ${rdList.s_name}</p>
											</div>
										</div>
										<div class="pad two">
											<div class="textbook">
												<p><i class="fas fa-book"></i> ${rdList.textbook_content}</p>
											</div>
										</div>
										<div class="pad">
											<c:if test="${rdList.r_detail_priority == '선택 안함'}">
												<p><i class="far fa-star"></i>선택 안함</p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도1'}">
												<p><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도2'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도3'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도4'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
											<c:if test="${rdList.r_detail_priority == '중요도5'}">
												<p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:if> 
						</c:forEach>
						</div>
					</div>
					<!-- roadmap_box -->


				</div>
				<!-- roadmap_container -->

			</div>
			<!-- roadmap_main -->

		</div>
		<!-- content_container -->

		<!-- The Modal : 세부 로드맵 생성 -->
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal_content">
				<p class="roadmap_title">
					<span style="font-size: 14pt;"><b><span style="font-size: 24pt;">로드맵 작성</span></b></span>
				</p>
				<p class="roadmap_write">
					<br />
				<table id="modal_tb">
					<tr>
						<td><strong><i class="far fa-file-alt"></i> 제목</strong></td>
						<td><input type="text" id="r_detail_title" name="r_detail_title"></td>
					</tr>

					<tr>
						<td><label for="state"><strong><i class="fas fa-seedling"></i> 상태</strong></label></td>
						<td><select name="r_detail_state" id="r_detail_state">
								<option value="상태 없음">상태 없음</option>
								<option value="시작 전">시작 전</option>
								<option value="진행 중">진행 중</option>
								<option value="완료">완료</option>
						</select></td>
					</tr>
					<br>
					<tr>
						<td><label for="grade"><strong><i class="fas fa-school"></i> 학년</strong></label></td>
						<td><select name="r_detail_grade" id="r_detail_grade">
								<option value="선택 안함">선택 안함</option>
								<option value="중학교 1학년">중학교 1학년</option>
								<option value="중학교 2학년">중학교 2학년</option>
								<option value="중학교 3학년">중학교 3학년</option>
								<option value="고등학교 1학년">고등학교 1학년</option>
								<option value="고등학교 2학년">고등학교 2학년</option>
								<option value="고등학교 3학년">고등학교 3학년</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="subject"><strong><i class="fab fa-speakap"></i> 과목</strong></label></td>
						<td><select name="s_no" id="s_no">
								<c:forEach items="${sList}" var="sList">
									<option value="${sList.s_no}">${sList.s_name}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><label for="textbook"><strong><i class="fas fa-book"></i> 교재</strong></label></td>
						<td><select name="textbook" id="textbook">
								<option value="0">선택 안함</option>
								<c:forEach items="${tList}" var="tList">
									<option value="${tList.textbook_no}">${tList.textbook_content}</option>
								</c:forEach>
								
						</select>
							<button type="button" id="subject_add" onclick="subject_btn()">교재 생성</button></td>
					</tr>
					<tr>
						<td><label for="content"><strong><i class="far fa-comments"></i> 내용</strong></label></td>
						<td><textarea name="r_detail_content" id="r_detail_content" cols="50" rows="5"></textarea></td>
					</tr>
					<tr>
						<td><label for="priority"><strong><i class="far fa-star"></i> 중요도</strong></label></td>
						<td><select name="r_detail_priority" id="r_detail_priority">
								<option value="선택 안함">선택 안함</option>
								<option value="중요도1">&#xf005</option>
								<option value="중요도2">&#xf005 &#xf005</option>
								<option value="중요도3">&#xf005 &#xf005 &#xf005</option>
								<option value="중요도4">&#xf005 &#xf005 &#xf005 &#xf005</option>
								<option value="중요도5">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="startdate"><strong><i class="far fa-calendar-check"></i> 시작일</strong></label></td>
						<td><input type="date" id="r_detail_startdate" name="r_detail_startdate"></td>
					</tr>
					<tr>
						<td><label for="enddate"><strong><i class="far fa-calendar-check"></i> 종료일</strong></label></td>
						<td><input type="date" id="r_detail_enddate" name="r_detail_enddate" class="date_border"></td>
					</tr>

				</table>
				
				</p>
				<p>
					<br />
				</p>
				<div class="modal_btn">
					<div id="save_btn" class="detail_save">
						<!-- onclick="save_pop()"  -->
						<span class="pop_bt"> 저장 </span>
					</div>
					<div id="cancel_btn" onClick="close_pop()">
						<span class="pop_bt"> 취소 </span>
					</div>
				</div>
			</div>
			<!-- Modal content -->
		</div>
		<!-- The Modal -->

		<!-- The Modal : 세부 로드맵 수정 -->
		<div id="myModiModal" class="modiModal">
			<!-- Modal content -->
			<div class="modiModal_content">
				<p class="roadmap_title">
					<span style="font-size: 14pt;"><b><span style="font-size: 24pt;">로드맵 수정</span></b></span>
					<input type="hidden" id="modi_detail_no" name="r_detail_no">
					<input type="hidden" id="modi_detail_date" name="r_detail_date"> 
				</p>
				<p class="roadmap_write">
					<br />
				<table id="modimodal_tb">
					<tr>
						<td><strong><i class="far fa-file-alt"></i> 제목</strong></td>
						<td><input type="text" id="modi_detail_title" name="r_detail_title"></td>
					</tr>

					<tr>
						<td><label for="state"><strong><i class="fas fa-seedling"></i> 상태</strong></label></td>
						<td><select name="r_detail_state" id="modi_detail_state">
								<option value="상태 없음">상태 없음</option>
								<option value="시작 전">시작 전</option>
								<option value="진행 중">진행 중</option>
								<option value="완료">완료</option>
						</select></td>
					</tr>
					<br>
					<tr>
						<td><label for="grade"><strong><i class="fas fa-school"></i> 학년</strong></label></td>
						<td><select name="r_detail_grade" id="modi_detail_grade">
								<option value="none">선택안함</option>
								<option value="중학교 1학년">중학교 1학년</option>
								<option value="중학교 2학년">중학교 2학년</option>
								<option value="중학교 3학년">중학교 3학년</option>
								<option value="고등학교 1학년">고등학교 1학년</option>
								<option value="고등학교 2학년">고등학교 2학년</option>
								<option value="고등학교 3학년">고등학교 3학년</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="subject"><strong><i class="fab fa-speakap"></i> 과목</strong></label></td>
						<td><select name="s_no" id="modi_s_no">
								<c:forEach items="${sList}" var="sList">
									<option value="${sList.s_no}">${sList.s_name}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><label for="textbook"><strong><i class="fas fa-book"></i> 교재</strong></label></td>
						<td><select name="textbook" id="modi_textbook">
								<option value="0">선택 안함</option>
								<c:forEach items="${tList}" var="tList">
									<option value="${tList.textbook_no}">${tList.textbook_content}</option>
								</c:forEach>
						</select>
							<button type="button" id="subject_add" onclick="subject_btn()">교재 생성</button></td>
					</tr>
					<tr>
						<td><label for="content"><strong><i class="far fa-comments"></i> 내용</strong></label></td>
						<td><textarea name="r_detail_content" id="modi_detail_content" cols="50" rows="5"></textarea></td>
					</tr>
					<tr>
						<td><label for="priority"><strong><i class="far fa-star"></i> 중요도</strong></label></td>
						<td><select name="r_detail_priority" id="modi_detail_priority">
								<option value="선택 안함">선택 안함</option>
								<option value="중요도1">&#xf005</option>
								<option value="중요도2">&#xf005 &#xf005</option>
								<option value="중요도3">&#xf005 &#xf005 &#xf005</option>
								<option value="중요도4">&#xf005 &#xf005 &#xf005 &#xf005</option>
								<option value="중요도5">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="startdate"><strong><i class="far fa-calendar-check"></i> 시작일</strong></label></td>
						<td><input type="date" id="modi_detail_startdate" name="r_detail_startdate"></td>
					</tr>
					<tr>
						<td><label for="enddate"><strong><i class="far fa-calendar-check"></i> 종료일</strong></label></td>
						<td><input type="date" id="modi_detail_enddate" name="r_detail_enddate" class="date_border"></td>
					</tr>

				</table>
				</p>
				<p>
					<br />
				</p>
				<div class="modal_btn">
					<div id="save_btn" class="detail_modi"  onclick="detailModi_save()">
						<span class="pop_bt"> 수정 </span>
					</div>
					<div id="cancel_btn" onClick="close_detailModi()">
						<span class="pop_bt"> 취소 </span>
					</div>
				</div>
			</div>
			
			<!-- Modal content -->
		</div>
		<!-- The Modal -->


		<!-- The subModal : 교재 생성 -->
		<div id="subModal" class="submodal">
			<!-- Modal subcontent -->
			<div class="submodal_content">
				<table id="modal_tb">
					<tr>
						<td><label for="textbook"><strong>교재</strong></label></td>
						<td><input id="subject_in" type="text"></td>
						<td id="sub_save" onclick="save_sub()"><span class="pop_bt">
								생성 </span></td>
						<td id="sub_cancel" onClick="close_sub()"><span
							class="pop_bt"> 취소 </span></td>
					</tr>
				</table>
			</div>
			<!-- subModal content -->
		</div>
		<!-- The subModal -->

		<!-- The modiModal : 제목변경 -->
		<div id="modiModal" class="modiModal">
			<!-- Modal modiModal -->
			<div class="modimodal_content">
				<table id="modal_tb">
					<tr>
						<td><label for="textbook"><strong>제목 변경</strong></label></td>
						<td><input id="modi_roadmap_title" type="text"></td>
						<td id="modi_save">
							<!-- onclick="save_modi()" --> <span class="pop_bt"> 변경 </span>
						</td>
						<td id="modi_cancel" onClick="close_modi()"><span
							class="pop_bt"> 취소 </span></td>
					</tr>
				</table>
			</div>
			<!-- modiModal content -->
	</section>
</body>
</html>