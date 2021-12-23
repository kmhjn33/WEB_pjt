package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardListPost {

	private int b_post_no;
	private String b_post_title;
	private String b_post_content;
	private Timestamp b_post_date;
	private Timestamp b_post_moddate;
	private String b_post_hit;
	private String b_post_expose;
	
	private int b_cate_no;
	private String b_cate_name;
	private int b_no;
	
	private int u_no;
	private int u_detail_no;
	private String u_name;
	private String u_id;
	private String u_pw;
	private String u_tel;
	private String u_email;
	private String u_nickName;
	private String u_profile;
	private Timestamp u_signDate;
	private Timestamp u_finalDate;
	private Timestamp u_modDate;
	private String u_intro;
	
	
	private int b_like_count;
	private int b_comm_count;
	
//	private BoardCateVo boardCateVo;
//	private BoardPostVo boardPostVo;
//	private UserInfoVo userInfoVo;
	
}
