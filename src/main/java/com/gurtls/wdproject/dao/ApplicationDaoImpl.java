package com.gurtls.wdproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gurtls.wdproject.model.Application;
import com.gurtls.wdproject.model.vo.ApplicationListVO;
import com.gurtls.wdproject.model.vo.ApplicationStatusCountVO;

@Repository
public class ApplicationDaoImpl implements ApplicationDao{
	@Autowired
	SqlSession sqlsession;
	
	private static final String mapperName = "ApplicationMapper";
	
	@Override
	public List<Application> selectApplicationList(long userSn, String status, int limitStart, int limitSize) {
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("userSn", userSn);
//		paramMap.put("status", status);
//		paramMap.put("limitStart", limitStart);
//		paramMap.put("limitSize", limitSize);
		
		return sqlsession.selectList(mapperName + ".selectApplicationList",
				ApplicationListVO.builder()
				.userSn(userSn)
				.status(status)
				.limitStart(limitStart)
				.limitSize(limitSize)
				.build());
	}
	
	@Override
	public List<ApplicationStatusCountVO> selectApplicationStatusCount(long userSn) {
		return sqlsession.selectList(mapperName + ".selectApplicationStatusCount", userSn);
	}
	
	@Override
	public Application selectApplcationByUserSnAndWdSn(long userSn, long wdSn) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userSn", userSn);
		paramMap.put("wdSn", wdSn);
		return sqlsession.selectOne(mapperName + ".selectApplcationByUserSnAndWdSn", paramMap);
	}

	@Override
	public int insertApplication(Application application) {
		return sqlsession.insert(mapperName + ".insertApplication", application);
	}
}
