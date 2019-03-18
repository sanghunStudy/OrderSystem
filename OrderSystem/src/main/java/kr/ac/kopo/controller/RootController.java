package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.User;
import kr.ac.kopo.service.UserService;


@Controller
public class RootController {

	@Autowired
	UserService service;

	
	@RequestMapping("/")
	String index() {
		
		return "index";
	}

	/*@RequestMapping(value="/login", method=RequestMethod.GET)
	String login() {
		return "login";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	String login(User user, HttpSession session) {
		
		
		if(service.login(user)) {
			session.setAttribute("user", user.getId());
		}else {
			System.out.println("로그인 실패");
		}
		
		return "redirect:.";
	}*/
	
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:";
	}
}
