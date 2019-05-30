package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.ExerciseJournal;
import kr.ac.kopo.model.UserManagement;
@Repository
public class AnalysisDaoImpl implements AnalysisDao {

	@Autowired 
	SqlSession sql;
	
	@Override
	public List<ExerciseJournal> list(String id) {
		return sql.selectList("statistics.monthExerList",id);
	}

	@Override
	public List<ExerciseJournal> getWeight(String id) {
		return sql.selectList("statistics.getWeight",id);
	}

	@Override
	public List<ExerciseJournal> getAvgLb(String id) {
		return sql.selectList("statistics.getAvgLb", id);
	}

	@Override
	public List<ExerciseJournal> todayList(String id) {
		return sql.selectList("statistics.todayList",id);
	}

	@Override
	public List<BEsave> getMetabolism(String id) {
		return sql.selectList("statistics.getMetabolism", id);
	}


	@Override
	public List<ExerciseJournal> getOverallAvg(String id) {
		return sql.selectList("statistics.getOverallAvg", id);
	}

	@Override
	public List<UserManagement> waitingForApproval(String id) {
		return sql.selectList("trainer.waitingForApproval", id);
	}

	@Override
	public int permission(String username) {
		return sql.update("trainer.grantApproval", username);

	}

	@Override
	public List<UserManagement> applicantList(String id) {
		return sql.selectList("trainer.waitingForApproval", id);
	}

	@Override
	public int applicantDeny(String username) {

		return sql.delete("trainer.deleteApplicant", username);
	}

}
