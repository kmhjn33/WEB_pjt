<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

	<link rel="stylesheet" href="../css/crew_write.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/roadmap_common.css">

    <!-- 구글 아이콘 링크 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- 다음주소 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <!-- summernote -->
    <link rel="stylesheet" href="../css/board_summernote/summernote-lite.css">
    <script src="../js/board_summernote/summernote-lite.js"></script> 
    <script src="../js/board_summernote/lang/summernote-ko-KR.js"></script>
    <!-- <script src="../js/board_write_summernote.js"></script> -->
    <!-- //summernote --> 


	<script type="text/javascript">
		$(function(){
			
			$("#summernote").summernote({
				
				height: 300,                 // 에디터 높이
			    minHeight: null,           // 에디터 최소 높이
			    maxHeight: null,          // 에디터 최대 높이
			    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			    lang: "ko-KR",	         // 한글 설정
			    placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			    
			    //  추가 부분
	            toolbar: [
				// [groupName, [list of button]]
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				['color', ['forecolor','color']],
				['table', ['table']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['insert',['picture','link','video']],
				
				],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],

				
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }// onimagesUpload
				}// callback

			    
			}); //summernote
		}); //function

		//파일 업로드 실행 메소드
		function sendFile(file, el){
			var form_data = new FormData();
		      form_data.append('file', file);
		      $.ajax({
		        data: form_data,
		        type: "POST",
		        url: 'summerUpload',
		        cache: false,
		        contentType: false,
		        enctype: 'multipart/form-data',
		        processData: false,
		        success: function(img_name) { //성공 시 url이 입력됨.
		        $(el).summernote('editor.insertImage', img_name);
		        }
		      });

		}//sendFile
		
		//임시저장 누르면 실행하여 form으로 submit
		function writeBtn(check){
			/* 날짜 비교 테스트------------------------------------------- */
			//alert($("#c_apply_sdate").val());
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month  + '-' + day;
			//alert("오늘 날짜"+dateString);
			//alert(dateString > $("#c_apply_sdate").val());
			
			
			//버튼 클릭 시 넘어 온 값 확인 후 변수 지정---------------------------
			//alert("넘어온 값 : "+check);
			var check_e = check;
			//alert("변수 지정 값 : "+check_e);
			
			var apply_sdate = $("#c_apply_sdate").val();
			var apply_edate = $("#c_apply_edate").val();
			var sdate = $("#c_sdate").val();
			var edate = $("#c_edate").val();
			
			//전송 조건 확인------------------------------------------------
			if( $("#c_title").val() == "" ){
				alert("제목을 입력하세요");
				$("#c_title").focus();
			}else if($("#c_apply_sdate").val() == ""){
				alert("신청 시작일을 입력하세요");
			}else if($("#c_apply_edate").val() == ""){
				alert("신청 종료일을 입력하세요");
			}else if($("#c_sdate").val() == ""){
				alert("크루 시작일을 입력하세요");
			}else if($("#c_edate").val() == ""){
				alert("크루 종료일을 입력하세요");
			}else if($("#addr1").val() == ""){
				alert("주소를 입력하세요");
			}else if($("#addr2").val() == ""){
				alert("상세 주소를 입력하세요");
			}else if($("#c_cost").val() == ""){
				alert("발생 금액을 입력하세요");
			}else if($("#c_count").val() == ""){
				alert("제한 인원을 입력하세요");
			}else if($("#summernote").val() == ""){
				alert("상세 내용을 입력하세요");
			}else if(dateString > apply_sdate){
				alert("신청 시작일은 오늘 보다 빠르면 안됩니다");	
			}else if(apply_sdate > apply_edate){
				alert("신청 종료일은 신청 시작일 보다 빠르면 안됩니다");
			}else if(apply_edate > sdate){
				alert("크루 시작일은 신청 종료일보다 빠르면 안됩니다");
			}else if(sdate > edate){
				alert("크루 종료일은 시작일 보다 빠르면 안됩니다");
			}else{
				
				if (check_e == 'N' ){  //임시 저장 버튼을 눌렀으면 노출 데이터 N으로 insert
					
					$("#c_expose").val(check_e);
					
					if(confirm("게시글을 저장하시겠습니까?")){
						alert("임시 저장 되었습니다. MY PAGE 로 이동합니다");
						$("#crew_write_id").submit();
					}else{
						return false;
					}
				}//임시 저장 버튼
				else if (check_e == 'Y' ){  //등록하기 버튼을 눌렀으면 노출 데이터 Y로 insert 바로 노출
					
					$("#c_expose").val(check_e);
					
					if(confirm("게시글을 저장하시겠습니까?")){
						alert("리스트에 저장 되었습니다. 목록 페이지로 이동합니다");
						$("#crew_write_id").submit();
					}else{
						return false;
					}
				} //등록하기 버튼
				

			} // 조건 충족 했으면 저장 실행
		 } //writeBtn

	</script>


