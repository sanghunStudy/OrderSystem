package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ReviewBoardDao;
import kr.ac.kopo.model.ReviewBoard;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Autowired
	ReviewBoardDao dao;
	
	@Override
	public List<ReviewBoard> list() {
		return dao.list();
	}

	@Override
	public void add(ReviewBoard item) {
		dao.add(item);
	}

}
