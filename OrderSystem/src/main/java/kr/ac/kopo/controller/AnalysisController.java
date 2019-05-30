package kr.ac.kopo.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.MentiPerformance;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.service.AnalysisService;




@RequestMapping("/member")
@Controller
public class AnalysisController {

@Autowired
AnalysisService service; 
	
@RequestMapping(value="/statistics")
private String statistics(Model model,HttpSession session) {
	
	String id = (String)session.getAttribute("user");

	List<ExerciseJournal> todayExercise = service.todayList(id);
	List<ExerciseJournal> monthExercise = service.list(id);
	List<ExerciseJournal> weight = service.getWeight(id);
	List<ExerciseJournal> avgLb = service.getavgLb(id);
	List<BEsave> metabolism = service.getMetabolism(id);
	List<ExerciseJournal> overallAvg = service.getOverallAvg(id);
	
	model.addAttribute("list",monthExercise);
	model.addAttribute("todayList",todayExercise);
	model.addAttribute("weight",weight);
	model.addAttribute("avgLb",avgLb);
	model.addAttribute("metabolism",metabolism);
	model.addAttribute("overallAvg",overallAvg);


	
	
	return "member/statistics";
}

//@RequestMapping(value="/statistics2")
//private String statistics2(String userId, Model model,HttpSession session) {
//	//String id = (String)session.getAttribute("user");
//	
//	// query (내가 속한 인간인가?) : flag
//	boolean flag = false;
//	if(!flag) {
//		
//		return "~!~~~";
//	}
//	String id = userId;
//
//	List<ExerciseJournal> todayExercise = service.todayList(id);
//	List<ExerciseJournal> monthExercise = service.list(id);
//	List<ExerciseJournal> weight = service.getWeight(id);
//	List<ExerciseJournal> avgLb = service.getavgLb(id);
//	List<BEsave> metabolism = service.getMetabolism(id);
//	List<ExerciseJournal> overallAvg = service.getOverallAvg(id);
//	
//	model.addAttribute("list",monthExercise);
//	model.addAttribute("todayList",todayExercise);
//	model.addAttribute("weight",weight);
//	model.addAttribute("avgLb",avgLb);
//	model.addAttribute("metabolism",metabolism);
//	model.addAttribute("overallAvg",overallAvg);
//	
//	return "member/statistics";
//}

@RequestMapping(value="/mentiManagement")
	private String mento(HttpSession session,Model model) {
	
	String id = (String)session.getAttribute("trainer");
	
	List<UserManagement> wfaList = service.waitingForApproval(id); 
	List<UserVO> ranking = service.getRanker();
	List<MentiPerformance> MPerformance = service.getMenti(id);
	model.addAttribute("myMenti",MPerformance);
	model.addAttribute("rankerList",ranking);
	model.addAttribute("wfaList",wfaList);
	
	return "member/mentiManagement";
}

@ResponseBody
@RequestMapping(value="/permission" , method=RequestMethod.POST)
	private int permission(String username) {
		
		return service.permission(username);
	
}

@ResponseBody
@RequestMapping(value="/applicant")
	private List<UserManagement> applicantList(HttpSession session, Model model) {
	String id = (String)session.getAttribute("trainer");
	
		return service.applicantList(id);
	
}

@ResponseBody
@RequestMapping(value="/applicantDeny", method = RequestMethod.POST)
	private int applicantDeny(String username) {
	
	return service.applicantDeny(username);
}
	
}
