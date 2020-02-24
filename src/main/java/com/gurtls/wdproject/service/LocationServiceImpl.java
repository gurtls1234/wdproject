package com.gurtls.wdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gurtls.wdproject.dao.LocationDao;
import com.gurtls.wdproject.model.Location;

@Service
public class LocationServiceImpl implements LocationService{
	
	@Autowired
	LocationDao locationDao;

	@Override
	public List<Location> getLocationList() {
		return locationDao.findLocationList();
	}

}
