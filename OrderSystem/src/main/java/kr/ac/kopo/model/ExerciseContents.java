package kr.ac.kopo.model;

public class ExerciseContents {

	
	private int ExerciseTitleCode;
	private Integer ExerciseSet;
	private Integer ExerciseReps;
	private Integer ExerciseLb;
	
	public ExerciseContents() {
		super();
	}
	
	public ExerciseContents(int ExerciseTitleCode ,int ExerciseSet, int ExerciseReps, int ExerciseLb ) {
		super();
		this.ExerciseTitleCode = ExerciseTitleCode;
		this.ExerciseSet = ExerciseSet;
		this.ExerciseReps = ExerciseReps;
		this.ExerciseLb = ExerciseLb;
	}
	
	public int getExerciseTitleCode() {
		return ExerciseTitleCode;
	}
	public void setExerciseTitleCode(int exerciseTitleCode) {
		ExerciseTitleCode = exerciseTitleCode;
	}
	public Integer getExerciseSet() {
		return ExerciseSet;
	}
	public void setExerciseSet(Integer exerciseSet) {
		ExerciseSet = exerciseSet;
	}
	public Integer getExerciseReps() {
		return ExerciseReps;
	}
	public void setExerciseReps(Integer exerciseReps) {
		ExerciseReps = exerciseReps;
	}
	public Integer getExerciseLb() {
		return ExerciseLb;
	}
	public void setExerciseLb(Integer exerciseLb) {
		ExerciseLb = exerciseLb;
	}
	
}
