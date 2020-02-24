package com.gurtls.wdproject.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CvCareer {
	@JsonFormat(pattern = "yyyy-MM", timezone = "Asia/Seoul")
	private Date startDate;
	@JsonFormat(pattern = "yyyy-MM", timezone = "Asia/Seoul")
	private Date endDate;
	private String companyName;
	private String partName;
	private List<CvCareerProject> projectList;
	
	
	public String getStartYearStr() {
		//if(startDate == null)
		//	return null;
		
		//Calendar cal = Calendar.getInstance();
		//cal.setTime(startDate);
		
		//cal.add(Calendar.HOUR, 12);
		//Date date = cal.getTime();
		
		//return ""+cal.get(Calendar.YEAR);
		
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

		String format;
		
		switch (calendarField) {
		case Calendar.YEAR:
			format = "yyyy";
			break;
		case Calendar.MONTH:
			format = "MM";
			break;
		default:
			return null;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}
}
