package com.gurtls.wdproject.common;


import com.gurtls.wdproject.model.reqdto.ReqSignInUser;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor:final�����͸� �����ڷ� ����
@RequiredArgsConstructor
public class SignInException extends RuntimeException {
	@Getter
	private final ReqSignInUser reqSignInUser;
	@Getter
	private final String alertMessege;
}
