package kr.ac.kopo.model;

import java.util.Date;

public class AutoSaveItem {
	String id;
	int point;
	int mentiCount;
	int rank;
	Date monthSaveDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getMentiCount() {
		return mentiCount;
	}
	public void setMentiCount(int mentiCount) {
		this.mentiCount = mentiCount;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public Date getMonthSaveDate() {
		return monthSaveDate;
	}
	public void setMonthSaveDate(Date monthSaveDate) {
		this.monthSaveDate = monthSaveDate;
	}
}
