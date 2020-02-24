package com.gurtls.wdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gurtls.wdproject.common.Const;
import com.gurtls.wdproject.dao.WdDao;
import com.gurtls.wdproject.model.Wd;

@Service
public class WdServiceImpl implements WdService{
	@Autowired
	WdDao wdDao;

	@Override
	public Wd getWd(long sn) {
		
		if(sn <= 0) {
			
		}
		
		Wd wd = wdDao.findWdBySn(sn);
		
		if(wd == null) {
			
		}
		
		return wd;
	}

	@Override
	public List<Wd> getWdList(String sort, int year, String location) {
		return wdDao.findWdList(sort, year, location, 0, Const.WD_LIST_DEFAULT_SIZE);
	}

	@Override
	public List<Wd> getWdList(String sort, int year, String location, int limitStart, int limitSize) {
		return wdDao.findWdList(sort, year, location, limitStart, limitSize);
	}

}
