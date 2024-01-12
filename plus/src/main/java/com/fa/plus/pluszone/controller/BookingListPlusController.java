package com.fa.plus.pluszone.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.BookingPlus;
import com.fa.plus.pluszone.service.BookingListPlusService;

@Controller
@RequestMapping("/pluszone/bookingList/*")
public class BookingListPlusController {

	@Autowired
	private BookingListPlusService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("list")
	public String booking(Model model,
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			HttpSession session,
			HttpServletRequest req) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int state = 0;
		int dataCount = 0;
		
		long memberIdx = info.getMemberIdx();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", memberIdx);
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
		
		String listUrl = cp + "/pluszone/bookingList/list";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		List<BookingPlus> list = service.bookingList(map);
		
		for(BookingPlus dto : list) {
			dto.setStateName("예약대기");
		}
		
		model.addAttribute("memberIdx", memberIdx);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".pluszone.bookingList.list";
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

	@RequestMapping("reservation")
	public String reservation(Model model,
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			HttpSession session,
			HttpServletRequest req) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int state = 1;
		int dataCount = 0;
		
		long memberIdx = info.getMemberIdx();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("state", state);
		map.put("memberIdx", memberIdx);
		
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
		
		String listUrl = cp + "/pluszone/bookingList/reservation";
		
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
		model.addAttribute("memberIdx", memberIdx);
		
		return ".pluszone.bookingList.reservation";
	}
	
	@PostMapping("updateOk")
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
