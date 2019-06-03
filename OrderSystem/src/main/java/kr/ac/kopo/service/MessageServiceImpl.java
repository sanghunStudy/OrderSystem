package kr.ac.kopo.service;

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

}
