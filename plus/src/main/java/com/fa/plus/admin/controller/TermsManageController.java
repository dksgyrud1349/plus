package com.fa.plus.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.TermsManage;
import com.fa.plus.admin.service.TermsManageService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;

@Controller
@RequestMapping("/admin/termsManage/*")
public class TermsManageController {
	@Autowired
	private TermsManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	// AJAX-Text(HTML)
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType, 
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<TermsManage> list = service.listTerms(map);	// @ offset,size를 listTerms에 넣기?
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/termsManage/list";
		String articleUrl = cp + "/admin/termsManage/article?page=" + current_page;
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.termsManage.list";
	}
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return ".admin.termsManage.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(TermsManage dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertTerms(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/termsManage/list";
	}
	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		TermsManage dto = service.findById(num);
		if(dto == null) {
			return "redirect:/admin/termsManage/list?" + query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);
		
		TermsManage prevDto = service.findByPrev(map);
		TermsManage nextDto = service.findByNext(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".admin.termsManage.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		//SessionInfo info = (SessionInfo) session.getAttribute("member");
		//if (dto == null || ! info.getUserId().equals(dto.getUserId())) {
		TermsManage dto = service.findById(num);
		if (dto == null) {
			return "redirect:/admin/termsManage/list?page=" + page;
		}
		
			model.addAttribute("mode", "update");
			model.addAttribute("page", page);
			model.addAttribute("dto", dto);
			
			return ".admin.termsManage.write";
		}
		
	@PostMapping("update")
	public String updateSubmit(TermsManage dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.updateTerms(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/termsManage/list?page=" + page;
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		try {
			service.deleteTerms(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/termsManage/list?" + query;
	}
}
