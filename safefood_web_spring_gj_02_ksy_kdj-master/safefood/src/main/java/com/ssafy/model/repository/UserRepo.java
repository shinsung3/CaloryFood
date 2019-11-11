package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Allergy;
import com.ssafy.model.dto.UserVO;
import com.ssafy.model.dto.eatFood;

public interface UserRepo {
	public int insert(UserVO user);

	public int update(UserVO user);

	public int delete(String id);

	public UserVO select(String id);

	public List<UserVO> selectAll();
	
	public int insertAl(Allergy allergy);
	
	public List<String> selectAl(String id);
	
	public int deleteAl(String id);
	
	public List<eatFood> selectEat(String id);
}
