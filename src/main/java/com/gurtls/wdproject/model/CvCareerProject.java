package com.gurtls.wdproject.model;

import java.util.Date;

import lombok.Data;

@Data
public class CvCareerProject {
	private String name;
	private Date startDate;
	private Date endDate;
	private String description;
}
