package org.zerock.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	// 처리를 하기 전에 실행되 메서드
	// false가 리턴이 되면 처리를 계속 진행하지 않는다. true가 return이 되면 계속진행한다.
	// 게시판 글쓰기 -> /board/write.do
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
	throws Exception{
		System.out.println(getClass().getSimpleName()+".preHandle()");
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) {//로그인을 하지 않은 경우
			response.sendRedirect("/member/loginForm.do");// 로그인 처리하러 감.
			return false; // 더이상 진행 되지 않는다.
		}
		return true;
	}
	
}
