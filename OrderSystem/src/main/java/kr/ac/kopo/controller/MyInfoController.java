package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/member")
@Controller
public class MyInfoController {
	final String path = "member/";

	@RequestMapping("/MyPage")
	public String MyPage(HttpSession session) {

		String auth = (String) session.getAttribute("admin");

		if (auth != null) {
			return "admin/management";
		}

		return path + "myinfo";
	}

}
