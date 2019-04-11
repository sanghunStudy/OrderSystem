package kr.ac.kopo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import kr.ac.kopo.service.NoticeServcie;
import kr.ac.kopo.service.ReviewBoardService;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.MediaUtils;
import kr.ac.kopo.util.SearchVO;
import kr.ac.kopo.util.UploadFileUtils;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	final String path = "notice/";
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private String uploadPath = "c:\\upload\\";
	
	List<String> reallist = new ArrayList<String>();
	List<String> filelist = new ArrayList<String>();
	List<String> sizelist = new ArrayList<String>();
	
	
	@Autowired
	NoticeServcie service;
	@Autowired
	ReviewBoardService Rservice;
	
	@RequestMapping("/test")
	String fileTest() {
		return "upload/fileUpload";
	}

	@RequestMapping("/list")
	String list(Model model, SearchVO searchVO) {

		searchVO.pageCalculate(service.totalCount(searchVO));

		List<Notice> list = service.list(searchVO);

		model.addAttribute("list", list);
		model.addAttribute("SearchVO", searchVO);
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

	// 이번에는 수정과 등록을 분리하지 않고 하나로 합쳐보았다.
	// nid 의 값이 있을경우 해당 글의 정보를 가져와서 수정화면 아니라면 그냥 입려화면이다.
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add(int nid, Model model) {

		if (nid != 0) {
			List<FileVO> file = service.fileSelect(nid);
			Notice item = service.view(nid);
			model.addAttribute("item", item);
			model.addAttribute("file", file);

		}

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
	String add(HttpServletRequest request, Notice notice, Principal principal) {

		

		notice.setId(principal.getName());

		
	
		
		if (notice.getNoticeId() > 0) {
			service.update(notice);
		} else {
			service.add(notice);
//			System.out.println(filelist.length + "파일사이즈 랭스스스");
			// 첨부파일이 있을 경우에만 실행
			if (filelist.size() > 0) {
				for (int i = 0; i < filelist.size(); i++) {
					service.fileUp(filelist.get(i), reallist.get(i), sizelist.get(i));
					
				}
				
				reallist.clear();
				filelist.clear();
				sizelist.clear();
				
			}

		}
		
		
		
		
		
		
		
		return "redirect:list";
	}

	// Ajax 파일 업로드 produces는 한국어를 정상적으로 전송하기 위한 속성
	@ResponseBody
	@RequestMapping(value = "/sample/upload/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxPOST(MultipartFile file) throws Exception {

		logger.info("originalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
	
		
		// String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		// HttpStatus.CREATED : 리소스가 정상적으로 생성되었다는 상태코드.
		// return new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED);
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}

	// 화면에 저장된 파일을 보여주는 컨트롤러 /년/월/일/파일명 형태로 입력 받는다.
	// displayFile?fileName=/년/월/일/파일명
	@ResponseBody
	@RequestMapping(value = "/sample/upload/displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName,UploadFileUtils up) throws Exception {
		
//			위에서 선언한 동적 배열에 값을 넣어준다.
			reallist.add(up.getRealname());
			filelist.add(up.getFilename());
			sizelist.add(up.getFilesize());
	
		System.out.println(reallist.size()+"<<<<<<<<<<reallist.size();");
		for(int i=0; i<reallist.size(); i++) {
		System.out.println(reallist.get(i)+"<<<<<<<<<<<<<<<<<<<<<진짜 이름");
		}
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("File name: " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			} // else

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}// displayFile

	// 업로드된 파일 삭제 처리
	@ResponseBody
	@RequestMapping(value = "/sample/upload/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName,UploadFileUtils up) throws Exception {


		logger.info("delete file:" + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		} // if

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		//배열에서 값 삭제처리
		String fakeFileName = fileName.substring(12);

		System.out.println(fileName+"<<<<<<<<<<<<<<<<<fileName");
		for(int i=0; i<filelist.size(); i++) {

			System.out.println(filelist.get(i)+"<<<<<<<<<<<<<<<<<get(i)");
			System.out.println(fakeFileName+"<<<<<<<<<<<<<<<<<fakeFileName");
			
			if(filelist.get(i).equals(fakeFileName)) {
				System.out.println(filelist.indexOf(filelist.get(i)) + "<<<<<<<<<<<<<<삭제할 놈이 있는 위치");
				//선택한 번째를 삭제한다.
				reallist.remove(filelist.indexOf(filelist.get(i)));
				sizelist.remove(filelist.indexOf(filelist.get(i)));
				filelist.remove(filelist.indexOf(filelist.get(i)));
				break;
				
			}
		}
	
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK) ;

	}

	// 상세보기 화면
	@RequestMapping("/view")
	String view(Model model, int nid) {
		// 조회수
		service.views(nid);

		Notice item = service.view(nid);
		List<FileVO> file = service.fileSelect(nid);
	
		model.addAttribute("item", item);
		model.addAttribute("file", file);

		// 현재 로그인한 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// 현재 로그인중인 회원의 아이디 가져오기
		// 회원가입시 anonymousUser이 아이디로 가입은 막자.
		System.out.println(authentication.getName());
		if (authentication.getName() == null || authentication.getName() == "anonymousUser")
			model.addAttribute("securityId", "null");
		else
			model.addAttribute("securityId", authentication.getName());
		
		return path + "view";
	}

	@RequestMapping("/delete")
	String delete(int nid) {
		service.delete(nid);
		return "redirect:list";
	}

	// 댓글 crud

	@RequestMapping("/commentUpdate")
	@ResponseBody
	String commentUpdate(NoticeComment NComment) {
		service.commentUpdate(NComment);
		return "success";
	}

	@RequestMapping("/commentDel")
	@ResponseBody
	String commentDel(NoticeComment NComment) {
		service.conmentDel(NComment);
		return "success";
	}

	@RequestMapping("/commentAdd")
	@ResponseBody
	String commentAdd(NoticeComment NComment, Principal principal) {

		System.out.println(principal.getName());

		NComment.setId(principal.getName());

		service.commentAdd(NComment);
		return "success";
	}

	@RequestMapping("/commentList")
	@ResponseBody
	ResponseEntity<String> commentList(NoticeComment NComment, HttpServletRequest request) {
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		// 해당 게시물 댓글
		List<NoticeComment> commentVO = service.commentList(NComment);

		if (commentVO.size() > 0) {
			for (int i = 0; i < commentVO.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("c_code", commentVO.get(i).getNcomentId());
				hm.put("comment", commentVO.get(i).getNcomentContent());
				hm.put("writer", commentVO.get(i).getId());
				hm.put("NcomentDate", commentVO.get(i).getNcomentDate());

				hmlist.add(hm);
			}

		}

		JSONArray json = new JSONArray(hmlist);

		return new ResponseEntity<String>(json.toString(), responseHeaders, HttpStatus.CREATED);
	}

}
