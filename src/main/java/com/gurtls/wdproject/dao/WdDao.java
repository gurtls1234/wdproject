package com.gurtls.wdproject.dao;

import java.util.List;

import com.gurtls.wdproject.model.Wd;

public interface WdDao {
	Wd findWdBySn(long sn);
	List<Wd> findWdList(String sort, int year, String location, int limitStart, int limitSize);
}
