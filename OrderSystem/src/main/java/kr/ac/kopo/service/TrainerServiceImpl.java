package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.TrainerDao;
import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.model.basicInformation;

@Service
public class TrainerServiceImpl implements TrainerService {

	@Autowired
	TrainerDao dao;
	//트레이너 리스트 출력
	@Override
	public List<TrainerProfile> list() {
		return dao.list();
	}
	//pt신청시 회원기초정보를 작성했나 확인
	@Override
	public int selectUserbI(String username) {
		
		return dao.selectUserbI(username);
	}
	//pt신청시 user_managerment 테이블에 신청한 회원과 선택한 트레이너의 아이디가 저장됨.
	@Override
	public void apply(UserManagement um) {
		dao.apply(um);
	}
	
	//트레이너에게 pt신청한 내역이 있나 확인
	@Override
	public int selectApply(String username) {
		return dao.selectApply(username);
	}
	
	//승인대기회원
	@Override
	public List<UserManagement> waitingForApproval(String id) {
		return dao.waitingForApproval(id);
	}
	
	//클릭한 회원의 기초정보 가져오기
	@Override
	public basicInformation userDetailView(String username) {
		return dao.userDetailView(username);
	}
	//승인허가
	@Override
	public void grantApproval(String username) {
		dao.grantApproval(username);
	}
	//트레이너티어체크
	@Override
	public String tierCheck(String username) {
		return dao.tierCheck(username);
	}
	//트레이너멘티수
	@Override
	public int mentiCount(String username) {
		return dao.mentiCount(username);
	}

}
