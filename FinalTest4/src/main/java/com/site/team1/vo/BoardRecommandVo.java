package com.site.team1.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardRecommandVo {

	private int b_comm_like_no; 
	private int b_comm_no; 
	private Date b_comm_like_date;       
	private int u_no;
	private String u_name;
	
}
