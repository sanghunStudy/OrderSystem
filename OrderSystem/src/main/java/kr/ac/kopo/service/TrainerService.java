package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.UserVO;

public interface TrainerService {

	List<UserVO> list();

	int selectUserbI(String username);

}
