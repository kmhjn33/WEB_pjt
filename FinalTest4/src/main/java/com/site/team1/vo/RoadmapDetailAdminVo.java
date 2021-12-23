package com.site.team1.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RoadmapDetailAdminVo {

	
	private int rnum;
	private int r_detail_no;    
	private String r_detail_title;  
	private Date r_detail_date;          
	private String r_detail_content; 
	private String r_detail_priority;  
	private Date r_detail_startdate;          
	private Date r_detail_enddate;          
	private int r_no;
	private String s_name;
	private String u_name;
	private int s_no;    
	private String r_detail_state;  
	private String r_detail_grade;
	private int r_grade_ct;
	private int textbook_no;
	private String cate_sub_name;
	private int r_count;

}