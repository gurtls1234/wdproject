package com.gurtls.wdproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.gurtls.wdproject.dao.UserDao;

public class SignInCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserDao userDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Long userSn = getUserSn(request);
		
		if(userSn == null) {
			response.sendRedirect(request.getContextPath()+"/wd/list");
			return false;
		} else {
			return super.preHandle(request, response, handler);
		}
	}

   private Long getUserSn(HttpServletRequest request) {
	   HttpSession session = request.getSession();
       Object userSn = session.getAttribute("user_sn");
       return userSn == null ? null : (Long)userSn;
   }

}
