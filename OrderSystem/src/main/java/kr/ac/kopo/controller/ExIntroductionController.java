package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ExIntroduction")
@Controller
public class ExIntroductionController {

	final String path = "ExIntroduction/";
	
	@RequestMapping("/chest")
	String chest() {
		
		return path+"chest";
	}

	@RequestMapping("/back")
	String back() {
		
		return path+"back";
	}
	
	@RequestMapping("/abs")
	String abs() {
		
		return path+"abs";
	}
	
	@RequestMapping("/shoulder")
	String shoulder() {
		
		return path+"shoulder";
	}
	
	@RequestMapping("/biceps")
	String biceps() {
		
		return path+"biceps";
	}
	
	@RequestMapping("/triceps")
	String triceps() {
		
		return path+"triceps";
	}
	
	@RequestMapping("/lowbody")
	String lowbody() {
		
		return path+"lowbody";
	}
	
	
}
