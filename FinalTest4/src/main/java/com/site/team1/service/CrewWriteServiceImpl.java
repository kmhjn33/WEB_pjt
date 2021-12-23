package com.site.team1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.CrewWriteMapper;
import com.site.team1.vo.CrewVo;
import com.site.team1.vo.UserInfoVo;

@Service
public class CrewWriteServiceImpl implements CrewWriteService {
	
	@Autowired
	CrewWriteMapper crewWriteMapper;

	@Override  //크루 생성 (글 저장) insert
	public int write(CrewVo crewVo) {
		
		/*
		 * System.out.println(crewVo.getC_title());
		 * System.out.println(crewVo.getU_no());
		 * System.out.println(crewVo.getCate_sub_no());
		 * System.out.println(crewVo.getC_apply_sdate());
		 * System.out.println(crewVo.getC_apply_edate());
		 * System.out.println(crewVo.getC_sdate());
		 * System.out.println(crewVo.getC_edate());
		 * System.out.println(crewVo.getC_how());
		 * System.out.println(crewVo.getC_addr1());
		 * System.out.println(crewVo.getC_addr2());
		 * System.out.println(crewVo.getC_cost());
		 * System.out.println(crewVo.getC_count());
		 * System.out.println(crewVo.getC_filename());
		 * System.out.println(crewVo.getC_content());
		 */
		
		int result = crewWriteMapper.insertWrite(crewVo);
		return result;
	}

	@Override  //크루 수정하기 뿌려주기
	public CrewVo selectOne(int c_no) {

		CrewVo crewVo = crewWriteMapper.selectOne(c_no);
		
		return crewVo;
	}

	@Override  //프로필 가져오기
	public UserInfoVo selectUser(int c_no) {
		
		UserInfoVo userInfoVo = crewWriteMapper.selectUser(c_no);
		
		return userInfoVo;
	}

	@Override  //수정 완료하기
	public int modify(CrewVo crewVo) {
		int result = crewWriteMapper.updateCrew(crewVo);
		return result;
	}

}
