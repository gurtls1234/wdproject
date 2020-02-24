package com.gurtls.wdproject.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gurtls.wdproject.common.InternalServerException;
import com.gurtls.wdproject.dao.CvDao;
import com.gurtls.wdproject.model.Cv;

@Service
public class CvServiceImpl implements CvService{
	@Autowired
	CvDao cvDao;
	
	Logger log = LoggerFactory.getLogger(CvServiceImpl.class);
	
	@Override
	public List<Cv> getCvList(long userSn) {	
		return cvDao.selectCvList(userSn);
	}
	
	@Override
	public Cv getCv(long cvSn, long userSn) {
		
		if(cvSn <= 0) {
			// TODO throw exception
		}
		
		//validation
		
		Cv cv = cvDao.selectCv(cvSn);
		
		if(cv.getUserSn() != userSn) {
			// TODO throw exception not mine
		}
		
		return cv;
	}
	
	@Override
	public Cv createCv(Cv cv) {

		//validation
		
		int insertCount = 0;
		
		try {
			insertCount = cvDao.insertCv(cv);
		} catch (Exception e) {
			log.error("insertCv fail", e);
			throw new InternalServerException("Cv insert error.");
		}
		
		return cv;
	}
	
	@Override
	public Cv updateCv(Cv cv) {
		
		if(cv.getSn() <= 0) {
			// TODO throw exception
		}
		
		//validation
		
		Cv originCv = cvDao.selectCv(cv.getSn());
		
		if(originCv.getUserSn() != cv.getUserSn()) {
			// TODO throw exception not mine
		}

		//validation
		
		int updateCount = 0;
		
		try {
			updateCount = cvDao.updateCv(cv);
		} catch (Exception e) {
			log.error("updateCv fail", e);
			throw new InternalServerException("Cv update error.");
		}
		
		return cv;
	}

	@Override
	public Cv updateCvTitle(Cv cv) {
		
		Cv originCv = cvDao.selectCv(cv.getSn());
		
		if(originCv.getUserSn() != cv.getUserSn()) {
			// TODO
			log.info("not authorized");
			return originCv;
		}
		
		if(originCv.getTitle().equals(cv.getTitle())) {
			log.info("already changed");
			return originCv;
		}
		
		int updateCount = 0;
		
		try {
			updateCount = cvDao.updateCvTitle(cv);
		} catch (Exception e) {
			log.error("updateCv fail", e);
		}
		
		if(updateCount == 0) {
			throw new InternalServerException("Cv update error.");
		}
		
		return cv;
	}

	@Override
	public int deleteCv(long cvSn) {
		return cvDao.deleteCv(cvSn);
	}

}
