package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.PageVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Notice> list(PageVO pageVo) {
		
		return sql.selectList("notice.list",pageVo);
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
		// TODO Auto-generated method stub
		sql.update("notice.views",nid);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return sql.selectOne("notice.total");
	}

}
