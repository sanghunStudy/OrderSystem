package kr.ac.kopo.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.ExerciseContents;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.TestList;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.model.basicInformation;
import kr.ac.kopo.service.UserService;

@Controller
@RequestMapping("/member")
public class UserController {
	final String path = "member/";

	@Autowired
	UserService service;
	
//	회원 기초정보 입력 화면
	@RequestMapping(value="/basicInformation",method=RequestMethod.GET)
	String basicInformation(String manager) {
		
		return path+ "basicInformation";
	}
// 회원 기초정보 입력 처리
	@RequestMapping(value="/basicInformation",method=RequestMethod.POST)
	String basicInformation(basicInformation bI,HttpSession session) {
		String id = (String)session.getAttribute("user");
		bI.setUsername(id);
		service.basicInformation(bI);
		return "redirect:MyPage";
	}
	
	@RequestMapping(value = "/ExerciseJournal", method = RequestMethod.GET)
	public String ExerciseJournal() {

		return path + "ExerciseJournal";
	}
	
	//운동일지 새로운 버전
	@RequestMapping(value="/MyExerciseJournal", method = RequestMethod.GET)
	public String MyExerciseJournal() {
		
		return path + "MyExerciseJournal";
	}
	
	// 달력에서 날짜 클릭시 운동일지 작성하는 메서드
	@RequestMapping(value = "/ExerciseJournalSubmit", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> saveCode(@RequestBody List<Map<String, Object>> param, HttpSession session) {
		String id = (String) session.getAttribute("user");
		service.saveCode(param, id);

		return param;
	}

	// 운동일지 페이지 호출시 자동 실행되며 list를 가져오는 ajax
	@RequestMapping(value = "/ExerciseJournalList", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> ExerciseJournalList(Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 현재 로그인중인 사용자의 아이디로 리스트를 가져온다.
		List<ExerciseJournal> EJ = service.ExerciseJournalList(principal.getName());

		map.put("EJ", EJ);
		return map;
	}

	@RequestMapping(value = "/ExerciseJournalUpdate", method = RequestMethod.GET)
	public String ExerciseJournalUpdate(int exerciseCode, Model model) {
		List<ExerciseJournal> oneEJ = service.ExerciseJournalUpdate(exerciseCode);
		model.addAttribute("oneEJ", oneEJ);
		return path + "ExerciseJournalUpdate";
	}

	// 운동일지 수정처리
	@RequestMapping(value = "/ExerciseJournalUpdate", method = RequestMethod.POST)
	public String ExerciseJournalUpdate(TestList test) {
		// @RequestParam(value="exerciseContentsCode", required=true) List<Integer>
		// exerciseContentsCode

		List<ExerciseContents> list = test.getItemList();

		for (int i = 0; i < list.size(); i++) {
			service.ExerciseJournalUpdate(list.get(i));
		}

		return "redirect:ExerciseJournal";
	}

	@RequestMapping(value = "/ExerciseJournalDel", method = RequestMethod.GET)
	public String ExerciseJournalDel(int exerciseCode) {
		service.ExerciseJournalDel(exerciseCode);

		return "redirect:ExerciseJournal";
	}
	// 운동일지 제목 클릭시 상세내용 가져오기 ORM
//	@RequestMapping(value="/ExerciseJournalOne", method = RequestMethod.POST)
//	@ResponseBody
//	public HashMap<String, Object> ExerciseJournalOne(int exerciseCode){
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		List<ExerciseJournal> oneEJ = service.ExerciseJournalOne(exerciseCode);
//		map.put("oneEJ", oneEJ);
//		return map;
//	}

	// 운동일지 제목 클릭시 상세내용 가져오기 화면전환 버전
	@RequestMapping(value = "/ExerciseJournalView", method = RequestMethod.GET)
	public String ExerciseJournalOne(int exerciseCode, Model model) {

		List<ExerciseJournal> oneEJ = service.ExerciseJournalOne(exerciseCode);
		model.addAttribute("oneEJ", oneEJ);
		return path + "ExerciseJournalView";
	}

	@RequestMapping("/MyPage")
	public String MyPage() {

		return path + "MyPage";
	}

	@RequestMapping("/list")
	public String list(Model model) {
		List<UserVO> list = service.list();

		model.addAttribute("list", list);

		return path + "list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add(Model model) {

		return path + "add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(UserVO item) {
		service.add(item);

		return "redirect:/";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(int id, Model model) {
		UserVO item = service.item(id);

		model.addAttribute("item", item);

		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(UserVO item) {
		service.update(item);

		return "redirect:list";
	}

	@RequestMapping("/delete")
	public String delete(int id) {
		service.delete(id);

		return "redirect:list";
	}

}
