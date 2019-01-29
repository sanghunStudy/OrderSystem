package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.NoticeDao;
import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

@Service
public class NoticeServcieImpl implements NoticeServcie {

	@Autowired
	NoticeDao dao;
	
	
	@Override
	public List<SearchVO> list(SearchVO searchVO) {
		
		return dao.list(searchVO);
	}


	@Override
	public void add(Notice notice) {
		dao.add(notice);
	}


	@Override
	public Notice view(int nid) {
		return dao.view(nid);
	}


	@Override
	public void delete(int nid) {
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
	public int totalCount(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.totalCount(searchVO);
	}

	@Override
	public void fileUp(String filenames, String realnames, String filesizes) {
		// TODO Auto-generated method stub
		dao.fileUp(filenames,realnames,filesizes);
	}


	@Override
	public List<FileVO> fileSelect(int nid) {
		// TODO Auto-generated method stub
		return dao.fileSelect(nid);
	}

}
