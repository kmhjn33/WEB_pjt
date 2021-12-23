package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardCommentLikeVo {

	private int b_comm_like_no;
	private int b_comm_no;
	private Timestamp b_comm_like_date;
	private int u_no;

}
