package kr.ac.kopo.model;

public class MentiPerformance {
	String username;
	int doneAssignment;
	int totalAssignment;
	String chatDay;
	float height;
	float weights;
	String etc;
	String goal;

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public float getWeights() {
		return weights;
	}

	public void setWeights(float weights) {
		this.weights = weights;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public int getDoneAssignment() {
		return doneAssignment;
	}

	public void setDoneAssignment(int doneAssignment) {
		this.doneAssignment = doneAssignment;
	}

	public int getTotalAssignment() {
		return totalAssignment;
	}

	public void setTotalAssignment(int totalAssignment) {
		this.totalAssignment = totalAssignment;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getChatDay() {
		return chatDay;
	}

	public void setChatDay(String chatDay) {
		this.chatDay = chatDay;
	}

}
