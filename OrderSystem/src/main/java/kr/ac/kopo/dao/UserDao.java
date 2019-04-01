package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.model.ExerciseContents;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.User;
import kr.ac.kopo.model.UserVO;

public interface UserDao {

	List<User> list();

	void add(User item);

	User item(int id);

	void update(User item);

	void delete(int id);

	boolean login(User user);

	UserVO selectUser(String username);

	void saveCode(Object object);

	void saveTitle(Object object);

	void saveContents(int set, int reps, int lb);

	List<ExerciseJournal> ExerciseJournalList(String id);

	List<ExerciseJournal> ExerciseJournalOne(int exerciseCode);

	List<ExerciseJournal> ExerciseJournalUpdate(int exerciseCode);

	void ExerciseJournalUpdate(ExerciseContents exerciseContents);

	void ExerciseJournalDel(int exerciseCode);


}
