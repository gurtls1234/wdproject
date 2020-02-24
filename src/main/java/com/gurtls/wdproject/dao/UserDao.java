package com.gurtls.wdproject.dao;

import com.gurtls.wdproject.model.User;

public interface UserDao {
	
	int insertUser(User user);
	int updateUserBySn(User user);
	User selectUserByEmailAndPasswd(User user);
	User selectUserBySn(long sn);
	

}
