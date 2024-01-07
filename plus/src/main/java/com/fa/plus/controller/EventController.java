package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Event;
import com.fa.plus.domain.EventReply;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.EventService;

@Controller
@RequestMapping("/event/*")
public class EventController {
	@Autowired
	private EventService service;
	
	@Autowired
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
		map.put("showEvent", 1);
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
		List<Event> list = service.listEvent(map);

		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/event/"+category+"/list";
		String articleUrl = cp + "/event/"+category+"/article?page=" + current_page;

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
		
		return ".event.list";
	}
	
	@GetMapping("{category}/article")
	public String article(
			@PathVariable String category,
			@RequestParam long eventNum,
			@RequestParam String page,
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

		if(category.equals("progress")) {
			service.updateHitCount(eventNum);
		}

		Event dto = service.findById(eventNum);
		if (dto == null) {
			return "redirect:/event/" + category + "/list?" + query;
		}
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("showEvent", 1);
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("eventNum", eventNum);

		Event prevDto = service.findByPrev(map);
		Event nextDto = service.findByNext(map);
		
		int classCount = service.eventClassCount(eventNum);
		List<Event> classList = service.listEventClass(map);

		model.addAttribute("category", category);
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("classCount", classCount);
		model.addAttribute("classList", classList);
		
		return ".event.article";
	}
	
	// 게시글 좋아요 추가/삭제 : AJAX-JSON
	@PostMapping("insertEventLike")
	@ResponseBody
	public Map<String, Object> insertBoardLike(@RequestParam long eventNum, 
			@RequestParam boolean userLiked,
			HttpSession session) {
		String state = "true";
		int eventLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("eventNum", eventNum);
		paramMap.put("userId", info.getUserId());

		try {
			if(userLiked) {
				service.deleteEventLike(paramMap);
			} else {
				service.insertEventLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}

		eventLikeCount = service.eventLikeCount(eventNum);

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("eventLikeCount", eventLikeCount);

		return model;
	}
	
	
	// 댓글 리스트 : AJAX-TEXT
	@GetMapping("listReply")
	public String listReply(@RequestParam long eventNum, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("eventNum", eventNum);
		
		map.put("membership", info.getMembership());
		map.put("userId", info.getUserId());
		
		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		List<EventReply>listReply = service.listReply(map);	
		for (EventReply dto : listReply) {
			dto.setErContent(dto.getErContent().replaceAll("\n", "<br>"));
		}

		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "event/listReply";
	}
	
	// 댓글 및 댓글의 답글 등록 : AJAX-JSON
	@PostMapping("insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(EventReply dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	// 댓글 및 댓글의 답글 삭제 : AJAX-JSON
	@PostMapping("deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
	
	
}
