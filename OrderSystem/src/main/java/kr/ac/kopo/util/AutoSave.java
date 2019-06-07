package kr.ac.kopo.util;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.ac.kopo.model.AutoSaveItem;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.service.AutoSaveService;

@Component
public class AutoSave {
	@Autowired
	AutoSaveService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AutoSave.class);
	
	public void saveItem() {
		logger.info("자동저장실행");
/*		List<UserVO> item = service.list();
		for(int i=0; i < item.size(); i++) {
			logger.info("트레이너 이름:"+item.get(i).getUsername());
			
		}*/
		
	}
}
