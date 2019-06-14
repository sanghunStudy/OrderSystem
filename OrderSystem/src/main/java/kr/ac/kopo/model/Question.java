package kr.ac.kopo.model;

import java.util.Date;

public class Question {
	int questionId;
	String questionName;
	String questionContent;
	int cnt;
	Date questionDate;
	int questionViews;
	String id;
	boolean imgChk;
	int pointSet;
	String hashTag;
	
	public int getPointSet() {
		return pointSet;
	}
	public void setPointSet(int pointSet) {
		this.pointSet = pointSet;
	}
	public boolean isImgChk() {
		return imgChk;
	}
	public void setImgChk(boolean imgChk) {
		this.imgChk = imgChk;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQuestionName() {
		return questionName;
	}
	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public Date getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}
	public int getQuestionViews() {
		return questionViews;
	}
	public void setQuestionViews(int questionViews) {
		this.questionViews = questionViews;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	
}
