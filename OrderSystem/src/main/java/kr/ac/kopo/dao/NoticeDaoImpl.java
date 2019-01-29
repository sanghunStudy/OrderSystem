package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<SearchVO> list(SearchVO searchVO) {
		
		return sql.selectList("notice.list",searchVO);
	}

	@Override
	public void add(Notice notice) {
		sql.insert("notice.add", notice);
	}

	@Override
	public Notice view(int nid) {
		// TODO Auto-generated method stub
		return sql.selectOne("notice.view",nid);
	}

	@Override
	public void delete(int nid) {
		// TODO Auto-generated method stub
		sql.delete("notice.delete",nid);
	}

	@Override
	public void update(Notice notice) {
		// TODO Auto-generated method stub
		sql.update("notice.update", notice);
	}

	@Override
	public void views(int nid) {
		sql.update("notice.views",nid);
	}

	@Override
	public int totalCount(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return sql.selectOne("notice.total",searchVO);
	}

	
	@Override
	public void fileUp(String filenames, String realnames, String filesizes) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("filename", filenames);
		map.put("realname", realnames);
		map.put("filesize", filesizes);
		
		System.out.println(filesizes+"<<<<<<<<<<<<파일사이즈");
		sql.insert("notice.fileUp",map);
	}

	@Override
	public List<FileVO> fileSelect(int nid) {
		return sql.selectList("notice.fileSelect",nid);
	}

}
