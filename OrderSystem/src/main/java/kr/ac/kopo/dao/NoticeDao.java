package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.PageVO;

public interface NoticeDao {

	List<Notice> list(PageVO pageVo);

	void add(Notice notice);

	Notice view(int nid);

	void delete(int nid);

	void update(Notice notice);

	void views(int nid);

	int totalCount();

}
