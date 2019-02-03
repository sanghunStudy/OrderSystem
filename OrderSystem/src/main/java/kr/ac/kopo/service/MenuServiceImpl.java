package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MenuDao;
import kr.ac.kopo.model.Menu;
import kr.ac.kopo.util.SearchVO;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	MenuDao dao;

	@Override
	public List<Menu> list(SearchVO searchVO) {
		return dao.list(searchVO);
	}

	@Override
	public void add(Menu menu) {
		dao.add(menu);
	}

	@Override
	public Menu item(int menuId) {
		return dao.item(menuId);
	}

	@Override
	public void update(Menu item) {
		dao.update(item);
	}

	@Override
	public void delete(int menuId) {
		dao.delete(menuId);
	}

	@Override
	public int total(SearchVO searchVO) {
		return dao.total(searchVO);
	}

}
