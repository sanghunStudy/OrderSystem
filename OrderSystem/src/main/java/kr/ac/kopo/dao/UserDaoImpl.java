package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.User;
import kr.ac.kopo.model.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<User> list() {
		return sql.selectList("user.list");
	}

	@Override
	public void add(User item) {
		sql.insert("user.add", item);
	}

	@Override
	public User item(int id) {
		return sql.selectOne("user.item", id);
	}

	@Override
	public void update(User item) {
		sql.update("user.update", item);
	}

	@Override
	public void delete(int id) {
		sql.delete("user.delete", id);
	}

	@Override
	public boolean login(User user) {
		if(sql.selectOne("user.login", user)==null) {
			return false;
		}
		else {
			return true;
		}
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

}
