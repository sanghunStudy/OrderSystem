package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.model.UserVO;

@Repository
public class MyInforDaoImpl implements MyInforDao {

	@Autowired
	SqlSession sql;

	//회원 프로필 조회
	@Override
	public UserVO userProfile(String id) {
		return sql.selectOne("myinfor.userProfile", id);
	}
	//내가 쓴 글
	@Override
	public List<Question> myWriting(String id) {
		return sql.selectList("myinfor.myWriting", id);
	}
	//내가 쓴 댓글
	@Override
	public List<QuestionComment> myWritingComment(String id) {
		return sql.selectList("myinfor.myWritingComment", id);
	}

}
