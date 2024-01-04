package com.fa.plus.pluszone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.MemberPlus;
import com.fa.plus.pluszone.domain.NoticePlus;
import com.fa.plus.pluszone.service.BookingPlusService;
import com.fa.plus.pluszone.service.MemberPlusService;
import com.fa.plus.pluszone.service.NoticePlusService;

@Controller
public class MainPlusController {
	@Autowired
	private MemberPlusService memberService;
	@Autowired
	private NoticePlusService noticeService;
	@Autowired
	private BookingPlusService bookingService;
	
	@RequestMapping(value="/pluszone", method=RequestMethod.GET)
	public String method(HttpSession session,
			Model model, String userId) throws Exception {
		MemberPlus loginPlusMember = null;
		int noticeDataCount = 0;
		int bookingDataCount = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("offset", 0);
		map.put("size", 5);
		List<NoticePlus> noticeList = noticeService.listNotice(map);
		
		loginPlusMember = memberService.loginPlusMember(userId);
		noticeDataCount = noticeService.dataCount(map);
		bookingDataCount = bookingService.dataCount(map);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("loginPlusMember", loginPlusMember);
		model.addAttribute("noticeDataCount", noticeDataCount);
		model.addAttribute("bookingDataCount", bookingDataCount);
		
		return ".plusLayout";
	}
}
