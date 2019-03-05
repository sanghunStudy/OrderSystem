package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.model.ReviewBoardComment;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.PageVO;
import kr.ac.kopo.util.SearchVO;

public interface ReviewBoardDao {

	List<SearchVO> list(SearchVO searchVO);

	void add(ReviewBoard item);

	void incRef(long reviewId);

	ReviewBoard view(int reviewId);

	void views(int reviewId);

	ReviewBoard item(int reviewId);

	void update(ReviewBoard item);

	void delete(int reviewId);

	int totalCount(SearchVO searchVO);

	void commentUpdate(ReviewBoardComment rComment);

	void commentDel(ReviewBoardComment rComment);

	void commentAdd(ReviewBoardComment rComment);

	List<ReviewBoardComment> commentList(ReviewBoardComment rComment);
	
}
