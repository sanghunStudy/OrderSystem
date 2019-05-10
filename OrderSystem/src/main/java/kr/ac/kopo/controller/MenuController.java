package kr.ac.kopo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuComment;
import kr.ac.kopo.model.Routine;
import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.service.MenuService;
import kr.ac.kopo.service.RoutineServcie;
import kr.ac.kopo.util.MediaUtils;
import kr.ac.kopo.util.SearchVO;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	final String path = "menu/";
	
	@Autowired
	MenuService service;
	@Autowired
	RoutineServcie Nservice;
	
	@RequestMapping("/list")
	String list(SearchVO searchVO,Model model) {
		searchVO.pageCalculate(service.total(searchVO));
		
		List<Menu> list = service.list(searchVO);
		List<Routine> Nlist = Nservice.staticList();
		
		model.addAttribute("Nlist", Nlist);
		model.addAttribute("list", list);
		model.addAttribute("searchVO", searchVO);
		
		return path + "list";
	}
	
	@RequestMapping(value="/add")
	String add() {
		return path + "add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	String add(Menu menu) {
		service.add(menu);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/update")
	String update(int menuId, Model model) {
		Menu item = service.item(menuId);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	String update(Menu item) {
		service.update(item);
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	String delete(int menuId) {
		service.delete(menuId);
		
		return "redirect:list";
	}
	
	@RequestMapping("/view")
	String view(Model model, int menuId) {
		service.views(menuId);
		Menu item = service.item(menuId);
		
		model.addAttribute("item", item);
		
		return path + "view";
	}
	
	@RequestMapping("/commentList")
	@ResponseBody
	ResponseEntity commentList(MenuComment MComment,HttpServletRequest request) {
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		List<MenuComment> commentVO = service.commentList(MComment);
		
		if(commentVO.size() > 0){
            for(int i=0; i<commentVO.size(); i++){
                HashMap hm = new HashMap();
                
                System.out.println(commentVO.get(i).getMcommentContent());
                hm.put("c_code", commentVO.get(i).getMcommentId());
                hm.put("comment", commentVO.get(i).getMcommentContent());
                hm.put("writer", commentVO.get(i).getId());
                hm.put("McommentDate", commentVO.get(i).getMcommentDate());
                
                hmlist.add(hm);
            }
            
        }
        
        JSONArray json = new JSONArray(hmlist);  	
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping("/commentAdd")
	@ResponseBody
	String commnetAdd(MenuComment MComment) {
		service.commentAdd(MComment);
		return "success";
	}
	
	@RequestMapping("/commentDel")
	@ResponseBody
	String commentsDel(MenuComment MComment) {
		service.commentDel(MComment);
		return "success";
	}
	
	@RequestMapping("/commentUpdate")
	@ResponseBody
	String commentUpdate(MenuComment MComment) {
		service.commentUpdate(MComment);
		return "success";
	}
	
	@RequestMapping("/profileUpload")
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
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
}
