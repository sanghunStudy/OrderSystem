package kr.ac.kopo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.MessageRepository;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSession sql;
	//메세지 입력
	@Override
	public void add(MessageRepository mr) {
		sql.insert("message.add",mr);
	}
	//안읽은 메세지 카운트
	@Override
	public int countMessage(String username) {
		return sql.selectOne("message.countMessage", username);
	}

}
