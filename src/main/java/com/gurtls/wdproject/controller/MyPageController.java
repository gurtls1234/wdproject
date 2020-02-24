package com.gurtls.wdproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gurtls.wdproject.model.User;
import com.gurtls.wdproject.resolver.SessionUserSn;
import com.gurtls.wdproject.service.UserService;

@Controller
public class MyPageController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String getmypage(
		Model model,
		@SessionUserSn long userSn
		) {
		User user = userService.getUser(userSn);
		model.addAttribute("user", user);
		return "mypage";
	}
	
	@RequestMapping(value = "/updatemyinfo", method = RequestMethod.PUT)
	public ResponseEntity<Object> updatemyinfo(
			@SessionUserSn long userSn,
			@RequestBody User user
	) {
		user.setSn(userSn);
		User resultUser = userService.updateUser(user);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
