package kr.ac.kopo.model;

import java.util.List;

public class ExerciseJournal {

	// 타이틀 번호
	private int ExerciseCode;
	// 입력한 날짜 달력에 뿌려주기 위해 start로 이름 지정 Exercise_date
	private String start;
	private String id;
	private String title;
	private float userWeight;
	private String ExerciseName;
	private float avgLb;
	private int sumReps;
	private int doneSet;
	private float oneRm;
	


	List<ExerciseContents> details;	
	

	



	

	

	public float getAvgLb() {
		return avgLb;
	}


	public void setAvgLb(float avgLb) {
		this.avgLb = avgLb;
	}





	public int getSumReps() {
		return sumReps;
	}


	public void setSumReps(int sumReps) {
		this.sumReps = sumReps;
	}


	public int getDoneSet() {
		return doneSet;
	}


	public void setDoneSet(int doneSet) {
		this.doneSet = doneSet;
	}


	public float getOneRm() {
		return oneRm;
	}


	public void setOneRm(float oneRm) {
		this.oneRm = oneRm;
	}


	public float getUserWeight() {
		return userWeight;
	}


	public void setUserWeight(float userWeight) {
		this.userWeight = userWeight;
	}


	public List<ExerciseContents> getDetails() {
		return details;
	}


	public void setDetails(List<ExerciseContents> details) {
		this.details = details;
	}
	
	


	public int getExerciseCode() {
		return ExerciseCode;
	}


	public void setExerciseCode(int exerciseCode) {
		ExerciseCode = exerciseCode;
	}


	public String getExerciseName() {
		return ExerciseName;
	}


	public void setExerciseName(String exerciseName) {
		ExerciseName = exerciseName;
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
