package kr.ac.kopo.model;

//운동일지에 뿌려주는 운동 종류
public class TypeOfExercise {
 int teNum;
 String teName;
 String teSet;
 String teReps;
 String teTool;
 
 
public int getTeNum() {
	return teNum;
}
public void setTeNum(int teNum) {
	this.teNum = teNum;
}
public String getTeName() {
	return teName;
}
public void setTeName(String teName) {
	this.teName = teName;
}
public String getTeSet() {
	return teSet;
}
public void setTeSet(String teSet) {
	this.teSet = teSet;
}
public String getTeReps() {
	return teReps;
}
public void setTeReps(String teReps) {
	this.teReps = teReps;
}
public String getTeTool() {
	return teTool;
}
public void setTeTool(String teTool) {
	this.teTool = teTool;
}
}
