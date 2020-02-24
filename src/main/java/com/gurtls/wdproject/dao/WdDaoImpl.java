package com.gurtls.wdproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gurtls.wdproject.model.Wd;

@Repository
public class WdDaoImpl implements WdDao{
	@Autowired
	private SqlSession sqlSession;
	
	private final static String mapperName = "WdMapper";
	
	@Override
	public Wd findWdBySn(long sn) {
		return sqlSession.selectOne(mapperName+".findWdBySn", sn); 
	}
	
	@Override
	public List<Wd> findWdList(String sort, int year, String location, int limitStart, int limitSize) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("sort", sort);
		paramMap.put("year", year);
		paramMap.put("location", location);
		paramMap.put("limitStart", limitStart);
		paramMap.put("limitSize", limitSize);
		
		return sqlSession.selectList(mapperName+".findWdList",paramMap);
	}

}
