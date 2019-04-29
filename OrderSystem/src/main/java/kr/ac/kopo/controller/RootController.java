package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.service.UserService;


@Controller
public class RootController {

	@Autowired
	UserService service;

	
	@RequestMapping("/")
	String index() {
		
		return "index";
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	String login() {
		return "login";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	String login(UserVO user, HttpSession session) {
		
		UserVO userAuthority = service.login(user);
		System.out.println(userAuthority.getAuthority());
		if(userAuthority.getAuthority().equals("user")) {
			session.setAttribute("user", userAuthority.getUsername());
		}else if(userAuthority.getAuthority().equals("trainer")) {
			session.setAttribute("trainer", userAuthority.getUsername());
		}else if(userAuthority.getAuthority().equals("admin")) {
			session.setAttribute("admin", userAuthority.getUsername());
		}else {
			System.out.println("로그인 실패");
		}
		
		return "redirect:.";
	}
	
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
}
