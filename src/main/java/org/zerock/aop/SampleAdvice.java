package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

// 자동적으로 생성하게 하는 어노테이션:@Controller, @Service, @Repository, @Component,
// @RestController
@Component
@Aspect
public class SampleAdvice {

	private static final Logger logger 
	= LoggerFactory.getLogger(SampleAdvice.class);
	
	// target 프로그램 전에 실행되어지는 메서드
	@Before("execution(* org.zerock..service.BoardService*.*(..))")
	public void startLog(JoinPoint jp) {
//		System.out.println("-------------------------------");
//		System.out.println(Arrays.toString(jp.getArgs()));
//		System.out.println(jp.getKind());
//		System.out.println(jp.getTarget());
		System.out.println(jp.getSignature());
		logger.info("---------------------------------");
		logger.info(jp.getSignature().toString());
		logger.info(Arrays.toString(jp.getArgs()));
		logger.info("---------------------------------");
	}
}
