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
	public List<MenuComment> commentList(int menuId) {
		return sql.selectList("menu.commentList", menuId);
	}

	@Override
	public void commentAdd(MenuComment mComment) {
		sql.insert("menu.commentAdd",mComment);
	}

	@Override
	public void commentDel(int mcommentId) {
		sql.delete("menu.commentDel", mcommentId);
	}

	@Override
	public void commentUpdate(MenuComment mComment) {
		sql.update("menu.commentUpdate", mComment);
	}

	@Override
	public void views(int menuId) {
		sql.update("menu.views", menuId);
	}

	@Override
	public void selection(int mcommentId) {
		sql.update("menu.selection",mcommentId);
	}

	@Override
	public void pointUp(String id) {
		sql.update("menu.pointUp",id);
	}

	@Override
	public int onlyOnceSelection(int menuId) {
		return sql.selectOne("menu.onlyOnceSelection",menuId);
	}

	@Override
	public int userpoint(String username) {
		return sql.selectOne("menu.userpoint",username);
	}

}
