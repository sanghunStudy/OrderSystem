package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.MentiPerformance;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;

public interface AnalysisService {

	List<ExerciseJournal> list(String id);

	List<ExerciseJournal> getWeight(String id);

	List<ExerciseJournal> getavgLb(String id);

	List<ExerciseJournal> todayList(String id);

	List<BEsave> getMetabolism(String id);

	List<ExerciseJournal> getOverallAvg(String id);

	List<UserManagement> waitingForApproval(String id);

	int permission(String username);

	List<UserManagement> applicantList(String id);

	int applicantDeny(String username, String mento);

	List<UserVO> getRanker();

	List<MentiPerformance> getMenti(String id);

	List<MentiPerformance> getMyMenti(String mento);



	TrainerProfile getMentiInfo(String id);

	int doneSubject(String subject, String contents, String manager, String id, String kind);

	






	



}
