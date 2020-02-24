package com.gurtls.wdproject.dao;

import java.util.List;

import com.gurtls.wdproject.model.Cv;

public interface CvDao {
	List<Cv> selectCvList(long userSn);
	Cv selectCv(long cvSn);
	int insertCv(Cv cv);
	int updateCv(Cv cv);
	int updateCvTitle(Cv cv);
	int deleteCv(long cvSn);
}
