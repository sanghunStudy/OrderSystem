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
	public void add(Question question) {
		sql.insert("question.add", question);
	}

	@Override
	public Question item(int questionId) {
		return sql.selectOne("question.item", questionId);
	}

	@Override
	public void update(Question item) {
		sql.update("question.update", item);
	}

	@Override
	public void delete(int questionId) {
		sql.delete("question.delete", questionId);
	}

	@Override
	public int total(SearchVO searchVO) {
		return sql.selectOne("question.total", searchVO);
	}

	@Override
	public List<QuestionComment> commentList(int questionId) {
		return sql.selectList("question.commentList", questionId);
	}

	@Override
	public void commentAdd(QuestionComment qComment) {
		sql.insert("question.commentAdd",qComment);
	}

	@Override
	public void commentDel(int qcommentId) {
		sql.delete("question.commentDel", qcommentId);
	}

	@Override
	public void commentUpdate(QuestionComment qComment) {
		sql.update("question.commentUpdate", qComment);
	}

	@Override
	public void views(int questionId) {
		sql.update("question.views", questionId);
	}

	@Override
	public void selection(int qcommentId) {
		sql.update("question.selection",qcommentId);
	}

	@Override
	public void pointUp(String pointGetUser,int pointSet) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id",pointGetUser);
		map.put("pointSet", pointSet);
		sql.update("question.pointUp",map);
	}

	@Override
	public int onlyOnceSelection(int questionId) {
		return sql.selectOne("question.onlyOnceSelection",questionId);
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

	@Override
	public String trainerCheck(String pointGetUser) {
		return sql.selectOne("question.trainerCheck",pointGetUser);
	}

	@Override
	public int mentiCount(String pointGetUser) {
		return sql.selectOne("trainer.mentiCount",pointGetUser);
	}

	@Override
	public void trainerTierLevelUp(String tier, String pointGetUser) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id",pointGetUser);
		map.put("tier", tier);
		sql.update("question.tierLevelUp",map);
	}

}
