package com.gurtls.wdproject.service;

import com.gurtls.wdproject.model.User;
import com.gurtls.wdproject.model.reqdto.ReqSignInUser;
import com.gurtls.wdproject.model.reqdto.ReqSignUpUser;

public interface UserService {
	
	User signUp(User user);
	User signin(ReqSignInUser reqSignInUser);
	User getUser(long userSn);
	User updateUser(User user);

}
