package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Routine;
import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

public interface RoutineDao {

	List<Routine> list(SearchVO searchVO);

	void add(Routine notice);

	Routine view(int nid);

	void delete(int nid);

	void update(Routine notice);

	void views(int nid);

	int totalCount(SearchVO searchVO);

	void fileUp(String filenames, String realnames, String filesizes);

	List<FileVO> fileSelect(int nid);

	void commentAdd(NoticeComment nComment);

	List<NoticeComment> commentList(NoticeComment nComment);

	void commentDel(NoticeComment nComment);

	void commentUpdate(NoticeComment nComment);

	List<Routine> staticList();

}
