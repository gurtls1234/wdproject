package com.gurtls.wdproject.controller;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gurtls.wdproject.common.ApplicationStatus;
import com.gurtls.wdproject.common.Const;
import com.gurtls.wdproject.model.Application;
import com.gurtls.wdproject.model.reqdto.ReqCreateApplication;
import com.gurtls.wdproject.model.vo.ApplicationStatusCountVO;
import com.gurtls.wdproject.resolver.SessionUserSn;
import com.gurtls.wdproject.service.ApplicationService;

@Controller
public class ApplicationController {
	
	@Autowired
	ApplicationService applicationService;
	
	@RequestMapping(value="/applications", method = RequestMethod.GET, produces = "text/html;charset=utf-8")
	public String getApplications(
		@SessionUserSn Long userSn,
		Model model
	) {
		List<Application> applicationList = applicationService.getApplicationList(userSn, null);
		List<ApplicationStatusCountVO> applicationStatusCountList = applicationService.getApplicationStatusCount(userSn);
		
		int totalCount = 0;
		for(ApplicationStatusCountVO statusCount : applicationStatusCountList)
			totalCount += statusCount.getCount();
	
		model.addAttribute("applicationList", applicationList);
		model.addAttribute("applicationListTotalCount", totalCount);
		model.addAttribute("applicationStatusCountList", applicationStatusCountList);
		
		return "applications";
	}

	@RequestMapping(value="/applications", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ResponseEntity<List<Application>> getApplicationsJSON(
		@SessionUserSn Long userSn,
		@RequestParam(value="status", required = false) String status,
		@RequestParam(value="limit_start") int limitStart,
		@RequestParam(value="limit_size", required = false) Integer limitSize
	) {
		ApplicationStatus applicationStatus = null;
		
		if(status != null) {
			try {
				applicationStatus = ApplicationStatus.valueOf(status);
			} catch (Exception e) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}
		
		if(limitStart < 0)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		
		if(limitSize == null)
			limitSize = Const.APPLICATION_LIST_DEFAULT_SIZE;
		else if(limitSize <= 0)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		
		List<Application> applicationList = applicationService.getApplicationList(userSn, applicationStatus, limitStart, limitSize);
		
		return new ResponseEntity<>(applicationList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/applications/statuses/counts", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<ApplicationStatus, Integer> getApplicationsStatusesCounts(
			@SessionUserSn Long userSn
	) {
		List<ApplicationStatusCountVO> applicationStatusCountList = applicationService.getApplicationStatusCount(userSn);
		
		Map<ApplicationStatus, Integer> statuesCountMap = new TreeMap<>();
		
		for(ApplicationStatusCountVO statusCount : applicationStatusCountList)
			statuesCountMap.put(statusCount.getStatus(), statusCount.getCount());
		
		return statuesCountMap;
	}
	
	@RequestMapping(value="/applications", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<Object> createApplication(
		@SessionUserSn Long userSn,
		@RequestBody ReqCreateApplication reqAppication
	) {
		Application application = applicationService.createApplication(
				userSn,
				reqAppication.getWdSn(),
				reqAppication.getCvSn());
		
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
