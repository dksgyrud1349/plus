package com.fa.plus.controller;

import java.net.URLDecoder;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Lesson;
import com.fa.plus.service.LessonService;

@Controller
@RequestMapping("/lesson/*")
public class LessonController {
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String main(
				@RequestParam(value = "page", defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "all") String schType,
				@RequestParam(defaultValue = "") String kwd, 
				@RequestParam(defaultValue = "0") long subNum,
				@RequestParam(defaultValue = "0") long mainNum, 
				HttpServletRequest req, 
				Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		List<Lesson> listMainCategory = lessonService.listMainCategory();
		
		/*
		if(mainNum == 0 && listMainCategory.size() != 0) {
			mainNum = listMainCategory.get(0).getMainNum();
		}
		*/
		
		//List<Lesson> listSubCategory = lessonService.listSubCategory(mainNum);
		/*
		if(subNum == 0 && listSubCategory.size() != 0) {
			subNum = listSubCategory.get(0).getSubNum();
		}
		*/
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subNum", subNum);
		map.put("mainNum", mainNum);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = lessonService.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		map.put("mainNum", mainNum);
		map.put("subNum", subNum);
		
		// 글 리스트
		List<Lesson> list = lessonService.allLessonList(map);
		
		String listUrl = cp + "/lesson/main";		
		String query = "mainNum=" + mainNum + "&subNum=" + subNum;
		
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/lesson/main?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("listMainCategory", listMainCategory);
		//model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".lesson.lessonList";
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(@RequestParam long mainNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Lesson> listSubCategory = lessonService.listSubCategory(mainNum);
		model.put("listSubCategory", listSubCategory);
		return model;
	}
	
	
	
	
	@GetMapping("detail/{classNum}")
	public String buyRequest(
			@PathVariable Long classNum,
			Model model
			) throws Exception{

		try {

			
			Lesson dto = lessonService.findById(classNum);
			if(dto == null || dto.getShowClass() == 1) {
				return "redirect:/lesson/main";
			}
			
			List<Lesson> listPhoto = lessonService.listLessonPhoto(classNum);
			
			dto.setPhotoName(dto.getFirstPhoto());
			listPhoto.add(0, dto);
			
			model.addAttribute("dto", dto);
			model.addAttribute("listPhoto", listPhoto);
			
					
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/lesson/main";
		}
		
		return ".lesson.lessonDetail";
	}
}
