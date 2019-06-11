package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.ExerciseContents;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.TypeOfExercise;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.util.SearchVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<UserVO> list() {
		return sql.selectList("user.list");
	}

	@Override
	public void add(UserVO item) {
		sql.insert("user.add", item);
	}

	@Override
	public UserVO item(String id) {
		return sql.selectOne("user.item", id);
	}

	@Override
	public void update(UserVO item) {
		sql.update("user.update", item);
	}

	@Override
	public void delete(String username) {
		sql.delete("user.delete", username);
	}

	@Override
	public UserVO login(UserVO user) {
		
		return sql.selectOne("user.login", user);
	}

	@Override
	public UserVO selectUser(String username) {
//			System.out.println("UserVO select() DaoImpl <<<<<<"+username);
		return sql.selectOne("user.select", username);
	}

	@Override
	public void saveCode(Object object) {
		sql.insert("user.saveCode", object);
		
	}

	@Override
	public void saveTitle(Object object) {
		sql.insert("user.saveTitle",object);
		
	}

	//달력에 입력된 값 db에 넣기
	@Override
	public void saveContents(int set, int reps, int lb) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ExerciseSet", set);
		map.put("ExerciseReps", reps);
		map.put("ExerciseLb", lb);
		
		System.out.println(map + "saveContents DAOIMPL");
		sql.insert("user.saveContents", map);
		
	}
	//달력에 사용자별 운동일지 가져오기
	@Override
	public List<ExerciseJournal> ExerciseJournalList(String id) {
		
		return sql.selectList("user.exerciseJournal", id);
	}
	
	//사용자가 클릭한 제목의 일지 가져오기
	@Override
	public List<ExerciseJournal> ExerciseJournalOne(int exerciseCode) {
		return sql.selectList("user.exerciseJournalOne", exerciseCode);
	}

	@Override
	public List<ExerciseJournal> ExerciseJournalUpdate(int exerciseCode) {
		// TODO Auto-generated method stub
		return sql.selectList("user.exerciseJournalUpdate", exerciseCode);
	}

	//운동일지 수정 처리
	@Override
	public void ExerciseJournalUpdate(ExerciseContents exerciseContents) {
		sql.update("user.exerciseJournalUpdateSubmit",exerciseContents);
		
	}
	//운동일지 삭제처리
	@Override
	public void ExerciseJournalDel(int exerciseCode) {
		sql.delete("user.exerciseJournalDel", exerciseCode);
		
	}
	//회원 기초정보 입력
	@Override
	public void basicInformation(kr.ac.kopo.model.basicInformation bI) {
		sql.insert("user.basicInformation", bI);
		
	}

	//아이디 중복체크
	@Override
	public int idChk(String username) {
		return sql.selectOne("user.idChk", username);
	}
	
	//로그인 체크
	@Override
	public int LoginChk(UserVO user) {
		return sql.selectOne("user.LoginChk", user);
	}
	//트레이너 신청
	@Override
	public void promotion(TrainerProfile pro) {
		sql.insert("user.promotion", pro);
	}
	//트레이너 신청리스트
	@Override
	public List<TrainerProfile> proList(SearchVO searchVO) {
		return sql.selectList("user.proList", searchVO);
	}
	//트레이너 신청 승인
	@Override
	public void grant(TrainerProfile pro) {
		sql.update("user.grant", pro);
		sql.update("user.grantDo", pro);
		sql.update("question.startTier",pro);
	}
	//트레이너 신청 거절
	@Override
	public void grantDel(TrainerProfile pro) {
		sql.update("user.grantDel", pro);
	}

	//운동일지에 뿌려주는 운동종류 리스트
	@Override
	public List<TypeOfExercise> typeOfExercise() {
		// TODO Auto-generated method stub
		return sql.selectList("user.typeOfExercise");
	}
	//운동 종류 입력
	@Override
	public void typeOfExerciseAdd(TypeOfExercise to) {
		sql.insert("user.typeOfExerciseAdd", to);
	}
	//운동 종류 하나만 가져오기
	@Override
	public TypeOfExercise typeOfExerciseOne(int teNum) {
		return sql.selectOne("user.typeOfExerciseOne", teNum);
	}
	//운동 종류 수정
	@Override
	public void typeOfExerciseUpdate(TypeOfExercise to) {
		sql.update("user.typeOfExerciseUpdate", to);
		
	}
	//운동 종류 삭제
	@Override
	public void typeOfExerciseDel(int teNum) {
		sql.delete("user.typeOfExerciseDel", teNum);
	}
	//트레이너 신청 목록 토탈
	@Override
	public int total(SearchVO searchVO) {
		return sql.selectOne("user.total", searchVO);
	}

	

}
