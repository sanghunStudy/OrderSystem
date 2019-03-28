package kr.ac.kopo.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.User;
import kr.ac.kopo.model.UserVO;

public interface UserService {

	List<User> list();

	void add(User item);

	User item(int id);

	void update(User item);

	void delete(int id);

	boolean login(User user);

	UserVO selectUser(String username);

	void saveCode(List<Map<String, Object>> param,Principal principal);

	List<ExerciseJournal> ExerciseJournalList(String id);

	ExerciseJournal ExerciseJournalOne(int exerciseCode);
}
