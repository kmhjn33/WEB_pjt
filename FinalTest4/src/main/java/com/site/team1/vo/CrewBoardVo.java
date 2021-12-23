package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CrewBoardVo {

	private int c_b_no;
	private String c_b_content;
	private int c_no;
	private int u_no;
	private Timestamp c_b_date;
	private String c_b_file;

}
