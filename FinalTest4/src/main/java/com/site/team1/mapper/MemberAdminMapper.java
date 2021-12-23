package com.site.team1.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.ChartVo;
import com.site.team1.vo.MemberAdminVo;

@Mapper
public interface MemberAdminMapper {

	public List<MemberAdminVo> selectMemberList(BoardNumberVo nDto);
	
	public int selectMemberListCount(BoardNumberVo nDto);

	public MemberAdminVo selectUserInfobyIdMap(int u_no);
	
	public int user_outMap(int u_no);
	
	//차트1
	public List<ChartVo> selectChart01();
	
	//차트2
	public List<ChartVo> selectChart02();
	
	//차트3
	public List<ChartVo> selectChart03();
	
}
