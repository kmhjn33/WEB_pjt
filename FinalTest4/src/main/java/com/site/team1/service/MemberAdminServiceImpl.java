package com.site.team1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.MemberAdminMapper;
import com.site.team1.vo.BoardNumberVo;
import com.site.team1.vo.ChartVo;
import com.site.team1.vo.MemberAdminVo;



@Service
public class MemberAdminServiceImpl implements MemberAdminService {

	@Autowired MemberAdminMapper memberAdminMapper;
	
	@Override
	public int selectMemberListCount(BoardNumberVo nDto) {
		int memberCount=memberAdminMapper.selectMemberListCount(nDto);
		return memberCount;
	}	// 회원 조회 리스트 count

	@Override
	public List<MemberAdminVo> selectMemberList(BoardNumberVo nDto) {
		List<MemberAdminVo> list=memberAdminMapper.selectMemberList(nDto);
		return list;
	}	// 회원 리스트 조회

	@Override
	public MemberAdminVo selectUserInfobyID(int u_no) {
		MemberAdminVo mDto=memberAdminMapper.selectUserInfobyIdMap(u_no);
		return mDto;
	} // 회원 정보 조회

	@Override
	public int user_out(int u_no) {
		int result=0;
		result=memberAdminMapper.user_outMap(u_no);
		return result;
	}//회원 탈퇴처리

	@Override
	public List<ChartVo> selectChart01() {
		List<ChartVo> list=memberAdminMapper.selectChart01();
		return list;
	}

	@Override
	public List<ChartVo> selectChart02() {
		List<ChartVo> list=memberAdminMapper.selectChart02();
		return list;
	}

	@Override
	public List<ChartVo> selectChart03() {
		List<ChartVo> list=memberAdminMapper.selectChart03();
		return list;
	}



	
	
}
