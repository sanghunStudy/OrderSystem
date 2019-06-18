package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.MessageRepository;

public interface MessageDao {

	//메세지 입력
	void add(MessageRepository mr);

	//메세지 개수 카운트
	int countMessage(String username);

	List<MessageRepository> alram(String id);

	void alramUpdate(String id);

}
