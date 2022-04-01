package com.potenter.instagram.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	// 요청이 들어 올때	
	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler) throws IOException {
			
		// 로그인 여부 확인
		HttpSession session = request.getSession();
		
		// /post/posting_view
		String uri = request.getRequestURI();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		// 로그인이 안된 상태
		if(userId == null) {
			
			// 리스트 화면
			// 글쓰기 화면
			if(uri.startsWith("/post")) {
				// 로그인 화면으로 이동시켜라
				response.sendRedirect("/user/signin_view");
				return false;
			}
			
		}
		// 로그인이 된 상태
			else {
			// 로그인 화면 /user/signin_view
			// 회원가입 화면 /user/signup_view
			if(uri.startsWith("/user")) {
				// now 화면으로 이동
				response.sendRedirect("/post/posting_now");
				return false;
			}
		}
		return true;
	}
	
	@Override
	public void postHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			ModelAndView modelAndView) {
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			Exception ex) {
	}
	


}
