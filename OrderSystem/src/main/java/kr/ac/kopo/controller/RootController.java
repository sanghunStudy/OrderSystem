package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	//스프링 시큐리티 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder passEncoder;

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
//		String rawPw = user.getPassword();
//		String encodedPw = userAuthority.getPassword();
//		boolean passMatch = passEncoder.matches(rawPw, encodedPw);
//		System.out.println(user.getPassword()+"user");
//		System.out.println(userAuthority.getPassword()+"userAuthority.getPassword()");
//		System.out.println(passMatch +"passMatch");
			if(userAuthority.getAuthority().equals("user")) {
				session.setAttribute("user", userAuthority.getUsername());
			}else if(userAuthority.getAuthority().equals("trainer")) {
				session.setAttribute("trainer", userAuthority.getUsername());
			}else if(userAuthority.getAuthority().equals("admin")) {
				session.setAttribute("admin", userAuthority.getUsername());
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
		UserVO userAuthority = service.login(user);
		if(userAuthority == null) {
			return 0;
		}else {
			System.out.println(service.login(user)+"service.login(user)");
			String rawPw = user.getPassword();
			String encodedPw = userAuthority.getPassword();
			boolean passMatch = passEncoder.matches(rawPw, encodedPw);
			
			if(passMatch && userAuthority != null) {
				return 1;
			}else {
				System.out.println("로그인 실패");
				return 0;
			}
		}
		
//		if(service.LoginChk(user) == 0) {
//			return 0;
//		}else {
//			return 1;	
//		}
	}

}
