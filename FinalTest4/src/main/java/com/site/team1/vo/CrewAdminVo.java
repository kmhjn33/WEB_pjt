package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CrewAdminVo {

	
	private int rnum;
	private int c_no;     
	private String c_title;   
	private Timestamp c_apply_sdate;           
	private Timestamp c_apply_edate;           
 	private int cate_sub_no;
 	private String cate_sub_name;
	private String c_expose;    
	private int u_no;
	private String u_name;
	private String u_profile;
	private int r_no;     
	private String c_how;   
	private String c_content; 
	private int c_count;         
	private int c_min;         
	private int c_max;         
	private Timestamp c_sdate;           
	private Timestamp c_edate;           
	private String c_filename;  
	private String c_addr1;  
	private String c_addr2;  
	private int c_cost;
	private String c_thumbnail;
	

}	// 크루 관리자 테이블
