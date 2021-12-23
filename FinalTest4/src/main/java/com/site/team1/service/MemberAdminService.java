package com.site.team1.service;

import java.util.List;

import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.ChartVo;
import com.site.team1.vo.MemberAdminVo;

public interface MemberAdminService {

	public int selectMemberListCount(BoardNumberVo nDto);

	public List<MemberAdminVo> selectMemberList(BoardNumberVo nDto);

	public MemberAdminVo selectUserInfobyID(int u_no);
	
	public int user_out(int u_no);
	
	public List<ChartVo> selectChart01();
	
	public List<ChartVo> selectChart02();
	
	public List<ChartVo> selectChart03();
	

}
