package kr.ac.kopo.util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.ac.kopo.model.MessageRepository;

@Repository
public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	SqlSession sql;
	
	private Map<String,WebSocketSession> users = new ConcurrentHashMap<String,WebSocketSession>();

	
	/*
	 * 클라이언트가 연결되면, 클라이언트의 관련된 WebSocketSession을 users 맵에 저장한다.
	 * 이 users 맵은 채팅 메시지를 연결된 전체 클라이언트에 전달할 때 사용
	 */
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + " 연결됨");
		users.put(session.getId(), session);
	}
	
	/*
	 * 클라이언트가 전송한 메시지를 users 맵에 보관한 전체 WebSocketSession에 다시 전달한다.
	 * 클라이언트는 메시지를 수신하면 채팅 영역에 보여주도록 구현.
	 * 특정 클라이언트가 채팅 메시지를 서버에 보내면 전체 클라이언트는 다시 그 메시지를 받아서 화면에 보여주게 된다.
	 */

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		System.out.println(session.getId() + "로부터 메시지 수신 : " + message.getPayload());
		String managerName = "kgw";//현재 로그인한 사용자의 아이디로 바꿔야됨 js에서 session에 존재하는 사용자 아이디를 webSocketSession에 보내줘서 해보자.
//		int mCount =sql.selectOne("message.countMessage", username);
		MessageRepository items = sql.selectOne("message.cuDate",managerName);
		CharSequence item = String.valueOf(items.getUsername()+"님이 " + items.getDoneSubject()+"를 완료 하였습니다.");
		System.out.println("쪽지수 :" + items.getUsername() + items.getDoneSubject());
//		session.sendMessage(new TextMessage(item));
		
		for(WebSocketSession s : users.values()) {
			s.sendMessage(new TextMessage(item));
		}
//		for(WebSocketSession s : users.values()) {
//			s.sendMessage(message);
//			System.out.println(s.getId() + "에 메시지 발송 : " + message.getPayload());
//		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + " 익셉션 발생 : " + exception.getMessage());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료됨");
		users.remove(session.getId());
	}
	
}

