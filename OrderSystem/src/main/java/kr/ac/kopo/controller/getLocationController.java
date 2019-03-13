package kr.ac.kopo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/gps")
public class getLocationController {

	final String path = "gps/";
	
	@RequestMapping("/getLocation")
	String getLocation() {
		return path+"getLocation";
	}
	
	@RequestMapping("/test")
	String test(String data,Model model){
		System.out.println(data+"<<<<<검색어");
//		%ED%97%AC%EC%8A%A4%EC%9E%A5
		String seach = data;
		String url = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+seach;
		Document doc = null;
		String item = "";
			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(url);

		
			if(data.equals("식당")) {
				Elements element = doc.select(".list_area");
				item = element.toString();
				
			}else if(data.equals("헬스장")) {
				Elements element = doc.select(".detail");
				item = element.toString();
			}
		
		
		
		System.out.println(item);
		model.addAttribute("item",item);
		/*
		 * Map<String, Object> map = new HashMap<String, Object>();
		 * map.put("item",item);
		 */	
		return path+"getLocation"; 
	}
}
