package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.util.FileVO;

public interface ReviewBoardDao {

	List<ReviewBoard> list();

	void add(ReviewBoard item);

	void incRef(long reviewId);

	ReviewBoard view(int reviewId);

	void views(int reviewId);

	ReviewBoard item(int reviewId);

	void update(ReviewBoard item);

	
}
