package kr.ac.kopo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.model.ReviewBoardComment;
import kr.ac.kopo.service.ReviewBoardService;
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
	
	//댓글 crud
	
	@RequestMapping("/commentUpdate")
	@ResponseBody
	String commentUpdate(ReviewBoardComment RComment) {
		service.commentUpdate(RComment);
		return "success";
	}
	
	@RequestMapping("/commentDel")
	@ResponseBody
	String commentDel(ReviewBoardComment RComment) {
		service.conmmentDel(RComment);
		return "success";
	}
	
	@RequestMapping("/commentAdd")
	@ResponseBody
	String commentAdd(ReviewBoardComment RComment) {
		service.commentAdd(RComment);
		return "success";
	}

	@RequestMapping("/commentList")
	@ResponseBody
	ResponseEntity commentList(ReviewBoardComment RComment,HttpServletRequest request){
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 게시물 댓글
        List<ReviewBoardComment> commentVO = service.commentList(RComment);
        
        if(commentVO.size() > 0){
            for(int i=0; i<commentVO.size(); i++){
                HashMap hm = new HashMap();
                hm.put("c_code", commentVO.get(i).getRcommentId());
                hm.put("comment", commentVO.get(i).getRcommentContent());
                hm.put("writer", commentVO.get(i).getId());
                hm.put("RcommentDate", commentVO.get(i).getRcommentDate());
                
                hmlist.add(hm);
            }
            
        }
        
        JSONArray json = new JSONArray(hmlist);  	
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
}
