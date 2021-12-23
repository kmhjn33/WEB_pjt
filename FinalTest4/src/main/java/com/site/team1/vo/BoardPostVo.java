package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardPostVo {

	private int b_post_no;
	private String b_post_title;
	private String b_post_content;
	private Timestamp b_post_date;
	private Timestamp b_post_moddate;
	private String b_post_hit;
	private int b_cate_no;
	private int u_no;
	private String b_post_expose;

}
