package com.gurtls.wdproject.model;

import java.util.Date;
import java.util.TreeSet;

import org.springframework.util.CollectionUtils;

import lombok.Data;

@Data
public class Wd {
	private long sn;
	private Company company;
	private Location location;
	private String title;
	private long companySn;
	private long locationSn;
	private String content;
	private String mainTask;
	private String qualification;
	private String preference;
	private String benefit;
	private Date endDt;
	private String workLocation;
	private Date createdAt;
	private Date updatedAt;
}
