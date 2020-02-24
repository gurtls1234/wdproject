package com.gurtls.wdproject.resolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class SessionUserSnArgResolver implements HandlerMethodArgumentResolver {
	
   @Override
   public boolean supportsParameter(MethodParameter parameter) {
      return parameter.getParameterAnnotation(SessionUserSn.class) != null;
   }

   @Override
   public Long resolveArgument(
         MethodParameter parameter, 
         ModelAndViewContainer mavContainer,
         NativeWebRequest webRequest, 
         WebDataBinderFactory binderFactory) throws Exception {
      HttpServletRequest r = (HttpServletRequest) webRequest.getNativeRequest();
      HttpSession session = r.getSession();
      Object value = session.getAttribute("user_sn");
      
      return value == null ? null : (Long) value;
   }

}