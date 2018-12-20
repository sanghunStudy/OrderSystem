package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.ReviewBoard;

public interface ReviewBoardService {

	List<ReviewBoard> list();

	void add(ReviewBoard item);

}
