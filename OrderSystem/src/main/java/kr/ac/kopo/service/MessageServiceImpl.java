package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MessageDao;
import kr.ac.kopo.model.MessageRepository;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao messageDao;
	
	@Override
	public void add(MessageRepository mr) {
		messageDao.add(mr);
	}

	@Override
	public List<MessageRepository> alram(String id) {
		return messageDao.alram(id);
	}

	@Override
	public int alramCount(String id) {
		return messageDao.countMessage(id);
	}

	@Override
	public void alramUpdate(String id) {
		messageDao.alramUpdate(id);
	}

}
