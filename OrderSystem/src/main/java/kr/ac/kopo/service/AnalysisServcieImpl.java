package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.AnalysisDao;
import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.MentiPerformance;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;
@Service
public class AnalysisServcieImpl implements AnalysisService {

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
	public int applicantDeny(String username,String mento) {
		return dao.applicantDeny(username,mento);
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
	public int doneSubject(String subject, String contents, String manager, String kind, String kind2) {
		
		int subjectKind = 0;
		
		if(kind == "to_do table-t") {
			subjectKind = 1;
		}
		else if(kind == "to_eat table-t") {
			subjectKind = 2;
		}
		
		return dao.doneSubject(subject,contents,manager,subjectKind);
	}







}
