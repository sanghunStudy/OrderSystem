package kr.ac.kopo.util;


import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ac.kopo.service.AnalysisService;
@Component
public class AutoImpl {
	@Autowired
	SqlSession sql;
	
	private static final Logger logger = LoggerFactory.getLogger(AutoImpl.class);

//	@Scheduled(cron="*/30 * * * * *") 

	public void scheduleRun(){
		
	 Calendar calendar = Calendar.getInstance();

	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	 //System.out.println("스케줄 실행 : " + dateFormat.format(calendar.getTime()));

	 logger.info("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
	 calendar.add(Calendar.DATE, 14);
	 logger.info("14일 후? 스케줄 실행 : " + dateFormat.format(calendar.getTime()));
	 //System.out.println("Request " + getCurrentRequest());

	}

	@Scheduled(cron ="59 59 23 * * * ")
	public void AutoDelete() {	
		try {
			sql.delete("autoimpl.autoDelete");
			logger.info("2주이상 처리되지 않은 멘티들을 삭제하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
}
