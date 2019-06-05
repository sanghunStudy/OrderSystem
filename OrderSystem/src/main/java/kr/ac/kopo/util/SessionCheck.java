package kr.ac.kopo.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionCheck extends HttpServlet implements Filter {
	private static final long serialVersionUID = 1L;
	private FilterConfig filterChain = null;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = httpReq.getSession(false);
		String loginURI = httpReq.getContextPath() + "/";

//		if (session.getAttribute("user") == null) {
//			((HttpServletResponse) res).sendRedirect("error.jsp");
//		} else {
//			chain.doFilter(request, res);
//		}
			
			boolean loggedIn = session != null && session.getAttribute("user") != null || session.getAttribute("trainer") != null || session.getAttribute("admin") != null;
			System.out.println(loggedIn);
			boolean loginRequest = httpReq.getRequestURI().equals(loginURI);
			System.out.println(httpReq.getRequestURI()+"<<<<<httpReq");
			if (loggedIn || loginRequest || excludeUrl(httpReq.getRequestURI())) {
				chain.doFilter(request, response);
			} else {
				response.sendRedirect(loginURI);
			}
		

	}

	private boolean excludeUrl(String uri) {
	  if(uri.equals("/kopo/member/add")){
		   return true;
	  }else{
		   return false;
	  }
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		filterChain = filterConfig;
	}

	@Override
	public void destroy() {
		filterChain = null;
	}

}
