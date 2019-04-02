package kr.ac.kopo.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.model.ExerciseContents;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.UserVO;

public interface UserService {

	List<UserVO> list();

	void add(UserVO item);

	UserVO item(int id);

	void update(UserVO item);

	void delete(int id);

	boolean login(UserVO user);

	UserVO selectUser(String username);

	void saveCode(List<Map<String, Object>> param,Principal principal);

	List<ExerciseJournal> ExerciseJournalList(String id);

	List<ExerciseJournal> ExerciseJournalOne(int exerciseCode);

	List<ExerciseJournal> ExerciseJournalUpdate(int exerciseCode);

	void ExerciseJournalUpdate(ExerciseContents exerciseContents);

	void ExerciseJournalDel(int exerciseCode);
}
