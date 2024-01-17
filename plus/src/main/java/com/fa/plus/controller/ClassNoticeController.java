package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.ClassNotice;
import com.fa.plus.service.ClassNoticeService;

@Controller
@RequestMapping("/classNotice/*")
public class ClassNoticeController {
	
	@Autowired
	private ClassNoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page, @RequestParam long classNum,
				@RequestParam(defaultValue = "all") String schType,
				@RequestParam(defaultValue = "") String kwd,
				HttpServletRequest req,
				Model model) throws Exception{
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("classNum", classNum);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		List<ClassNotice> notices = null;
		if(current_page == 1) {
			notices = service.notices(classNum);
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) {
			offset = 0;
		}
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ClassNotice> noticeList = service.noticeList(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/classNotice/list";
		String articleUrl = cp + "/classNotice/article?page=" + current_page;
		
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/classNotice/list?" + query;
			articleUrl = cp + "/classNotice/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("notices", notices);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("classNum", classNum);
		model.addAttribute("articleUrl", articleUrl);
		
		return ".classNotice.list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long num, @RequestParam String page, @RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd, Model model, @RequestParam int classNum) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		service.updateHitCount(num);
		
		ClassNotice dto = service.findById(num);
		if(dto == null) {
			return "redirect:/classNotice/list?" + query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);
		map.put("classNum", classNum);
		
		ClassNotice prevDto = service.findByPrev(map);
		ClassNotice nextDto = service.findByNext(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("classNum", classNum);
		
		return ".classNotice.article";
	}
}
