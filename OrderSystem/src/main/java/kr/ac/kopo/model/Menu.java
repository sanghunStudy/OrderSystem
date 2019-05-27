package kr.ac.kopo.model;

import java.util.Date;

public class Menu {
	int menuId;
	String menuName;
	String menuContent;
	int cnt;
	Date menuDate;
	int menuViews;
	String id;
	boolean imgChk;
	

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
	public Date getMenuDate() {
		return menuDate;
	}
	public void setMenuDate(Date menuDate) {
		this.menuDate = menuDate;
	}
	public int getMenuViews() {
		return menuViews;
	}
	public void setMenuViews(int menuViews) {
		this.menuViews = menuViews;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuContent() {
		return menuContent;
	}
	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}
}
