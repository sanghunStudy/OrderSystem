package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.MessageRepository;
import kr.ac.kopo.service.MessageService;

@RequestMapping("/alram")
@Controller
public class MessageController {

	@Autowired
	MessageService messageService;
	
	final String path = "websocket/";
	
	@RequestMapping("/messageTest")
	String messageTest() {
		return path+"messageTest";
	}
	
	@RequestMapping("message")
	String message() {
		return path+"message";
	}
	String id;
	@RequestMapping("count")
	@ResponseBody
	int alram(HttpSession session){
		id = session.getAttribute("trainer").toString();
		int alramCount = messageService.alramCount(id);
		return alramCount;
	}
	
	@RequestMapping("alramList")
	@ResponseBody
	List<MessageRepository> alramList(HttpSession session){
		id = session.getAttribute("trainer").toString();
		List<MessageRepository> mrList = messageService.alram(id);
		return mrList;
	}	
	@RequestMapping("alramUpdate")
	@ResponseBody
	void alramUpdate(HttpSession session){
		id = session.getAttribute("trainer").toString();
		messageService.alramUpdate(id);
	}
}
