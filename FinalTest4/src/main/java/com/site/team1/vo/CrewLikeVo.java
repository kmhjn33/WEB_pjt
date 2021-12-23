package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CrewLikeVo {

	private int c_like_no;
	private Timestamp c_like_date;
	private int u_no;
	private int c_no;
}

