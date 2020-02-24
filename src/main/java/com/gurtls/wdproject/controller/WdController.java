package com.gurtls.wdproject.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gurtls.wdproject.common.Const;
import com.gurtls.wdproject.common.WdSort;
import com.gurtls.wdproject.common.WdYear;
import com.gurtls.wdproject.model.Application;
import com.gurtls.wdproject.model.Cv;
import com.gurtls.wdproject.model.Location;
import com.gurtls.wdproject.model.User;
import com.gurtls.wdproject.model.Wd;
import com.gurtls.wdproject.resolver.SessionUserSn;
import com.gurtls.wdproject.service.ApplicationService;
import com.gurtls.wdproject.service.CvService;
import com.gurtls.wdproject.service.LocationService;
import com.gurtls.wdproject.service.UserService;
import com.gurtls.wdproject.service.WdService;


@RequestMapping("/wd")
@Controller
public class WdController {
	@Autowired
	WdService wdService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	CvService cvService;
	
	@Autowired
	LocationService locationService;
	
	@Autowired
	ApplicationService applicationService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET, produces = "text/html;charset=utf-8")
	public String listGET(
			@RequestParam Map<String, String> paramMap,
			@RequestParam(value="sort", required = false) String sort,//required에 false를 넣어주면 sort에 NULL값이 옴 안해주면 404에러
			@RequestParam(value="year", required = false) Integer year,
			@RequestParam(value="location", required = false) String location,
			Model model,
			RedirectAttributes rttr
	) {
		rttr.addAllAttributes(paramMap);
		
		if(isRedirectBySort(sort, rttr) || isRedirectByYear(year, rttr) || isRedirectByLocation(location, rttr))
			return "redirect:/wd/list";
		
		List<Wd> wdList = wdService.getWdList(sort, year, location);
		
		List<Location> locationList = locationService.getLocationList();
		Location selectedLocation = null;
		for(int i=0;i<locationList.size();i++) {
			Location l = locationList.get(i);
			if(l.getNameEn().equals(location)) {
				selectedLocation = l;
				break;
			}
		}
		
		WdYear selectedYear = WdYear.getWdYear(year);
		
		List<WdSort> sortList = Arrays.asList(WdSort.values());
		WdSort selectedSort = null;
		for(int i=0;i<sortList.size();i++) {
			WdSort s = sortList.get(i);
			if(s.name().equals(sort)) {
				selectedSort = s;
				break;
			}
		}
		
		model.addAttribute("wdList", wdList);
		
		model.addAttribute("sort", sort);
		model.addAttribute("selectedSort", selectedSort);
		model.addAttribute("sortList", sortList);
		
		model.addAttribute("year", year);
		model.addAttribute("selectedYear", selectedYear);
		model.addAttribute("yearList", WdYear.values());
		
		model.addAttribute("location", location);
		model.addAttribute("selectedLocation", selectedLocation);
		model.addAttribute("locationList",locationList);
		return "/wd/list";
	}
	
	@RequestMapping(value="/list",method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ResponseEntity<List<Wd>> listGETJSON(
			@RequestParam(value="sort") String sort,//required에 false를 넣어주면 sort에 NULL값이 옴 안해주면 404에러
			@RequestParam(value="year") Integer year,
			@RequestParam(value="location") String location,
			@RequestParam(value="limit_start") int limitStart,
			@RequestParam(value="limit_size", required = false) Integer limitSize
	) {
		if(!isValidSort(sort)
			|| !isValidYear(year)
			|| !isValidLocation(location)
			|| limitStart < 0 )
			return new ResponseEntity<List<Wd>>(HttpStatus.BAD_REQUEST);
		
		if(limitSize == null)
			limitSize = Const.WD_LIST_DEFAULT_SIZE;
		else if(limitSize <= 0)
			return new ResponseEntity<List<Wd>>(HttpStatus.BAD_REQUEST);
		
		List<Wd> wdList = wdService.getWdList(sort, year, location, limitStart, limitSize);
		
		return new ResponseEntity<List<Wd>>(wdList, HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/{sn}", method = RequestMethod.GET)
	public String wdboardGET(
			@PathVariable long sn,
			@SessionUserSn Long userSn,
			Model model
		) {
		
		Wd wd = wdService.getWd(sn);
		User user = null;
		List<Cv> cv = null;
		
		if(userSn != null) {
			user = userService.getUser(userSn);
			cv = cvService.getCvList(userSn);
		}
		
		Application application = applicationService.getApplication(userSn, sn);
		
		model.addAttribute("wd", wd);
		model.addAttribute("user", user);
		model.addAttribute("cvList", cv);
		model.addAttribute("application", application);
		
		return "/wd/info";
	}
	
	private boolean isRedirectBySort(String sort, RedirectAttributes rttr) {
		if(isValidSort(sort))
			return false;
		
		rttr.addAttribute("sort", Const.WD_SORT_DEFAULT.name()); // /wd/list?sort=latest
		return true;
	}
	
	private boolean isValidSort(String sort) {
		return WdSort.contains(sort);
	}
	
	private boolean isRedirectByYear(Integer year, RedirectAttributes rttr) {
		if(isValidYear(year))
			return false;
		
		rttr.addAttribute("year", WdYear.YEAR_DEFAULT);
		return true;
	}
	
	private boolean isValidYear(Integer year) {
		return year != null && year >= WdYear.YEAR_MIN && year <= WdYear.YEAR_MAX;
	}
	
	private boolean isRedirectByLocation(String location, RedirectAttributes rttr) {
		if(isValidLocation(location))
			return false;
		
		rttr.addAttribute("location", Const.WD_LOCATION_DEFAULT);
		return true;
	}
	
	private boolean isValidLocation(String location) {
		List<Location> locationList = locationService.getLocationList();
		
		for(Location l : locationList)
			if(l.getNameEn().equals(location))
				return true;
		
		return false;
	}

}
