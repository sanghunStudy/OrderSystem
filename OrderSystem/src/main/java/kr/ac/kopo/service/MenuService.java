package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Menu;

public interface MenuService {

	List<Menu> list();

	void add(Menu menu);

	Menu item(int menuId);

	void update(Menu item);

	void delete(int menuId);

}
