package com.site.team1.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.site.team1.vo.CrewVo;
import com.site.team1.vo.UserInfoVo;

@Mapper
public interface CrewWriteMapper {

	//크루 생성 (글 저장) insert
	int insertWrite(CrewVo crewVo);

	//크루 수정하기 뿌려주기
	CrewVo selectOne(int c_no);

	//프로필 뿌리기
	UserInfoVo selectUser(int c_no);

	//수정하기
	int updateCrew(CrewVo crewVo);

}
