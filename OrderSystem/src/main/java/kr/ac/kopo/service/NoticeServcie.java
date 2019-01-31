package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

public interface NoticeServcie {

	List<Notice> list(SearchVO searchVO);

	void add(Notice notice);

	Notice view(int nid);

	void delete(int nid);

	void update(Notice notice);

	void views(int nid);

	int totalCount(SearchVO saerchVO);

	void fileUp(String filenames, String realnames, String filesizes);

	List<FileVO> fileSelect(int nid);

	void commentAdd(NoticeComment nComment);

	List<NoticeComment> commentList(NoticeComment nComment);

	void conmentDel(NoticeComment nComment);

	void commentUpdate(NoticeComment nComment);

}