package com.site.team1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.team1.mapper.CrewMapper;
import com.site.team1.vo.CategorySubVo;
import com.site.team1.vo.CrewEntryVo;
import com.site.team1.vo.CrewLikeVo;
import com.site.team1.vo.CrewVo;
import com.site.team1.vo.UserInfoVo;

@Service
public class CrewServiceImpl implements CrewService {

	@Autowired
	CrewMapper crewMapper;
	
	
	@Override  //해당 카테고리 리스트 가져오기
	public List<CrewVo> crewStudy(int cate_sub_no) {
		
		List<CrewVo> list = crewMapper.selectStudyList(cate_sub_no);
		return list;
	}

	@Override  //카테고리 이름 가져오기
	public CategorySubVo cataName(int cate_sub_no) {
		CategorySubVo categorySubVo = crewMapper.selectCateSubName(cate_sub_no);
		return categorySubVo;
	}


	@Override  //크루 상세보기 게시글 1개 가져오기
	public CrewVo selectCrewOne(int c_no) {
		//System.out.println("넘기는 값 : "+c_no);
		CrewVo crewVo = crewMapper.selectCrewOne(c_no);
		//System.out.println("받아온 값 : "+crewVo.getC_no());
		return crewVo;
	}

	@Override  //참여하고 싶어요 갯수 가져오기
	public List<CrewEntryVo> entryCount(int c_no) {
		
		List<CrewEntryVo> entrylist = crewMapper.selectEntryCount(c_no);
		return entrylist;
	}
	@Override  //관심있어요 갯수 가져오기
	public List<CrewLikeVo> likeCount(int c_no) {
		List<CrewLikeVo> likelist = crewMapper.selectLikeCount(c_no);
		return likelist;
	}



	
	@Override  //참여하고 싶어요
	public Map<String, Object> hope(CrewEntryVo crewEntryVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		//crew_entry에 데이터 저장
		crewMapper.insertCrewEntry(crewEntryVo);
		//참여하고 싶어요 갯수 다시 가져오기
		int eCount = crewMapper.selectCount(crewEntryVo);
		//c_entry_No 객체 받아오기
		CrewEntryVo entryVo = crewMapper.selectEntryNo(crewEntryVo);
		
		System.out.println("c_entry_no : "+entryVo.getC_entry_no());
		
		map.put("eCount", eCount);
		map.put("entryVo", entryVo);
		
		return map;
	}
	@Override  //관심있어요
	public Map<String, Object> interesting(CrewLikeVo crewLikeVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		//crew_like 에 데이터 저장
		crewMapper.insertCrewLike(crewLikeVo);
		//관심있어요 갯수 다시 가져오기
		int lCount = crewMapper.selectCount2(crewLikeVo);
		//c_like_no 객체 받아오기
		CrewLikeVo likeVo = crewMapper.selectLikeNo(crewLikeVo);
		
		map.put("lCount", lCount);
		map.put("likeVo", likeVo);
		
		return map;
	}


	@Override  //참여하고 싶어료 취소취소
	public int entryCancle(int c_entry_no) {
		int result = crewMapper.deleteEntry(c_entry_no);
		return result;
	}
	@Override  //관심있어요 취소취소
	public int likeCancle(int c_like_no) {
		int result = crewMapper.deleteLike(c_like_no);
		return result;
	}


	@Override  //참여 하고 싶어요 눌렀는지 안눌렀는지 확인하고 조건 주기
	public CrewEntryVo checkEnrty(int c_no, int u_no) {
		CrewEntryVo crewEntryVo = crewMapper.checkEnrty(c_no,u_no);
		return crewEntryVo;
	}


	@Override  //관심 있어요 눌렀는지 안눌렀는지 확인하고 조건 주기
	public CrewLikeVo checkLike(int c_no, int u_no) {
		CrewLikeVo crewLikeVo = crewMapper.checkLike(c_no,u_no);
		return crewLikeVo;
	}

	@Override  //프로필 가져오기
	public UserInfoVo selectProfile(int c_no) {

		UserInfoVo userInfoVo = crewMapper.selectProfile(c_no);
		
		return userInfoVo;
	}

	@Override  //크루 생성 시 내 프로필 가져오기
	public UserInfoVo selectProfile2(int u_no) {

		UserInfoVo userInfoVo = crewMapper.selectProfile2(u_no);
		
		return userInfoVo;
	}

	@Override  //참여 희망 인원 리스트에 담아 모달에 뿌리기
	public List<UserInfoVo> entryUser(int c_no) {

		List<UserInfoVo> modalList = crewMapper.entryUser(c_no);
		
		return modalList;
	}









	





}
