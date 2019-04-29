package kr.ac.kopo.service;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.UserDao;
import kr.ac.kopo.model.ExerciseContents;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	@Override
	public List<UserVO> list() {
		return dao.list();
	}

	@Override
	public void add(UserVO item) {
		dao.add(item);
	}

	@Override
	public UserVO item(int id) {
		return dao.item(id);
	}

	@Override
	public void update(UserVO item) {
		dao.update(item);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

	@Override
	public UserVO login(UserVO user) {
		return dao.login(user);
	}

	@Override
	public UserVO selectUser(String username) {
		System.out.println("UserVO select() serviceImpl <<<<<<" + username);
		return dao.selectUser(username);
	}

	@Override
	public void saveCode(List<Map<String, Object>> param, String id) {
		Map<String, Object> map = new HashMap<String, Object>();

		String ExerciseDate = "";
		String title = "";
		for (int i = 0; i < param.size(); i++) {
			if (param.get(i).get("ExerciseDate") != null)
				ExerciseDate = (String) param.get(i).get("ExerciseDate");
			if (param.get(i).get("title") != null)
				title = (String) param.get(i).get("title");
		}
		map.put("id", id);
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

	//운동일지 리스트
	@Override
	public List<ExerciseJournal> ExerciseJournalList(String id) {
		
		return dao.ExerciseJournalList(id);
	}

	//운동일지 상세보기
	@Override
	public List<ExerciseJournal> ExerciseJournalOne(int exerciseCode) {
		return dao.ExerciseJournalOne(exerciseCode);
	}

	//운동일지 수정화면
	@Override
	public List<ExerciseJournal> ExerciseJournalUpdate(int exerciseCode) {
		// TODO Auto-generated method stub
		return dao.ExerciseJournalUpdate(exerciseCode);
	}

	//운동일지 수정처리
	@Override
	public void ExerciseJournalUpdate(ExerciseContents exerciseContents) {
		dao.ExerciseJournalUpdate(exerciseContents);
		
	}
	//운동일지 삭제처리
	@Override
	public void ExerciseJournalDel(int exerciseCode) {
		dao.ExerciseJournalDel(exerciseCode);
	}

	//회원 기초정보 입력
	@Override
	public void basicInformation(kr.ac.kopo.model.basicInformation bI) {
		dao.basicInformation(bI);
		
	}

}
