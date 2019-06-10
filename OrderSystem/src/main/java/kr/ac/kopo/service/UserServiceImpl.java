package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.UserDao;
import kr.ac.kopo.model.ExerciseContents;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.TypeOfExercise;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.util.SearchVO;

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
	public UserVO item(String id) {
		return dao.item(id);
	}

	@Override
	public void update(UserVO item) {
		dao.update(item);
	}

	@Override
	public void delete(String username) {
		dao.delete(username);
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
		int userWeight = 0;
		
		for (int i = 0; i < param.size(); i++) {
			if (param.get(i).get("ExerciseDate") != null)
				ExerciseDate = (String) param.get(i).get("ExerciseDate");
			if (param.get(i).get("title") != null)
				title = (String) param.get(i).get("title");
			if(param.get(i).get("userWeight") != null)
				userWeight = Integer.parseInt((String) param.get(i).get("userWeight"));
		}
		map.put("id", id);
		map.put("ExerciseDate", ExerciseDate);
		map.put("title", title);
		map.put("userWeight", userWeight);
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

	//아이디 중복체크
	@Override
	public int idChk(String username) {
		
		return dao.idChk(username);
		
	}
	//로그인 체크
	@Override
	public int LoginChk(UserVO user) {
		// TODO Auto-generated method stub
		return dao.LoginChk(user);
	}
	//트레이너 신청
	@Override
	public void promotion(TrainerProfile pro) {
		dao.promotion(pro);
	}
	//트레이너신청 리스트
	@Override
	public List<TrainerProfile> proList(SearchVO searchVO) {
		return dao.proList(searchVO);
	}
	//테리언 신청 승인
	@Override
	public void grant(TrainerProfile pro) {
		dao.grant(pro);
	}
	//트레이너 신청 거절
	@Override
	public void grantDel(TrainerProfile pro) {
		dao.grantDel(pro);
	}


	//운동일지에 뿌려주는 운동죵류
	@Override
	public List<TypeOfExercise> typeOfExercise() {
		return dao.typeOfExercise();
	}
	//운동 종류 입력
	@Override
	public void typeOfExerciseAdd(TypeOfExercise to) {
		dao.typeOfExerciseAdd(to);
	}
	//운동 종류 하나만 가져오기
	@Override
	public TypeOfExercise typeOfExerciseOne(int teNum) {
		return dao.typeOfExerciseOne(teNum);
	}
	//운동 종류 수정
	@Override
	public void typeOfExerciseUpdate(TypeOfExercise to) {
		dao.typeOfExerciseUpdate(to);
		
	}
//	운동 종류 삭제
	@Override
	public void typeOfExerciseDel(int teNum) {
		dao.typeOfExerciseDel(teNum);
	}
// 트레이너 신청 목록 페이징 토탈
	@Override
	public int total(SearchVO searchVO) {
		return dao.total(searchVO);
	}



	
}
