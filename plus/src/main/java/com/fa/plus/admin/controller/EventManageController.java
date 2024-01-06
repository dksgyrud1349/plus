package com.fa.plus.admin.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.EventManage;
import com.fa.plus.admin.service.EventManageService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;

@Controller
@RequestMapping("/admin/eventManage/*")
public class EventManageController {
	@Autowired
	private EventManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping("{category}/list")
	public String list(@PathVariable String category,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
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
		List<EventManage> list = service.listEvent(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/eventManage/"+category+"/list";
		String articleUrl = cp + "/admin/eventManage/"+category+"/article?page=" + current_page;

		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.eventManage.list";
	}
	
	@GetMapping("{category}/write")
	public String writeForm(
			@PathVariable String category, Model model) throws Exception {
		model.addAttribute("mode", "write");

		return ".admin.eventManage.write";
	}

	@PostMapping("{category}/write")
	public String writeSubmit(
			@PathVariable String category,
			EventManage dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		try {
			dto.setUserId(info.getUserId());
			service.insertEvent(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/eventManage/all/list";
	}
	
	@GetMapping("{category}/article")
	public String article(
			@PathVariable String category,
			@RequestParam long eventNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		EventManage dto = service.findById(eventNum);
		if (dto == null) {
			return "redirect:/event/" + category + "/list?" + query;
		}
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventNum", eventNum);
		List<EventManage> list = service.eventClassList(map);
		map.put("category", category);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		EventManage prevDto = service.findByPrev(map);
		EventManage nextDto = service.findByNext(map);
		
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".admin.eventManage.article";
	}
	
	@GetMapping("{category}/update")
	public String updateForm(
			@PathVariable String category,
			@RequestParam long eventNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {

		EventManage dto = service.findById(eventNum);
		
		if (dto == null) {
			return "redirect:/event/" + category + "/list?page=" + page;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".admin.eventManage.write";
	}

	@PostMapping("{category}/update")
	public String updateSubmit(EventManage dto,
			@PathVariable String category,
			@RequestParam String page,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo";

		try {
			service.updateEvent(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/eventManage/" + category + "/list?page=" + page;
	}

	@GetMapping("{category}/delete")
	public String delete(
			@PathVariable String category,
			@RequestParam long eventNum,
			@RequestParam String eventImg,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo" + File.separator + eventImg;

		try {
			service.deleteEvent(eventNum, pathname);
		} catch (Exception e) {
			
		}

		return "redirect:/admin/eventManage/" + category + "/list?" + query;
	}
	
	// 이벤트 수정에서 이벤트에 클래스 등록
	@PostMapping("{eventNum}/classInsert")
	@ResponseBody
	public Map<String, Object> classInsert(@PathVariable long eventNum,
			EventManage dto) throws Exception {
		String state = "true";
		try {
			service.insertEventClass(dto);
			service.updateClassPrice(dto);
			
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("{eventNum}/classDelete")
	@ResponseBody
	public Map<String, Object> classDelete(
			@PathVariable long eventNum,
			@RequestParam long classNum,
			EventManage dto) throws Exception {
		String state = "true";
		try {
			service.deleteEventClass(classNum);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("{eventNum}/classList")
	@ResponseBody
	public Map<String, Object> classList (
			@PathVariable long eventNum
			) throws Exception {
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("eventNum", eventNum);
		
		List<EventManage> list = service.eventClassList(map);
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		
		return model;
	}
	
	
	// 클래스 리스트 서치
	@GetMapping("{eventNum}/search")
	@ResponseBody
	public Map<String, Object> searchClass(
			@PathVariable long eventNum,
			@RequestParam(defaultValue = "") String schType,
			@RequestParam(defaultValue = "") String kwd
			) throws Exception {
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("eventNum", eventNum);
		
		service.classList(map);
		List<EventManage> classList = service.classList(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("classList", classList);
		
		return model;
	}
	
}
