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
		
		if(session.getAttribute("user") == null && session.getAttribute("admin") == null){
			response.sendRedirect("/login");//Î°úÍ∑∏?ù∏?éò?ù¥Ïß?Î°? Î≥¥ÎÇ¥Ï§?
			
			return false;//Ïª®Ìä∏Î°§Îü¨ ?†ëÍ∑? Ï∞®Îã®.
		}
		
		return true;
			
	}

}
