package com.site.team1.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RoadmapVo {

	private int r_no;
	private String r_name;
	private String r_expose;
	
	private int u_no;
	private int cate_sub_no;
}
