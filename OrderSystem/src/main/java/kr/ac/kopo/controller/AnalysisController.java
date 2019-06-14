package kr.ac.kopo.controller;



import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.DailyRank;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.MentiPerformance;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.service.AnalysisService;
import kr.ac.kopo.service.UserService;




@RequestMapping("/member")
@Controller
public class AnalysisController {

@Autowired
AnalysisService service; 
@Autowired
UserService Uservice;
	
@RequestMapping(value="/statistics")
private String statistics(UserVO user, Model model,TrainerProfile pro, HttpSession session,HttpServletRequest request) {

	String id = request.getParameter("name");
	TrainerProfile profile =  service.getMentiInfo(id);
	pro.setUsername(id);
	
	UserVO point = Uservice.item(id);
	int userPoint = point.getPoint();
	System.out.println(userPoint + "<<<<<<<<<<<<<<< 포린트");
//	if(point.getPoint() >= po) {
//		Uservice.promotion(pro);
//	} else {
//		
//	}

	
	
	
	List<ExerciseJournal> todayExercise = service.todayList(id);
	List<ExerciseJournal> monthExercise = service.list(id);
	List<ExerciseJournal> weight = service.getWeight(id);
	List<ExerciseJournal> avgLb = service.getavgLb(id);
	List<BEsave> metabolism = service.getMetabolism(id);
	List<ExerciseJournal> overallAvg = service.getOverallAvg(id);
	
	model.addAttribute("userPoint", userPoint);
	model.addAttribute("mentiProfile",profile);
	model.addAttribute("list",monthExercise);
	model.addAttribute("todayList",todayExercise);
	model.addAttribute("weight",weight);
	model.addAttribute("avgLb",avgLb);
	model.addAttribute("metabolism",metabolism);
	model.addAttribute("overallAvg",overallAvg);


	
	
	return "member/statistics";
}

@ResponseBody
@RequestMapping(value="/done",method = RequestMethod.POST) 
	private int doneSubject(String subject, String contents,String manager,String kind,HttpSession session) {

	String id = (String)session.getAttribute("user");

	
	return service.doneSubject(subject,contents,manager,id,kind);
}


//@RequestMapping(value="/menti-statistics")
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

//}

@RequestMapping(value="/mentiManagement")
	private String mento(HttpSession session,Model model) {
	
	String id = (String)session.getAttribute("trainer");
	if(id != null) { 
	List<UserManagement> wfaList = service.waitingForApproval(id); 
	List<UserVO> ranking = service.getRanker();
	List<MentiPerformance> MPerformance = service.getMenti(id);
	List<DailyRank> myRanking = service.getMyDailyRanking(id);
	
	model.addAttribute("myMenti",MPerformance);
	model.addAttribute("rankerList",ranking);
	model.addAttribute("wfaList",wfaList);
	model.addAttribute("dailyRanking",myRanking);
	
	return "member/mentiManagement";
	}
	else return "index";
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
	private int applicantDeny(String username,HttpSession session) {
	String mento = (String)session.getAttribute("trainer");

	return service.applicantDeny(username,mento);
}

@ResponseBody
@RequestMapping(value="/myMenti")
	private List<MentiPerformance> myMenti(String manager,HttpSession session) {

	String mento= (String)session.getAttribute("trainer");
	
	return service.getMyMenti(mento);
}

@ResponseBody
@RequestMapping(value="/writePlan",method=RequestMethod.POST)
	private void savePlan(@RequestBody Map<String,Object> plan)  {
	
		service.insertPlan(plan);

}

//@ResponseBody
//@RequestMapping(value="/writePlan",method=RequestMethod.POST)
//	private void savePlan(String[] plan) throws JsonProcessingException {
//	System.out.println(Arrays.toString(plan));
//	
//	ObjectMapper mapper = new ObjectMapper();
//
//	JSONPObject json = new JSONPObject("JSON.parse", plan);
//
//	String jsonStr = mapper.writeValueAsString(json);
//	System.out.println(jsonStr);
//
//		for(int i=0; i<plan.length; i++) {
//			System.out.println(Arrays.toString(plan[i]));
//		}
//}


}
