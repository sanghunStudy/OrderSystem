package kr.ac.kopo.dao;

import java.util.List;

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

	int applicantDeny(String username, String mento);

	List<UserVO> getRanker();

	List<MentiPerformance> getMenti(String id);

	List<MentiPerformance> getMyMenti(String mento);

	void autoDelete();

	TrainerProfile getMentiInfo(String id);


	int doneSubject(String subject, String contents, String manager, int subjectKind, String id);

	List<DailyRank> getMyDailyRanking(String id);

	void addExerPlan(Planner planner);

	void addFoodPlan(Planner planner);

	List<TypeOfExercise> getExerList();

	List<DoPlanner> getDoList(String id);

	List<EatPlanner> getEatList(String id);

	List<DoPlanner> getAjaxDoList(String id, String date);

	List<EatPlanner> getAjaxEatList(String id, String date);

	void saveScore(int score, String mento, String userName);

	void avgScore(int score, String mento);

	List<MessageRepository> getLatestLog(String id);

	int countScore(String mento, String userName);

	void getAvgScore(String mento);



}
