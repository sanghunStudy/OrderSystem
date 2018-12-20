package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.ReviewBoard;

public interface ReviewBoardDao {

	List<ReviewBoard> list();

	void add(ReviewBoard item);

	
}
