package com.fa.plus.pluszone.controller;

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
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.PlusInq;
import com.fa.plus.pluszone.service.PlusInqService;

@Controller
@RequestMapping("/pluszone/plusInq/*")
public class PlusInqController {

	@Autowired
	private PlusInqService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("inqList")
	public String noInqList(@RequestParam(value = "page", defaultValue = "1") int current_page,
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
		map.put("memberIdx", info.getMemberIdx());
		map.put("reInquiryNum", 0);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<PlusInq> list = service.inqList(map);
		String listUrl = cp + "/pluszone/plusInq/inqList";
		String query = "";
		
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/pluszone/plusInq/inqList" + query;
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
		
		return ".pluszone.plusInq.inqNo";
	}
	
	@GetMapping("article1")
	public String article1(@RequestParam long inquiryNum, @RequestParam(defaultValue = "1") String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception{
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		PlusInq dto = service.findByNo(inquiryNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("mode", "write");
		
		return ".pluszone.plusInq.article";
	}
	
	// 답변 입력 완료
	@PostMapping("writeAnswer")
	public String writeSubmit(@RequestParam String reSubject, 
			@RequestParam String reContent, 
			@RequestParam long inquiryNum, 
			HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			paraMap.put("reSubject", reSubject);
			paraMap.put("reContent", reContent);
			paraMap.put("reInquiryId", info.getUserId());
			paraMap.put("inquiryNum", inquiryNum);
			// 답변 등록
			service.insertAnswer(paraMap);
			
			// 답변 여부 0 -> 1
			map.put("reInquiryNum", 1);
			map.put("inquiryNum", inquiryNum);
			service.updateReInquiryNum(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/pluszone/plusInq/inqList";
	}
	
	@RequestMapping("inqOkList")
	public String yesInqList(@RequestParam(value = "page", defaultValue = "1") int current_page,
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
		map.put("memberIdx", info.getMemberIdx());
		map.put("reInquiryNum", 1);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<PlusInq> list = service.inqList(map);
		String listUrl = cp + "/pluszone/plusInq/inqOkList";
		String query = "";
		
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/pluszone/plusInq/inqOkList" + query;
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
		
		return ".pluszone.plusInq.inqYes";
	}
	
	// 답변 article
		@GetMapping("article2")
		public String article2(@RequestParam long inquiryNum, @RequestParam(defaultValue = "1") String page,
				@RequestParam(defaultValue = "all") String schType,
				@RequestParam(defaultValue = "") String kwd,
				HttpSession session,
				Model model) throws Exception{
			
			kwd = URLDecoder.decode(kwd, "utf-8");
			String query = "page=" + page;
			if (kwd.length() != 0) {
				query += "&schType=" + schType + 
						"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			if(info == null) {
				return "redirect:/member/login";
			}
			
			PlusInq dto = service.findByNo(inquiryNum);
			
			PlusInq dto1 = service.findByYes(inquiryNum);
			
			model.addAttribute("dto", dto);
			model.addAttribute("dto1", dto1);
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			model.addAttribute("mode", "update");
			
			return ".pluszone.plusInq.article";
		}
		
		// 답변 수정 완료
		@PostMapping("updateAnswer")
		public String updateSubmit(@RequestParam String reSubject, 
				@RequestParam String reContent, 
				@RequestParam long inquiryNum, 
				HttpSession session) throws Exception{
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			if(info == null) {
				return "redirect:/member/login";
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			try {
				// 답변 수정
				map.put("reSubject", reSubject);
				map.put("reContent", reContent);
				map.put("inquiryNum", inquiryNum);
				
				service.updateAnswer(map);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			return "redirect:/pluszone/plusInq/inqOkList";
		}
		
		// 답변 삭제
		@GetMapping("deleteAnswer")
		public String delete(@RequestParam long inquiryNum) {
			try {
				service.deleteAnswer(inquiryNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/pluszone/plusInq/inqOkList";
		}
}
