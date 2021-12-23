package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardReportVo {

	private int b_report_no;
	private int u_no;
	private Timestamp b_report_date;
	private String b_report_content;
	private int b_post_no;
	
}