</head>
<body>
    <%@include file="../header_footer/header.jsp" %>



    <section>
        <div class="wrap">
            <div class="t-left">
                <h2>크루 만들기</h2>
            </div>
            <c:if test="${crewVo.c_expose == 'N' }">
	            <div class="t-right"><h1><span class="material-icons">drive_file_rename_outline</span>편집중...</h1></div>
            </c:if>
            <c:if test="${crewVo.c_expose == 'Y' }">
	            <div class="t-right"><h1><span class="material-icons">grading</span>등록중</h1></div>
            </c:if>
        </div>

        <div class="wrap">
<!-- form---------------------------------------------------------------------------------------------------------------------------------->
            <form action="./crew_modify" id="crew_write_id" method="post" enctype="multipart/form-data">
                <div class="main1">
                    <input type="hidden" id="c_expose" name="c_expose">
                    <input type="hidden" id="c_no" name="c_no" value="${crewVo.c_no }">
                    <input type="hidden" id="u_no" name="u_no" value="${crewVo.u_no }">

                    <div class="chart">
                    <p style="color: red; margin-top: 20px;">아래 내용을 빠짐없이 입력해 주세요</p>
                    
                        <table>
                            <tr>
                                <td class="info"><span class="material-icons">title</span> 제목</td>
                                <td colspan="3"><input id="c_title" name="c_title" value="${crewVo.c_title }" type="text" style="width: 600px; height: 30px; font-size: 18px;" spellcheck="false"></td>
                            </tr>
                            <tr>
                                <td class="info"><span class="material-icons">category</span> 크루종류</td>
                                <td>
                                <select name="cate_sub_no" id="cate_sub_no">
                                    <option value="2">스터디</option>
                                    <option value="4">자격증</option>
                                    <option value="6">공모전</option>
                                    <option value="8">취미및기타</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="info"><span class="material-icons">outlined_flag</span> 신청시작일</td>
                                <td><input id="c_apply_sdate" name="c_apply_sdate" value="${crewVo.c_apply_sdate }" type="date" style="width: 170px; height: 30px; font-size: 18px;" spellcheck="false"></td>
                                
                            </tr>
                            <tr>
                                <td class="info"><span class="material-icons">flag</span> 신청종료일</td>
                                <td><input id="c_apply_edate" name="c_apply_edate" value="${crewVo.c_apply_edate }" type="date" style="width: 170px; height: 30px; font-size: 18px;" spellcheck="false"></td>
                                
                            </tr>
                            <tr>
                                <td class="info"><span class="material-icons">today</span> 시작일</td>
                                <td><input id="c_sdate" name="c_sdate" value="${crewVo.c_sdate }" type="date" style="width: 170px; height: 30px; font-size: 18px;" spellcheck="false"></td>
                                
                            </tr>
                            <tr>
                                <td class="info"><span class="material-icons">event</span> 종료일</td>
                                <td><input id="c_edate" name="c_edate" value="${crewVo.c_edate }" type="date" style="width: 170px; height: 30px; font-size: 18px;" spellcheck="false"></td>
                                
                            </tr>
                            <tr>
                                <td class="info"><span class="material-icons">signpost</span> 참여방법</td>
                                <td>
                                <select name="c_how" id="c_how">
                                    <option value="온라인">온라인</option>
                                    <option value="오프라인">오프라인</option>
                                    <option value="온_오프라인_병행">온/오프라인 병행</option>
                                </select>
                                </td>
                            </tr>
<script>
/* 주소API------------------------------------------------------------------------ */
    function zipSearch(){
            new daum.Postcode({
                oncomplete: function(data) {
                    alert("다음에서 zonecode 받음 : "+data.zonecode);
                    alert("다음에서 기본주소 받음 : "+data.address);
                    
                    $("#addr1").val(data.roadAddress);
                    $("#addr1").attr("readonly",true);
                    $("#addr2").focus();
			    }
			}).open();
        } //zipSearch
