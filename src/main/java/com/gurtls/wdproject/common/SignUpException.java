package com.gurtls.wdproject.common;

import com.gurtls.wdproject.model.User;
import com.gurtls.wdproject.model.reqdto.ReqSignUpUser;

public class SignUpException extends RuntimeException {
	User user;
	String alertMessage;
	
	public SignUpException(User user, String alertMessage) {
		this.user = user;
		this.alertMessage = alertMessage;
	}
	
	public User getUser() {
		return user;
	}
	
	public String getAlertMessage() {
		return alertMessage;
	}
}
