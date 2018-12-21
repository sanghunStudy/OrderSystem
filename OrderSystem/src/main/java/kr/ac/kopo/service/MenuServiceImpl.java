package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MenuDao;
import kr.ac.kopo.model.Menu;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	MenuDao dao;

	@Override
	public List<Menu> list() {
		return dao.list();
	}

	@Override
	public void add(Menu menu) {
		dao.add(menu);
	}

}
