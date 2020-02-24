package com.gurtls.wdproject.dao;

import java.util.List;

import com.gurtls.wdproject.model.Application;
import com.gurtls.wdproject.model.vo.ApplicationStatusCountVO;

public interface ApplicationDao {
	List<Application> selectApplicationList(long userSn, String status, int limitStart, int limitSize);
	List<ApplicationStatusCountVO> selectApplicationStatusCount(long userSn);
	Application selectApplcationByUserSnAndWdSn(long userSn, long wdSn);
	int insertApplication(Application application);
}
