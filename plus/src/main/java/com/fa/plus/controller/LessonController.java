package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Lesson;
import com.fa.plus.service.LessonService;

@Controller
@RequestMapping("/product/*")
public class LessonController {
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "all") String schType,
				@RequestParam(defaultValue = "") String kwd, HttpServletRequest req, Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
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
		
		// 글 리스트
		List<Lesson> list = lessonService.allLessonList(map);
		
		String query = "";
		String listUrl = cp + "/product/lessonList";
		String articleUrl = cp + "/product/article?page=" + current_page;
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/product/list?" + query;
			articleUrl = cp + "/product/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".product.lessonList";
	}
	
}
