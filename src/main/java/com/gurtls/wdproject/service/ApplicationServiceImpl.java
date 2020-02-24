package com.gurtls.wdproject.service;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gurtls.wdproject.common.ApplicationStatus;
import com.gurtls.wdproject.common.Const;
import com.gurtls.wdproject.dao.ApplicationDao;
import com.gurtls.wdproject.model.Application;
import com.gurtls.wdproject.model.Cv;
import com.gurtls.wdproject.model.Wd;
import com.gurtls.wdproject.model.vo.ApplicationStatusCountVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ApplicationServiceImpl implements ApplicationService{
	@Autowired
	ApplicationDao applicationDao;
	
	@Autowired
	WdService wdService;
	
	@Autowired
	CvService cvService;
	
	@Override
	public List<ApplicationStatusCountVO> getApplicationStatusCount(long userSn) {
		List<ApplicationStatusCountVO> statusCountList = applicationDao.selectApplicationStatusCount(userSn);

		Set<ApplicationStatus> statusSet = new HashSet<>(Arrays.asList(ApplicationStatus.values()));
		
		for(ApplicationStatusCountVO statusCount : statusCountList)
			statusSet.remove(statusCount.getStatus());
		
		for(ApplicationStatus status : statusSet)
			statusCountList.add(new ApplicationStatusCountVO(status, 0));
		
		final List<ApplicationStatus> statusList = Arrays.asList(ApplicationStatus.values());
		
		statusCountList.sort(new Comparator<ApplicationStatusCountVO>() {
			@Override
			public int compare(ApplicationStatusCountVO o1, ApplicationStatusCountVO o2) {
				return statusList.indexOf(o1.getStatus()) - statusList.indexOf(o2.getStatus());
			}
		});
		
		return statusCountList;
	}
	
	@Override
	public List<Application> getApplicationList(long userSn, ApplicationStatus applicationStatus) {
		return applicationDao.selectApplicationList(userSn, applicationStatus == null ? null : applicationStatus.name(), 0, Const.APPLICATION_LIST_DEFAULT_SIZE);
	}
	
	@Override
	public List<Application> getApplicationList(long userSn, ApplicationStatus applicationStatus, int limitStart, int limitSize) {
		return applicationDao.selectApplicationList(userSn, applicationStatus == null ? null : applicationStatus.name(), limitStart, limitSize);
	}
	
	@Override
	public Application getApplication(Long userSn, long wdSn) {
		
		if(userSn == null) {
			return null;
		}

		if(userSn <= 0) {
			
		}
		
		if(wdSn <= 0) {
			
		}
		
		Application application = null;
		
		try {
			application = applicationDao.selectApplcationByUserSnAndWdSn(userSn, wdSn);
		} catch (Exception e) { }

		return application;
	}

	@Override
	public Application createApplication(long userSn, long wdSn, long cvSn) {
		
		if(userSn <= 0) {
			
		}
		
		if(wdSn <= 0) {
			
		}
		
		if(cvSn <= 0) {
			
		}
		
		// wd 존재하는지 체크
		Wd wd = wdService.getWd(wdSn);
		
		if(wd.getEndDt() != null && Calendar.getInstance().after(wd.getEndDt())) {
			// throw 이미 끝난 채용공고
		}
		
		// cv 소유한 유저인지 체크
		Cv cv = cvService.getCv(cvSn, userSn);
		
		Application application = Application.builder()
				.userSn(userSn)
				.wdSn(wdSn)
				.cvSn(cvSn)
				.build();
		
		try {
			int insertCount = applicationDao.insertApplication(application);
		} catch (Exception e) {
			log.error("fail insertApplication", e);
		}
		
		if(application.getSn() == 0) {
			// thow 
		}
		
		return application;
	}
}
