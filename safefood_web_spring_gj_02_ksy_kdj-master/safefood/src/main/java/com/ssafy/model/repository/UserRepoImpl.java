package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Allergy;
import com.ssafy.model.dto.UserVO;
import com.ssafy.model.dto.eatFood;

@Repository
public class UserRepoImpl implements UserRepo {
	private static final Logger logger = LoggerFactory.getLogger(UserRepoImpl.class);
	private static final String ns = "com.ssafy.model.mapper.User.";

	@Autowired
	SqlSessionTemplate template;

	public int insert(UserVO user) {
		String st = ns + "insert";
		return template.insert(st, user);
	}

	public int update(UserVO user) {
		String st = ns + "update";
		return template.update(st, user);
	}

	public int delete(String id) {
		String st = ns + "delete";
		return template.delete(st, id);
	}

	public UserVO select(String id) {
		String st = ns + "select";
		return template.selectOne(st, id);
	}

	public List<UserVO> selectAll() {
		String st = ns + "selectAllUsers";
		return template.selectList(st);
	}

	@Override
	public int insertAl(Allergy allergy) {
		String st=ns+"insertAl";
		return template.insert(st,allergy);
	}

	@Override
	public List<String> selectAl(String id) {
		String st=ns+"selectAl";
		return template.selectList(st,id);
	}

	@Override
	public int deleteAl(String id) {
		String st=ns+"deleteAl";
		return template.delete(st,id);
	}

	@Override
	public List<eatFood> selectEat(String id) {
		String st=ns+"selectEat";
		return template.selectList(st,id);
	}
}
