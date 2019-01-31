package kr.ac.kopo.model;

import java.util.Date;

public class NoticeComment {
	private int ncomentId;
	private String id;
	private String ncomentContent;
	private String ncomentDate;
	
	
	public int getNcomentId() {
		return ncomentId;
	}
	public void setNcomentId(int ncomentId) {
		this.ncomentId = ncomentId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNcomentContent() {
		return ncomentContent;
	}
	public void setNcomentContent(String ncomentContent) {
		this.ncomentContent = ncomentContent;
	}
	public String getNcomentDate() {
		return ncomentDate;
	}
	public void setNcomentDate(String ncomentDate) {
		this.ncomentDate = ncomentDate;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	private int noticeId;
}
