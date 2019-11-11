package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.UserVO;
import com.ssafy.model.dto.eatFood;

public interface UserService {
	int insert(UserVO user);

	int update(UserVO user);

	int delete(String id);

	UserVO select(String id);

	List<UserVO> selectAll();
	
	boolean loginck(String id,String pw);
	
	void insertAl(String id,String[] allergy);
	
	List<String> selectAl(String id);
	
	void updateAl(String id,String[] allergy);
	
	int deleteAl(String id);
	
	List<eatFood> selectEat(String id);
}
