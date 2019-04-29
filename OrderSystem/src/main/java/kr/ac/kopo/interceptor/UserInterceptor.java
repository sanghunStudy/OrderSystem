package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session= request.getSession();
		
		if(session.getAttribute("user") == null && session.getAttribute("admin") == null && session.getAttribute("trainer") == null){
			response.sendRedirect("/login");//로그?��?��?���?�? 보내�?
			
			return false;//컨트롤러 ?���? 차단.
		}
		
		return true;
			
	}

}
