package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.MessageRepository;
import kr.ac.kopo.service.MessageService;

@RequestMapping("/webSocket")
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
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	String add(MessageRepository mr, HttpSession session) {
		String id = (String)session.getAttribute("user");
		mr.setUsername(id);
		messageService.add(mr);
		return "redirect:message";
	}
}
