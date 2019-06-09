package kr.ac.kopo.model;

public class MentiPerformance {
	String manager;
	String username;
	char reading;
	String applyDate;
	float height;
	String goal;
	float weights;
	String etc;
	String chatDay;
	int doneAssignment;
	int totalAssignment;
	int eRequirement;
	int age;
	String sex;

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public char getReading() {
		return reading;
	}

	public void setReading(char reading) {
		this.reading = reading;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public int geteRequirement() {
		return eRequirement;
	}

	public void seteRequirement(int eRequirement) {
		this.eRequirement = eRequirement;
	}

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
