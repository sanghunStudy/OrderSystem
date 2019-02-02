package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.util.PageVO;

public interface MenuDao {

	List<Menu> list(PageVO pageVO);

	void add(Menu menu);

	Menu item(int menuId);

	void update(Menu item);

	void delete(int menuId);

	int total(PageVO pageVO);

}
