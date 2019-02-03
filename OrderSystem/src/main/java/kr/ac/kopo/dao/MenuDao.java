package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.util.SearchVO;

public interface MenuDao {

	List<Menu> list(SearchVO searchVO);

	void add(Menu menu);

	Menu item(int menuId);

	void update(Menu item);

	void delete(int menuId);

	int total(SearchVO searchVO);

}
