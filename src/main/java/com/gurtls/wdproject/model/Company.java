package com.gurtls.wdproject.model;

import java.util.Date;
import java.util.TreeSet;

import org.springframework.util.CollectionUtils;

import lombok.Data;

@Data
public class Company {
	private long sn;
	private String name;
	private String iconPath;
	private String description;
	private Date createdAt;
	private Date updateAt;

	private TreeSet<CompanyImage> imageSet;

	public String getFirstImagePath() {
		if(CollectionUtils.isEmpty(imageSet)) {
			return null;
		}
		
		CompanyImage firstImage = imageSet.first();
		return firstImage.getPath();
	}
}
