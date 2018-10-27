package org.zerock.interceptor;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.zerock.member.dto.LoginDTO;

public class LogInterceptor extends HandlerInterceptorAdapter{

	@Inject
	private LogDAO dao;
	
	// 처리를 하기 전에 실행되 메서드
	// false가 리턴이 되면 처리를 계속 진행하지 않는다. true가 return이 되면 계속진행한다.
	// 요청에 대한 처리를 하기 전에 로그를 몽고 디비에 저장한다.
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
	throws Exception{
		System.out.println(getClass().getSimpleName()+".preHandle()");
		HttpSession session = request.getSession();
		
		// 로그로 남길 데이터 만들기
		String url = request.getServletPath();
		String part = getPart(url);
		String id = "";
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		if(dto == null) id="No Login"; //로그인을 안한 상태
		else id = dto.getId(); // 로그인을 한 상태
		String ip = request.getRemoteAddr();
		LogDTO log = new LogDTO();
		log.setUrl(url);
		log.setPart(part);
		log.setId(id);
		log.setWriteTime(new Date());
		log.setIp(ip);
		// 몽고디비에 저장하는 dao로 보낸 프로그램 작성
		dao.insert(log);
		return true;
	}
	
	String getPart(String url) {
		if(url.indexOf("board") != -1) return "board";
		else if(url.indexOf("data") != -1) return "data";
		else if(url.indexOf("qna") != -1) return "qna";
		else if(url.indexOf("member") != -1) return "member";
		else if(url.indexOf("shop") != -1) return "shop";
		else return "no part";
	}
}
