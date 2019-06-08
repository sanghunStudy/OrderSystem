package kr.ac.kopo.util;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Component;



@Component
public class AutoSave {
//	@Autowired
//	AutoSaveService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AutoSave.class);
	
	public void saveItem() {
		logger.info("자동저장실행");
/*		List<UserVO> item = service.list();
		for(int i=0; i < item.size(); i++) {
			logger.info("트레이너 이름:"+item.get(i).getUsername());
			
		}*/
		
	}
}
