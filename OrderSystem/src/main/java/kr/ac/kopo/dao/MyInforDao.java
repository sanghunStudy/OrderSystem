package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.model.UserVO;

public interface MyInforDao {

	UserVO userProfile(String id);

	List<Question> myWriting(String id);

	List<QuestionComment> myWritingComment(String id);

}
