package com.gurtls.wdproject.common;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor:final�����͸� �����ڷ� ����
@RequiredArgsConstructor
public class InternalServerException extends RuntimeException {
	@Getter
	private final String alertMessege;
}
