package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//아이디 중복체크
	@RequestMapping("/idChk")
	@ResponseBody
	int idChk(String username) {
		if(service.idChk(username) == 0) {
			return 0;
		}else {
			return 1;	
		}
	}
	
	
	//로그인시 아이디 및 패스퉈드 확인
	@RequestMapping("/LoginChk")
	@ResponseBody
	int LoginChk(UserVO user) {
		if(service.LoginChk(user) == 0) {
			return 0;
		}else {
			return 1;	
		}
	}

}
