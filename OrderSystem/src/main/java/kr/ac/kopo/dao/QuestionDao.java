package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.util.SearchVO;

public interface QuestionDao {

	List<Question> list(SearchVO searchVO);

	void add(Question question);

	Question item(int questionId);

	void update(Question item);

	void delete(int questionId);

	int total(SearchVO searchVO);

	List<QuestionComment> commentList(int questionId);

	void commentAdd(QuestionComment qComment);

	void commentDel(int qcommentId);

	void commentUpdate(QuestionComment qComment);

	void views(int questionId);

	void selection(int qcommentId);

	void pointUp(String pointGetUser, int pointSet);

	int onlyOnceSelection(int questionId);

	int userpoint(String username);

	void pointLoseUser(String pointLoseUser, int pointSet);

}
