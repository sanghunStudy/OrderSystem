package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.PageVO;

public interface NoticeServcie {

	List<Notice> list(PageVO pageVo);

	void add(Notice notice);

	Notice view(int nid);

	void delete(int nid);

	void update(Notice notice);

	void views(int nid);

	int totalCount();

}
