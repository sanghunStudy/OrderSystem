package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.util.PageVO;

public interface MenuService {

	List<Menu> list(PageVO pageVO);

	void add(Menu menu);

	Menu item(int menuId);

	void update(Menu item);

	void delete(int menuId);
	
	int total(PageVO pageVO);

}
