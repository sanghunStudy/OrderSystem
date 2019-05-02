package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.ExerciseJournal;

public interface AnalysisService {

	List<ExerciseJournal> list(String id);

	List<ExerciseJournal> deadArray(String id);

	List<ExerciseJournal> squatArray(String id);

	List<ExerciseJournal> benchArray(String id);



	



}
