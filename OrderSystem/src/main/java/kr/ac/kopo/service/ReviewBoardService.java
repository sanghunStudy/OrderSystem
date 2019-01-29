package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.util.FileVO;

public interface ReviewBoardService {

	List<ReviewBoard> list();

	void add(ReviewBoard item);

	void incRef(long reviewId);

	ReviewBoard view(int reviewId);

	void views(int reviewId);

	ReviewBoard item(int reviewId);

	void update(ReviewBoard item);
}
