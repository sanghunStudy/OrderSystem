package kr.ac.kopo.service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.UserDao;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.User;
import kr.ac.kopo.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	@Override
	public List<User> list() {
		return dao.list();
	}

	@Override
	public void add(User item) {
		dao.add(item);
	}

	@Override
	public User item(int id) {
		return dao.item(id);
	}

	@Override
	public void update(User item) {
		dao.update(item);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

	@Override
	public boolean login(User user) {
		return dao.login(user);
	}

	@Override
	public UserVO selectUser(String username) {
		System.out.println("UserVO select() serviceImpl <<<<<<" + username);
		return dao.selectUser(username);
	}

	@Override
	public void saveCode(List<Map<String, Object>> param, Principal principal) {
		Map<String, Object> map = new HashMap<String, Object>();

		String ExerciseDate = "";
		String title = "";
		for (int i = 0; i < param.size(); i++) {
			if (param.get(i).get("ExerciseDate") != null)
				ExerciseDate = (String) param.get(i).get("ExerciseDate");
			if (param.get(i).get("title") != null)
				title = (String) param.get(i).get("title");
		}
		map.put("id", principal.getName());
		map.put("ExerciseDate", ExerciseDate);
		map.put("title", title);

		dao.saveCode(map);

		int Set = 0;
		int Reps = 0;
		int lb = 0;
		
		for (int i = 0; i < param.size(); i++) {
			if (param.get(i).get("ExerciseName") != null)
				dao.saveTitle(param.get(i).get("ExerciseName"));
			//saveContents에 saveCode의 기본키를 넣어야됨...
			if (param.get(i).get("set") != null) {
				Set = Integer.parseInt((String) param.get(i).get("set"));
			}else if (param.get(i).get("Reps") != null) {
				Reps = Integer.parseInt((String) param.get(i).get("Reps"));
			}else if(param.get(i).get("lb") != null) {
				lb = Integer.parseInt((String) param.get(i).get("lb"));
				dao.saveContents(Set,Reps,lb);
			}
		
		}

		
		

	}

	@Override
	public List<ExerciseJournal> ExerciseJournalList(String id) {
		
		return dao.ExerciseJournalList(id);
	}

}
