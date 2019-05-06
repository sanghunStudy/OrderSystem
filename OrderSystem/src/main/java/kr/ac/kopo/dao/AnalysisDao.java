package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.ExerciseJournal;

public interface AnalysisDao {


	List<ExerciseJournal> list(String id);

	List<ExerciseJournal> getWeight(String id);

	List<ExerciseJournal> getAvgLb(String id);



}
