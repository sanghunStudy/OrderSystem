package kr.ac.kopo.util;

import java.util.Date;

public class BoardReplyVO {

	private String reviewId; //게시물번호
	private String rcommentId; //댓글
	private String rcommentWriter; //작성자
	private String rcommentDf; //삭제여부
	private String rcommentContents; //댓글내용
	private Date rcommentDate; //작성일자
	
	
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getRcommentId() {
		return rcommentId;
	}
	public void setRcommentId(String rcommentId) {
		this.rcommentId = rcommentId;
	}
	public String getRcommentWriter() {
		return rcommentWriter;
	}
	public void setRcommentWriter(String rcommentWriter) {
		this.rcommentWriter = rcommentWriter;
	}
	public String getRcommentDf() {
		return rcommentDf;
	}
	public void setRcommentDf(String rcommentDf) {
		this.rcommentDf = rcommentDf;
	}
	public String getRcommentContents() {
		return rcommentContents;
	}
	public void setRcommentContents(String rcommentContents) {
		this.rcommentContents = rcommentContents;
	}
	public Date getRcommentDate() {
		return rcommentDate;
	}
	public void setRcommentDate(Date rcommentDate) {
		this.rcommentDate = rcommentDate;
	}
	
	
}
