package kr.ac.kopo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	final String path = "menu/";
	static final Logger logger=LoggerFactory.getLogger(MenuController.class);
	
	
	@Autowired
	MenuService service;
	
	@RequestMapping("/list")
	String list(Model model) {
		List<Menu> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@RequestMapping(value="/add")
	String add() {
		return path + "add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	String add(Menu menu) {
		service.add(menu);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/uploadAjax",method=RequestMethod.POST)
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		return new ResponseEntity<String>(file.getOriginalFilename(), HttpStatus.CREATED);
	}
	
}
