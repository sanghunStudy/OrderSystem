package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.ExerciseJournalList;
import kr.ac.kopo.model.User;
import kr.ac.kopo.service.UserService;

@Controller
@RequestMapping("/member")
public class UserController {
	final String path = "member/";
	
	@Autowired
	UserService service;
	
	
	@RequestMapping(value="/ExerciseJournal",method=RequestMethod.GET)
	public String ExerciseJournal() {
		
		return path+"ExerciseJournal";
	}
	
	@RequestMapping(value="/ExerciseJournal", method=RequestMethod.POST)
	public String ExerciseJournal(@ModelAttribute ExerciseJournalList ejl) {
		
		System.out.println(ejl.getEj());
		return "redirect:MyPage";
	}
	
	@RequestMapping("/MyPage")
	public String MyPage() {
		
		return path + "MyPage";
	}
	
	
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<User> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	String add(Model model) {
		
		return path + "add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(User item) {
		service.add(item);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(int id, Model model) {
		User item = service.item(id);
		
		model.addAttribute("item", item);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(User item) {
		service.update(item);
		
		return "redirect:list";
	}
	@RequestMapping("/delete")
	public String delete(int id) {
		service.delete(id);
		
		return "redirect:list";
	}

}
