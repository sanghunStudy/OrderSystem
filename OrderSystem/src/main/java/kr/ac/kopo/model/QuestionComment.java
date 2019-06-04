package kr.ac.kopo.model;

public class QuestionComment {
	private int mcommentId;
	private String id;
	private String mcommentContent;
	private String mcommentDate;
	private int menuId;
	boolean selectionCheck;
	
	public int getMcommentId() {
		return mcommentId;
	}
	public void setMcommentId(int mcommentId) {
		this.mcommentId = mcommentId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMcommentContent() {
		return mcommentContent;
	}
	public void setMcommentContent(String mcommentContent) {
		this.mcommentContent = mcommentContent;
	}
	public String getMcommentDate() {
		return mcommentDate;
	}
	public void setMcommentDate(String mcommentDate) {
		this.mcommentDate = mcommentDate;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public boolean isSelectionCheck() {
		return selectionCheck;
	}
	public void setSelectionCheck(boolean selectionCheck) {
		this.selectionCheck = selectionCheck;
	}
	
}
