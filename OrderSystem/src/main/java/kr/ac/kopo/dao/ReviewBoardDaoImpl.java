package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.ReviewBoard;

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

}
