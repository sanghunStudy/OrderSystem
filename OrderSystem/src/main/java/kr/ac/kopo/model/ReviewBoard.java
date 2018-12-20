package kr.ac.kopo.model;

import java.util.Date;

public class ReviewBoard {
	
	int review_id;
	String review_title;
	String review_contents;
	Date review_date;
	String review_photo;
	int review_views;
	int review_score;
	String id;
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getReview_photo() {
		return review_photo;
	}
	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}
	public int getReview_views() {
		return review_views;
	}
	public void setReview_views(int review_views) {
		this.review_views = review_views;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
