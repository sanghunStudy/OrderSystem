package kr.ac.kopo.controller;



import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.ForegroundAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import kr.ac.kopo.model.DoPlanner;
import kr.ac.kopo.model.EatPlanner;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.MentiPerformance;
import kr.ac.kopo.model.MessageRepository;
import kr.ac.kopo.model.Planner;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.TypeOfExercise;
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
	System.out.println(userPoint + "<<<<<<<<포인트");

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
	List<DoPlanner> doList = service.getDoList(id);
	List<EatPlanner> eatList = service.getEatList(id);
	
	model.addAttribute("userPoint", userPoint);
	model.addAttribute("mentiProfile",profile);
	model.addAttribute("list",monthExercise);
	model.addAttribute("todayList",todayExercise);
	model.addAttribute("weight",weight);
	model.addAttribute("avgLb",avgLb);
	model.addAttribute("metabolism",metabolism);
	model.addAttribute("overallAvg",overallAvg);
	model.addAttribute("doList", doList);
	model.addAttribute("eatList", eatList);

	
	
	return "member/statistics";
}

@ResponseBody
@RequestMapping(value = "/getDoList")
	private List<DoPlanner> getDoList(HttpSession session,String date) {
	System.out.println(date);
	Enumeration em = session.getAttributeNames();
	String sessionName;
	String id = null;
	//받아온 키값으로 현재 세션에 있는 아이디 확인
	while(em.hasMoreElements()){
		sessionName = em.nextElement().toString();
		id = session.getAttribute(sessionName).toString();
	}
	return service.getAjaxDoList(id,date);
}

@ResponseBody
@RequestMapping(value = "/getEatList")
private List<EatPlanner> getEatList(HttpSession session,String date) {
	
	Enumeration em = session.getAttributeNames();
	String sessionName;
	String id = null;
	//받아온 키값으로 현재 세션에 있는 아이디 확인
	while(em.hasMoreElements()){
		sessionName = em.nextElement().toString();
		id = session.getAttribute(sessionName).toString();
	}
	return service.getAjaxEatList(id,date);
}

@ResponseBody
@RequestMapping(value="/done",method = RequestMethod.POST) 
	private int doneSubject(String subject, String contents,String manager,String kind,HttpSession session) {

	String id = (String)session.getAttribute("user");

	
	return service.doneSubject(subject,contents,manager,id,kind);
}
@ResponseBody
@RequestMapping(value="/submitRate",method=RequestMethod.POST)
	private void submitScore(int score,String mento,HttpSession session) {
	String userName = session.getAttribute("user").toString();
	 service.saveScore(score,mento,userName);
}

//별점 평가여부 확인
@ResponseBody
@RequestMapping(value="/countScore",method=RequestMethod.POST)
	private int countScore(String mento,HttpSession session) {
	String userName = session.getAttribute("user").toString();
	int countScore =  service.countScore(mento,userName);
	if(countScore == 0) {
	
		return 0;
	}else {
		return 1;
	}
	 
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

//멘티관리 컨트롤러
@RequestMapping(value="/mentiManagement")
	private String mento(HttpSession session,Model model) {
	
	String id = (String)session.getAttribute("trainer");
	if(id != null) { 
	List<UserManagement> wfaList = service.waitingForApproval(id); 
	List<UserVO> ranking = service.getRanker();
	List<MentiPerformance> MPerformance = service.getMenti(id);
	List<DailyRank> myRanking = service.getMyDailyRanking(id);
	List<TypeOfExercise> typeOfExercise = service.getExerList();
	List<MessageRepository> mr = service.getLatestLog(id);

//	String doubleSlashStr = "";
//	
//	
//	
//	
//	for(int i =0 ; i < typeOfExercise.size(); i++) {
//		doubleSlashStr = typeOfExercise.get(i).getTeImg().toString().replace("\\", "\\\\");
//
//	
//	}
	
	
	model.addAttribute("myMenti",MPerformance);
	model.addAttribute("rankerList",ranking);
	model.addAttribute("wfaList",wfaList);
	model.addAttribute("dailyRanking",myRanking);
	model.addAttribute("typeOfExercise", typeOfExercise);
	model.addAttribute("latestLog",mr);
	return "member/mentiManagement";
	}
	else return "/member/myinfo";
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
//requestbody로 값을 받아오는데는 성공했으나 정규화 하는 과정에서 비효율적이어서 실패
//@ResponseBody
//@RequestMapping(value="/writePlan",method=RequestMethod.POST)
//	private void savePlan(@RequestBody Map<String,Object> plan)  {
//	
//		service.insertPlan(plan);
//
//}

//modelattribute를 통해 모델의 필드와 js 배열의 값들과 일치시켜줌으로써 값과 정규화 모두 성공적.
@ResponseBody
@RequestMapping(value="/writePlan",method=RequestMethod.POST)
	private void savePlan(@ModelAttribute("planner") Planner planner)  {
	
	
		service.insertPlan(planner);

}

//JSON parsing으로 배열출력 시도 실패
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
