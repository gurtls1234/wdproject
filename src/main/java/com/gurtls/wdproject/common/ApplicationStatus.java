package com.gurtls.wdproject.common;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonGetter;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ApplicationStatus{
	hire("채용 완료"),
	pass("서류 통과"),
	accept("접수"),
	reject("채용 종료");
	
	private String nameKo;
	
	private ApplicationStatus(String nameKo) {
		this.nameKo = nameKo;
	}
	
	@JsonGetter("name_ko")
	public String getNameKo() {
		return nameKo;
	}

	@JsonGetter("name_en")
	public String getNameEn() {
		return name();
	}
}
