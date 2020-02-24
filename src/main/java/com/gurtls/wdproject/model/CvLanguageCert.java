package com.gurtls.wdproject.model;

import java.util.List;

import lombok.Data;

@Data
public class CvLanguageCert {
	private String language;
	private String level;
	private List<CvLanguageCertExam> examList;
}
