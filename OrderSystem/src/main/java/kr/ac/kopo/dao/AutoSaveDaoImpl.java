package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.UserVO;

@Repository
public class AutoSaveDaoImpl implements AutoSaveDao {
	@Autowired
	SqlSession sql;

	@Override
	public List<UserVO> list() {
		return sql.selectList("autosave.trainerItem");
	}

}
