package com.ssafy.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.eatFood;
import com.ssafy.model.repository.FoodRepo;

@Service
public class FoodServiceImpl implements FoodService {

	private FoodRepo repo;
	
	public FoodServiceImpl(FoodRepo repo) {
		this.repo=repo;
	}

	@Override
	public int insert(Food food) {
		return repo.insert(food);
	}

	@Override
	public int update(Food food) {
		return repo.update(food);
	}

	@Override
	public int delete(int code) {
		return repo.delete(code);
	}

	@Override
	public Food select(int code) {
		return repo.select(code);
	}

	@Override
	public List<Food> selectAll() {
		return repo.selectAll();
	}

	@Override
	public int insertFood(eatFood food) {
		return repo.insertFood(food);
	}

	@Override
	public int deleteEat(int eatcode) {
		return repo.deleteEat(eatcode);
	}

	@Override
	public int deleteFood(String id) {
		return repo.deleteFood(id);
	}

}
