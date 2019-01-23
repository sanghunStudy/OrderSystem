package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.NoticeDao;
import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.PageVO;

@Service
public class NoticeServcieImpl implements NoticeServcie {

	@Autowired
	NoticeDao dao;
	
	
	@Override
	public List<Notice> list(PageVO pageVo) {
		
		return dao.list(pageVo);
	}


	@Override
	public void add(Notice notice) {
		dao.add(notice);
	}


	@Override
	public Notice view(int nid) {
		// TODO Auto-generated method stub
		return dao.view(nid);
	}


	@Override
	public void delete(int nid) {
		// TODO Auto-generated method stub
		dao.delete(nid);
	}


	@Override
	public void update(Notice notice) {
		// TODO Auto-generated method stub
		dao.update(notice);
	}


	@Override
	public void views(int nid) {
		// TODO Auto-generated method stub
		dao.views(nid);
	}


	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return dao.totalCount();
	}

}
