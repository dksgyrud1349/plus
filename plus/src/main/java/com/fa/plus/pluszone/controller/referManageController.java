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
import com.fa.plus.pluszone.domain.referManage;
import com.fa.plus.pluszone.service.referManageService;

@Controller
@RequestMapping("/pluszone/referManage/*")
public class referManageController {

	@Autowired
	// @Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@Autowired
	private referManageService service;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all")String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		int size = 10;
		int total_page =0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		// 전체 페이지수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
	
		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트
		
		List<referManage> list = service.listRefer(map);
		
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/pluszone/referManage/list";
		String articleUrl = cp + "/pluszone/referManage/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
	
		return ".pluszone.referManage.list";
	}
	
	@GetMapping("write")
	public String writeForm(HttpSession session, Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<referManage> listClass = service.listClass(info.getMemberIdx());
		
		model.addAttribute("mode", "write");
		model.addAttribute("listClass", listClass);
		
		return ".pluszone.referManage.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(referManage dto, HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertRefer(dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/pluszone/referManage/list";
	}
	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		
		referManage dto = service.findById(num);
		if (dto == null) {
			return "redirect:/pluszone/referManage/list?" + query;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("refNum", num);
		
		referManage prevDto = service.findByPrev(map);
		referManage nextDto = service.findByNext(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".pluszone.referManage.article";
	}
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<referManage> listClass = service.listClass(info.getMemberIdx());

		referManage dto = service.findById(num);
		
		if (dto == null) {
			return "redirect:/pluszone/referManage/list?page=" + page;
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("listClass", listClass);
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		

		return ".pluszone.referManage.write";
	}

	@PostMapping("update")
	public String updateSubmit(referManage dto,
			@RequestParam String page, HttpSession session
			) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		long memberIdx = info.getMemberIdx();
		
		try {
			dto.setUserId(info.getUserId());
			service.updateRefer(dto);
			service.listClass(memberIdx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/pluszone/referManage/article?num=" + dto.getRefNum() + "&page=" + page;
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
			service.deleteRefer(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/pluszone/referManage/list?" + query;
	}
		
}
	