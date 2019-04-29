package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.service.TrainerService;
@Controller
@RequestMapping("/trainer")
public class TrainerController {

	final String path = "trainer/";
	
	@Autowired
	TrainerService service;
	
	@RequestMapping("/list")
	String list(Model model) {
			List<UserVO> trainer = service.list();
			
			model.addAttribute("trainerList",trainer);
		return path+"list";
	}
	//pt신청 버튼을 눌렀을때 회원 기초 정보가 등록되어 있나 확인
	@RequestMapping("selectUserbI")
	@ResponseBody
	int selectUserbI(HttpSession session) {
		String username = (String)session.getAttribute("user");
		
		if(service.selectUserbI(username) > 0) {
			return 1;
		}else {
			return 0;	
		}
	}
	
	//pt신청을 했을때 트레이너한테 회원 아이디가 저장됨
	@RequestMapping("/apply")
	String apply(String manager) {
		System.out.println(manager);
		
		return path+"apply";
	}
}
