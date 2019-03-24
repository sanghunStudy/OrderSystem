package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/strength")
public class StrengthController {
	final String th = "strength/";
	
	@RequestMapping("/training")
	String Training() {
		return th + "training";
	}
}
