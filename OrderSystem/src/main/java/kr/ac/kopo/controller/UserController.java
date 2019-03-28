package kr.ac.kopo.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.User;
import kr.ac.kopo.service.UserService;

@Controller
@RequestMapping("/member")
public class UserController {
	final String path = "member/";

	@Autowired
	UserService service;

	@RequestMapping(value = "/ExerciseJournal", method = RequestMethod.GET)
	public String ExerciseJournal() {

		return path + "ExerciseJournal";
	}

	//달력에서 날짜 클릭시 운동일지 작성하는 메서드
	@RequestMapping(value = "/ExerciseJournalSubmit", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> saveCode(@RequestBody List<Map<String, Object>> param,Principal principal) {

		service.saveCode(param,principal);

		return param;
	}
	
	//운동일지 페이지 호출시 자동 실행되며 list를 가져오는 ajax
	@RequestMapping(value = "/ExerciseJournalList", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> ExerciseJournalList(Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//현재 로그인중인 사용자의 아이디로 리스트를 가져온다.
		List<ExerciseJournal> EJ = service.ExerciseJournalList(principal.getName());
		
		
		map.put("EJ",EJ);
		return map;
	}
	//운동일지 제목 클릭시 상세내용 가져오기 ORM
	@RequestMapping(value="/ExerciseJournalOne", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> ExerciseJournalOne(int exerciseCode){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ExerciseJournal oneEJ = service.ExerciseJournalOne(exerciseCode);
		map.put("oneEJ", oneEJ);
		return map;
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

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add(Model model) {

		return path + "add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(User item) {
		service.add(item);

		return "redirect:/";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(int id, Model model) {
		User item = service.item(id);

		model.addAttribute("item", item);

		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
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
