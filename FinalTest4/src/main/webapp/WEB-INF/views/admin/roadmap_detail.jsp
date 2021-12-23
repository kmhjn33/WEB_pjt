<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/admin_common.css">
	<link rel="stylesheet" href="../css/admin_roadmap_detail.css">
	<link rel="stylesheet" href="../css/admin_add_roadmap_detail_modimodal.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">


	<!-- 구글 아이콘 링크 -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
		} --%>
	
	
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
			width: 500px;
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
			width: 500px;
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
			width: 500px;
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
			width: 345px;
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
			width: 400px;
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



</head>
<body>
		<c:if test="${ session_u_id != 'admin' || session_u_id == null }">
			<script>
				alert("잘못된 접근입니다.");
				location.href = "/main";
			</script>
		</c:if>
	
	<!-- The Modal : 세부 로드맵 생성 -->
	<div id="myModal" class="use">
		<!-- Modal content -->
		<div class="modal_content">
			<p class="roadmap_title">
				<span style="font-size: 14pt;"><b><span style="font-size: 24pt;">로드맵 정보</span></b></span>
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
		</div>
		<!-- Modal content -->
	</div>

</body>
</html>