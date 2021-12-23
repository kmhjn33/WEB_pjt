package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RoadmapDetailVo {
	
	private int u_no;
	
	private int r_detail_no;
	private String r_detail_title;
	private Timestamp r_detail_date;
	private String r_detail_content;
	private String r_detail_priority;
	private Timestamp r_detail_startdate;
	private String r_detail_state;
	private String r_detail_grade;
	private Timestamp r_detail_enddate;
	
	private int r_no;
	
	private int s_no;
	private String s_name;
	
	private int textbook_no;
	private String textbook_content;
}
