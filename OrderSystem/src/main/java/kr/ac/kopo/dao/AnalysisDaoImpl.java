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
	public List<ExerciseJournal> getWeight(String id) {
		return sql.selectList("statistics.getWeight",id);
	}


}
