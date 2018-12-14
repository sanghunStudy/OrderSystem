package kr.ac.kopo.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CartController {

	 private static final String encoding = "UTF-8";
	 private static final String path = "/";
	
	@RequestMapping(value="/cart" , method=RequestMethod.POST)
	@ResponseBody
	Cookie[] cartAdd(String code,HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		
		 Cookie[] cookies = request.getCookies();
		  if(cookies != null) {
			  for(int i=0; i < cookies.length; i++) {
				  if(cookies[i].getName().equals(code)) {
					  System.out.println(cookies[i].getName()+"중복되는이름");
					  int cookiesAmout = Integer.parseInt(cookies[i].getValue());
					  System.out.println(cookies[i].getValue()+"기존 값");
					  
					  int val = cookiesAmout +1;
					  String cookiesVal = Integer.toString(val);
					  cookies[i].setValue(cookiesVal);
					  System.out.println(cookies[i].getValue()+"변경된 값");
					  response.addCookie(cookies[i]);
					  break;
				  
			  }else {
				  System.out.println("이름이 없을 경우");
				  String amount ="1";  
					Cookie cookie = new Cookie(code, URLEncoder.encode(amount, encoding));
					  cookie.setPath(path);
					  cookie.setMaxAge(60*60*24*1);
					  response.addCookie(cookie);	
			  }
				  

				  System.out.println("메뉴번호"+cookies[i].getName());
				  System.out.println("수량"+cookies[i].getValue());
		  }
	
		
	}
		  return cookies;
	}
	
	@RequestMapping("/cartDel")
	void cartDel(HttpServletRequest request, HttpServletResponse response) {

			Cookie[] cookies = request.getCookies();

			if(cookies != null){

			for(int i=0; i< cookies.length; i++){
			cookies[i].setPath(path);
			cookies[i].setMaxAge(0); // 유효시간을 0으로 설정

			response.addCookie(cookies[i]); // 응답 헤더에 추가

			}

				
			}
	}
}
