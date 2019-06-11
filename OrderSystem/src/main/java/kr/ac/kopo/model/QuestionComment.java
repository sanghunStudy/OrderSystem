package kr.ac.kopo.model;

public class QuestionComment {
	private int qcommentId;
	private String id;
	private String qcommentContent;
	private String qcommentDate;
	private int questionId;
	boolean selectionCheck;
	private String questionName;
	String tier;
	
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public String getQuestionName() {
		return questionName;
	}
	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}
	public int getQcommentId() {
		return qcommentId;
	}
	public void setQcommentId(int qcommentId) {
		this.qcommentId = qcommentId;
	}
	public String getQcommentContent() {
		return qcommentContent;
	}
	public void setQcommentContent(String qcommentContent) {
		this.qcommentContent = qcommentContent;
	}
	public String getQcommentDate() {
		return qcommentDate;
	}
	public void setQcommentDate(String qcommentDate) {
		this.qcommentDate = qcommentDate;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean isSelectionCheck() {
		return selectionCheck;
	}
	public void setSelectionCheck(boolean selectionCheck) {
		this.selectionCheck = selectionCheck;
	}
	
}
