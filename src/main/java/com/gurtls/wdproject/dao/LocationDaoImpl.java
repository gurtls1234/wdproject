package com.gurtls.wdproject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gurtls.wdproject.model.Location;

@Repository
public class LocationDaoImpl implements LocationDao{
	
	@Autowired
	private SqlSession sqlsession;
	
	private final static String mapperName = "LocationMapper";
	
	@Override
	public List<Location> findLocationList() {
		return sqlsession.selectList(mapperName+".findLocationList");
	}

}
