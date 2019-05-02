package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.ExerciseJournal;

public interface AnalysisDao {

	List<ExerciseJournal> list(String id);

	List<ExerciseJournal> deadArray(String id);

	List<ExerciseJournal> squatArray(String id);

	List<ExerciseJournal> benchArray(String id);

}
