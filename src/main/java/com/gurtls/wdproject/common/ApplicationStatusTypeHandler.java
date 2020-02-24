package com.gurtls.wdproject.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;


public class ApplicationStatusTypeHandler implements TypeHandler<ApplicationStatus>{
	
	@Override
	public void setParameter(PreparedStatement ps, int i, ApplicationStatus applicationStatus, JdbcType jdbcType) throws SQLException {
		ps.setString(i, applicationStatus.name());
	}

	@Override
	public ApplicationStatus getResult(ResultSet rs, String columnName) throws SQLException {
		String value = rs.getString(columnName);
		ApplicationStatus applicationStatus = null;
		try {
			applicationStatus = ApplicationStatus.valueOf(value);
		} catch (Exception e) { }
		return applicationStatus;
	}

	@Override
	public ApplicationStatus getResult(ResultSet rs, int columnIndex) throws SQLException {
		String value = rs.getString(columnIndex);
		ApplicationStatus applicationStatus = null;
		try {
			applicationStatus = ApplicationStatus.valueOf(value);
		} catch (Exception e) { }
		return applicationStatus;
	}

	@Override
	public ApplicationStatus getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String value = cs.getString(columnIndex);
		ApplicationStatus applicationStatus = null;
		try {
			applicationStatus = ApplicationStatus.valueOf(value);
		} catch (Exception e) { }
		return applicationStatus;
	}
   
}