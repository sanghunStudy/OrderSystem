package kr.ac.kopo.model;

import java.util.List;

public class ExerciseJournal {

	// 타이틀 번호
	private int exerciseCode;
	// 입력한 날짜 달력에 뿌려주기 위해 start로 이름 지정 Exercise_date
	private String start;
	private String id;
	private String title;
	private int userWeight;
	private String exerciseName;
	
	List<ExerciseContents> details;	
	
	public int getUserWeight() {
		return userWeight;
	}


	public void setUserWeight(int userWeight) {
		this.userWeight = userWeight;
	}


	public List<ExerciseContents> getDetails() {
		return details;
	}


	public void setDetails(List<ExerciseContents> details) {
		this.details = details;
	}
	
	

	public String getExerciseName() {
		return exerciseName;
	}


	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}


	public int getExerciseCode() {
		return exerciseCode;
	}


	public void setExerciseCode(int exerciseCode) {
		this.exerciseCode = exerciseCode;
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
