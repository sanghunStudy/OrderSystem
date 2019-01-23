package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.service.NoticeServcie;
import kr.ac.kopo.util.PageVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	final String path = "notice/";
	
	@Autowired
	NoticeServcie service;
	
	@RequestMapping("/list")
	String list(Model model , PageVO pageVo) {
	
	pageVo.pageCalculate(service.totalCount());
	
	
	
	List<Notice> list = service.list(pageVo);
	
	model.addAttribute("list", list);
	model.addAttribute("pageVo",pageVo);
		return path+"list";
	}
	
	//이번에는 수정과 등록을 분리하지 않고 하나로 합쳐보았다.
	//nid 의 값이 있을경우 해당 글의 정보를 가져와서 수정화면 아니라면 그냥 입려화면이다.
	@RequestMapping(value="/add" , method=RequestMethod.GET)
	String add(int nid, Model model) {
		
		
		if(nid != 0) {
			Notice item = service.view(nid);
			model.addAttribute("item", item);
		}
		
		return path+"add";
	}
	
	//jsp에서 글작성시 noticeId의 값을 0으로 넘겨주고 아래에서 비교 0보다 클경우에는 글 수정 나머지는 글 작성이다.
	@RequestMapping(value="/add" , method=RequestMethod.POST)
	String add(Notice notice) {
		if(notice.getNoticeId() > 0) {
			service.update(notice);
		}else{
			service.add(notice);	
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/view")
	String view(Model model, int nid) {
		//조회수
		service.views(nid);
		
		Notice item = service.view(nid);
		
		model.addAttribute("item",item);
		return path+"view";
	}
	
	
	@RequestMapping("/delete")
	String delete(int nid) {
		service.delete(nid);
		return "redirect:list";
	}
}
