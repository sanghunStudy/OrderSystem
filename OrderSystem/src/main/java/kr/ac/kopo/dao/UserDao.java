package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.ExerciseContents;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.TypeOfExercise;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.model.basicInformation;
import kr.ac.kopo.util.SearchVO;

public interface UserDao {

	List<UserVO> list();

	void add(UserVO item);

	UserVO item(String id);

	void update(UserVO item);

	void delete(String username);

	UserVO login(UserVO user);

	UserVO selectUser(String username);

	void saveCode(Object object);

	void saveTitle(Object object);

	void saveContents(int set, int reps, int lb);

	List<ExerciseJournal> ExerciseJournalList(String id);

	List<ExerciseJournal> ExerciseJournalOne(int exerciseCode);

	List<ExerciseJournal> ExerciseJournalUpdate(int exerciseCode);

	void ExerciseJournalUpdate(ExerciseContents exerciseContents);

	void ExerciseJournalDel(int exerciseCode);

	void basicInformation(basicInformation bI);

	int idChk(String username);

	int LoginChk(UserVO user);

	void promotion(TrainerProfile pro);

	List<TrainerProfile> proList(SearchVO searchVO);

	void grant(TrainerProfile pro);

	List<TypeOfExercise> typeOfExercise();

	void typeOfExerciseAdd(TypeOfExercise to);

	TypeOfExercise typeOfExerciseOne(int teNum);

	void typeOfExerciseUpdate(TypeOfExercise to);

	void typeOfExerciseDel(int teNum);

	void grantDel(TrainerProfile pro);

	int total(SearchVO searchVO);



}
