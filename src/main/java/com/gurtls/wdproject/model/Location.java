package com.gurtls.wdproject.model;

import java.util.Date;

import lombok.Data;

@Data
public class Location {
	private long sn;
	private int order;
	private String nameKo;
	private String nameEn;
	private Date createdAt;
}
