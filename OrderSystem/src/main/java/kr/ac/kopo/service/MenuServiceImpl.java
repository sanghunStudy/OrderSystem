package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MenuDao;
import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuComment;
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

	@Override
	public List<MenuComment> commentList(MenuComment mComment) {
		return dao.commentList(mComment);
	}

	@Override
	public void commentAdd(MenuComment mComment) {
		dao.commentAdd(mComment);
	}

	@Override
	public void commentDel(MenuComment mComment) {
		dao.commentDel(mComment);
	}

	@Override
	public void commentUpdate(MenuComment mComment) {
		dao.commentUpdate(mComment);
	}

	@Override
	public void views(int menuId) {
		dao.views(menuId);
	}

}
