package kr.ac.kopo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.BEDao;
import kr.ac.kopo.model.BEsave;

@Service
public class BEServiceImpl implements BEservice {

	@Autowired
	BEDao dao;

	@Override
	public int add(BEsave besave) {
		return dao.add(besave);
	}
	
	
}
