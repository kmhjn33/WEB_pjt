package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardLikeVo {

	private int b_like_no;
	private Timestamp b_like_date;
	private int u_no;
	private int b_post_no;

}
