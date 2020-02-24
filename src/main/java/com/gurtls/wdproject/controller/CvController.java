package com.gurtls.wdproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gurtls.wdproject.resolver.SessionUserSn;
import com.gurtls.wdproject.model.Cv;
import com.gurtls.wdproject.model.User;
import com.gurtls.wdproject.model.reqdto.ReqCvUpdateTitle;
import com.gurtls.wdproject.service.CvService;
import com.gurtls.wdproject.service.UserService;

@RequestMapping("/cv")
@Controller
public class CvController {
	@Autowired
	CvService cvService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/intro",method = RequestMethod.GET)
	public String introGET(
			HttpSession session
	) {
		/*
		 * if(session.getAttribute("user_sn") != null) { return "redirect:/cv/list"; }
		 */
		return "/cv/intro";
	}
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public String introGET(
			@SessionUserSn long userSn,
			HttpSession session,
			Model model 
	) {
		if(session.getAttribute("user_sn") == null) {
			return "redirect:/cv/intro";
		}
		/*
		 * if(!(userSn instanceof Long)) { return "redirect:/cv/intro"; }
		 */
		List<Cv> cvlist = cvService.getCvList((long)userSn);
		model.addAttribute("cvlist", cvlist);
		return "/cv/list";
	}
	
	@RequestMapping(value="/new",method = RequestMethod.GET)
	public String getNew(
			@SessionUserSn Long userSn,
			Model model
		) {
		User user = userService.getUser(userSn);
		model.addAttribute("user", user);
		return "/cv/edit";
	}
	
	@RequestMapping(value = "/{sn}", method = RequestMethod.GET)
	public String getCv(
			@SessionUserSn Long userSn,
			@PathVariable long sn,
			Model model
		) {
		
		Cv cv = cvService.getCv(sn, userSn);

		model.addAttribute("cv", cv);
		
		return "/cv/edit";
	}
	
	@RequestMapping(value = "/{sn}", method = RequestMethod.PUT)
	public ResponseEntity<Object> updateCv(
			@SessionUserSn Long userSn,
			@PathVariable long sn,
			@RequestBody Cv cv,
			Model model
		) {
		
		cv.setSn(sn);
		cv.setUserSn(userSn);
		
		Cv resultCv = cvService.updateCv(cv);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(value="",method = RequestMethod.POST)
	public ResponseEntity<Object> createCv(
			@SessionUserSn Long userSn,
			@RequestBody Cv cv,
			RedirectAttributes rttr
		) {
		
		cv.setUserSn(userSn);
		
		Cv resultCv = cvService.createCv(cv);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/{sn}/title",method = RequestMethod.PUT) // application/json => RequestBody  // x-www-formurlencoded => RequestParam
	public ResponseEntity<Object> updateCvTitle(
			@SessionUserSn long userSn,
			@PathVariable long sn,
			@RequestBody ReqCvUpdateTitle reqTitle
		){
		
		Cv cv = new Cv();
		cv.setSn(sn);
		cv.setUserSn(userSn);
		cv.setTitle(reqTitle.getTitle());
		
		cvService.updateCvTitle(cv);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/{sn}",method = RequestMethod.DELETE)
	public ResponseEntity<Object> deleteCv(
			@SessionUserSn long userSn,
			@PathVariable long sn
		) {
		
		cvService.deleteCv(sn);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
