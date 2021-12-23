package com.site.team1.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardPostAdminVo {

	private int rnum;
	private int b_post_no;     
	private String b_post_title;   
	private String b_post_content; 
	private Timestamp b_post_date;           
	private Timestamp b_post_moddate;           
	private int b_post_hit;         
	private int b_cate_no;     
	private String b_cate_name;
	private String b_name;
	private int u_no; 
	
}
