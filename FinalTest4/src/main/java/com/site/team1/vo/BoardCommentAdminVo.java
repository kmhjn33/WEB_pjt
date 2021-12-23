package com.site.team1.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardCommentAdminVo {

	private int b_comm_no;
	private String b_comm_content; 
	private int b_comm_group;     
	private int b_comm_reply;      
	private Date b_comm_date;           
	private Date b_comm_moddate;
	private int b_post_no;
	private int u_no;
	private String b_comm_expose;

}
