package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.model.basicInformation;
import kr.ac.kopo.service.TrainerService;
@Controller
@RequestMapping("/trainer")
public class TrainerController {

	final String path = "trainer/";
	
	@Autowired
	TrainerService service;
	//트레이너 리스트 출력
	@RequestMapping("/list")
	String list(Model model) {
			List<TrainerProfile> trainer = service.list();
			
			model.addAttribute("trainerList",trainer);
			
		return path+"list";
	}
	//pt신청 버튼을 눌렀을때 회원 기초 정보가 등록되어 있나 확인
	@RequestMapping("selectUserbI")
	@ResponseBody
	int selectUserbI(HttpSession session) {
		String username = (String)session.getAttribute("user");

		//회원 기초정보 없음
		if(service.selectUserbI(username) == 0) {
			return 0;
		//이미 트레이닝을 신청한 회원
		}else if(service.selectApply(username) > 0){
			return 2;
		//두가지 경우를 다 통과했을때
		}else {
			return 1;
		}
	}
	
	//pt신청을 했을때 트레이너한테 회원 아이디가 저장됨
	@RequestMapping(value="/apply", method=RequestMethod.POST)
	String apply(UserManagement um, HttpSession session) {
		
		String id = (String)session.getAttribute("user");
		um.setUsername(id);
		service.apply(um);
		return "redirect:list";
	}
	
	//pt신청 승인 대기 회원리스트
	@RequestMapping(value="waitingForApproval")
	String waitingForApproval(HttpSession session, Model model) {
		String id = (String)session.getAttribute("trainer");
		List<UserManagement> wfaList = service.waitingForApproval(id); 
		model.addAttribute("wfaList",wfaList);
		return path + "waitingForApproval";
	}
	
	//회원의 정보 확인
	@RequestMapping(value="userDetailView", method=RequestMethod.GET)
	@ResponseBody
	public  Map<String, Object> userDetailView(String username) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		basicInformation userD = service.userDetailView(username);
		map.put("Detail",userD);
		return map;
	}
	//회원 승인허가
	@RequestMapping(value="grantApproval", method=RequestMethod.POST)
	String grantApproval(String username) {
		service.grantApproval(username);
		return "redirect:waitingForApproval";
	}
	//pt신청할 때 해당 트레이너 티어,멘티수로 제한
	@ResponseBody
	@RequestMapping(value="trainer/checkTrainerTier", method=RequestMethod.GET)
	String checkTrainerTier(String username) {
		
		String tier = service.tierCheck(username);
		int menti = service.mentiCount(username);
		
		if(tier.equals("bronze")&&menti<=5) {
			return "OK";
		} else if(tier.equals("silver")&&menti<=10) {
			return "OK";
		} else if(tier.equals("gold")&&menti<=15) {
			return "OK";
		} else if(tier.equals("platinum")&&menti<=20) {
			return "OK";
		} else if(tier.equals("diamond")&&menti<=25) {
			return "OK";
		} else {
			return "NO";
		}
	}
}
