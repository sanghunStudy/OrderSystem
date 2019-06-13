package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.util.SearchVO;

public interface QuestionService {

	List<Question> list(SearchVO searchVO);

	void add(Question question);

	Question item(int questionId);

	void update(Question item);

	void delete(int questionId);
	
	int total(SearchVO searchVO);

	List<QuestionComment> commentList(int questionId);

	void commentAdd(QuestionComment qComment);

	void commentDel(QuestionComment QComment);

	void commentUpdate(QuestionComment qComment);

	void views(int questionId);

	void selection(int qcommentId);

	void pointUp(String pointGetUser, int pointSet);

	int onlyOnceSelection(int questionId);

	int userpoint(String username);

	void pointDown(String pointLoseUser, int pointSet);

}
