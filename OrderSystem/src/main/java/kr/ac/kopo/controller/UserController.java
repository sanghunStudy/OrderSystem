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
	
	@RequestMapping("/analysis")
	private String analysis() {
		return path + "analysis";
	}
	
//	�쉶�썝 湲곗큹�젙蹂� �엯�젰 �솕硫�
	@RequestMapping(value="/basicInformation",method=RequestMethod.GET)
	String basicInformation(String manager) {
		
		return path+ "basicInformation";
	}
// �쉶�썝 湲곗큹�젙蹂� �엯�젰 泥섎━
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
	
	//�슫�룞�씪吏� �깉濡쒖슫 踰꾩쟾
	@RequestMapping(value="/MyExerciseJournal", method = RequestMethod.GET)
	public String MyExerciseJournal() {
		
		return path + "MyExerciseJournal";
	}
	
	// �떖�젰�뿉�꽌 �궇吏� �겢由��떆 �슫�룞�씪吏� �옉�꽦�븯�뒗 硫붿꽌�뱶
	@RequestMapping(value = "/ExerciseJournalSubmit", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> saveCode(@RequestBody List<Map<String, Object>> param, HttpSession session) {
		String id = (String) session.getAttribute("user");
		service.saveCode(param, id);

		return param;
	}

	// �슫�룞�씪吏� �럹�씠吏� �샇異쒖떆 �옄�룞 �떎�뻾�릺硫� list瑜� 媛��졇�삤�뒗 ajax
	@RequestMapping(value = "/ExerciseJournalList", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> ExerciseJournalList(Principal principal) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		// �쁽�옱 濡쒓렇�씤以묒씤 �궗�슜�옄�쓽 �븘�씠�뵒濡� 由ъ뒪�듃瑜� 媛��졇�삩�떎.
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

	// �슫�룞�씪吏� �닔�젙泥섎━
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
	// �슫�룞�씪吏� �젣紐� �겢由��떆 �긽�꽭�궡�슜 媛��졇�삤湲� ORM
//	@RequestMapping(value="/ExerciseJournalOne", method = RequestMethod.POST)
//	@ResponseBody
//	public HashMap<String, Object> ExerciseJournalOne(int exerciseCode){
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		List<ExerciseJournal> oneEJ = service.ExerciseJournalOne(exerciseCode);
//		map.put("oneEJ", oneEJ);
//		return map;
//	}

	// �슫�룞�씪吏� �젣紐� �겢由��떆 �긽�꽭�궡�슜 媛��졇�삤湲� �솕硫댁쟾�솚 踰꾩쟾
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
