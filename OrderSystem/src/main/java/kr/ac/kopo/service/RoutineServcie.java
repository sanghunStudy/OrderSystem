package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Routine;
import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

public interface RoutineServcie {

	List<Routine> list(SearchVO NsearchVO);

	void add(Routine notice);

	Routine view(int nid);

	void delete(int nid);

	void update(Routine notice);

	void views(int nid);

	int totalCount(SearchVO saerchVO);

	void fileUp(String filenames, String realnames, String filesizes);

	List<FileVO> fileSelect(int nid);

	void commentAdd(NoticeComment nComment);

	List<NoticeComment> commentList(NoticeComment nComment);

	void conmentDel(NoticeComment nComment);

	void commentUpdate(NoticeComment nComment);
	//검색 페이징 안되는 다른 게시판에 불러오는 용도의 공지사항 리스트
	List<Routine> staticList();

	void filedelete(String fileName);

}
