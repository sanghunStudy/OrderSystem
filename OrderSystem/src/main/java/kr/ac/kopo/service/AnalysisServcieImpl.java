package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.AnalysisDao;
import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.DailyRank;
import kr.ac.kopo.model.DoPlanner;
import kr.ac.kopo.model.EatPlanner;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.MentiPerformance;
import kr.ac.kopo.model.Planner;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;

@Service
public class AnalysisServcieImpl implements AnalysisService {
	EatPlanner eat;
	DoPlanner exercise;

	@Autowired
	AnalysisDao dao;

	@Override
	public List<ExerciseJournal> list(String id) {
		return dao.list(id);
	}

	@Override
	public List<ExerciseJournal> getWeight(String id) {
		return dao.getWeight(id);
	}

	@Override
	public List<ExerciseJournal> getavgLb(String id) {
		return dao.getAvgLb(id);
	}

	@Override
	public List<ExerciseJournal> todayList(String id) {
		return dao.todayList(id);
	}

	@Override
	public List<BEsave> getMetabolism(String id) {
		return dao.getMetabolism(id);
	}

	@Override
	public List<ExerciseJournal> getOverallAvg(String id) {
		return dao.getOverallAvg(id);
	}

	@Override
	public List<UserManagement> waitingForApproval(String id) {

		return dao.waitingForApproval(id);
	}

	@Override
	public int permission(String username) {

		return dao.permission(username);
	}

	@Override
	public List<UserManagement> applicantList(String id) {
		return dao.applicantList(id);
	}

	@Override
	public int applicantDeny(String username, String mento) {
		return dao.applicantDeny(username, mento);
	}

	@Override
	public List<UserVO> getRanker() {
		return dao.getRanker();
	}

	@Override
	public List<MentiPerformance> getMenti(String id) {
		return dao.getMenti(id);
	}

	@Override
	public List<MentiPerformance> getMyMenti(String mento) {
		return dao.getMyMenti(mento);
	}

	@Override
	public TrainerProfile getMentiInfo(String id) {
		return dao.getMentiInfo(id);
	}

	@Override
	public int doneSubject(String subject, String contents, String manager, String id, String kind) {

		int subjectKind = 0;
		System.out.println(kind);
		if (kind.equals("to_do table-t")) {

			subjectKind = 1;

		} else if (kind.equals("to_eat table-t")) {

			subjectKind = 2;

		}

		return dao.doneSubject(subject, contents, manager, subjectKind, id);
	}

//	@Override
//	public void insertPlan(Map<String, Object> plan) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		String name = "";
//		map.put("name", name);
//		for(int i=0; i<plan.size(); i++) {
//			String[] planList = plan.get("plan").toString().split(",");
//			for(String item : planList) {
//				System.out.println(item);
//				String[] data = item.split("=");
//				data[0] = data[0].replace("[{","");
//				data[1] = data[1].replace("]", "");
//				System.out.println(data[0]);
//				System.out.println(data[1]);
//				
//			}
//		}
//	}

	@Override
	public List<DailyRank> getMyDailyRanking(String id) {
		return dao.getMyDailyRanking(id);
	}

	@Override
	public void insertPlan(Planner planner) {
//		Map<String, Object> map = new HashMap<String, Object>();
		
		if (planner.getEatList().get(0).getCode() == 1) {
//			for (int i = 0; i < planner.getList().size(); i++) {
//				System.out.println(planner.getList().get(i).getEatTime());
//				map.put("eatDate",planner.getList().get(i).getEatDate());
//				map.put("eatName",planner.getList().get(i).getEatName());
//				map.put("eatGram",planner.getList().get(i).getEatGram());
//				map.put("eatCount",planner.getList().get(i).getEatCount());
//				map.put("eatKcal",planner.getList().get(i).getEatKcal());
//				map.put("eatEtc",planner.getList().get(i).getEatEtc());
//				map.put("eatNutrient",planner.getList().get(i).getEatNutrient());
//				map.put("eatTime",planner.getList().get(i).getEatTime());
//				
//			}
			System.out.println("먹기");
			dao.addFoodPlan(planner);
		}
		else if(planner.getDoList().get(0).getCode() == 2) {
//			for (int i = 0; i < planner.getList2().size(); i++) {
//				System.out.println(planner.getList2().get(i).getDoSet());
//			}
			System.out.println("운동");
			dao.addExerPlan(planner);
		}

	}

}
