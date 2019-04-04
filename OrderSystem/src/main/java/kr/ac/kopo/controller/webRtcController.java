package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.util.URLConn;

@RequestMapping("/opo")
@Controller
public class webRtcController {

	final String path = "webRtc/";
	@RequestMapping("/webRtc")
	String webRtcIndex() {
//		URLConn conn = new URLConn("http://172.16.143.39",9393); 노드로 값 보내기??
		return path+"webRtc";
	}


}
