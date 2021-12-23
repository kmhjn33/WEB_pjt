package com.site.team1.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserInfoVo {

	private int u_no;
	private int u_detail_no;
	private String u_name;
	private	String u_id;
	private String u_pw;
	private String u_tel;
	private String u_email;
	private String u_nickName;
	private String u_profile;
	private Timestamp u_signDate;
	private Timestamp u_finalDate;
	private Timestamp u_modDate;
	private String u_intro;
	
	
}


