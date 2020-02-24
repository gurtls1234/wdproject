package com.gurtls.wdproject.model;

import java.util.List;

import lombok.Data;

@Data
public class CvContent {
	private String userName;
	private String userEmail;
	private String userPhone;
	private String introduction;
	private List<CvCareer> careerList;
	private List<CvEducation> educationList;
	private List<CvActivity> activityList;
	private List<CvLanguageCert> languageCertList;
	private List<String> linkList;
}
