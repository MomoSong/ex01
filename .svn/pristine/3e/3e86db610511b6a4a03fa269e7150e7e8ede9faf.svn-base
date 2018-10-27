package org.zerock.mongo.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.dto.BoardDTO;
import org.zerock.board.dto.Criteria;
import org.zerock.interceptor.LogCount;
import org.zerock.interceptor.LogDAO;
import org.zerock.mongo.dto.MongoBoardDTO;
import org.zerock.mongo.service.MongoBoardService;

/*
 * 자동생성이 되게 하려면 
 * 1. web.xml에 설정되어 있는 xml 안에 beans > bean 태그를 이용해서 클래스 등록
 * 2. web.xml에 설정되어 있는 xml 안에 context:component-scan 을 이용해서
 *    base-package 속성의 패키지 안에서 클래스를 @Controller, @Service, @Repository,
 *    @Component, @RestController로 지정하면 자동 생성된다.
 */
@Controller
@RequestMapping("/mongo")
public class MongoBoardController {

	// 사용할 서비스 변수 선언. - DI 적용 : @Inject, @Autowired
	@Inject
	private MongoBoardService service;
	
	// 리스트 - DB에서 데이터를 꺼내와서 JSP로 Model객체에 데이터를 담아서 넘긴다.forward
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) {
		System.out.println(getClass().getSimpleName()+".list()");
//		System.out.println(cri);
	    model.addAttribute("list", service.list(cri));
	    // jsp에서 하단부분 페이지 표시할때 cri 객체가 필요하다. model에 담아서 보낸다.
	    model.addAttribute("cri", cri);
		// prefix + return String + suffix
		// /WEB-INF/views/mongo/list.jsp
		return "mongo/list";
	}
	// 글보기 - 글번호를 전달 받아서 DB에 글번호에 맞는 BoardDTO를 가져온다. JSP로 전달
	// view.do?no=10
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String view(Model model, int no) {
		System.out.println(getClass().getSimpleName()+".view()");
		model.addAttribute("dto", service.view(no, true));
		// prefix + return String + suffix
		// /WEB-INF/views/mongo/view.jsp
		return "mongo/view";
	}
	
	// 글쓰기 폼 -> servlet-context.xml에 view-controller tag로 지정
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write() {
		System.out.println(getClass().getSimpleName()+".write():GET");
		// prefix + return String + suffix
		// /WEB-INF/views/mongo/list.jsp
		return "mongo/write";
	}
	
	// 글쓰기 처리 - 사용자가 제목, 내용, 작성자 데이터 입력 후 넘긴다. -> BoardDTO
	// 리스트로 갈때에 글등록이 완료 되었다는 경고창은 띄우자(단, 한번만)
	// -> RedirectAttributes.flash속성을 이용한다.
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(MongoBoardDTO dto, RedirectAttributes rttr) {
		System.out.println(getClass().getSimpleName()+".write():POST");
		System.out.println(dto);
		service.insert(dto);
		// 딱 한번만 적용되고 다음에는 없어지는 속성 저장
		rttr.addFlashAttribute("msg", "writeOK");
		return "redirect:list.do"; // 처리가 다 끝나면 리스트로 자동 이동시킨다.
	}
	
	// 글수정 폼 - DB에서 글번호에 맞는 데이터를 불러와서 사용자에게 보여준다. -> JSP
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String update(Model model, int no) {
		System.out.println(getClass().getSimpleName()+".update():GET");
		model.addAttribute("dto", service.view(no, false));
		// prefix + return String + suffix
		// /WEB-INF/views/mongo/update.jsp
		return "mongo/update";
	}
	
	// 글수정 처리 - 수정한 제목, 내용, 작성자를 글번호와 함께 DAO에 보내서 DB에 저장한다.
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(MongoBoardDTO dto, RedirectAttributes rttr,
			Criteria cri) {
		System.out.println(getClass().getSimpleName()+".write():POST");
		System.out.println(cri);
		service.update(dto);
		// 딱 한번만 적용되고 다음에는 없어지는 속성 저장
		rttr.addFlashAttribute("msg", "updateOK");
		return "redirect:view.do?no="+dto.getNo()
		+"&page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
	}
	
	// 글삭제 처리 - 삭제할 글번호를 받아서 DB에서 글번호에 맞는 데이터를 삭제한다.
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String delete(int no, RedirectAttributes rttr) {
		System.out.println(getClass().getSimpleName()+".delete()");
		service.delete(no);
		// 딱 한번만 적용되고 다음에는 없어지는 속성 저장
		rttr.addFlashAttribute("msg", "deleteOK");
		return "redirect:list.do";
	}
	
	@Inject
	private LogDAO logDAO; 
	// 글삭제 처리 - 삭제할 글번호를 받아서 DB에서 글번호에 맞는 데이터를 삭제한다.
	@RequestMapping(value = "/logcount.do", method = RequestMethod.GET)
	public String getLogCount(Model model) {
		System.out.println(getClass().getSimpleName()+".getLogCount()");
		model.addAttribute("data", forChartData(logDAO.getLogCount()));
		// 딱 한번만 적용되고 다음에는 없어지는 속성 저장
		return "mongo/logCount";
	}
	
	String forChartData(List<LogCount> list) {
		String data = "[";
		for(LogCount logCount : list) {
			data += "['" + logCount.getPart()+"',";
			data += logCount.getValue() + "],";
		}
		data = data.substring(0, data.length()-1); // 마지막 ","를 제거한다.
		data += "]";
		System.out.println(data);
		return data;
	}
}
