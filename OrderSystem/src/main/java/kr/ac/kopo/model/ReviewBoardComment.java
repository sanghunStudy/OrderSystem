package kr.ac.kopo.model;

import java.util.Date;

public class ReviewBoardComment {
	private int rcommentId;
	private String id;
	private String rcommentContent;
	private String rcommentDate;
	private int reviewId;
	private int rcommentDepth;
	private int rcommentParent;
	private int rcommentOrder;

	
	public int getRcommentOrder() {
		return rcommentOrder;
	}
	public void setRcommentOrder(int rcommentOrder) {
		this.rcommentOrder = rcommentOrder;
	}
	public int getRcommentDepth() {
		return rcommentDepth;
	}
	public void setRcommentDepth(int rcommentDepth) {
		this.rcommentDepth = rcommentDepth;
	}
	public int getRcommentParent() {
		return rcommentParent;
	}
	public void setRcommentParent(int rcommentParent) {
		this.rcommentParent = rcommentParent;
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
