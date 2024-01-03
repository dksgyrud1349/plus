package com.fa.plus.pluszone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.BookingPlus;
import com.fa.plus.pluszone.service.BookingPlusService;

@Controller
@RequestMapping("/booking/*")
public class BookingPlusController {
	
	@Autowired
	private BookingPlusService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("lessonList")
	public String lessonList(@RequestParam(defaultValue = "regDate") String schType, @RequestParam(defaultValue = "") String kwd,
			 HttpSession session, Model model) throws Exception{

		int dataCount = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("memberIdx", info.getMemberIdx());
		
		dataCount = service.dataCount(map);
		
		List<BookingPlus> list = service.lessonList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".pluszone.booking.lessonList";
	}
	
	@RequestMapping("detailList")
	public String detailList( @RequestParam(name = "classNum") long classNum, Model model) {
			
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classNum", classNum);
		
		dataCount = service.detailCount(map);
		
		List<BookingPlus> list = service.lessonDetailList(map);
		
		model.addAttribute("classNum", classNum);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		
		return ".pluszone.booking.detailList";
	}
	
	@RequestMapping("bookList")
	public String bookList(@RequestParam(name = "detailNum") long detailNum, Model model,
			@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req) {
		
		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int state = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("detailNum", detailNum);
		map.put("state", state);
		
		dataCount = service.bookingCount(map);
		
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
		
		String listUrl = cp + "/booking/bookList";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		List<BookingPlus> list = service.bookingList(map);
		
		for(BookingPlus dto : list) {
			dto.setStateName("예약대기");
		}
		
		model.addAttribute("detailNum", detailNum);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".pluszone.booking.bookingList";
	}
	
	@PostMapping("update")
	@ResponseBody
	public Map<String, Object> updateState(@RequestParam long arrayValue[]){
		
		String state = "true";
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			map.put("state", 1);
			for(int i = 0; i < arrayValue.length; i++) {
				map.put("orderNum", arrayValue[i]);
				service.updateState(map);
			}
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}

	@RequestMapping("bookingOk")
	public String bookingOk(@RequestParam(name = "detailNum") long detailNum, Model model,
			@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req) {
		
		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int state = 1;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("detailNum", detailNum);
		map.put("state", state);
		
		dataCount = service.bookingCount(map);
		
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
		
		String listUrl = cp + "/booking/bookingOk";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		List<BookingPlus> list = service.bookingList(map);
		
		for(BookingPlus dto : list) {
			dto.setStateName("예약확정");
		}

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("detailNum", detailNum);
		
		return ".pluszone.booking.bookingOk";
	}
	
	@PostMapping("update1")
	@ResponseBody
	public Map<String, Object> updateState1(@RequestParam long arrayValue[]){
		
		String state = "true";
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			map.put("state", 0);
			for(int i = 0; i < arrayValue.length; i++) {
				map.put("orderNum", arrayValue[i]);
				service.updateState(map);
			}
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}

}
