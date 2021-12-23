package com.site.team1.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.team1.service.CrewWriteService;
import com.site.team1.vo.CrewVo;
import com.site.team1.vo.UserInfoVo;

@Controller
public class CrewWriteController {
	
	@Autowired
	CrewWriteService crewWriteService;
	

	@RequestMapping("/summerUpload")
	@ResponseBody
	public String summerUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		//파일이름 가져오기
		String newFileName = "";
		
		// 업로드할 폴더 경로
		String realFolder = "c:/team1FileSave/";//저장될 외부 파일 경로 //c:/team1FileSave/

		// 업로드할 파일 이름
		String originFileName = file.getOriginalFilename();
		System.out.println("originFileName : " + originFileName);
		long time = System.currentTimeMillis();
		// 1개의 파일이름을 변형해서 다시 저장
		newFileName = String.format("%d_%s", time, originFileName);

		System.out.println("원본 파일명 : " + originFileName);
		System.out.println("저장할 파일명 : " + newFileName);

		String filepath = realFolder + "/" + newFileName;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		file.transferTo(f);
		System.out.println("/upload/"+newFileName);

		return "/upload/"+newFileName;
	}
	
	public String fileSave(MultipartFile file) {
		
		String newFileName = "";
		
		if( file.getSize() != 0) {
			
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); //01241514545512
			//중복방지 파일이름생성
			newFileName = String.format("%d_%s", time,originFileName); 
			//파일 저장 위치
			String fileSaveUrl="c:/team1FileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl+newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return newFileName;
	}
	
	//크루 생성 (글 저장) insert
	@RequestMapping("/crew_insert")
	public String crew_insert(CrewVo crewVo, @RequestPart MultipartFile file1, @RequestPart MultipartFile file2) {
		
		//파일이름 Vo 저장
		crewVo.setC_filename(fileSave(file1));
		crewVo.setC_thumbnail(fileSave(file2));
		
		int result = crewWriteService.write(crewVo);
		System.out.println("글저장 result : "+result);
		System.out.println("글 저장 u_no : "+crewVo.getU_no());
		if (crewVo.getC_expose().equals("Y")) {
			
			return "redirect:./crew_list?cate_sub_no="+crewVo.getCate_sub_no()+"";
		}else {
			return "redirect:./mypage_crew_list?u_no="+crewVo.getU_no()+"";
		}
		
		
	}
	
	
	// 수정하기 페이지로 이동
	@RequestMapping("/crew_modify_view")
	public String crew_modify_view(@RequestParam int c_no, Model model) {
		//게시내용 뿌리기
		CrewVo crewVo = crewWriteService.selectOne(c_no);
		model.addAttribute("crewVo", crewVo);
		//만든 놈 = 나 프로필 가져오기
		UserInfoVo userInfoVo = crewWriteService.selectUser(c_no);
		model.addAttribute("userInfoVo", userInfoVo);
		
		return "crew/crew_modify";
	}
	
	
	//수정 완료하기
	@RequestMapping("/crew_modify")
	public String crew_modify(CrewVo crewVo, @RequestPart MultipartFile file1, @RequestPart MultipartFile file2) {
		System.out.println(crewVo.getC_no());
		System.out.println(crewVo.getU_no());
		System.out.println(crewVo.getC_title());
		//파일이름 Vo 저장
		if (file1 != null || file2 != null) {
			crewVo.setC_filename(fileSave(file1));
			crewVo.setC_thumbnail(fileSave(file2));
		}
		
		int result = crewWriteService.modify(crewVo);
		
		if (crewVo.getC_expose().equals("Y")) {
			
			return "redirect:./crew_list?cate_sub_no="+crewVo.getCate_sub_no()+"";
		}else {
			return "redirect:./mypage_crew_list?u_no="+crewVo.getU_no()+"";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}
