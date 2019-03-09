package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuComment;
import kr.ac.kopo.util.SearchVO;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<Menu> list(SearchVO searchVO) {
		return sql.selectList("menu.list", searchVO);
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
	public int total(SearchVO searchVO) {
		return sql.selectOne("menu.total", searchVO);
	}

	@Override
	public List<MenuComment> commentList(MenuComment mComment) {
		return sql.selectList("menu.commentList", mComment);
	}

	@Override
	public void commentAdd(MenuComment mComment) {
		sql.insert("menu.commentAdd",mComment);
	}

	@Override
	public void commentDel(MenuComment mComment) {
		sql.delete("menu.commentDel", mComment);
	}

	@Override
	public void commentUpdate(MenuComment mComment) {
		sql.update("menu.commentUpdate", mComment);
	}

}
