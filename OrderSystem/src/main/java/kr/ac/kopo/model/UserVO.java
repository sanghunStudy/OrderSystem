package kr.ac.kopo.model;

public class UserVO {

	private String username;
	private String password;
	private int point;
	private String authority;
	private String tier;
	private int score;
	private int menti;
	private float rank;
	private int ranking;
	private int ubChk;//회원 기초정보 여부 체크
	private String upFilename;
	
	
	public int getUbChk() {
		return ubChk;
	}
	public void setUbChk(int ubChk) {
		this.ubChk = ubChk;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public int getMenti() {
		return menti;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public void setMenti(int menti) {
		this.menti = menti;
	}
	public float getRank() {
		return rank;
	}
	public void setRank(float rank) {
		this.rank = rank;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUpFilename() {
		return upFilename;
	}
	public void setUpFilename(String upFilename) {
		this.upFilename = upFilename;
	}
	
	
	
}
