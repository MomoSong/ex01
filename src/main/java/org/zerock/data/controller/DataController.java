package org.zerock.data.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.board.dto.Criteria;
import org.zerock.data.dto.DataDTO;
import org.zerock.data.service.DataService;
import org.zerock.util.UploadFileUtils;

// 객체 자동적으로 생성되는 어노테니션
// - @Controller, @Service, @Repository(dao),
//   @Conponent(aop), @RestController(ajax)
@Controller
@RequestMapping("/data")
public class DataController {

	@Inject
	private DataService service;
	
	// servlet-context.xml에 선언한 bean을 사용한다.
	@Resource(name="uploadPath")
	private String uploadPath;
	
//	private String uploadPath = "c:\\zzz\\upload";
	
	// 자료실 글 리스트
	// return String -> jsp를 직접 지정
	// return을 void로 url안에 마지막 부분이 jsp가 된다.(/data/list.jsp)
	@RequestMapping(value="/list", method= RequestMethod.GET)
	public void list(Model model, Criteria cri) {
		 System.out.println(getClass().getSimpleName()+".list()");
		 model.addAttribute("list", service.list(cri));
		 model.addAttribute("cri", cri);
	}
	
	// 자료실 글보기
	@RequestMapping(value="/view", method= RequestMethod.GET)
	public void view(int no, Model model) {
		// 게시글 내용
		model.addAttribute("dto", service.view(no, true));
		// 첨부파일 리스트
		model.addAttribute("list", service.getFiles(no));
		
	}
	// 자료실 글쓰기 폼
	@RequestMapping(value="/write", method= RequestMethod.GET)
	public void writeForm() {
		
	}
	
	// 자료실 글쓰기 처리 - 첨부파일이 있다.
	@RequestMapping(value="/write", method= RequestMethod.POST)
	public String write(DataDTO dto) throws Exception{
		System.out.println(dto);
		// 파일 업로드 처리를 한다.
		String originalName = dto.getFile1().getOriginalFilename();
		if(originalName.equals("")) System.out.println("빈문자");
		String savedFile = "";
		// 첨부 파일이 없으면 저장하지 않고 있으면 저장한다.
		if(!originalName.equals("")) {
			// 날짜폴더가 포함된 파일명
			savedFile 
			= UploadFileUtils.uploadFile(uploadPath, originalName,
					dto.getFile1().getBytes());
			dto.setSavedFile(savedFile);
			dto.setFilecnt(1);
		}
		
		// 데이터를 db에 저장
		service.insert(dto);
		return "redirect:list";
	}
	
	
	// ModelAndView 객체를 이용한 jsp forward
	// 자료실 글수정 폼
	@RequestMapping(value="/update", method= RequestMethod.GET)
	public ModelAndView updateForm() {
		ModelAndView mav = new ModelAndView();
		// jsp 셋팅 --> return jsp String;
		mav.setViewName("/data/update");
		// data 셋팅 --> model에 셋팅한 것과 같다.
		mav.addObject("name", "이영환");
		return mav;
	}
	
	// 자료실 글수정 처리
	@RequestMapping(value="/update", method= RequestMethod.POST)
	public String update() {
		return "redirect:view";
	}
	// 자료실 글삭제 처리
	@RequestMapping(value="/delete", method= RequestMethod.GET)
	public String delete() {
		return "redirect:list";
	}
	
	
}
