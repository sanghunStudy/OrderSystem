package kr.ac.kopo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.model.ReviewBoardComment;
import kr.ac.kopo.service.ReviewBoardService;
import kr.ac.kopo.util.FileVO;
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

	@RequestMapping("/profileUpload")
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = "c:\\upload\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("/upload/" + str_filename);
		out.close();
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add(Model model) {

		return path + "add";
	}

	@RequestMapping(value = "/upload")
	public void upload(HttpServletResponse response, HttpServletRequest request,
			@RequestParam("Filedata") MultipartFile Filedata) throws IllegalStateException, IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String newfilename = df.format(new Date()) + Integer.toString((int) (Math.random() * 10));

		File f = new File("c:\\upload\\" + newfilename);

		Filedata.transferTo(f);
		response.getWriter().write(newfilename);
	}

	// jsp에서 글작성시 noticeId의 값을 0으로 넘겨주고 아래에서 비교 0보다 클경우에는 글 수정 나머지는 글 작성이다.
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	String add(ReviewBoard reviewboard) {

		service.add(reviewboard);

		return "redirect:list";
	}

	@RequestMapping("/view")
	String view(Model model, int reviewId) {
		// 조회수
		service.views(reviewId);

		ReviewBoard item = service.view(reviewId);

		model.addAttribute("item", item);

		return path + "view";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, int reviewId) {
		ReviewBoard item = service.item(reviewId);

		model.addAttribute("item", item);

		return path + "update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ReviewBoard item) {

		service.update(item);

		return "redirect:list";
	}

	@RequestMapping("/delete")
	public String delete(int reviewId) {

		service.delete(reviewId);

		return "redirect:list";
	}

	// 댓글 crud

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
	String commentAdd(ReviewBoardComment RComment, Principal principal) {

		System.out.println(principal.getName());

		RComment.setId(principal.getName());

		service.commentAdd(RComment);
		return "success";
	}

	@RequestMapping("/recommentAdd")
	@ResponseBody
	String recommentAdd(ReviewBoardComment RComment, Principal principal) {

		System.out.println(principal.getName());

		RComment.setId(principal.getName());
		System.out.println(RComment.getRcommentContent() + "<<<<<<RComment.getRcommentContent()");
		System.out.println(RComment.getReviewId() + "<<<<<<RComment.getReviewId()");
		service.recommentAdd(RComment);
		return "success";
	}

	@RequestMapping("/commentList")
	@ResponseBody
	ResponseEntity commentList(ReviewBoardComment RComment, HttpServletRequest request) {
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		// 해당 게시물 댓글
		List<ReviewBoardComment> commentVO = service.commentList(RComment);

		if (commentVO.size() > 0) {
			for (int i = 0; i < commentVO.size(); i++) {
				HashMap<String, Comparable> hm = new HashMap();
				hm.put("c_code", commentVO.get(i).getRcommentId());
				hm.put("comment", commentVO.get(i).getRcommentContent());
				hm.put("writer", commentVO.get(i).getId());
				hm.put("depth", commentVO.get(i).getRcommentDepth());
				hm.put("parent", commentVO.get(i).getRcommentParent());
				hm.put("order", commentVO.get(i).getRcommentOrder());
				hmlist.add(hm);
			}

		}

		JSONArray json = new JSONArray(hmlist);

		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}

	@RequestMapping("/rcommentList")
	@ResponseBody
	ResponseEntity rcommentList(ReviewBoardComment RComment, HttpServletRequest request) {
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		// 해당 게시물 댓글
		List<ReviewBoardComment> commentVO = service.rcommentList(RComment);

		if (commentVO.size() > 0) {
			for (int i = 0; i < commentVO.size(); i++) {
				HashMap<String, Comparable> hm = new HashMap();
				hm.put("c_code", commentVO.get(i).getRcommentId());
				hm.put("comment", commentVO.get(i).getRcommentContent());
				hm.put("writer", commentVO.get(i).getId());
				hm.put("depth", commentVO.get(i).getRcommentDepth());
				hm.put("parent", commentVO.get(i).getRcommentParent());
				hm.put("order", commentVO.get(i).getRcommentOrder());
				hmlist.add(hm);
			}

		}

		JSONArray json = new JSONArray(hmlist);

		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
}
