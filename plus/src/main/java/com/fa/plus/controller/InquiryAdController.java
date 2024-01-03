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
import com.fa.plus.domain.InquiryAd;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.InquiryAdService;

@Controller
@RequestMapping("/inquiryAd/*")
public class InquiryAdController {
	@Autowired
	private InquiryAdService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		String userName = null;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("inquiryId", info.getUserId());
		
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
		List<InquiryAd> list = service.listInquiryAd(map);

		String query = "";
		String listUrl = cp + "/inquiryAd/list";
		String articleUrl = cp + "/inquiryAd/article?page=" + current_page;
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
		return ".inquiryAd.list";
	}
	
	@GetMapping("write")
	public String writeForm(HttpSession session, Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return ".inquiryAd.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(InquiryAd dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			String userId = info.getUserId();
			dto.setInquiryId(userId);
			service.insertInquiryAd(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/inquiryAd/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long inquiryNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session, Model model) throws Exception {
		String userName = null;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		InquiryAd dto = service.findById(inquiryNum);
		if (dto == null) {
			return "redirect:/inquiryAd/list?" + query;
		}
		
		if ( !info.getUserId().equals(dto.getInquiryId()) ) {
			return "redirect:/inquiryAd/list?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("query", query);
		model.addAttribute("userName", userName);
		
		return ".inquiryAd.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long inquiryNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		InquiryAd dto = service.findById(inquiryNum);
		if (dto == null || ! info.getUserId().equals(dto.getInquiryId())) {
			return "redirect:/inquiryAd/list?page=" + page;
		}
		// 추가할지말지 고민
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".inquiryAd.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(InquiryAd dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		try {
			service.updateInquiryAd(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/inquiryAd/list?page=" + page;
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam long inquiryNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		InquiryAd dto = service.findById(inquiryNum);
		if (dto != null) {
			if (info.getUserId().equals(dto.getInquiryId()) ) {
				try {
					service.deleteInquiryAd(inquiryNum);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return "redirect:/inquiryAd/list?" + query;
	}
}
