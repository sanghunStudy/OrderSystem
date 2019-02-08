package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.service.ReviewBoardService;
import kr.ac.kopo.util.BoardReplyVO;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.PageVO;
import kr.ac.kopo.util.SearchVO;

@Controller
@RequestMapping("/review_board")
public class ReviewBoardController {
	final String path = "review_board/";
	
	@Autowired
	ReviewBoardService service;
	
	@RequestMapping("/list")
	public String list(Model model, SearchVO searchVO) {
		
		searchVO.pageCalculate(service.totalCount(searchVO));

		List<SearchVO> list = service.list(searchVO);
		
		model.addAttribute("SearchVO", searchVO);
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@RequestMapping("/reply")
	public String Reply(BoardReplyVO boardReplyVO) {
		
		service.insertBoardReply(boardReplyVO);
		
		return "redirect:board5Read?reviewId=" + boardReplyVO.getReviewId();
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String add() {
		
		return path + "add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(ReviewBoard item) {
		
		service.add(item);
		
		return "redirect:list";
	}
	
	@RequestMapping("/view")
	String view(Model model, int reviewId) {
		//조회수
		service.views(reviewId);
		
		ReviewBoard item = service.view(reviewId);
		
		model.addAttribute("item",item);
		
		return path+"view";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(Model model, int reviewId) {
		ReviewBoard item = service.item(reviewId);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(ReviewBoard item) {
		
		service.update(item);
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(int reviewId) {
		
		service.delete(reviewId);
		
		return "redirect:list";
	}
}
