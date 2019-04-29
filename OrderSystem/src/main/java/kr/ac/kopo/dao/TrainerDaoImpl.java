package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.UserVO;

@Repository
public class TrainerDaoImpl implements TrainerDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<UserVO> list() {
		
		return sql.selectList("trainer.list");
	}

	@Override
	public int selectUserbI(String username) {
		// TODO Auto-generated method stub
		return sql.selectOne("trainer.selectUserbI",username);
	}

}
