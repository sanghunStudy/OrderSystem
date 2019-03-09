package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.Menu;
import kr.ac.kopo.model.MenuComment;
import kr.ac.kopo.model.NoticeComment;
import kr.ac.kopo.service.MenuService;
import kr.ac.kopo.util.MediaUtils;
import kr.ac.kopo.util.SearchVO;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	//@Resource(name = "uploadPath")
	private String uploadPath;
	
	final String path = "menu/";
	static final Logger logger=LoggerFactory.getLogger(MenuController.class);
	
	
	@Autowired
	MenuService service;
	
	@RequestMapping("/list")
	String list(SearchVO searchVO,Model model) {
		searchVO.pageCalculate(service.total(searchVO));
		
		List<Menu> list = service.list(searchVO);
		
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
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax",method=RequestMethod.POST)
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		System.out.println(file.getOriginalFilename());
		
		return new ResponseEntity<String>(file.getOriginalFilename(), HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("FILE NAME : " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath+fileName);
			
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+ "\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
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
}
