package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.model.basicInformation;

public interface TrainerService {
	//트레이너 리스트 출력
	List<TrainerProfile> list();
	//pt신청시 회원기초정보를 작성했나 확인
	int selectUserbI(String username);
	//pt신청시 user_managerment 테이블에 신청한 회원과 선택한 트레이너의 아이디가 저장됨.
	void apply(UserManagement um);
	//트레이너에게 pt신청한 내역이 있나 확인
	int selectApply(String username);
	//승인 대기회원
	List<UserManagement> waitingForApproval(String id);
	//클릭한 회원의 기초정보 가져오기
	basicInformation userDetailView(String username);
	//승인허가
	void grantApproval(String username);
	//트레이너티어체크
	String tierCheck(String username);
	//트레이너멘티수
	int mentiCount(String username);
	

}
