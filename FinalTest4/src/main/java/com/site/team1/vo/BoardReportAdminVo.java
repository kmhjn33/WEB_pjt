package com.site.team1.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardReportAdminVo {

	private int b_report_no;    
	private int u_no;    
	private Date b_report_date;          
	private String b_report_content; 
	private int b_post_no;    
	private String u_name;
	
}
