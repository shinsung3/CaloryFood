package com.ssafy.model.dto;

public class Allergy {
	private String id;
	private String allergy;

	public Allergy() {
		// TODO Auto-generated constructor stub
	}

	public Allergy(String id, String allergy) {
		super();
		this.id = id;
		this.allergy = allergy;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	@Override
	public String toString() {
		return "Allergy [id=" + id + ", allergy=" + allergy + "]";
	}

}
