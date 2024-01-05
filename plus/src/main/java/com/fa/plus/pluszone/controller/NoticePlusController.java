package com.fa.plus.pluszone.controller;

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
import com.fa.plus.pluszone.domain.NoticePlus;
import com.fa.plus.pluszone.service.NoticePlusService;

@Controller
@RequestMapping("/pluszone/noticePlus/*")
public class NoticePlusController {
	@Autowired
	private NoticePlusService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		// 1페이지인 경우 공지리스트 가져오기
		List<NoticePlus> noticeList = null;
		if (current_page == 1) {
			noticeList = service.listNoticeTop(map);
		}
		
		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트
		List<NoticePlus> list = service.listNotice(map);

		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/pluszone/noticePlus/list";
		String articleUrl = cp + "/pluszone/noticePlus/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
	
		return ".pluszone.noticePlus.list";
	}

	@GetMapping("write")
	public String writeForm(HttpSession session, Model model) throws Exception {	
		//내것만 내 memberIdx만 가져오기
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		long memberIdx = info.getMemberIdx();
		List<NoticePlus> listTitle = service.listTitle(memberIdx);
				
			model.addAttribute("mode", "write");
			model.addAttribute("listTitle", listTitle);
			
			return ".pluszone.noticePlus.write";
		}
	
	@PostMapping("write")
	public String writeSubmit(NoticePlus dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertNotice(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/pluszone/noticePlus/list";
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
		
		service.updateHitCount(num);
		
		NoticePlus dto = service.findById(num);
		if (dto == null) {
			return "redirect:/pluszone/noticePlus/list?" + query;
		}
		
		// 스마트 에디터를 사용하므로
		// dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);
		
		NoticePlus prevDto = service.findByPrev(map);
		NoticePlus nextDto = service.findByNext(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".pluszone.noticePlus.article";
	}
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<NoticePlus> listTitle = service.listTitle(info.getMemberIdx());

		NoticePlus dto = service.findById(num); 
		if (dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/pluszone/noticePlus/list?page=" + page;
		}

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listTitle", listTitle);

		return ".pluszone.noticePlus.write";
	}

	@PostMapping("update")
	public String updateSubmit(NoticePlus dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		long memberIdx = info.getMemberIdx();
		
		try {
			dto.setUserId(info.getUserId());
			 service.updateNotice(dto);
			 service.listTitle(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/pluszone/noticePlus/list?page=" + page;
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
			service.deleteNotice(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/pluszone/noticePlus/list?" + query;
	}
}
