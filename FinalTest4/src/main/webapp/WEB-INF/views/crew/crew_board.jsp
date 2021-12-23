<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/board_common.css" />
        <link rel="stylesheet" href="../css/board_list.css" />
        <link rel="stylesheet" href="../css/board_view.css" />
        <link rel="stylesheet" href="../css/crew_board.css" />
        <link rel="stylesheet" href="../css/mypage.css" />
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="../js/board_view.js"></script>
        <title>view</title>

        <link rel="stylesheet" href="../css/header.css">
        <!-- 구글 아이콘 링크 -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    </head>
    <body>

        <%@include file="../header_footer/header.jsp" %>

        <content>
            <div id="board_page_wrap">

                    <div id="mypage_head">
                        <div id="mypage_title">
                            <h2>${ map.crewVo.c_title }</h2>
                        </div>
                    </div>

                <!-- //view 시작 -->
                <div id="board_body_wrap">
                    
                    <div id="view_bottom">
                        <div>
                            <table class="detail_table">
                                <tr>
                                    <th>시작일</th>
                                    <td>${ map.crewVo.c_sdate }</td>
                                </tr>
                                <tr>
                                    <th>종료일</th>
                                    <td>${ map.crewVo.c_edate }</td>
                                </tr>
                                <tr>
                                    <th>상세내용</th>
                                    <td>${ map.crewVo.c_content }</td>
                                </tr>
                            </table>
                        </div>
                        <a href="/crew_view?c_no=${ map.crewVo.c_no }&u_no=${ session_u_no }">자세히 보기</a>
                    </div>
                </div> <!-- //board_body_wrap -->
                <!-- //view 끝 -->

                <div id="comment_wrap">
                    
                    <!-- 댓글 작성 -->
                    <div>
                        <div id="comm_write_wrap">
                            <form action="" method="POST" id="" enctype="multipart/form-data">
                                <textarea name="b_comm_content " id="comm_write" maxlength="500" placeholder="내용을 입력하세요. (최대 500글자)"></textarea>
                                <button type="button" onclick="" class="c_pointer comm_write_btn">등록</button>
                                <input type="file" name="c_b_file" id="c_b_file">
                            </form>
                        </div>
                    </div>

                    <!-- 댓글 부분 -->
                    <c:forEach items="${ map.crewBoardList }" var="crewBoardList">
	                    <div class="comment" id="${ crewBoardList.c_b_no }">
	                        <div class="comment_content">
	                            <div>${ crewBoardList.c_b_content }</div>
	                        </div> <!-- //comment_content -->
	
	                        <div class="comment_info">
	                            <div class="comm_info_left">
	                                <span>${ crewBoardList.u_no }</span>
	                                <span>|</span>
	                                <span>${ crewBoardList.c_b_date }</span>
	                                <!-- 댓글 작성자만 -->
	                                <span>|</span>
	                                <span class="c_pointer h_bold" onclick="">수정</span>
	                                <span>|</span>
	                                <span class="c_pointer h_bold" onclick="">삭제</span>
	                                <!-- //댓글 작성자만 -->
	                            </div>
	                            <c:if test="${ crewBoardList.c_b_file != null }">
	                            <div class="comm_info_right">
	                                <span>첨부 파일 : </span>
	                                <span><a href="/upload/${ crewBoardList.c_b_file }" download="">${ crewBoardList.c_b_file }</a></span>
	                            </div>
	                            </c:if>
	                        </div> <!-- //comment_info -->
	                    </div> <!-- //comment -->
                    </c:forEach>    
                    <!-- //댓글 부분 --> 

                   
                    <!-- 댓글 수정시 -->    
                    <div class="comment">
                        <div class="comment_content">
                            <div class="comm_modi_text">
                                <textarea name="b_comm_content" id="comm_modify" maxlength="500" placeholder="내용을 입력하세요. (최대 500글자)"></textarea>
                            </div>
                            <div>
                                <input type="file" name="">
                            </div>

                        </div> <!-- //comment_content -->

                        <div class="comment_info">
                            <div class="comm_info_left">
                                <span>댓글작성자</span>
                                <span>|</span>
                                <span>2021-11-15 12:56:21</span>
                            </div>
                            <div class="comm_info_right">
                                <span class="c_pointer comm_mod_ok h_bold" onclick="">완료</span>
                                <span>|</span>
                                <span class="c_pointer comm_mod_cancle h_bold" onclick="">취소</span>
                            </div>
                        </div> <!-- //comment_info -->
                    </div> <!-- //comment -->
                    <!-- //댓글 수정시 --> 
                    
                    
                </div> <!-- //comment_wrap -->

                <div id="board_bottom">
                    <ul id="pagination">
                        <li><a href="#" id="first_page"><i class="fas fa-angle-double-left"></i></a></li>
                        <li><a href="#" id="prev_page"><i class="fas fa-angle-left"></i></a></li>
                        <li><a href="#" class="page_num sel_page">1</a></li>
                        <li><a href="#" class="page_num">2</a></li>
                        <li><a href="#" class="page_num">3</a></li>
                        <li><a href="#" class="page_num">4</a></li>
                        <li><a href="#" class="page_num">5</a></li>
                        <li><a href="#" id="next_page"><i class="fas fa-angle-right"></i></a></li>
                        <li><a href="#" id="last_page"><i class="fas fa-angle-double-right"></i></a></li>
                    </ul>
                   
                </div> <!-- //board_bottom -->
                

            </div> <!-- //board_page_wrap -->

        </content>

        
    </body>
</html>