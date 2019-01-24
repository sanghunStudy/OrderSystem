package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Menu;

public interface MenuDao {

	List<Menu> list();

	void add(Menu menu);

	Menu item(int menuId);

	void update(Menu item);

	void delete(int menuId);

}
