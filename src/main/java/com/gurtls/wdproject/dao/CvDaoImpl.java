package com.gurtls.wdproject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gurtls.wdproject.model.Cv;

@Repository
public class CvDaoImpl implements CvDao{
	
	@Autowired
	private SqlSession sqlsession;
	
	private final static String mapperName = "CvMapper";
	
	@Override
	public List<Cv> selectCvList(long userSn) {
		return sqlsession.selectList(mapperName + ".selectCvList", userSn);
	}
	
	@Override
	public Cv selectCv(long cvSn) {
		return sqlsession.selectOne(mapperName + ".selectCv", cvSn);
	}
	
	@Override
	public int insertCv(Cv cv) {
		return sqlsession.insert(mapperName + ".insertCv", cv);
	}
	
	@Override
	public int updateCv(Cv cv) {
		return sqlsession.update(mapperName + ".updateCv", cv);
	}

	@Override
	public int updateCvTitle(Cv cv) {
		return sqlsession.update(mapperName + ".updateCvTitle", cv);
	}

	@Override
	public int deleteCv(long cvSn) {
		return sqlsession.delete(mapperName + ".deleteCv", cvSn);
	}

}
