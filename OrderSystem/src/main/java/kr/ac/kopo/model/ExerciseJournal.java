package kr.ac.kopo.model;

public class ExerciseJournal {
	
	//타이틀 번호
	private int ExerciseCode;
	//입력한 날짜 달력에 뿌려주기 위해 start로 이름 지정
	private String start;
	
	
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
	private String id;
	private String title;
	private String ExerciseName;
	private Integer set;
	private Integer Reps;
	private Integer lb;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getExerciseName() {
		return ExerciseName;
	}
	public void setExerciseName(String exerciseName) {
		ExerciseName = exerciseName;
	}
	public Integer getSet() {
		return set;
	}
	public void setSet(Integer set) {
		this.set = set;
	}
	public Integer getReps() {
		return Reps;
	}
	public void setReps(Integer reps) {
		Reps = reps;
	}
	public Integer getLb() {
		return lb;
	}
	public void setLb(Integer lb) {
		this.lb = lb;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	

	

	
}
