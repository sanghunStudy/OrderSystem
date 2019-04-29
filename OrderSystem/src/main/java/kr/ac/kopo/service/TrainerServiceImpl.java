package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.TrainerDao;
import kr.ac.kopo.model.UserVO;

@Service
public class TrainerServiceImpl implements TrainerService {

	@Autowired
	TrainerDao dao;
	
	@Override
	public List<UserVO> list() {
		return dao.list();
	}

	@Override
	public int selectUserbI(String username) {
		
		return dao.selectUserbI(username);
	}

}
