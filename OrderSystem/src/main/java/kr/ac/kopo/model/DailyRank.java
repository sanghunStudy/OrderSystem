package kr.ac.kopo.model;

public class DailyRank {

	private String username;
	private int point;
	private int menti;
	private float rank;
	private float ranking;
	private float func;
	private String saveDate;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getMenti() {
		return menti;
	}

	public void setMenti(int menti) {
		this.menti = menti;
	}

	public float getRank() {
		return rank;
	}

	public void setRank(float rank) {
		this.rank = rank;
	}

	public float getRanking() {
		return ranking;
	}

	public void setRanking(float ranking) {
		this.ranking = ranking;
	}

	public float getFunc() {
		return func;
	}

	public void setFunc(float func) {
		this.func = func;
	}

	public String getSaveDate() {
		return saveDate;
	}

	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}

}
