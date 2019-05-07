package kr.ac.kopo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.BEsave;

@Repository
public class BEDaoImpl implements BEDao {

	@Autowired
	SqlSession sql;

	@Override
	public int add(BEsave besave) {

		sql.insert("bedata.add", besave);
		return 1;

	}

}
