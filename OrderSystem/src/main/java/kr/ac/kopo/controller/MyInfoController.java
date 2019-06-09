package kr.ac.kopo.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.service.MyInforService;
import kr.ac.kopo.service.UserService;
import kr.ac.kopo.util.VerifyRecaptcha;

@RequestMapping("/member")
@Controller
public class MyInfoController {

	@Autowired
	MyInforService myService;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	final String path = "member/";
	
	@RequestMapping("/MyPage")
	public String MyPage(HttpSession session,Model model) {
		Enumeration em = session.getAttributeNames();
		String sessionName;
		String id = null;
		//받아온 키값으로 현재 세션에 있는 아이디 확인
		while(em.hasMoreElements()){
			sessionName = em.nextElement().toString();
			id = session.getAttribute(sessionName).toString();
		}
		
		UserVO userProfile = myService.userProfile(id);
		
		List<Question> qBoard = myService.myWriting(id);
		List<QuestionComment> qBoardComment = myService.myWritingComment(id);
		
		model.addAttribute("userProfile",userProfile);
		model.addAttribute("qBoard",qBoard);
		model.addAttribute("qBoardComment",qBoardComment);
		
		String auth = (String) session.getAttribute("admin");
		if (auth != null) {
			return "admin/management";
		}

		return path + "myinfo";
	}
	

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpSession session,Model model) {
		//세션에 있는 모든 키값을 받아와서 직렬화 시킨다.
		Enumeration em = session.getAttributeNames();
		String sessionName;
		String id = null;
		//받아온 키값으로 현재 세션에 있는 아이디 확인
		while(em.hasMoreElements()){
			sessionName = em.nextElement().toString();
			id = session.getAttribute(sessionName).toString();
		}
//		System.out.println(id +"<<<<<<<session에 있는 아이디");
		UserVO item = service.item(id);

		model.addAttribute("item", item);

		return path+"update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(UserVO item) {
		logger.info("username ->:" + item.getUsername());
		logger.info("ps ->" + item.getPassword());
		String inputPw = item.getPassword();
		//비번 암호화
		String rockPw = passEncoder.encode(inputPw);
		item.setPassword(rockPw);
		service.update(item);

		return "redirect:/";
	}

	@RequestMapping("/delete")
	public String delete(int id) {
		service.delete(id);

		return "redirect:list";
	}
	
//	구글 리캡챠
	   @ResponseBody
	    @RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	    public int VerifyRecaptcha(HttpServletRequest request) {
	        VerifyRecaptcha.setSecretKey("6Lft0aYUAAAAAJQIFJdN8k6xR7X2YTLLyibbjjJL");
	        String gRecaptchaResponse = request.getParameter("recaptcha");
	        System.out.println(gRecaptchaResponse);
	        //0 = 성공, 1 = 실패, -1 = 오류
	        try {
	            if(VerifyRecaptcha.verify(gRecaptchaResponse))
	                return 0;
	            else return 1;
	        } catch (IOException e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }

}
