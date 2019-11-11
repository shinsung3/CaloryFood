package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.eatFood;

public interface FoodRepo {
	public int insert(Food food);

	public int update(Food food);

	public int delete(int code);

	public Food select(int code);

	public List<Food> selectAll();
	
	public int insertFood(eatFood food);
	
	public int deleteEat(int eatcode);
	
	public int deleteFood(String id);
}
