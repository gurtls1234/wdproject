package com.gurtls.wdproject.service;

import java.util.List;

import com.gurtls.wdproject.model.Wd;

public interface WdService {
	
	Wd getWd(long sn);
	List<Wd> getWdList(String sort, int year, String location);
	List<Wd> getWdList(String sort, int year, String location, int limitStart, int limitSize);
}
