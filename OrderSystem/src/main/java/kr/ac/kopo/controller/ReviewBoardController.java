package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.service.ReviewBoardService;
import kr.ac.kopo.util.FileVO;

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
	
	@RequestMapping("/view")
	String view(Model model, int reviewId) {
		//조회수
		service.views(reviewId);
		
		ReviewBoard item = service.view(reviewId);
		
		model.addAttribute("item",item);
		
		return path+"view";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(Model model, int reviewId) {
		ReviewBoard item = service.item(reviewId);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(ReviewBoard item) {
		
		service.update(item);
		
		return "redirect:list";
	}
}
