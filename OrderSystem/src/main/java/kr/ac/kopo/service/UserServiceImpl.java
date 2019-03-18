package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.UserDao;
import kr.ac.kopo.model.User;
import kr.ac.kopo.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Override
	public List<User> list() {
		return dao.list();
	}

	@Override
	public void add(User item) {
		dao.add(item);
	}

	@Override
	public User item(int id) {
		return dao.item(id);
	}

	@Override
	public void update(User item) {
		dao.update(item);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

	@Override
	public boolean login(User user) {
		return dao.login(user);
	}

	@Override
	public UserVO selectUser(String username) {
		System.out.println("UserVO select() serviceImpl <<<<<<"+username);
		return dao.selectUser(username);
	}

}