/* 주소API------------------------------------------------------------------------ */
</script>
                            <tr>
                                <td class="info"><span class="material-icons">pin_drop</span> 해당지역</td>
                                <td><input type="text" id="addr1" name="c_addr1" value="${crewVo.c_addr1 }" placeholder="주소" style="width: 350px; height: 30px; font-size: 18px;" spellcheck="false"></td>
                                <td><button type="button" onclick="zipSearch()" style="font-size: 18px;" class="mod_form_btn">우편 번호 검색</button></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="3"><input type="text" id="addr2" name="c_addr2" value="${crewVo.c_addr2 }" placeholder="상세주소" style="width: 600px; height: 30px; font-size: 18px;" spellcheck="false"></td>
                            </tr>
<script>
/* 셀렉트박스------------------------------------------------------------------------ */
    $(function(){
    	$("#select2").change(function(){
    		if($(this).val()=="비용발생"){
                $("#c_cost").attr("readonly",false);
                $("#c_cost").val("");
                $("#c_cost").focus();
    		}else if($(this).val()=="해당없음"){
    			$("#c_cost").val(0);
                $("#c_cost").attr("readonly",true);
            }
        });
			
        $("#select3").change(function(){
            if($(this).val()=="인원제한"){
                $("#c_count").attr("readonly",false);
                $("#c_count").val("");
                $("#c_count").focus();
            }else if($(this).val()=="제한없음"){
    			$("#c_count").val(0);
                $("#c_count").attr("readonly",true);
            }
        });

    });
/* 셀렉트박스------------------------------------------------------------------------ */
</script>
                            <tr>
                                <td class="info"><span class="material-icons">savings</span> 비용</td>
                                <td>
                                    <select name="" id="select2">
                                        <option value="해당없음">해당없음</option>
                                        <option value="비용발생">비용발생</option>
                                    </select>
                                </td>
                                <td><input type="number" id="c_cost" name="c_cost" value="${crewVo.c_cost }"  min="0" value="0" style="width: 100px; height: 30px; font-size: 18px;" readonly spellcheck="false">원</td>
                                
                            </tr>
                            <tr>
                                <td class="info"><span class="material-icons">group</span> 최대인원</td>
                                <td>
                                    <select name="" id="select3">
                                        <option value="제한없음">제한없음</option>
                                        <option value="인원제한">인원제한</option>
                                    </select>
                                </td>
                                <td><input type="number" id="c_count" name="c_count" value="${crewVo.c_count }" min="1" value="00" style="width: 100px; height: 30px; font-size: 18px;" readonly spellcheck="false">명</td>
                                
                            </tr>
                            <tr>
                                <td class="info"><span class="material-icons">upload_file</span>파일첨부</td>
                                <td style="width: 200px;"><input type="file" name="file1" id="file1">${crewVo.c_filename }</td>
                            </tr>
                            <<tr>
                                <td class="info"><span class="material-icons">upload_file</span>썸네일</td>
                                <td style="width: 200px;"><input type="file" name="file2" id="file2">${crewVo.c_thumbnail }</td>
                            </tr>
                        </table>

                        <p><span class="material-icons">notes</span>
                            상세 설명을 입력해 주세요
                        </p>
                        <div style="margin-bottom: 300px;">
                            <textarea id="summernote" name="c_content" rows="100" cols="100" spellcheck="false">${crewVo.c_content }</textarea>
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

                <!-- <input type="text" placeholder="로드맵 파일명" spellcheck="false"> -->
                <div class="main2-btn">
                    <!-- <button class="mod_btn3"><span class="material-icons">add_road</span> 로드맵 불러오기</button> -->
                    <!-- <button class="mod_btn1" onclick="location='./mypage_crew_list.html'"><span class="material-icons">push_pin</span> 임시저장</button> -->
                    <button type="button" class="mod_btn1" onclick="writeBtn('N')"><span class="material-icons">push_pin</span> 임시저장</button>
                    <button class="mod_btn1" onclick="javascript:history.back()"><span class="material-icons">clear</span> 취소</button>
                    <button class="mod_btn2" onclick="writeBtn('Y')"><span class="material-icons">post_add</span> 등록하기</button>
                    <p>등록하기를 버튼을 눌러야 게시글이 등록이 됩니다.<br>그 전에는 크루 관리를 이용해 주세요</p>
                </div>

            </div>
        </div>
    </section>
</body>
</html>