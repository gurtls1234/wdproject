package com.gurtls.wdproject.common;

public enum WdYear {
	all(-1,"전체"),
	year0(0, "신입"),
	year1(1, "1년"),
	year2(2, "2년"),
	year3(3, "3년"),
	year4(4, "4년"),
	year5(5, "5년"),
	year6(6, "6년"),
	year7(7, "7년"),
	year8(8, "8년"),
	year9(9, "9년"),
	year10(10, "10년 이상");
	
	public final static int YEAR_MIN = -1;
	public final static int YEAR_MAX = 10;
	public final static int YEAR_DEFAULT = -1;
	
	private int year;
	private String nameKo;
	
	private WdYear(int year, String nameKo) {
		this.year = year;
		this.nameKo = nameKo;
	}
	
	public int getYear() {
		return year;
	}
	
	public String getNameKo() {
		return nameKo;
	}
	
	public static WdYear getWdYear(int year) {
		for(WdYear wy : values())
			if(wy.getYear() == year)
				return wy;
		
		return null;
	}
}
