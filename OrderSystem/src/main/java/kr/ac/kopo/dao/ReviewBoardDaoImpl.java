package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.model.ReviewBoardComment;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

@Repository
public class ReviewBoardDaoImpl implements ReviewBoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<SearchVO> list(SearchVO searchVO) {;
		
		return sql.selectList("reviewboard.list", searchVO);
	}

	@Override
	public void add(ReviewBoard item) {
		sql.insert("reviewboard.add", item);
	}

	@Override
	public void incRef(long reviewId) {
		
//		String sql = " update board02 set readcount = nvl(readcount,0)+1 where seq = ?";		
//		Object[] obj = {seq};		
//		return jdbaTemplate.update(sql,obj);	
		sql.update("reviewboard.update", reviewId);
	}

	@Override
	public void views(int reviewId) {
		sql.update("reviewboard.views", reviewId);
	}

	@Override
	public ReviewBoard view(int reviewId) {
		return sql.selectOne("reviewboard.view",reviewId);
	}

	@Override
	public ReviewBoard item(int reviewId) {
		return sql.selectOne("reviewboard.item",reviewId);
	}

	@Override
	public void update(ReviewBoard item) {
		sql.update("reviewboard.update", item);
	}

	@Override
	public void delete(int reviewId) {
		sql.delete("reviewboard.delete", reviewId);
	}

	@Override
	public int totalCount(SearchVO searchVO) {
		return sql.selectOne("reviewboard.total", searchVO);
	}

	@Override
	public void commentUpdate(ReviewBoardComment rComment) {
		sql.update("reviewboard.commentUpdate", rComment);
	}

	@Override
	public void commentDel(ReviewBoardComment rComment) {
		sql.delete("reviewboard.commentDel", rComment);
	}

	@Override
	public void commentAdd(ReviewBoardComment rComment) {
		sql.insert("reviewboard.commentAdd", rComment);
	}

	@Override
	public List<ReviewBoardComment> commentList(ReviewBoardComment rComment) {
		return sql.selectList("reviewboard.commentList", rComment);
	}

}
