package com.gurtls.wdproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gurtls.wdproject.model.User;
import com.gurtls.wdproject.model.reqdto.ReqSignInUser;
import com.gurtls.wdproject.model.reqdto.ReqSignUpUser;
import com.gurtls.wdproject.model.resdto.ResSignInUser;
import com.gurtls.wdproject.model.resdto.ResSignUpUser;
import com.gurtls.wdproject.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/signup", method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public User signUpPost(User user) {
		userService.signUp(user);
		return user;
	}
	
	@RequestMapping(value="/signin",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResSignInUser signInPOST(ReqSignInUser reqSignInUser,HttpSession session) {
		User user =  userService.signin(reqSignInUser);

		session.setAttribute("user_sn", user.getSn());
		
		ResSignInUser resSignInUser = new ResSignInUser();
		resSignInUser.setSn(user.getSn());
		resSignInUser.setEmail(user.getEmail());
		resSignInUser.setName(user.getName());
		
		return resSignInUser;
	}
	
	@RequestMapping(value="/signout", method=RequestMethod.GET)
	public String signOutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/wd/list";
	}
}
