package kr.ac.kopo.model;

import java.util.Date;

public class Notice {
	
	int noticeId;
	String noticeTitle;
	String noticeContents;
	Date noticeDate;
	int noticeViews;
	String noticePhoto;
	String id;
	
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeViews() {
		return noticeViews;
	}
	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}
	public String getNoticePhoto() {
		return noticePhoto;
	}
	public void setNoticePhoto(String noticePhoto) {
		this.noticePhoto = noticePhoto;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
