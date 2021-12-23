package com.site.team1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.MyCrewMapper;
import com.site.team1.vo.CrewEntryVo;
import com.site.team1.vo.CrewLikeVo;
import com.site.team1.vo.CrewVo;

@Service
public class MyCrewServiceImple implements MyCrewService {

	@Autowired
	MyCrewMapper myCrewMapper;
	
	
	@Override  //내 크루 전체 가져오기
	public List<CrewVo> getMyCrew(int u_no) {
		List<CrewVo> list = myCrewMapper.getMyCrew(u_no);
		return list;
	}

	@Override //관심 크루 갯수 가져오기
	public List<CrewVo> getCrewLike(int u_no) {
		List<CrewVo> likeList = myCrewMapper.getCrewLike(u_no);
		return likeList;
	}

	@Override  //참여하고 싶어요 갯수 크루 가져오기
	public List<CrewVo> getCrewEntry(int u_no) {
		List<CrewVo> entryList = myCrewMapper.getCrewEntry(u_no);
		return entryList;
	}

	@Override  //진행중 크루 갯수 가져오기
	public List<CrewVo> getIngList(int u_no) {
		List<CrewVo> ingList = myCrewMapper.getIngList(u_no);
		return ingList;
	}

	@Override  //완료된 크루 갯수 가져오기
	public List<CrewVo> getEndList(int u_no) {
		List<CrewVo> endList = myCrewMapper.getEndList(u_no);
		return endList;
	}

	@Override  //임시저장 크루 갯수 가져오기
	public List<CrewVo> getNlist(int u_no) {
		List<CrewVo> Nlist = myCrewMapper.getNlist(u_no);
		return Nlist;
	}

	@Override  //모집중 크루 갯수 가져오기
	public List<CrewVo> getRecruitList(int u_no) {
		List<CrewVo> recruitList = myCrewMapper.getRecruitList(u_no);
		return recruitList;
	}

	@Override  //시작대기 크루 갯수 가져오기
	public List<CrewVo> getReadyList(int u_no) {
		List<CrewVo> readyList = myCrewMapper.getReadyList(u_no);
		return readyList;
	}

	@Override  // 숫자 버튼 클릭 시 해당 리스트로 변경
	public List<CrewVo> getChangeList(int u_no, int num) {
		List<CrewVo> changeList = null;
		
		if ( num ==1) {
			changeList = myCrewMapper.getCrewLike(u_no);
		}else if (num ==2) {
			changeList = myCrewMapper.getCrewEntry(u_no);
		}else if ( num ==3) {
			changeList = myCrewMapper.getIngList(u_no);
		}else if ( num ==4) {
			changeList = myCrewMapper.getEndList(u_no);
		}else if ( num ==5) {
			changeList = myCrewMapper.getNlist(u_no);
		}else if (num ==6) {
			changeList = myCrewMapper.getRecruitList(u_no);
		}else if ( num ==7) {
			changeList = myCrewMapper.getReadyList(u_no);
		}else if ( num ==8) {
			changeList = myCrewMapper.getMyCrew(u_no);
		}
		
		return changeList;
	}

	@Override  // 해당 크루 삭제
	public int crewDelete(int c_no) {
		//크루테이블 데이터만 지우면 무결성제약조건 때문에 에러 남
		//참조 걸려 있는 데이터부터 삭제 후 최종 크루 테이블 데이터 삭제
		int result = myCrewMapper.likeDelete(c_no);
		result += myCrewMapper.entryDelete(c_no);
		result += myCrewMapper.crewDelete(c_no);
		
		return result;
	}


}
