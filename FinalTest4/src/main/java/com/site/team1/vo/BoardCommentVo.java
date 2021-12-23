package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardCommentVo {

	private int b_comm_no;
	private String b_comm_content;
	private int b_comm_group;
	private int b_comm_reply;
	private Timestamp b_comm_date;
	private Timestamp b_comm_moddate;
	private int b_post_no;
	private int u_no;
	private String b_comm_expose;

}
