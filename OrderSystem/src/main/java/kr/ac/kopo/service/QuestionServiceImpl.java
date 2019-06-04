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
	public void add(Question menu) {
		dao.add(menu);
	}

	@Override
	public Question item(int menuId) {
		return dao.item(menuId);
	}

	@Override
	public void update(Question item) {
		dao.update(item);
	}

	@Override
	public void delete(int menuId) {
		dao.delete(menuId);
	}

	@Override
	public int total(SearchVO searchVO) {
		return dao.total(searchVO);
	}

	@Override
	public List<QuestionComment> commentList(int menuId) {
		return dao.commentList(menuId);
	}

	@Override
	public void commentAdd(QuestionComment mComment) {
		dao.commentAdd(mComment);
	}

	@Override
	public void commentDel(int mcommentId) {
		dao.commentDel(mcommentId);
	}

	@Override
	public void commentUpdate(QuestionComment mComment) {
		dao.commentUpdate(mComment);
	}

	@Override
	public void views(int menuId) {
		dao.views(menuId);
	}

	@Override
	public void selection(int mcommentId) {
		dao.selection(mcommentId);
	}

	@Override
	public void pointUp(String pointGetUser,int pointSet) {
		dao.pointUp(pointGetUser,pointSet);
	}

	@Override
	public int onlyOnceSelection(int menuId) {
		return dao.onlyOnceSelection(menuId);
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
