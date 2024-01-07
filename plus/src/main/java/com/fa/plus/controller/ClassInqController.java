package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.ClassInq;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.ClassInqService;

@Controller
@RequestMapping("/classInq/*")
public class ClassInqController {
	
	@Autowired
	private ClassInqService service;
	
	@Autowired
	private MyUtil myUtil;

	@GetMapping("insertInq")
	public String insertForm(@RequestParam long classNum, Model model) {
		
		try {
			ClassInq vo = service.findByClassName(classNum);
			model.addAttribute("vo", vo);
			model.addAttribute("mode", "write");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("classNum", classNum);		
		
		return ".classInq.write";
	}
	
	@PostMapping("insertInq")
	public String insertSubmit(ClassInq dto, HttpSession session, @RequestParam long classNum, @RequestParam String className) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		dto.setInquiryId(info.getUserId());
		dto.setClassNum(classNum);
		dto.setClassName(className);
		
		try {
			service.insertInq(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/lesson/detail/" + classNum;
	}
	
	@RequestMapping("myInqList")
	public String myInqList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd, 
			HttpServletRequest req, HttpSession session, Model model) throws Exception{
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("inquiryId", info.getUserId());
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ClassInq> list = service.myInqList(map);
		String listUrl = cp + "/classInq/myInqList";
		String query = "";
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/classInq/myInqList?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".classInq.myInqList";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long inquiryNum, @RequestParam(defaultValue = "1") String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		ClassInq dto = service.findByNo(inquiryNum);
		ClassInq dto1 = service.findByYes(inquiryNum);
		
		ClassInq className = service.findByClassName(dto.getClassNum());
		
		model.addAttribute("className", className);
		model.addAttribute("dto", dto);
		model.addAttribute("dto1", dto1);
		model.addAttribute("query", query);
		
		return ".classInq.article";
	}
	
	@GetMapping("updateInq")
	private String updateInqForm(@RequestParam long inquiryNum, Model model, HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info == null) {
			return "redirect:/member/login";
		}
		
		try {
			
			ClassInq findDto = service.findByNo(inquiryNum);
			ClassInq vo = service.findByClassName(findDto.getClassNum());
			
			model.addAttribute("findDto", findDto);
			model.addAttribute("vo", vo);
			model.addAttribute("mode", "update");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".classInq.write";
	}
	
	@PostMapping("updateInq")
	private String updateSubmit(@RequestParam long inquiryNum, 
			@RequestParam String subject, 
			@RequestParam String content) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("inquiryNum", inquiryNum);
			map.put("subject", subject);
			map.put("content", content);
			
			service.updateInq(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/classInq/myInqList";
	}
}
