package com.gurtls.wdproject.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CvActivity {
	@JsonFormat(pattern = "yyyy-MM", timezone = "Asia/Seoul")
	private Date date;
	private String name;
	private String description;
	
	public String getYearStr() {
		return getTimeFieldString(date, Calendar.YEAR);
	}

	public String getMonthStr() {
		return getTimeFieldString(date, Calendar.MONTH);
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
