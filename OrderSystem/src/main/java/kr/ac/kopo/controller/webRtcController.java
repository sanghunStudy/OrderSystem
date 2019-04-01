package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/opo")
@Controller
public class webRtcController {

	final String path = "webRtc/";
	@RequestMapping("/webRtc")
	String webRtcIndex() {
		
		return path+"webRtc";
	}
}
