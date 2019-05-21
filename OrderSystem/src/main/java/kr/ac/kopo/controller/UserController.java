package kr.ac.kopo.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.ExerciseContents;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.TestList;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.TypeOfExercise;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.model.basicInformation;
import kr.ac.kopo.service.UserService;

@Controller
@RequestMapping("/member")
public class UserController {
	final String path = "member/";
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService service;
	

	
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
	public String MyExerciseJournal(Model model) {
		List<TypeOfExercise> eTlist = service.typeOfExercise();
		model.addAttribute("eTlist",eTlist);
		
		return path + "MyExerciseJournal2";
	}
	
	// �떖�젰�뿉�꽌 �궇吏� �겢由��떆 �슫�룞�씪吏� �옉�꽦�븯�뒗 硫붿꽌�뱶
	@RequestMapping(value = "/ExerciseJournalSubmit", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> saveCode(@RequestBody List<Map<String, Object>> param, HttpSession session) {
		String id = (String) session.getAttribute("user");
		service.saveCode(param, id);

		return param;
	}

	/*// �슫�룞�씪吏� �럹�씠吏� �샇異쒖떆 �옄�룞 �떎�뻾�릺硫� list瑜� 媛��졇�삤�뒗 ajax
	@RequestMapping(value = "/ExerciseJournalList", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> ExerciseJournalList(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("user");
		// �쁽�옱 濡쒓렇�씤以묒씤 �궗�슜�옄�쓽 �븘�씠�뵒濡� 由ъ뒪�듃瑜� 媛��졇�삩�떎.
		List<ExerciseJournal> EJ = service.ExerciseJournalList(id);

		map.put("EJ", EJ);
		return map;
	}*/
	
	// �슫�룞�씪吏� �럹�씠吏� �샇異쒖떆 �옄�룞 �떎�뻾�릺硫� list瑜� 媛��졇�삤�뒗 ajax
			@RequestMapping(value = "/ExerciseJournalList", method = RequestMethod.GET)
			
			public String ExerciseJournalList(Model model,HttpSession session) {
				String id = (String)session.getAttribute("user");
				HashMap<String, Object> map = new HashMap<String, Object>();

				// �쁽�옱 濡쒓렇�씤以묒씤 �궗�슜�옄�쓽 �븘�씠�뵒濡� 由ъ뒪�듃瑜� 媛��졇�삩�떎.
				List<ExerciseJournal> EJ = service.ExerciseJournalList(id);
				/*map.put("EJ", EJ);*/
				model.addAttribute("EJ", EJ);
				return path + "MyExerciseJournalList";
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
		System.out.println(exerciseCode);
		List<ExerciseJournal> oneEJ = service.ExerciseJournalOne(exerciseCode);
		model.addAttribute("oneEJ", oneEJ);
		return path + "ExerciseJournalView";
	}

	@RequestMapping("/MyPage")
	public String MyPage() {

		return path + "MyPage";
	}
	
	//트레이너 신청
	@RequestMapping(value="/promotion", method=RequestMethod.GET)
	public String promotion() {
		
		return path + "promotion";
	}
	
	@RequestMapping(value="/promotion", method=RequestMethod.POST)
	public String promotion(TrainerProfile pro,HttpSession session, Model model, MultipartFile profile) throws IOException {
		logger.info("promotionPost");
		
		if(profile != null) {
			logger.info("originalName:" + profile.getOriginalFilename());
			logger.info("size:" + profile.getSize());
			logger.info("ContentType:" + profile.getContentType());
		}
		String savedName = uploadFile(profile.getOriginalFilename(), profile.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		String username = (String)session.getAttribute("user");
		pro.setFile(savedName);
		pro.setUsername(username);
		service.promotion(pro);
	
		return "redirect:MyPage";
	}
	
	//업로드된 파일을 저장하는 함수
	public String uploadFile(String originalName, byte[] fileDate) throws IOException {
			
		UUID uid = UUID.randomUUID();
			
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
			
		//org.springframework.util 패키지의 FileCopyUtils는 파일 데이터를 파일로 처리하거나, 복사하는 등의 기능이 있다.
		FileCopyUtils.copy(fileDate, target);
			
		return savedName;	
	}
	//트레이너 신청 리스트
	@RequestMapping(value="proList")
	public String proList(Model model2) {
		
		List<TrainerProfile> proList = service.proList();
		
		model2.addAttribute("proList",proList);
		
		return path + "proList";
	}
	//트레이너 승인
	@ResponseBody
	@RequestMapping("/grant")
	public JSONObject grant(TrainerProfile pro, HttpSession session) {
		JSONObject json = new JSONObject();
	
		service.grant(pro);
		json.put("success", true);
		json.put("url",  "/user/grant");
		return json;
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
