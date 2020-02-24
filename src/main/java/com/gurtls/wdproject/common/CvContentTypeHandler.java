package com.gurtls.wdproject.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import com.google.gson.Gson;
import com.gurtls.wdproject.model.CvContent;

public class CvContentTypeHandler implements TypeHandler<CvContent>{
	
	private Gson gson = new Gson();
	
	@Override
	public void setParameter(PreparedStatement ps, int i, CvContent cvContent, JdbcType jdbcType) throws SQLException {
		ps.setObject(i, gson.toJson(cvContent));
	}

	@Override
	public CvContent getResult(ResultSet rs, String columnName) throws SQLException {
		Object value = rs.getObject(columnName);
		return gson.fromJson(value.toString(), CvContent.class);
	}

	@Override
	public CvContent getResult(ResultSet rs, int columnIndex) throws SQLException {
		Object value = rs.getObject(columnIndex);
		return gson.fromJson(value.toString(), CvContent.class);
	}

	@Override
	public CvContent getResult(CallableStatement cs, int columnIndex) throws SQLException {
		Object value = cs.getObject(columnIndex);
		return gson.fromJson(value.toString(), CvContent.class);
	}
   
}