package kr.ac.kopo.model;

import java.util.List;

public class Planner {
	private List<EatPlanner> eatList;
	private List<DoPlanner> doList;

	public List<EatPlanner> getEatList() {
		return eatList;
	}

	public void setEatList(List<EatPlanner> eatList) {
		this.eatList = eatList;
	}

	public List<DoPlanner> getDoList() {
		return doList;
	}

	public void setDoList(List<DoPlanner> doList) {
		this.doList = doList;
	}

}
