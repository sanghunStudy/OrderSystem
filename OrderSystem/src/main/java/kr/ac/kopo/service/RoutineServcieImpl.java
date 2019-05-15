package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.RoutineDao;
import kr.ac.kopo.model.Routine;
import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

@Service
public class RoutineServcieImpl implements RoutineServcie {

	@Autowired
	RoutineDao dao;
	
	
	@Override
	public List<Routine> list(SearchVO NsearchVO) {
		
		return dao.list(NsearchVO);
	}


	@Override
	public void add(Routine notice) {
		dao.add(notice);
	}


	@Override
	public Routine view(int nid) {
		return dao.view(nid);
	}


	@Override
	public void delete(int nid) {
		dao.delete(nid);
	}


	@Override
	public void update(Routine notice) {
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


	@Override
	public void commentAdd(NoticeComment nComment) {
		// TODO Auto-generated method stub
		dao.commentAdd(nComment);
	}


	@Override
	public List<NoticeComment> commentList(NoticeComment nComment) {
		// TODO Auto-generated method stub
		return dao.commentList(nComment);
	}


	@Override
	public void conmentDel(NoticeComment nComment) {
		// TODO Auto-generated method stub
		dao.commentDel(nComment);
	}


	@Override
	public void commentUpdate(NoticeComment nComment) {
		// TODO Auto-generated method stub
		dao.commentUpdate(nComment);
	}


	@Override
	public List<Routine> staticList() {
		// TODO Auto-generated method stub
		return dao.staticList();
	}


	@Override
	public void filedelete(String fileName) {
		// TODO Auto-generated method stub
		dao.filedelete(fileName);
	}

}
