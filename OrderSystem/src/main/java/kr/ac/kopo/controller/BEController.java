package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.service.BEservice;

@Controller
@RequestMapping("/BE")
public class BEController {
	final String path = "BE/";
	
	@Autowired
	BEservice service;
	
	@RequestMapping("/add")
	String BEData() {
		return path + "add";
	}
	
	@RequestMapping(value="/besave", method=RequestMethod.POST)
	@ResponseBody
	int BEDataAdd(BEsave besave, HttpSession session) {
		
		return service.add(besave);
	}
	
}
