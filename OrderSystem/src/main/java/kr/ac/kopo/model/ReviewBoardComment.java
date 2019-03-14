package kr.ac.kopo.model;

import java.util.Date;

public class ReviewBoardComment {
	private int rcommentId;
	private String id;
	private String rcommentContent;
	private String rcommentDate;
	private int reviewId;
	private int redepth; //깊이
	private int reorder; //순서
	private int reparent; // 부모
	

	public int getRedepth() {
		return redepth;
	}
	public void setRedepth(int redepth) {
		this.redepth = redepth;
	}
	public int getReorder() {
		return reorder;
	}
	public void setReorder(int reorder) {
		this.reorder = reorder;
	}
	public int getReparent() {
		return reparent;
	}
	public void setReparent(int reparent) {
		this.reparent = reparent;
	}
	public int getRcommentId() {
		return rcommentId;
	}
	public void setRcommentId(int rcommentId) {
		this.rcommentId = rcommentId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRcommentContent() {
		return rcommentContent;
	}
	public void setRcommentContent(String rcommentContent) {
		this.rcommentContent = rcommentContent;
	}
	public String getRcommentDate() {
		return rcommentDate;
	}
	public void setRcommentDate(String rcommentDate) {
		this.rcommentDate = rcommentDate;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	
	
}
