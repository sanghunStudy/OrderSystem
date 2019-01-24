package kr.ac.kopo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.service.NoticeServcie;
import kr.ac.kopo.util.FileVO;
import kr.ac.kopo.util.SearchVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	final String path = "notice/";
	
	@Autowired
	NoticeServcie service;
	
	@RequestMapping("/list")
	String list(Model model , SearchVO searchVO) {
	
	searchVO.pageCalculate(service.totalCount(searchVO));
	
	
	
	List<SearchVO> list = service.list(searchVO);
	
	model.addAttribute("list", list);
	model.addAttribute("SearchVO",searchVO);
		return path+"list";
	}
	
	
	@RequestMapping("/profileUpload")
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		out.println("/upload/"+str_filename);
		out.close();
	}
	
	//이번에는 수정과 등록을 분리하지 않고 하나로 합쳐보았다.
	//nid 의 값이 있을경우 해당 글의 정보를 가져와서 수정화면 아니라면 그냥 입려화면이다.
	@RequestMapping(value="/add" , method=RequestMethod.GET)
	String add(int nid, Model model) {
		
		if(nid != 0) {
			List<FileVO> file = service.fileSelect(nid);
			Notice item = service.view(nid);
			model.addAttribute("item", item);
			model.addAttribute("file",file);
			
		}
		
		return path+"add";
	}
	
	@RequestMapping(value = "/upload")
	public void upload(HttpServletResponse response, HttpServletRequest request, @RequestParam("Filedata") MultipartFile Filedata) throws IllegalStateException, IOException {
	   	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	   	String newfilename = df.format(new Date()) + Integer.toString((int) (Math.random()*10));
	   	
		File f = new File("c:\\upload\\" + newfilename);
		
			Filedata.transferTo(f);
		   	response.getWriter().write(newfilename);
	}
	
	
	//jsp에서 글작성시 noticeId의 값을 0으로 넘겨주고 아래에서 비교 0보다 클경우에는 글 수정 나머지는 글 작성이다.
	@RequestMapping(value="/add" , method=RequestMethod.POST)
	String add(HttpServletRequest request, Notice notice) {

		String realname = request.getParameter("filename");
		String filesize = request.getParameter("realname");
		String filename = request.getParameter("filesize");
    	String[] reallist = realname.split(",");
    	String[] filelist = filename.split(",");
    	String[] sizelist = filesize.split(",");

		
		if(notice.getNoticeId() > 0) {
			service.update(notice);
		}else{
			service.add(notice);
			System.out.println(filesize.length()+"파일사이즈 랭스스스");
			//첨부파일이 있을 경우에만 실행
			if(filesize.length() > 0) {
				for(int i=0; i < filelist.length; i++) {	
					service.fileUp(filelist[i],reallist[i],sizelist[i]);
				}	
			}
				
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/view")
	String view(Model model, int nid) {
		//조회수
		service.views(nid);
		
		Notice item = service.view(nid);
		List<FileVO> file = service.fileSelect(nid);
		
		model.addAttribute("item",item);
		model.addAttribute("file",file);
		
		return path+"view";
	}
	
	
	@RequestMapping("/delete")
	String delete(int nid) {
		service.delete(nid);
		return "redirect:list";
	}
}
