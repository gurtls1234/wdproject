package com.gurtls.wdproject.service;

import java.util.List;

import com.gurtls.wdproject.model.Cv;

public interface CvService {
	List<Cv> getCvList(long userSn);
	Cv getCv(long cvSn, long userSn);
	Cv createCv(Cv cv);
	Cv updateCv(Cv cv);
	Cv updateCvTitle(Cv cv);
	int deleteCv(long cvSn);
}
