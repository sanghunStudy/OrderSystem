package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calorie")
public class CalorieController {
	final String path = "calorie/";

	
	@RequestMapping("calculator")
	public String calPage() {
		
		return path + "calculator";
	}
	
}
