package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.User;

public interface UserDao {

	List<User> list();

	void add(User item);

	User item(int id);

	void update(User item);

	void delete(int id);

	boolean login(User user);

}
