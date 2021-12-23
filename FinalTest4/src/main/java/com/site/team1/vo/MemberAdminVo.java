package com.site.team1.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberAdminVo {

	private int rnum;
	private int u_no ;
	private int u_detail_no ;
	private String u_detail_type;
	private String u_name ;
	private String u_id ;
	private String u_pw ;
	private String u_tel ;
	private String u_email ;
	private String u_nickname;
	private String u_profile;
	private Timestamp u_signdate;
	private Timestamp u_finaldate;
	private Timestamp u_moddate;
	private String u_intro;
	private int reported;
	private int board;
	private int crew;
	private int roadmap;
	
}
