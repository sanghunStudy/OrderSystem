package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.util.BoardReplyVO;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

public interface ReviewBoardService {

	List<SearchVO> list(SearchVO searchVO);

	void add(ReviewBoard item);

	void incRef(long reviewId);

	ReviewBoard view(int reviewId);

	void views(int reviewId);

	ReviewBoard item(int reviewId);

	void update(ReviewBoard item);

	void delete(int reviewId);

	int totalCount(SearchVO searchVO);

	void insertBoardReply(BoardReplyVO boardReplyVO);
}
