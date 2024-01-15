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

import com.fa.plus.admin.domain.InquiryAdManage;
import com.fa.plus.admin.service.InquiryAdManageService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;

@Controller
@RequestMapping("/admin/inquiryAdManage/*")
public class InquiryAdManageController {
	@Autowired
	private InquiryAdManageService service;
	
	@Autowired
	// @Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		String userName = null;
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<InquiryAdManage> list = service.listInquiryAd(map);

		String query = "";
		String listUrl = cp + "/admin/inquiryAdManage/list";
		String articleUrl = cp + "/admin/inquiryAdManage/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("userName", userName);

		return ".admin.inquiryAdManage.list";
	}
		
	@GetMapping("article")
	public String article(@RequestParam long inquiryNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session, Model model) throws Exception {
		
		String userName = null;
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		InquiryAdManage dto = service.findById(inquiryNum);
		if (dto == null) {
			return "redirect:/admin/inquiryAdManage/list?" + query;
		}
				
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("query", query);
		model.addAttribute("userName", userName);
		
		return ".admin.inquiryAdManage.article";
	}
	
	
	@GetMapping("deleteInquiryAd")
	public String delete(@RequestParam long inquiryNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		InquiryAdManage dto = service.findById(inquiryNum);
		if (dto != null) {
				try {
					service.deleteInquiryAd(inquiryNum);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		return "redirect:/admin/inquiryAdManage/list?" + query;
	}
	
	@GetMapping("deleteReContentAd")
	public String deleteReContentAd(@RequestParam long inquiryNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		InquiryAdManage dto = service.findById(inquiryNum);
		if (dto != null) {
			try {
				service.deleteReContentAd(inquiryNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/admin/inquiryAdManage/list?" + query;
	}
	
	
	@PostMapping("sendReContentAd")
	public String answerSubmit(InquiryAdManage dto,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		try {
			dto.setReInquiryId(info.getUserId());
			service.sendReContentAd(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/inquiryAdManage/list?" + query;
	}
}
