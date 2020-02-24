package com.gurtls.wdproject.service;

import java.util.List;

import com.gurtls.wdproject.common.ApplicationStatus;
import com.gurtls.wdproject.model.Application;
import com.gurtls.wdproject.model.vo.ApplicationStatusCountVO;

public interface ApplicationService {
	List<ApplicationStatusCountVO> getApplicationStatusCount(long userSn);
	List<Application> getApplicationList(long userSn, ApplicationStatus applicationStatus);
	List<Application> getApplicationList(long userSn, ApplicationStatus applicationStatus, int limitStart, int limitSize);
	Application getApplication(Long userSn, long wdSn);
	Application createApplication(long userSn, long wdSn, long cvSn); 
}
