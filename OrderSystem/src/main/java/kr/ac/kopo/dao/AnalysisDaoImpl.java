package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.ExerciseJournal;
@Repository
public class AnalysisDaoImpl implements AnalysisDao {

	@Autowired 
	SqlSession sql;
	
	@Override
	public List<ExerciseJournal> list(String id) {
		return sql.selectList("statistics.exerList",id);
	}

	@Override
	public List<ExerciseJournal> deadArray(String id) {
		// TODO Auto-generated method stub
		return sql.selectList("statistics.deadArray", id);
	}

	@Override
	public List<ExerciseJournal> squatArray(String id) {
		// TODO Auto-generated method stub
		return sql.selectList("statistics.squatArray", id);
	}

	@Override
	public List<ExerciseJournal> benchArray(String id) {
		// TODO Auto-generated method stub
		return sql.selectList("statistics.benchArray", id);
	}

}
