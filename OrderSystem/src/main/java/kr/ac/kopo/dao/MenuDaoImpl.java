package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Menu;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<Menu> list() {
		return sql.selectList("menu.list");
	}

	@Override
	public void add(Menu menu) {
		sql.insert("menu.add", menu);
	}

}
