package com.ssafy.model.dto;

import java.io.Serializable;
import java.util.Arrays;

public class UserVO implements Serializable{
	private String id;
	private String pw;
	private String name;
	private String addr;
	private String tel;
	private String[] allergy;
	
	public UserVO() {}
	
	public UserVO(String id, String pw, String name, String addr, String tel, String[] allergy) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
		this.allergy = allergy;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String[] getAllergy() {
		return allergy;
	}
	public void setAllergy(String[] allergy) {
		this.allergy = allergy;
	}
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", addr=" + addr + ", tel=" + tel + ", allergy="
				+ Arrays.toString(allergy) + "]";
	}

	
}
