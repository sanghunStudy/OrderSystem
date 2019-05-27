package kr.ac.kopo.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TrainerProfile {
	private int applyNum;
	private String username;
	private String name;
	private String sex;
	private String career;
	private Date applyDate;
	MultipartFile uploadFile;
	String upFilename;
	private Date proDate;
	private String file;
	private String trnThum;
	
	
	
	public String getUpFilename() {
		return upFilename;
	}
	public void setUpFilename(String upFilename) {
		this.upFilename = upFilename;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getTrnThum() {
		return trnThum;
	}
	public void setTrnThum(String trnThum) {
		this.trnThum = trnThum;
	}
	public int getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(int applyNum) {
		this.applyNum = applyNum;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public Date getProDate() {
		return proDate;
	}
	public void setProDate(Date proDate) {
		this.proDate = proDate;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
		
}
