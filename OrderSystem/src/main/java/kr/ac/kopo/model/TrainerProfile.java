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
	private String region;
	private String trainerApply;
	private String deleteApply;
	String thumbnail;
	
	
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getTrainerApply() {
		return trainerApply;
	}
	public void setTrainerApply(String trainerApply) {
		this.trainerApply = trainerApply;
	}
	public String getDeleteApply() {
		return deleteApply;
	}
	public void setDeleteApply(String deleteApply) {
		this.deleteApply = deleteApply;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
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
