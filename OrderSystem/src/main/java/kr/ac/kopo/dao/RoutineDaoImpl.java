package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Routine;
import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

@Repository
public class RoutineDaoImpl implements RoutineDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Routine> list(SearchVO searchVO) {
		
		return sql.selectList("routine.list",searchVO);
	}

	@Override
	public void add(Routine notice) {
		sql.insert("routine.add", notice);
	}

	@Override
	public Routine view(int nid) {
		// TODO Auto-generated method stub
		return sql.selectOne("routine.view",nid);
	}

	@Override
	public void delete(int nid) {
		// TODO Auto-generated method stub
		sql.delete("routine.delete",nid);
	}

	@Override
	public void update(Routine notice) {
		// TODO Auto-generated method stub
		sql.update("routine.update", notice);
	}

	@Override
	public void views(int nid) {
		sql.update("routine.views",nid);
	}

	@Override
	public int totalCount(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return sql.selectOne("routine.total",searchVO);
	}

	
	@Override
	public void fileUp(String filenames, String realnames, String filesizes) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("filename", filenames);
		map.put("realname", realnames);
		map.put("filesize", filesizes);
		
		System.out.println(filesizes+"<<<<<<<<<<<<파일사이즈");
		sql.insert("routine.fileUp",map);
	}

	@Override
	public List<FileVO> fileSelect(int nid) {
		return sql.selectList("routine.fileSelect",nid);
	}

	@Override
	public void commentAdd(NoticeComment nComment) {
		// TODO Auto-generated method stub
		sql.insert("routine.commentAdd",nComment);
	}

	@Override
	public List<NoticeComment> commentList(NoticeComment nComment) {
		// TODO Auto-generated method stub
		return sql.selectList("routine.commentList",nComment);
	}

	@Override
	public void commentDel(NoticeComment nComment) {
		// TODO Auto-generated method stub
		sql.delete("routine.commentDel",nComment);
	}

	@Override
	public void commentUpdate(NoticeComment nComment) {
		// TODO Auto-generated method stub
		sql.update("routine.commentUpdate", nComment);
	}

	@Override
	public List<Routine> staticList() {
		// TODO Auto-generated method stub
		return sql.selectList("routine.staticList");
	}

}
