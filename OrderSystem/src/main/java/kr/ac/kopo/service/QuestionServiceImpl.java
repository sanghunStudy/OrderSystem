package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.QuestionDao;
import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.util.SearchVO;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	QuestionDao dao;

	@Override
	public List<Question> list(SearchVO searchVO) {
		return dao.list(searchVO);
	}

	@Override
	public void add(Question question) {
		dao.add(question);
	}

	@Override
	public Question item(int questionId) {
		return dao.item(questionId);
	}

	@Override
	public void update(Question item) {
		dao.update(item);
	}

	@Override
	public void delete(int questionId) {
		dao.delete(questionId);
	}

	@Override
	public int total(SearchVO searchVO) {
		return dao.total(searchVO);
	}

	@Override
	public List<QuestionComment> commentList(int questionId) {
		return dao.commentList(questionId);
	}

	@Override
	public void commentAdd(QuestionComment qComment) {
		dao.commentAdd(qComment);
	}

	@Override
	public void commentDel(int qcommentId) {
		dao.commentDel(qcommentId);
	}

	@Override
	public void commentUpdate(QuestionComment qComment) {
		dao.commentUpdate(qComment);
	}

	@Override
	public void views(int questionId) {
		dao.views(questionId);
	}

	@Override
	public void selection(int qcommentId) {
		dao.selection(qcommentId);
	}

	@Override
	public void pointUp(String pointGetUser,int pointSet) {
		dao.pointUp(pointGetUser,pointSet);
	}

	@Override
	public int onlyOnceSelection(int questionId) {
		return dao.onlyOnceSelection(questionId);
	}

	@Override
	public int userpoint(String username) {
		return dao.userpoint(username);
	}

	@Override
	public void pointDown(String pointLoseUser, int pointSet) {
		dao.pointLoseUser(pointLoseUser,pointSet);
	}

}
