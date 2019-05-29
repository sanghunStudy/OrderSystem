package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.UserManagement;

public interface AnalysisDao {


	List<ExerciseJournal> list(String id);

	List<ExerciseJournal> getWeight(String id);

	List<ExerciseJournal> getAvgLb(String id);

	List<ExerciseJournal> todayList(String id);

	List<BEsave> getMetabolism(String id);

	List<ExerciseJournal> getOverallAvg(String id);

	List<UserManagement> waitingForApproval(String id);

	int permission(String username);

	List<UserManagement> applicantList(String id);



}
