package kr.ac.kopo.controller;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.compress.utils.IOUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
import kr.ac.kopo.util.MediaUtils;
import kr.ac.kopo.util.UploadFileUtils;
import kr.ac.kopo.util.VerifyRecaptcha;


@Controller
@RequestMapping("/member")
public class UserController {
	final String path = "member/";
	
	private String uploadPath = "c:\\upload\\";
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService service;
	//스프링 시큐리티 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
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
		public String MyExerciseJournal(Model model,HttpSession session) {
			List<TypeOfExercise> eTlist = service.typeOfExercise();
			model.addAttribute("eTlist",eTlist);
			//로그인한 사람이 user이면 운동일지 입력 페이지로
			if(session.getAttribute("user") != null || session.getAttribute("trainer") != null) {
				return path + "MyExerciseJournal2";
			}
			//아니면 운동 종류 입력 페이지로
			return path + "typeOfExerciseList";
		}
		//관리자가 운동 등록
		@RequestMapping(value="typeOfExerciseAdd", method = RequestMethod.GET)
		public String typeOfExerciseAdd(int teNum, Model model) {
			if(teNum != 0) {
				TypeOfExercise to = service.typeOfExerciseOne(teNum);
				model.addAttribute("to",to);
			}
			return path + "typeOfExerciseAdd";
		}
		
		//관리자가 운동 삭제
		@RequestMapping(value="typeOfExerciseDel", method = RequestMethod.GET)
		public String typeOfExerciseDel(int teNum) {
			service.typeOfExerciseDel(teNum);
			return "redirect:MyExerciseJournal";
		}
		//관리자로 운동일지 들어가서 운동종류 입력
		@RequestMapping(value="typeOfExerciseAdd", method = RequestMethod.POST)
		public String typeOfExerciseAdd(MultipartFile file,TypeOfExercise to) throws IOException, Exception {
			String imgUploadPath = uploadPath + File.separator;
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;
			
			if(file != null) {
					fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				
			}else {
				fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}
			
			to.setTeImg(File.separator + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			System.out.println(to.getTeImg()+"<<<<<<<<<<img");
			if(to.getTeNum() > 0) {
				service.typeOfExerciseUpdate(to);
			}else {
				service.typeOfExerciseAdd(to);
			}
			
			return "redirect:MyExerciseJournal";
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
	public String MyPage(HttpSession session) {
		
		String auth = (String)session.getAttribute("admin");
		
		if(auth != null) {
			return "admin/management";
		}
		
		return path + "MyPage";
	}
	
	@RequestMapping("/imageUpload")
	@ResponseBody
	ResponseEntity<String> profileUpload(MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
		logger.info("originalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		
		
//		String path = service.profileUpload(file,request,response);
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	//트레이너 신청
	@RequestMapping(value="/promotion", method=RequestMethod.GET)
	public String promotion() {
		return path + "promotion";
	}
	//Ajax 파일 업로드 produces는 한국어를 정상적으로 전송하기 위한 속성
		@RequestMapping(value="/promotion", method = RequestMethod.POST)
		public String promotion(TrainerProfile pro,HttpSession session) {
			
			String username = (String)session.getAttribute("user");
			
			if(pro.getUploadFile() != null) {
				String upFilename = pro.getUploadFile().getOriginalFilename();
				try {
					pro.getUploadFile().transferTo(new File(uploadPath + upFilename));
					
					pro.setUpFilename(upFilename);
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			pro.setUsername(username);
			service.promotion(pro);

			return path + "MyPage";
		}
		
		//화면에 저장된 파일을 보여주는 컨트롤러 /년/월/일/파일명 형태로 입력 받는다.
		// displayFile?fileName=/년/월/일/파일명
		@ResponseBody
		@RequestMapping(value="/sample/upload/displayFile", method = RequestMethod.GET)
		public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
			
			InputStream in = null;
			ResponseEntity<byte[]> entity = null;
			
			logger.info("File name: " + fileName);
			
			try {
				String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
				
				MediaType mType = MediaUtils.getMediaType(formatName);
				
				HttpHeaders headers = new HttpHeaders();
				
				in = new FileInputStream(uploadPath + fileName);
				
				
				if(mType != null) {
					headers.setContentType(mType);
				}else {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
				}// else
				
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
				
			} catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				in.close();
			}
			
			return entity;
		}// displayFile
	
	/*@RequestMapping(value="/promotion", method=RequestMethod.POST)
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
	} */
	
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
	public String proList() {
		
		return path + "proList";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxProList")
	public Map<String, Object> ajaxProList() {
		Map<String,Object> map = new HashMap<String,Object>();
		List<TrainerProfile> proList = service.proList();
		map.put("proList",proList);
		
		return map;
	}
	//트레이너 승인
	@ResponseBody
	@RequestMapping("/grant")
	public String grant(TrainerProfile pro, HttpSession session) {
	
		service.grant(pro);
		return "success";
	}
	//트레이너 거절
	@ResponseBody
	@RequestMapping("/grantDel")
	public String grantDel(TrainerProfile pro, HttpSession session) {
		
		service.grantDel(pro);
		
		return "success";
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
		String inputPw = item.getPassword();
		//비번 암호화
		String rockPw = passEncoder.encode(inputPw);
		//암호화한 비번 저장
		item.setPassword(rockPw);
		service.add(item);

		return "redirect:/";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpSession session,Model model) {
		//세션에 있는 모든 키값을 받아와서 직렬화 시킨다.
		Enumeration em = session.getAttributeNames();
		String sessionName;
		String id = null;
		//받아온 키값으로 현재 세션에 있는 아이디 확인
		while(em.hasMoreElements()){
			sessionName = em.nextElement().toString();
			id = session.getAttribute(sessionName).toString();
		}
		System.out.println(id +"<<<<<<<session에 있는 아이디");
		UserVO item = service.item(id);

		model.addAttribute("item", item);

		return path+"update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(UserVO item) {
		logger.info("username ->:" + item.getUsername());
		logger.info("ps ->" + item.getPassword());
		String inputPw = item.getPassword();
		//비번 암호화
		String rockPw = passEncoder.encode(inputPw);
		item.setPassword(rockPw);
		service.update(item);

		return "redirect:/";
	}

	@RequestMapping("/delete")
	public String delete(int id) {
		service.delete(id);

		return "redirect:list";
	}
	
//	구글 리캡챠
	   @ResponseBody
	    @RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	    public int VerifyRecaptcha(HttpServletRequest request) {
	        VerifyRecaptcha.setSecretKey("6Lft0aYUAAAAAJQIFJdN8k6xR7X2YTLLyibbjjJL");
	        String gRecaptchaResponse = request.getParameter("recaptcha");
	        System.out.println(gRecaptchaResponse);
	        //0 = 성공, 1 = 실패, -1 = 오류
	        try {
	            if(VerifyRecaptcha.verify(gRecaptchaResponse))
	                return 0;
	            else return 1;
	        } catch (IOException e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }


}
