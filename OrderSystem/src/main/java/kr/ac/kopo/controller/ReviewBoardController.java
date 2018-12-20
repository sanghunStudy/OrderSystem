package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.service.ReviewBoardService;

@Controller
@RequestMapping("/review_board")
public class ReviewBoardController {
	final String path = "review_board/";
	
	@Autowired
	ReviewBoardService service;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<ReviewBoard> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String add() {
		
		return path + "add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(ReviewBoard item) {
		
		service.add(item);
		
		return "redirect:list";
	}	
}
