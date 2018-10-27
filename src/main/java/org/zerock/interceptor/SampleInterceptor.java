package org.zerock.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SampleInterceptor extends HandlerInterceptorAdapter{

	// 처리를 하고 난 뒤에 실행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception{
		System.out.println(getClass().getSimpleName()+".postHandle()");
		
	}
	// 처리를 하기 전에 실행되 메서드
	// false가 리턴이 되면 처리를 계속 진행하지 않는다. true가 return이 되면 계속진행한다.
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
	throws Exception{

		System.out.println(getClass().getSimpleName()+".preHandle()");
		if(request.getParameter("yesNo").equals("yes"))
			return true;
		else return false;
	}
	
}
