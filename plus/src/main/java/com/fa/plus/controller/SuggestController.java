package com.fa.plus.controller;

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


import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.Suggest;
import com.fa.plus.service.SuggestService;

@Controller
@RequestMapping("/suggest/*")
public class SuggestController {
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@Autowired
	private SuggestService service;
	
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
		
		// 글 리스트
		
				List<Suggest> list = service.listSuggest(map);
				
			
				String cp = req.getContextPath();
				String query = "";
				String listUrl = cp + "/plus/suggest/list";
				String articleUrl = cp + "/plus/suggest/article?page=" + current_page;
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
			
				return ".suggest.list";
			}
	@GetMapping("write")
	public String writeForm(HttpSession session, Model model) throws Exception{
		
	
		model.addAttribute("mode", "write");
		
		
		return ".suggest.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Suggest dto, HttpSession session)throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertSuggest(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/suggest/list";
		
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
		
		
		Suggest dto = service.findById(num);
		if (dto == null) {
			return "redirect:/suggest/list?" + query;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("Sugnum", num);
	
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".suggest.article";
	}
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Suggest dto = service.findById(num);
		if (dto == null || ! info.getUserId().equals(dto.getUserId())) {

			return "redirect:/suggest/list?page=" + page;
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
	

		return ".plus.suggest.write";
	}
	@PostMapping("update")
	public String updateSubmit(Suggest dto,
			@RequestParam String page, HttpSession session
			) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
				
		try {
			dto.setUserId(info.getUserId());
			service.updateSuggest(dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/suggest/article?num=" + dto.getSugNum() + "&page=" + page;
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
			service.deleteSuggest(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:suggest/list?" + query;
	}
		
}
