package kr.ac.kopo.model;

import java.util.List;

public class ExerciseJournalList {

	private List<ExerciseJournal> ej;

	public List<ExerciseJournal> getEj() {
		return ej;
	}

	public void setEj(List<ExerciseJournal> ej) {
		this.ej = ej;
	}

	@Override
	public String toString() {
		return "ExerciseJournalList [ej=" + ej + "]";
	}
	
}
