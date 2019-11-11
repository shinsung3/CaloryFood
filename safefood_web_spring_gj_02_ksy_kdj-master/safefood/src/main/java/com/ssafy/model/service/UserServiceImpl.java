package com.ssafy.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Allergy;
import com.ssafy.model.dto.UserVO;
import com.ssafy.model.dto.eatFood;
import com.ssafy.model.repository.UserRepo;

@Service
public class UserServiceImpl implements UserService {

	private UserRepo repo;

	public UserServiceImpl(UserRepo repo) {
		super();
		this.repo = repo;
	}

	@Override
	public int insert(UserVO user) {
		// TODO Auto-generated method stub
		return repo.insert(user);
	}

	@Override
	public int update(UserVO user) {
		// TODO Auto-generated method stub
		return repo.update(user);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return repo.delete(id);
	}

	@Override
	public UserVO select(String id) {
		// TODO Auto-generated method stub
		return repo.select(id);
	}

	@Override
	public List<UserVO> selectAll() {
		// TODO Auto-generated method stub
		return repo.selectAll();
	}

	@Override
	public boolean loginck(String id, String pw) {
		UserVO user = select(id);
		if (user.getPw().equals(pw)) {
			return true;
		}
		return false;
	}

	@Override
	public void insertAl(String id, String[] allergy) {
		for (int i = 0; i < allergy.length; i++) {
			Allergy al = new Allergy(id, allergy[i]);
			repo.insertAl(al);
		}
	}

	@Override
	public List<String> selectAl(String id) {
		return repo.selectAl(id);
	}

	@Override
	public void updateAl(String id, String[] allergy) {
		repo.deleteAl(id);
		insertAl(id, allergy);
	}

	@Override
	public int deleteAl(String id) {
		return repo.deleteAl(id);
	}

	@Override
	public List<eatFood> selectEat(String id) {
		return repo.selectEat(id);
	}

}
