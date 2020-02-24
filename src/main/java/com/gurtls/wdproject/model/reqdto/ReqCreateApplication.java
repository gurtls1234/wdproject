package com.gurtls.wdproject.model.reqdto;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;


@Data
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class ReqCreateApplication {
	private long wdSn;
	private long cvSn;
}
