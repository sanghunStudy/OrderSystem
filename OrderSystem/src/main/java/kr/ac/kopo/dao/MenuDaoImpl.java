package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.util.PageVO;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<Menu> list(PageVO pageVO) {
		return sql.selectList("menu.list", pageVO);
	}

	@Override
	public void add(Menu menu) {
		sql.insert("menu.add", menu);
	}

	@Override
	public Menu item(int menuId) {
		return sql.selectOne("menu.item", menuId);
	}

	@Override
	public void update(Menu item) {
		sql.update("menu.update", item);
	}

	@Override
	public void delete(int menuId) {
		sql.delete("menu.delete", menuId);
	}

	@Override
	public int total(PageVO pageVO) {
		return sql.selectOne("menu.total", pageVO);
	}

}
