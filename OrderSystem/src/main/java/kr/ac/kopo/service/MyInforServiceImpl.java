package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MyInforDao;
import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.model.UserVO;

@Service
public class MyInforServiceImpl implements MyInforService {

	@Autowired
	MyInforDao myDao;
	
	//회원프로필 조회
	@Override
	public UserVO userProfile(String id) {
		return myDao.userProfile(id);
	}
	//내가 쓴글
	@Override
	public List<Question> myWriting(String id) {
		return myDao.myWriting(id);
	}
	//내가 쓴 댓글
	@Override
	public List<QuestionComment> myWritingComment(String id) {
		return myDao.myWritingComment(id);
	}

}
