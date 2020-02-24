package com.gurtls.wdproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.gurtls.wdproject.dao.UserDao;
import com.gurtls.wdproject.model.User;

public class SignInInfoInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserDao userDao;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		Long userSn = getUserSn(request);
		
		if(userSn != null && modelAndView != null) {
			User user = userDao.selectUserBySn(userSn);
			modelAndView.addObject("user", user);  
	      }
		
		super.postHandle(request, response, handler, modelAndView);
	}

   private Long getUserSn(HttpServletRequest request) {
	   HttpSession session = request.getSession();
       Object userSn = session.getAttribute("user_sn");
       return userSn == null ? null : (Long)userSn;
   }

}
