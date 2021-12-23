package com.site.team1.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RoadmapDetailOutVo {

	private RoadmapDetailVo roadmapDetailVo;
	private SubjectVo subjectVo;
	private TextbookVo textbookVo;
}