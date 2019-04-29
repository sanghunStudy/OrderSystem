package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.UserVO;

public interface TrainerDao {

	List<UserVO> list();

	int selectUserbI(String username);

}
