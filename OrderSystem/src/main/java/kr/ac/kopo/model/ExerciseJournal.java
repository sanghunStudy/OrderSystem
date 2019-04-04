package kr.ac.kopo.model;

import java.util.List;

public class ExerciseJournal {

	// 타이틀 번호
	private int ExerciseCode;
	// 입력한 날짜 달력에 뿌려주기 위해 start로 이름 지정 Exercise_date
	private String start;
	private String id;
	private String title;
	private String ExerciseName;
	
	List<ExerciseContents> details;
	
	public List<ExerciseContents> getDetails() {
		return details;
	}


	public void setDetails(List<ExerciseContents> details) {
		this.details = details;
	}
	
	public String getExerciseName() {
		return ExerciseName;
	}
	public void setExerciseName(String exerciseName) {
		ExerciseName = exerciseName;
	}
	

	public int getExerciseCode() {
		return ExerciseCode;
	}

	public void setExerciseCode(int exerciseCode) {
		ExerciseCode = exerciseCode;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
