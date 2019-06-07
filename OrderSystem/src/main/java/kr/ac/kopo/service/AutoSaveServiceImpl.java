package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.AutoSaveDao;
import kr.ac.kopo.model.AutoSaveItem;
import kr.ac.kopo.model.UserVO;

@Service
public class AutoSaveServiceImpl implements AutoSaveService {
	@Autowired
	AutoSaveDao dao;

	@Override
	public List<UserVO> list() {
		return dao.list();
	}

}
