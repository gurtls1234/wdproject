package com.gurtls.wdproject.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class Cv {
	private long sn;
	private long userSn;
	private String title;
	private CvContent content;
	private Date createdAt;
	
	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
	
	public String getCreatedAtFormatted() {
		return dateFormat.format(createdAt);
	}
}
