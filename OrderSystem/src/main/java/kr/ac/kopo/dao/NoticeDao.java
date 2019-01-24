package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

public interface NoticeDao {

	List<SearchVO> list(SearchVO searchVO);

	void add(Notice notice);

	Notice view(int nid);

	void delete(int nid);

	void update(Notice notice);

	void views(int nid);

	int totalCount(SearchVO searchVO);

	void fileUp(String filenames, String realnames, String filesizes);

	List<FileVO> fileSelect(int nid);

}
