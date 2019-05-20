package kr.ac.kopo.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.ExerciseJournal;
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
	private String mento() {
	
	return "member/mentiManagement";
}



	
}
