package com.site.team1.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RoadmapNumberVo {

	private int page;
	private int limit;
	private int numLimit;
	private int listCount;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int startrow;
	private int endrow;
	private int cate_sub_no;
}
