package kr.ac.kopo.model;

public class BEsave {
	int BEid;
	String username;
	String BEdate;
	int Bmetabolism;
	int Erequirement;
	
	public int getBEid() {
		return BEid;
	}
	public void setBEid(int bEid) {
		BEid = bEid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBEdate() {
		return BEdate;
	}
	public void setBEdate(String bEdate) {
		BEdate = bEdate;
	}
	public int getBmetabolism() {
		return Bmetabolism;
	}
	public void setBmetabolism(int bmetabolism) {
		Bmetabolism = bmetabolism;
	}
	public int getErequirement() {
		return Erequirement;
	}
	public void setErequirement(int erequirement) {
		Erequirement = erequirement;
	}
}
