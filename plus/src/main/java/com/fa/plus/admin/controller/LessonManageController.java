package com.fa.plus.admin.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.LessonManage;
import com.fa.plus.admin.service.LessonManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/lessonManage/*")
public class LessonManageController {
	
	@Autowired
	private LessonManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list0")
	public String list0(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "className") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception{
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		int approvalCode = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd",  kwd);
		map.put("approvalCode", approvalCode);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<LessonManage> list = service.lessonList(map);
		
		String query = "";
		String listUrl = cp + "/admin/lessonManage/list0";
		String articleUrl = cp + "/admin/lessonManage/article0?page=" + current_page;
		
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/admin/lessonManage/list0?" + query;
			articleUrl = cp + "/admin/lessonManage/article0?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.lessonManage.list0";
	}
	
	@RequestMapping("list1")
	public String list1(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "className") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception{
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		int approvalCode = 1;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd",  kwd);
		map.put("approvalCode", approvalCode);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<LessonManage> list = service.lessonList(map);
		
		String query = "";
		String listUrl = cp + "/admin/lessonManage/list1";
		String articleUrl = cp + "/admin/lessonManage/article1?page=" + current_page;
		
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/admin/lessonManage/list1?" + query;
			articleUrl = cp + "/admin/lessonManage/article1?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.lessonManage.list1";
	}
	
	@RequestMapping("list2")
	public String list2(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "className") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception{
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		int approvalCode = 2;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd",  kwd);
		map.put("approvalCode", approvalCode);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<LessonManage> list = service.lessonList(map);
		
		String query = "";
		String listUrl = cp + "/admin/lessonManage/list2";
		String articleUrl = cp + "/admin/lessonManage/article2?page=" + current_page;
		
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/admin/lessonManage/list2?" + query;
			articleUrl = cp + "/admin/lessonManage/article2?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.lessonManage.list2";
	}
	
	@RequestMapping("list3")
	public String list3(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "className") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception{
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		int approvalCode = 3;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd",  kwd);
		map.put("approvalCode", approvalCode);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<LessonManage> list = service.lessonList(map);
		
		String query = "";
		String listUrl = cp + "/admin/lessonManage/list3";
		String articleUrl = cp + "/admin/lessonManage/article3?page=" + current_page;
		
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/admin/lessonManage/list3?" + query;
			articleUrl = cp + "/admin/lessonManage/article3?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.lessonManage.list3";
	}
	
	@GetMapping("article0")
	public String article0(@RequestParam long classNum, @RequestParam String page, @RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd, HttpSession session, Model model) throws Exception{
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		LessonManage dto = service.findById(classNum);
		if(dto == null) {
			return "redirect:/admin/lessonManage/list0?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".admin.lessonManage.article0";
	}
	
	@GetMapping("article1")
	public String article1(@RequestParam long classNum, @RequestParam String page, @RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd, HttpSession session, Model model) throws Exception{
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		LessonManage dto = service.findById(classNum);
		if(dto == null) {
			return "redirect:/admin/lessonManage/list1?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".admin.lessonManage.article1";
	}
	
	@GetMapping("article2")
	public String article2(@RequestParam long classNum, @RequestParam String page, @RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd, HttpSession session, Model model) throws Exception{
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		LessonManage dto = service.findById(classNum);
		if(dto == null) {
			return "redirect:/admin/lessonManage/list2?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".admin.lessonManage.article2";
	}
	
	@GetMapping("article3")
	public String article3(@RequestParam long classNum, @RequestParam String page, @RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd, HttpSession session, Model model) throws Exception{
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		LessonManage dto = service.findById(classNum);
		if(dto == null) {
			return "redirect:/admin/lessonManage/list3?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".admin.lessonManage.article3";
	}
	
	@GetMapping("update0")
	public String update0(@RequestParam long classNum, @RequestParam int approvalCode) throws Exception{
		
		String memo;
		
		if(approvalCode == 0) {
			memo = "대기";
		} else if(approvalCode == 1) {
			memo = "승인";
		} else if(approvalCode == 2) {
			memo = "보류";
		} else {
			memo = "취소";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classNum", classNum);
		map.put("approvalCode", approvalCode);
		map.put("memo", memo);
		
		try {
			service.updateApproval(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/admin/lessonManage/list0";
	}
	
	@GetMapping("update1")
	public String update1(@RequestParam long classNum, @RequestParam int approvalCode) throws Exception{
		
		String memo;
		
		if(approvalCode == 0) {
			memo = "대기";
		} else if(approvalCode == 1) {
			memo = "승인";
		} else if(approvalCode == 2) {
			memo = "보류";
		} else {
			memo = "취소";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classNum", classNum);
		map.put("approvalCode", approvalCode);
		map.put("memo", memo);
		
		try {
			service.updateApproval(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/admin/lessonManage/list1";
	}
	
	@GetMapping("update2")
	public String update2(@RequestParam long classNum, @RequestParam int approvalCode) throws Exception{
		
		String memo;
		
		if(approvalCode == 0) {
			memo = "대기";
		} else if(approvalCode == 1) {
			memo = "승인";
		} else if(approvalCode == 2) {
			memo = "보류";
		} else {
			memo = "취소";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classNum", classNum);
		map.put("approvalCode", approvalCode);
		map.put("memo", memo);
		
		try {
			service.updateApproval(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/admin/lessonManage/list2";
	}
	
	@GetMapping("update3")
	public String update3(@RequestParam long classNum, @RequestParam int approvalCode) throws Exception{
		
		String memo;
		
		if(approvalCode == 0) {
			memo = "대기";
		} else if(approvalCode == 1) {
			memo = "승인";
		} else if(approvalCode == 2) {
			memo = "보류";
		} else {
			memo = "취소";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classNum", classNum);
		map.put("approvalCode", approvalCode);
		map.put("memo", memo);
		
		try {
			service.updateApproval(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/admin/lessonManage/list3";
	}
}
