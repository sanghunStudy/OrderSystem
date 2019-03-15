package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<User> list() {
		return sql.selectList("user.list");
	}

	@Override
	public void add(User item) {
		sql.insert("user.add", item);
	}

	@Override
	public User item(int id) {
		return sql.selectOne("user.item", id);
	}

	@Override
	public void update(User item) {
		sql.update("user.update", item);
	}

	@Override
	public void delete(int id) {
		sql.delete("user.delete", id);
	}

	@Override
	public boolean login(User user) {
		if(sql.selectOne("user.login", user)==null) {
			return false;
		}
		else {
			return true;
		}
	}
}
