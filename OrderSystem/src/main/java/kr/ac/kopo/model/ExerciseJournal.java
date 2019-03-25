package kr.ac.kopo.model;

import java.util.Date;
import java.util.List;

public class ExerciseJournal {

	private Date ExerciseDate;
	private String id;
	private String title;
	private String ExerciseName;
	private Integer set;
	private Integer Reps;
	private Integer lb;
	
	private List<ExerciseJournal> ExerciseJournalVOList;

	
	public List<ExerciseJournal> getExerciseJournalVOList() {
		return ExerciseJournalVOList;
	}
	public void setExerciseJournalVOList(List<ExerciseJournal> exerciseJournalVOList) {
		ExerciseJournalVOList = exerciseJournalVOList;
	}
	
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
	public Date getExerciseDate() {
		return ExerciseDate;
	}
	public void setExerciseDate(Date exerciseDate) {
		ExerciseDate = exerciseDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ExerciseJournal [ExerciseDate=" + ExerciseDate + ", id=" + id + ", title=" + title + ", ExerciseName="
				+ ExerciseName + ", set=" + set + ", Reps=" + Reps + ", lb=" + lb + ", ExerciseJournalVOList="
				+ ExerciseJournalVOList + "]";
	}
	
	

	

	
}
