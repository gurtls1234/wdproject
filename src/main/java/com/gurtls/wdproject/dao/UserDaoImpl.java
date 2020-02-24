package com.gurtls.wdproject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gurtls.wdproject.model.User;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final static String mapperName = "UserMapper";
	@Override
	public int insertUser(User user) {
		return sqlSession.insert(mapperName+".insertUser", user);
	}
	@Override
	public User selectUserByEmailAndPasswd(User user) {
		return sqlSession.selectOne(mapperName+".selectUserByEmailAndPasswd", user);
	}
	@Override
	public User selectUserBySn(long sn) {
		return sqlSession.selectOne(mapperName+".selectUserBySn", sn);
	}
	@Override
	public int updateUserBySn(User user) {
		return sqlSession.update(mapperName+".updateUserBySn", user);
	}

}
