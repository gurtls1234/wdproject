package com.gurtls.wdproject.model;

import java.util.Date;

import com.gurtls.wdproject.utill.Sha256;

import lombok.Data;

@Data
public class User {
	private long sn;
	private String email;
	private String passwd;
	private String name;
	private String phone;
	private Date createdAt;
	private Date UpdatedAt;
	
	public void setPasswd(String passwd) {
		this.passwd = Sha256.encrypt(email+passwd);
	}
}
