package com.gurtls.wdproject.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import com.gurtls.wdproject.common.InternalServerException;
import com.gurtls.wdproject.common.SignInException;
import com.gurtls.wdproject.common.SignUpException;
import com.gurtls.wdproject.dao.UserDao;
import com.gurtls.wdproject.model.User;
import com.gurtls.wdproject.model.reqdto.ReqSignInUser;
import com.gurtls.wdproject.model.reqdto.ReqSignUpUser;
@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;
	
	Logger log = LoggerFactory.getLogger(CvServiceImpl.class);
	
	@Override
	public User signUp(User user) {
		
		int insertCount = 0;
		try {
			insertCount = userDao.insertUser(user);
		}catch (DuplicateKeyException e) {
			throw new SignUpException(user,"계정 등록에 문제가 생겼습니다.");
		}
		
		if(insertCount == 0 || user == null) {
			throw new InternalServerException("User signup error.");
		}
		
		return user;
	}

	@Override
	public User signin(ReqSignInUser reqSignInUser) {
		User user = new User();
		user.setEmail(reqSignInUser.getEmail());
		user.setPasswd(reqSignInUser.getPasswd());
		
		try {
			user = userDao.selectUserByEmailAndPasswd(user);
		}catch (Exception e) {
			throw new InternalServerException("User signin error");
		}
		if(user == null || user.getSn() == 0) {
			throw new SignInException(reqSignInUser, "signIn error.");
		}
		return user;
	}

	@Override
	public User getUser(long userSn) {
		User user = userDao.selectUserBySn(userSn);
		return user;
	}

	@Override
	public User updateUser(User user) {
		int updateCount = 0;
		
		try {
			updateCount = userDao.updateUserBySn(user);
		} catch (Exception e) {
			log.error("updateUser fail", e);
			throw new InternalServerException("User update error.");
		}
		return user;
	}
	

}
