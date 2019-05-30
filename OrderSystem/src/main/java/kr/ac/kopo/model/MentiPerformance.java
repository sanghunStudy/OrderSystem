package kr.ac.kopo.model;

public class MentiPerformance {
	String username;
	int doneAssignment;
	int totalAssignment;
	String chatDay;

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
