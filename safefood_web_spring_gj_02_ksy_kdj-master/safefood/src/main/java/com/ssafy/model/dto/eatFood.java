package com.ssafy.model.dto;

import java.util.Date;

public class eatFood {
	private Integer eatcode;
	private String id;
	private Integer code;
	private Date date;


	public eatFood() {
	}

	public eatFood(String id, Integer code) {
		super();
		this.id = id;
		this.code = code;
	}
	
	public eatFood(String id, Integer code, Date date,Integer eatcode) {
		super();
		this.eatcode = eatcode;
		this.id = id;
		this.code = code;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public Integer getEatcode() {
		return eatcode;
	}

	public void setEatcode(Integer eatcode) {
		this.eatcode = eatcode;
	}

	@Override
	public String toString() {
		return "eatFood [eatcode=" + eatcode + ", id=" + id + ", code=" + code + ", date=" + date + "]";
	}


}
