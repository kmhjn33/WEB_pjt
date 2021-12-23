package com.site.team1.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardFileAdminVo {

	private int b_file_no;
	private String b_file_name;
	private int b_post_no;    
	private String b_file_alt; 
	private Date b_file_date;
	private Date b_file_moddate;
	private String b_file_path; 
	
}
