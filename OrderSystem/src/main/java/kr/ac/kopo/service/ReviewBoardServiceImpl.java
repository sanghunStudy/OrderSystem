package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ReviewBoardDao;
import kr.ac.kopo.model.Notice;
import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.model.ReviewBoardComment;
import kr.ac.kopo.util.SearchVO;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Autowired
	ReviewBoardDao dao;
	
	@Override
	public List<SearchVO> list(SearchVO searchVO) {
		return dao.list(searchVO);
	}

	@Override
	public void add(ReviewBoard item) {
		dao.add(item);
	}

	@Override
	public void incRef(long reviewId) {
		dao.incRef(reviewId);
	}

	@Override
	public void views(int reviewId) {
		dao.views(reviewId);
	}

	@Override
	public ReviewBoard view(int reviewId) {
		return dao.view(reviewId);
	}

	@Override
	public ReviewBoard item(int reviewId) {
		return dao.item(reviewId);
	}

	@Override
	public void update(ReviewBoard item) {
		dao.update(item);
	}

	@Override
	public void delete(int reviewId) {
		dao.delete(reviewId);
	}

	@Override
	public int totalCount(SearchVO searchVO) {
		return dao.totalCount(searchVO);
	}

	@Override
	public void commentUpdate(ReviewBoardComment rComment) {
		dao.commentUpdate(rComment);
	}

	@Override
	public void conmmentDel(ReviewBoardComment rComment) {
		dao.commentDel(rComment);
	}

	@Override
	public void commentAdd(ReviewBoardComment rComment) {
		dao.commentAdd(rComment);
	}

	@Override
	public List<ReviewBoardComment> commentList(ReviewBoardComment rComment) {
		return dao.commentList(rComment);
	}


}
