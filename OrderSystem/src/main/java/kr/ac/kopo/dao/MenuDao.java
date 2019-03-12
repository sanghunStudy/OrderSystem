package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuComment;
import kr.ac.kopo.util.SearchVO;

public interface MenuDao {

	List<Menu> list(SearchVO searchVO);

	void add(Menu menu);

	Menu item(int menuId);

	void update(Menu item);

	void delete(int menuId);

	int total(SearchVO searchVO);

	List<MenuComment> commentList(MenuComment mComment);

	void commentAdd(MenuComment mComment);

	void commentDel(MenuComment mComment);

	void commentUpdate(MenuComment mComment);

	void views(int menuId);

}
