package com.gurtls.wdproject.model;

import java.util.Date;

import com.gurtls.wdproject.common.ApplicationStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Application {
	private long sn;
	private long wdSn;
	private Wd wd;
	private long cvSn;
	private long userSn;
	private ApplicationStatus status;
	private Date createdAt;
	private Date updatedAt;
}
