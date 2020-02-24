package com.gurtls.wdproject.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CvEducation {
	@JsonFormat(pattern = "yyyy-MM", timezone = "Asia/Seoul")
	private Date startDate;
	@JsonFormat(pattern = "yyyy-MM", timezone = "Asia/Seoul")
	private Date endDate;
	private String schoolName;
	private String major;
	private String description;
	
	public String getStartYearStr() {
		return getTimeFieldString(startDate, Calendar.YEAR);
	}

	public String getStartMonthStr() {
		return getTimeFieldString(startDate, Calendar.MONTH);
	}
	
	public String getEndYearStr() {
		return getTimeFieldString(endDate, Calendar.YEAR);
	}
	
	public String getEndMonthStr() {
		return getTimeFieldString(endDate, Calendar.MONTH);
	}
	
	private String getTimeFieldString(Date date, int calendarField) {
		if(date == null)
			return null;
		
		switch (calendarField) {
		case Calendar.YEAR:
			return new SimpleDateFormat("yyyy").format(date);
		case Calendar.MONTH:
			return new SimpleDateFormat("MM").format(date);
		default:
			return null;
		}
	}
}
