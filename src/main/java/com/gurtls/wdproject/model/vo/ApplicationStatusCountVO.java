package com.gurtls.wdproject.model.vo;

import com.gurtls.wdproject.common.ApplicationStatus;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApplicationStatusCountVO {
	private ApplicationStatus status;
	private Integer count;
}
