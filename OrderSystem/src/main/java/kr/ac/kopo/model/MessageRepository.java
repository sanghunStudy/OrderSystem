package kr.ac.kopo.model;

//assignment_log db와 연결되는 vo
public class MessageRepository {

	private int log_num; //기록번호
	private String manager; //멘토
	private String username; //유저
	private String doneSubject;//한 일
	private String doneContent; //한 내용
	private String kinds; //먹기 or 하기
	private char logTime; //등록시간
	public int getLog_num() {
		return log_num;
	}
	public void setLog_num(int log_num) {
		this.log_num = log_num;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDoneSubject() {
		return doneSubject;
	}
	public void setDoneSubject(String doneSubject) {
		this.doneSubject = doneSubject;
	}
	public String getDoneContent() {
		return doneContent;
	}
	public void setDoneContent(String doneContent) {
		this.doneContent = doneContent;
	}
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	public char getLogTime() {
		return logTime;
	}
	public void setLogTime(char logTime) {
		this.logTime = logTime;
	}
	
	
	
	
	
	
	
}
