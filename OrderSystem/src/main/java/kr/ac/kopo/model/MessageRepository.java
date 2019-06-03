package kr.ac.kopo.model;

//message_repository db와 연결되는 vo
public class MessageRepository {

	private int messageNo; //쪽지번호
	private String username; //발신자
	private String recipient; //수신자
	private String message;//내용
	private String sentDate; //보낸날짜
	private String readDate; //열람일자
	private char reception; //수신여부
	
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getSentDate() {
		return sentDate;
	}
	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}
	public String getReadDate() {
		return readDate;
	}
	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}
	public char getReception() {
		return reception;
	}
	public void setReception(char reception) {
		this.reception = reception;
	}
	
	
	
	
}
