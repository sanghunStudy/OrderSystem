package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.util.SearchVO;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<Question> list(SearchVO searchVO) {
		return sql.selectList("question.list", searchVO);
	}

	@Override
	public void add(Question menu) {
		sql.insert("question.add", menu);
	}

	@Override
	public Question item(int menuId) {
		return sql.selectOne("question.item", menuId);
	}

	@Override
	public void update(Question item) {
		sql.update("question.update", item);
	}

	@Override
	public void delete(int menuId) {
		sql.delete("question.delete", menuId);
	}

	@Override
	public int total(SearchVO searchVO) {
		return sql.selectOne("question.total", searchVO);
	}

	@Override
	public List<QuestionComment> commentList(int menuId) {
		return sql.selectList("question.commentList", menuId);
	}

	@Override
	public void commentAdd(QuestionComment mComment) {
		sql.insert("question.commentAdd",mComment);
	}

	@Override
	public void commentDel(int mcommentId) {
		sql.delete("question.commentDel", mcommentId);
	}

	@Override
	public void commentUpdate(QuestionComment mComment) {
		sql.update("question.commentUpdate", mComment);
	}

	@Override
	public void views(int menuId) {
		sql.update("question.views", menuId);
	}

	@Override
	public void selection(int mcommentId) {
		sql.update("question.selection",mcommentId);
	}

	@Override
	public void pointUp(String pointGetUser,int pointSet) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id",pointGetUser);
		map.put("pointSet", pointSet);
		sql.update("question.pointUp",map);
	}

	@Override
	public int onlyOnceSelection(int menuId) {
		return sql.selectOne("question.onlyOnceSelection",menuId);
	}

	@Override
	public int userpoint(String username) {
		return sql.selectOne("question.userpoint",username);
	}

	@Override
	public void pointLoseUser(String pointLoseUser, int pointSet) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id",pointLoseUser);
		map.put("pointSet", pointSet);
		sql.update("question.pointDown",map);
	}

}
