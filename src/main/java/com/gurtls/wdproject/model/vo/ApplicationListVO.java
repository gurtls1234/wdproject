package com.gurtls.wdproject.model.vo;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class ApplicationListVO {
	private long userSn;
	private String status;
	private int limitStart;
	private int limitSize;
}
