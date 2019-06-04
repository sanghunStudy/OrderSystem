package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.util.SearchVO;

public interface QuestionDao {

	List<Question> list(SearchVO searchVO);

	void add(Question menu);

	Question item(int menuId);

	void update(Question item);

	void delete(int menuId);

	int total(SearchVO searchVO);

	List<QuestionComment> commentList(int menuId);

	void commentAdd(QuestionComment mComment);

	void commentDel(int mcommentId);

	void commentUpdate(QuestionComment mComment);

	void views(int menuId);

	void selection(int mcommentId);

	void pointUp(String pointGetUser, int pointSet);

	int onlyOnceSelection(int menuId);

	int userpoint(String username);

	void pointLoseUser(String pointLoseUser, int pointSet);

}
