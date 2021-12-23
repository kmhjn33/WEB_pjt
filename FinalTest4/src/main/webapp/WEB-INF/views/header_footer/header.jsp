<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        
		<script>
		 function soWhat(){
			 if ( ${session_u_id == null} ){
				 alert("로그인 후 이용가능합니다.");
				 location.href="/main";
			 }
		 }
		</script>
		
<header>
        <div class="total_header_wrap">
            <div class="total_header_nav">
    
                <div class="total_header_left">
                    <div class="total_header_logo">
                        <a href="/main"><img src="/images/imsilogo.png" alt="logo"></a>
                    </div>
    
                    <div class="total_header_cate">
                        <ul class="header_left_f_ul">
                            <c:if test="${session_u_id != null }">                        	  
                          	  <li class="header_left_f_li"><a href="/roadmap/my_roadmap">로드맵</a></li>
                        	</c:if>      
                        	<c:if test="${session_u_id == null }">
                          	  <li class="header_left_f_li"><a onclick="soWhat()">로드맵</a></li><!-- href="/main"  -->
                        	</c:if>
                            <li class="header_left_f_li"><a href="/board/list">게시판</a>
                                <div class="header_open_cate">
                                    <ul class="header_left_ul_inner">
                                        <li class="header_left_li_inner"><a href="/board/list/1">자유게시판</a></li>
                                        <li class="header_left_li_inner"><a href="/board/list/2">질문게시판</a></li>
                                        <li class="header_left_li_inner"><a href="/board/list/3">정보게시판</a></li>
                                        <li class="header_left_li_inner"><a href="/board/list/4">공지사항</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="header_left_f_li"><a href="/crew_index">크루</a>
                                <div class="header_open_cate">
                                    <ul class="header_left_ul_inner">
                                        <li class="header_left_li_inner"><a href="/crew_list?cate_sub_no=2">학습</a></li>
                                        <li class="header_left_li_inner"><a href="/crew_list?cate_sub_no=4">자격증</a></li>
                                        <li class="header_left_li_inner"><a href="/crew_list?cate_sub_no=6">공모전</a></li>
                                        <li class="header_left_li_inner"><a href="/crew_list?cate_sub_no=8">생활 | 기타</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
    
                    </div>
    
                </div>
            
    
                <div class="total_header_right">
                
                    <ul class="total_header_user">
                        <c:if test="${session_u_id != null && session_u_id != 'admin'}">
                        <li class="header_right_f_li"><a href=""><span id="accountaccount" class="material-icons">account_circle</span></a>
                            <div class="header_open_user">
                                <ul class="header_right_ul_inner">
                                    <li class="header_right_li_inner"><a href="/mypage/my_info">내정보관리</a></li>
                                    <li class="header_right_li_inner"><a href="/mypage_crew_list?u_no=${ session_u_no }">크루관리</a></li>
                                    <li class="header_right_li_inner"><a href="/roadmap/my_roadmap">로드맵관리</a></li>
                                    <li class="header_right_li_inner"><a href="/myboard">게시물관리</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="header_right_f_li"><a href="/user/logout"><span class="material-icons" style="font-size: 15px;">logout</span><span> 로그아웃</span></a></li>
                        <li class="header_right_f_li"><a href="/mypage/mypage"><span> 마이페이지</span></a></li>
                        </c:if>
                        <c:if test="${session_u_id == null}">
                            <li class="header_right_f_li"><a href="/user/signUpEmail"><span class="material-icons" style="font-size: 15px;"></span><span> 회원가입</span></a></li>
                            <li class="header_right_f_li"><a href="/user/login"><span class="material-icons" style="font-size: 15px;">login </span><span> 로그인</span></a></li>
                        </c:if>
                        
                        <c:if test="${session_u_id == 'admin'}">
                            <li class="header_right_f_li"><a href="/admin/member_info"><span class="material-icons" style="font-size: 15px;"></span><span> 관리자</span></a></li>
                            <li class="header_right_f_li"><a href="/user/logout"><span class="material-icons" style="font-size: 15px;">logout</span><span> 로그아웃</span></a></li>
                        </c:if>
                        
                    </ul>
              
                </div>
    
                <!-- <div class="search_menumenu">
                    <form action="">
                      <input type="text" placeholder="검색어를 입력하세요" name="search">
                      <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div> -->
    
            </div>
    
        </div>
    
    </header>
    
