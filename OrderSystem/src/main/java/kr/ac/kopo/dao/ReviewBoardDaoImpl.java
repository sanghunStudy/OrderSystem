package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.util.FileVO;

@Repository
public class ReviewBoardDaoImpl implements ReviewBoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<ReviewBoard> list() {
		return sql.selectList("reviewboard.list");
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
		sql.update("revicewboard.update", item);
	}


}
