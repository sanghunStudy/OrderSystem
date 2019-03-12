package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/gps")
public class getLocationController {

	final String path = "gps/";
	
	@RequestMapping("/getLocation")
	String getLocation() {
		return path+"getLocation";
	}
}
