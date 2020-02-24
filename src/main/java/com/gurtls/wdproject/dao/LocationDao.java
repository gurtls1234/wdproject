package com.gurtls.wdproject.dao;

import java.util.List;

import com.gurtls.wdproject.model.Location;

public interface LocationDao {
	
	List<Location> findLocationList();
}
