package com.site.team1.service;

import com.site.team1.vo.CrewVo;
import com.site.team1.vo.UserInfoVo;

public interface CrewWriteService {

	//크루 생성 (글 저장) insert
	int write(CrewVo crewVo);

	//크루 수정하기 뿌려주기
	CrewVo selectOne(int c_no);

	//프로필 가져오기
	UserInfoVo selectUser(int c_no);

	//수정 완료하기
	int modify(CrewVo crewVo);

}
