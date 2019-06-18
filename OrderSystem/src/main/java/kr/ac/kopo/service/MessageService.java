package kr.ac.kopo.service;


import java.util.List;

import kr.ac.kopo.model.MessageRepository;


public interface MessageService {

	void add(MessageRepository mr);

	List<MessageRepository> alram(String id);

	int alramCount(String id);

	void alramUpdate(String id);

}
