package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	final String path = "menu/";
	
	@Autowired
	MenuService service;
	
	@RequestMapping("/list")
	String list(Model model) {
		List<Menu> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
}
