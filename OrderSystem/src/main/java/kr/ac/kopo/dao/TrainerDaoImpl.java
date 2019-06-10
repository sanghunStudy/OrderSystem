package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.TrainerProfile;
import kr.ac.kopo.model.UserManagement;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.model.basicInformation;

@Repository
public class TrainerDaoImpl implements TrainerDao {

	@Autowired
	SqlSession sql;
	//트레이너 리스트 출력
	@Override
	public List<TrainerProfile> list() {
		
		return sql.selectList("trainer.list");
	}
	//pt신청시 회원기초정보를 작성했나 확인
	@Override
	public int selectUserbI(String username) {
		// TODO Auto-generated method stub
		return sql.selectOne("trainer.selectUserbI",username);
	}
	//pt신청시 user_managerment 테이블에 신청한 회원과 선택한 트레이너의 아이디가 저장됨.
	@Override
	public void apply(UserManagement um) {
		sql.insert("trainer.apply", um);
	}
	//트레이너에게 pt신청한 내역이 있나 확인
	@Override
	public int selectApply(String username) {
		return sql.selectOne("trainer.selectApply", username);
	}
	
	//승인 대기회원
	@Override
	public List<UserManagement> waitingForApproval(String id) {
		return sql.selectList("trainer.waitingForApproval", id);
	}
	
	//클릭한 회원의 기초정보 가져오기
	@Override
	public basicInformation userDetailView(String username) {
		return sql.selectOne("trainer.userDetailView", username);
	}
	//승인허가
	@Override
	public void grantApproval(String username) {
			sql.update("trainer.grantApproval", username);
	}
	//트레이너티어체크
	@Override
	public String tierCheck(String username) {
		return sql.selectOne("trainer.tierCheck", username);
	}
	//트레이너멘티수
	@Override
	public int mentiCount(String username) {
		return sql.selectOne("trainer.mentiCount", username);
	}

}
