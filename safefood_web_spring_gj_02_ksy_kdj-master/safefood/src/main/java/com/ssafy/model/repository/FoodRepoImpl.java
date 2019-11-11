package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.eatFood;

@Repository
public class FoodRepoImpl implements FoodRepo{
	private static final Logger logger = LoggerFactory.getLogger(FoodRepoImpl.class);
	private static final String ns = "com.ssafy.model.mapper.Food.";

	@Autowired
	SqlSessionTemplate template;

	public int insert(Food food) {
		String st = ns + "insert";
		return template.insert(st, food);
	}

	public int update(Food food) {
		String st = ns + "update";
		return template.update(st, food);
	}

	public int delete(int code) {
		String st = ns + "delete";
		return template.delete(st, code);
	}

	public Food select(int code) {
		String st = ns + "select";
		return template.selectOne(st, code);
	}

	public List<Food> selectAll() {
		String st = ns + "selectAll";
		return template.selectList(st);
	}

	@Override
	public int insertFood(eatFood food) {
		String st=ns+"insertFood";
		return template.insert(st,food);
	}

	@Override
	public int deleteEat(int eatcode) {
		String st=ns+"deleteEat";
		return template.delete(st,eatcode);
	}

	@Override
	public int deleteFood(String id) {
		String st=ns+"deleteFood";
		return template.delete(st,id);
	}
}
