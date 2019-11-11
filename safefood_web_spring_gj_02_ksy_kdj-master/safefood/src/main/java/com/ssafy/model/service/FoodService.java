package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.eatFood;

public interface FoodService {
	int insert(Food food);

	int update(Food food);

	int delete(int code);

	Food select(int code);

	List<Food> selectAll();
	
	int insertFood(eatFood food);
	
	int deleteEat(int eatcode);
	
	int deleteFood(String id);
}
